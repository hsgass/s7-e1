require 'cowsay'
require 'cowsay/svg_renderer'
require 'rspec/expectations'

RSpec::Matchers.define :contain do |regex|
  match do |m|
    (m.respond_to? :flatten and m.flatten.to_s.match regex ) or (m =~ regex)
  end
end

class RenderSpy
  attr_reader :lines, :options

  def output(lines, options)
    @lines   = lines
    @options = options
  end
end
