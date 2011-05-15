require 'spec_helper'

module Cowsay
  describe Command do

    before :each do
      @command      = Command.new
      @command.text = 'foo'
    end

    it "should initialize with default text" do
      Command.new.text.should == 'MOOF!'
    end

    it "should create string starting with cowsay and ending with text" do
      @command.to_s.should match /cowsay\s+"foo"/
    end

    it "should add correct switch for borg cow" do
      @command.mode = :borg
      @command.to_s.should eql 'cowsay -b "foo"'
    end

    it "should add width param" do
      @command.width = '96'
      @command.to_s.should eql 'cowsay -W 96 "foo"'
    end

    it "should add eyes param" do
      @command.eyes = '96'
      @command.to_s.should eql 'cowsay -e 96 "foo"'
    end

    it "should add tongue param" do
      @command.tongue = '()'
      @command.to_s.should eql 'cowsay -T () "foo"'
    end

    it "tongue param should be exactly 2 characters" do
      @command.tongue = '('
      @command.to_s.should eql 'cowsay "foo"'
      @command.tongue = '(|)'
      @command.to_s.should eql 'cowsay "foo"'
    end

    it "should not add eyes or tongue param when mode is specified" do
      @command.eyes   = '96'
      @command.tongue = '()'
      @command.mode   = :stoned
      @command.to_s.should eql 'cowsay -s "foo"'
    end

    it "should add the nowrap switch" do
      @command.nowrap = true
      @command.to_s.should eql 'cowsay -n "foo"'
    end

    it "should use a specified file in the cowpath" do
      @command.file = 'beavis.zen.cow'
      @command.to_s.should eql 'cowsay -f beavis.zen.cow "foo"'
    end
  end
end

