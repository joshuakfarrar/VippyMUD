module VippyMUD
  class Client
    attr_accessor :client, :state, :character

    def initialize(client)
      @client = client
      @state ||= :not_logged_in

      @character = nil
    end

    def close
      @client.close
    end

    def puts(message)
      @client.puts message
    end

    def print(message)
      @client.print message
    end

    def gets
      @client.gets
    end
  end
end