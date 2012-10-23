module UnicornLoader
  module Exceptions
    class AlreadyConfiguredPortException < Exception
      attr_reader :app_name, :port

      def initialize(app_name, port)
        @app_name = app_name
        @port = port
      end

      def message
        "Port #{port} already used for #{app_name}"
      end
    end

    class AlreadyConfiguredAppException < Exception
      attr_reader :app_name

      def initialize(app_name)
        @app_name = app_name
      end

      def message
        "Application `#{app_name}` already configured"
      end
    end

    class PathNotFoundException < Exception
      attr_reader :path

      def initialize(path)
        @path = path
      end

      def message
        "Path `#{path}` not exists"
      end
    end
  end
end