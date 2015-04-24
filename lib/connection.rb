require 'colorize'

module VippyMUD
  class Connection
    def initialize(client)
      @client = client
      @client.puts "hej :) welcome to VippyMUD! :3!".colorize(:light_blue)
      @client.close
    end
  end
end