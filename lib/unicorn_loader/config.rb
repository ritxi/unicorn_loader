require 'psych'

module UnicornLoader
  class Config
    include Exceptions

    attr_reader :apps_port

    def nginx_virtual_host_template_path
      config['nginx_virtual_host_template_path'] || UnicornLoader.file_path('../templates/virtual_host.conf.erb')
    end

    def nginx_virtual_host_template_path=(path)
      if File.exist?(path)
        @nginx_virtual_host_template_path = path
        config['nginx_virtual_host_template_path'] = @nginx_virtual_host_template_path
        store!
      else
        raise PathNotFoundException.new(path)
      end
    end

    def nginx_path
      @nginx_path ||= config['nignx_path']
    end

    def nginx_path=(path)
      if Dir.exist?(path)
        @nignx_path = path
        config['nignx_path'] = @nignx_path
        store!
      else
        raise PathNotFoundException.new(path)
      end
    end

    def each(&block)
      apps_port.each(&block)
    end

    def [](key)
      apps_port[key]
    end

    def []=(app_name, port)
      name_used = self[app_name].nil?
      app_using = apps_port.reject{|k,v| v != port }.keys.first
      port_used = app_using.nil?

      case false
      when port_used then
        raise AlreadyConfiguredPortException.new(app_using, port)
      when name_used
        raise AlreadyConfiguredAppException.new(app_name)
      else
        self[app_name] = port.to_i
        @config['servers'] = @apps_port
        store!
      end
    end

    private

    def config_file
      @config_file ||= File.expand_path('~/.unicorn_loader/unicorn.yml')
    end

    def config
      @config ||= Psych.load(File.read(config_file))
    end

    def apps_port
      @apps_port ||= config['servers']
    end

    def store!
      File.write(config_file, config.to_yaml)
    end
  end
end