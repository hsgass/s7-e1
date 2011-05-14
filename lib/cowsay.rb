require_relative 'cowsay/command'
require_relative 'cowsay/svg_renderer'

module Cowsay
  extend self

  def say(command = Command.new, renderer = SVGRenderer.new, options = {})
    renderer.output(`#{command}`.split("\n"), options)
  end
end

