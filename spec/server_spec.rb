require "spec_helper"
require "net/telnet"

require "server.rb"

describe VippyMUD::Server do
  before(:each) do
    @server = VippyMUD::Server.new(8081)
    @server.start
  end

  describe '#start' do
    it 'should start a server' do
      buffer = ''

      localhost = Net::Telnet::new("Host" => "localhost",
                                   "Port" => 8081)
      localhost.cmd("list") { |c| buffer << c }

      expect(buffer).to match("hej! :) welcome to \e[5;94;47mVippyMUD\e[0m! :3!\n")
    end
  end

  after(:each) do
    @server.stop
  end
end