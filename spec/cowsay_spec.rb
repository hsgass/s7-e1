require 'spec_helper'

describe Cowsay do

  before :each do
    @cowsay       = Cowsay.new(SVGRenderer.new)
    @command      = Command.new
    @command.text = 'foo'
  end

  it "should produce some output" do
    @cowsay.say @command
    @cowsay.to_s.should_not be_empty
    puts @cowsay
  end

  it "should produce lines starting and ending with <text> tag" do
    @cowsay.say @command
    @cowsay.to_s.each_line do |l|
      if l.start_with? '<text.*>'
        l.should match /<text.*>[^\n]+<\/text>/
      end
    end
  end

  it "should render a specified file if it's in the cowpath" do
    default       = @cowsay.say @command
    @command.file = 'beavis.zen.cow'
    @cowsay.say(@command).should_not == default
    puts @cowsay
  end

  it "should render eyes and tongue" do
    @command.eyes   = '88'
    @command.tongue = '99'
    @cowsay.say @command

    @cowsay.to_s.should include '88'
    @cowsay.to_s.should include '99'
  end
end
