require './lib/states/new_character'

module VippyMUD
  module State
    class Login
      def initialize(client)
        @client = client
        @greeted = false

        ask_for_username
      end

      def ask_for_username
        @client.print greeting

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
            character = Character.find_by_name(line.capitalize)
            if character
              @client.puts "\nWelcome back, #{character[:name]}!"
              break
            else
              @client.print "\nNo such player exists.\n"
              ask_for_username
            end
          end
        end

        @client.close
      end

      def greeting
        if !@greeted
          @greeted = true
          'By what name are you known (or "new" to create a new character): '
        else
          'Name: '
        end
      end

    end
  end
end