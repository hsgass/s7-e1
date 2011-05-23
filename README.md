# ruby-cowsay
A library for generating SVG files from the Unix cowsay command.

## Example Usage

    require 'cowsay'
    #=> true
    c = Cowsay::Command.new
    #=> cowsay "MOOF!"
    c.text = 'I am 100% pure beef.'
    #=> "I am 100% pure beef."
    c.mode = :borg
    #=> :borg
    File.open('example.svg', 'w') do |f|
      f.write Cowsay.say({command: c})
    end
    #=> 1044

-----

    require 'cowsay'
    #=> true
    File.open('example.svg', 'w') do |f|
      f.write(Cowsay.say() do |command|
        command.text = 'text goes here'
        command.mode = :tired
      end)
    end
    #=> 1071

`rake` to run the tests.

