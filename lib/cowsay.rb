class Cowsay

  attr_reader :lines

  def initialize(renderer, img_width = '100%', img_height = '100%')
    @renderer   = renderer
    @img_width  = img_width
    @img_height = img_height
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
    @renderer.output(@lines, @img_width, @img_height)
  end
end

