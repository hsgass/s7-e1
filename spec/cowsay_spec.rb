require 'spec_helper'

describe Cowsay do

  before :each do
    @command      = Cowsay::Command.new
    @renderer     = RenderSpy.new
    @options      = { 'img_width' => '100%', 'img_height' => '100%' }
    @command.text = 'moof'
  end

  it "should contain specified text" do
    Cowsay.say @renderer, @command, @options
    @renderer.lines.should contain /moof/
    puts @renderer.lines
  end

  it "should accept a block for command" do
    Cowsay.say(@renderer) do |command|
      command.text = "im in ur block"
    end

    @renderer.lines.should contain /im in ur block/
    puts @renderer.lines
  end

  it "shouldn't need any arguments" do
    Cowsay.say do |command|
      command.text = "im in ur block"
    end.should contain /im in ur block/
  end
end
