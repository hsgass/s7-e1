require 'spec_helper'

describe Cowsay do

  before :each do
    @command      = Cowsay::Command.new
    @renderer     = RenderSpy.new
    @options      = { 'img_width' => '100%', 'img_height' => '100%' }
    @command.text = 'moof'
  end

  it "should contain specified text" do
    Cowsay.say({renderer: @renderer, command: @command, options: @options})
    @renderer.lines.should contain /moof/
    puts @renderer.lines
  end

  it "should accept a block for command" do
    Cowsay.say do |command|
      command.mode = :stoned
      command.text = "im in ur block"
    end.should contain /im in ur block/
  end

  it "shouldn't need any arguments" do
    Cowsay.say do |c|
      c.text = "im in ur block"
    end.should contain /im in ur block/
  end
end
