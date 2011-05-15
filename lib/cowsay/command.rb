module Cowsay
  class Command

    attr_accessor :text, :mode, :eyes, :tongue, :width, :nowrap, :file

    SWITCH_VALUES = {
      :borg     => ' -b',
      :dead     => ' -d',
      :greedy   => ' -g',
      :paranoid => ' -p',
      :stoned   => ' -s',
      :tired    => ' -t',
      :wired    => ' -w',
      :youthful => ' -y'
    }

    def initialize
      @text = 'MOOF!'
    end

    def to_s
      cowsay = "cowsay"
      if SWITCH_VALUES.include? @mode
        cowsay << SWITCH_VALUES[@mode]
      else
        cowsay << " -e #{@eyes}" if @eyes
        cowsay << " -T #{@tongue}" if (@tongue and @tongue.length == 2)
      end

      cowsay << " -W #{@width}" if @width
      cowsay << " -n" if @nowrap
      cowsay << " -f #{@file}" if @file
      cowsay << " \"#{@text}\""
    end
  end
end

