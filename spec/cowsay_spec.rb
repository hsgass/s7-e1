require 'spec_helper'

describe Cowsay do

  before :each do
    @command      = Cowsay::Command.new
    @renderer     = RenderSpy.new
    @options      = { 'img_width' => '100%', 'img_height' => '100%' }
    @command.text = 'moof'
  end

  it "should contain specified text" do
    Cowsay.say @command, @renderer, @options
    @renderer.lines.should contain /moof/
    puts @renderer.lines
  end
end
