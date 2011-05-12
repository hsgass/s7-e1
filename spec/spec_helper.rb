require 'cowsay'
require 'command'
require 'rspec/expectations'

RSpec::Matchers.define :be_empty do
  match do |array|
    array.empty?
  end
end
