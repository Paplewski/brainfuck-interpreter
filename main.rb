#!/usr/bin/env ruby

if ARGV.length != 1
    puts "Please provide the path to brainfuck program"
    exit
end
bf_filename = ARGV[0]
unless File.exist?(bf_filename)
    puts "File %s doesnt exist" % [bf_filename]
    exit
end

FILE = File.read(bf_filename)
puts FILE