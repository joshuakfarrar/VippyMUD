module VippyMUD
  class Connection
    def initialize(client)
      @client = client
      @client.puts "hej :) welcome to VippyMUD! :3!"
      @client.close
    end
  end
end