require "spec_helper"
require "net/telnet"

require "server.rb"

describe VippyMUD::Server do
  describe '#start' do
    it 'should start a server' do
      buffer = ''
      localhost = Net::Telnet::new("Host" => "localhost",
                                   "Port" => 8080)
      localhost.cmd("list") { |c| buffer << c }
      expect(buffer).to match("hej! :) welcome to \e[5;94;47mVippyMUD\e[0m! :3!\n")
    end
  end
end