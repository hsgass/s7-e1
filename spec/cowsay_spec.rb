require 'spec_helper'

describe Cowsay do

  before :each do
    @cowsay       = Cowsay.new
    @command      = Command.new
    @command.text = 'foo'
  end

  it "should produce some output" do
    @cowsay.say @command
    @cowsay.lines.should_not be_empty
    puts @cowsay
  end

  it "should produce lines starting and ending with <text> tag" do
    @cowsay.say @command
    @cowsay.lines.each do |l|
      l.should match /<text.*>[^\n]+<\/text>/
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

    found_eyes = false
    found_tongue = false
    @cowsay.lines.each do |l|
      found_eyes = true if l.include? '88'
      found_tongue = true if l.include? '99'
    end

    found_eyes.should be_true
    found_tongue.should be_true
  end
end
