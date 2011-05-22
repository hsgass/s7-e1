# ruby-cowsay
A library for generating SVG files from the Unix cowsay command.

## Basic Usage
`rake` to run the tests.

irb example:

    > require './lib/cowsay'
    > Cowsay.say {|c| c.text='foo'; c.mode=:borg}

