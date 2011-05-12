class Cowsay

  attr_reader :lines

  def initialize(width = '100%', height = '100%')
    @width  = width
    @height = height
  end

  def say(command)
    @lines = []
    text   = `#{command}`
    text.each_line do |l|
      add_line l
    end
    to_s
  end

  def add_line(line)
    @lines << "<text>#{line.chomp}</text>\n"
  end

  def to_s
    svg = "<?xml version='1.0' standalone='no'?>\n"
    svg << "<!DOCTYPE svg PUBLIC '-//W3C//DTD SVG 1.1//EN' "
    svg << "'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd'>\n"
    svg << "<svg width='#{@width}' height='#{@height}' version='1.1' "
    svg << "xmlns='http://www.w3.org/2000/svg'>\n"

    @lines.each do |l|
      svg << l
    end

    svg << "</svg>\n"
  end
end

