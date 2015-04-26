require 'socket'
require './lib/connection.rb'

module VippyMUD
  class Server
    def initialize(port = 8080)
      @port = port
    end

    def start
      @server = TCPServer.new @port
      @connection_thread = Thread.new do
        while client = @server.accept
          Thread.new do
            VippyMUD::Connection.new(client)
          end
        end
      end
    end

    def stop
      @server.close
      @connection_thread.kill
      @connection_thread = nil
    end
  end
end