module Cowsay
  class SVGRenderer

    def output(lines, options)
      svg = <<-EOT
<?xml version='1.0' standalone='no'?>
<!DOCTYPE svg PUBLIC '-//W3C//DTD SVG 1.1//EN'
'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd'>
<svg width='#{options["img_width"]}' height='#{options['img_height']}'
version='1.1' xmlns='http://www.w3.org/2000/svg'>
EOT

      lines.each do |l|
        l.sub! /&/, '&amp;'
        l.sub! /</, '&lt;'
        l.sub! />/, '&gt;'
        l.sub! /"/, '&quot;'
        l.sub! /'/, '&apos;'
        svg << "<text>#{l}</text>\n"
      end

      svg << '</svg>'
    end
  end
end

