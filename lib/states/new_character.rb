module VippyMUD
  module State
    class NewCharacter
      def initialize(client)
        @client = client

        @client.puts "\nWelcome young Padawan!"

        @client.close
      end
    end
  end
end