require 'socket'

class VippyMUD
  def initialize(port = 8080)
    @port = port
  end

  def start
    @server = TCPServer.new @port
    @connection_thread = Thread.new do
      while client = @server.accept
        client.puts "hej :) welcome to VippyMUD! :3! rawr!"
        client.puts "the time is now #{Time.now}"
        client.close
      end
    end
  end

  def stop
    @server.close
    @connection_thread.kill
  end
end