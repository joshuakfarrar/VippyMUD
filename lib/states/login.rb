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

        encoding_options = {
          :invalid           => :replace,  # Replace invalid byte sequences
          :undef             => :replace,  # Replace anything not defined in ASCII
          :replace           => '',        # Use a blank for those replacements
          :universal_newline => true       # Always break lines with \n
        }

        while line = @client.gets.strip
          line = line.encode(Encoding.find('ASCII'), encoding_options)
          puts line.bytes
          if line.bytes.last == 0x6 # ctrl-c
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
              ask_for_password(character)
              return
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

      def ask_for_password(character)
        @client.print 'Password: '

        password = @client.gets.strip

        if character.password_is password
          @client.puts "\nWelcome back, #{character[:name]}!"
        else
          @client.puts "\nInvalid password."
        end

        @client.close
      end
    end
  end
end