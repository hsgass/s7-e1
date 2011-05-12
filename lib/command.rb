class Command

  attr_accessor :text, :mode, :eyes, :tongue, :width, :nowrap, :file

  def initialize
    @switch_values = {
      'borg'     => ' -b',
      'dead'     => ' -d',
      'greedy'   => ' -g',
      'paranoid' => ' -p',
      'stoned'   => ' -s',
      'tired'    => ' -t',
      'wired'    => ' -w',
      'youthful' => ' -y'
    }
  end

  def to_s
    cowsay = "cowsay"

    has_mode = @switch_values.include? @mode
    if (has_mode)
      cowsay << @switch_values[@mode]
    end

    if (@eyes and not has_mode)
      cowsay << " -e #{@eyes}"
    end

    if (@tongue and tongue.length == 2 and not has_mode)
      cowsay << " -T #{@tongue}"
    end

    if (@width)
      cowsay << " -W #{@width}"
    end

    if (@nowrap)
      cowsay << " -n"
    end

    if (@file)
      cowsay << " -f #{@file}"
    end

    cowsay << " \"#{@text}\""
  end
end
