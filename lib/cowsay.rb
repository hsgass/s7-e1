require_relative 'cowsay/command'
require_relative 'cowsay/svg_renderer'

module Cowsay
  extend self

  def say(params = {})
    renderer = params.delete(:renderer) || SVGRenderer
    command  = params.delete(:command)  || Command.new
    options  = params.delete(:options)  || { img_width: '100%', img_height: '100%' }
    yield command if block_given?
    renderer.output(`#{command}`.split("\n"), options)
  end

  OUTPUT_TEMPLATES = File.expand_path("#{File.dirname(__FILE__)}/../data/templates/")
end

