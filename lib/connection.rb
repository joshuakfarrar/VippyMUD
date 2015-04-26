require 'colorize'

require './lib/client'

require './lib/states/playing'
require './lib/states/login'

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