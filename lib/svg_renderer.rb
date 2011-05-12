class SVGRenderer

  def output(lines, img_width, img_height)
    svg = "<?xml version='1.0' standalone='no'?>\n"
    svg << "<!DOCTYPE svg PUBLIC '-//W3C//DTD SVG 1.1//EN' "
    svg << "'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd'>\n"
    svg << "<svg width='#{img_width}' height='#{img_height}' version='1.1' "
    svg << "xmlns='http://www.w3.org/2000/svg'>\n"

    lines.each do |l|
      svg << l
    end

    svg << "</svg>\n"
  end
end
