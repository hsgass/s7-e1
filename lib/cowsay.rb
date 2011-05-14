require_relative 'cowsay/command'

module Cowsay

  def self::say(command, renderer, options)
    renderer.output(`#{command}`.split("\n"), options)
  end
end

