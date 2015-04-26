require './lib/states/new_character'

module VippyMUD
  module State
    class Login
      def initialize(client)
        @client = client

        ask_for_username
      end

      def ask_for_username
        @client.print 'By what name are you known (or "new" to create a new character): '

        while line = @client.gets.strip
          if line.bytes == [255, 244, 255, 253, 6] # ctrl-c
            break
          end

          case line
          when ''
            ask_for_username
          when 'new'
            @client.puts "Welcome young Padawan!"
            VippyMUD::State::NewCharacter.new
            break
          else
            @client.puts "Welcome back, #{line}!"
            break
          end
        end

        @client.close
      end
    end
  end
end