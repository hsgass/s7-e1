require_relative 'cowsay/command'
require_relative 'cowsay/svg_renderer'

module Cowsay
  extend self

  def say(renderer = SVGRenderer, command = Command.new, options = {})
    yield command if block_given?
    renderer.output(`#{command}`.split("\n"), options)
  end
end

