require 'colorize'

require './lib/client'

require './lib/states/login'
require './lib/states/new_character'
require './lib/states/playing'

module VippyMUD
  class Connection
    def initialize(client)
      @client = VippyMUD::Client.new(client)

      case @client.state
      when :not_logged_in
        VippyMUD::State::Login.new(@client)
      end
    end
  end
end