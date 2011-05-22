require "erb"
require 'cgi'

module Cowsay
  module SVGRenderer
    extend self

    def output(lines, options)
      @lines = lines
      @options = options
      template = File.read("#{Cowsay::OUTPUT_TEMPLATES}/svg.erb")
      ERB.new(template).result(binding)
    end
  end
end

