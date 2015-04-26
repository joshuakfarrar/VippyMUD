require 'dotenv'
ENV['RACK_ENV'] ||= 'development'
Dotenv.load '.env'

require 'bundler'
Bundler.require :default, ENV['RACK_ENV']

require 'logger'

require './lib/server'

module VippyMUD
  class Application
    def initialize
      Dir[root.join('config/initializers/**/*.rb')].each {|initializer| require initializer }
      Dir[root.join('models/**/*.rb')].each {|model| require model } 

      @server = VippyMUD::Server.new(ENV['PORT'])
    end

    def root
      @root ||= Pathname.new(File.dirname(__FILE__)).join('..').expand_path
    end

    def start
      @server.start
    end

    def stop
      @server.stop
    end
  end
end