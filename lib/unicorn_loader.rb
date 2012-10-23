module UnicornLoader
  class << self
    def file_path(path)

      File.expand_path(path, File.dirname(__FILE__))
    end
  end

  VERSION = '0.1'

  autoload 'Exceptions', file_path('unicorn_loader/exceptions')
  autoload 'Config', file_path('unicorn_loader/config')
end