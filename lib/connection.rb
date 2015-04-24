require 'colorize'

module VippyMUD
  class Connection
    def initialize(client)
      @client = client
      @client.print "hej! :) welcome to "
      @client.print "VippyMUD".colorize(:light_blue).on_white.blink
      @client.puts "! :3!"
      @client.close
    end
  end
end