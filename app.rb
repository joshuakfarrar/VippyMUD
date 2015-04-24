require 'socket'
require './lib/connection.rb'

module VippyMUD
  class Server
    def initialize(port = 8080)
      @port = port
      @connections = []
    end

    def start
      @server = TCPServer.new @port
      @connection_thread = Thread.new do
        while client = @server.accept
          @connections = VippyMUD::Connection.new(client)
        end
      end
    end

    def stop
      @server.close
      @connection_thread.kill
    end
  end
end