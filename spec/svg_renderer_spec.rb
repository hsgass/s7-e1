require 'spec_helper'

module Cowsay
  describe SVGRenderer do

    before :each do
      @command      = Command.new
      @renderer     = SVGRenderer.new
      @options      = { 'img_width' => '100%', 'img_height' => '100%' }
      @command.text = 'moof!'
    end

    it "should produce lines starting and ending with <text> tag" do
      Cowsay.say(@command, @renderer, @options).each_line do |l|
        if l.start_with? '<text'
          l.should match /<text.?>[^\n]+<\/text>/
        end
      end
    end

    it "should render a specified file if it's in the cowpath" do
      default       = Cowsay.say(@command, @renderer, @options)
      @command.file = 'beavis.zen.cow'
      s             = Cowsay.say(@command, @renderer, @options)
      s.should_not == default
      puts s
    end

    it "should render eyes and tongue" do
      @command.eyes   = '88'
      @command.tongue = '99'
      s               = Cowsay.say(@command, @renderer, @options)

      s.should contain /88/
      s.should contain /99/
    end

    it "should not output any illegal XML characters" do
      Cowsay.say(@command, @renderer, @options).each_line do |l|
        if l.match /<text[^>]?>(.*)<\/text>/
          $1.should_not contain /[<>"']/
        end
      end
    end
  end
end