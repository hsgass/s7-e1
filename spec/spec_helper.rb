require 'cowsay'
require 'command'
require 'svg_renderer'
require 'rspec/expectations'

RSpec::Matchers.define :be_empty do
  match do |m|
    m.empty?
  end
end
