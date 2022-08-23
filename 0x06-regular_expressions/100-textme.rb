#!/usr/bin/env ruby
sender = ARGV[0].scan(/(?<=\[from:)(.*?)(?=\])/)
reciever = ARGV[0].scan(/(?<=\[to:)(.*?)(?=\])/)
flags = ARGV[0].scan(/(?<=\[flags:)(.*?)(?=\])/)
puts "#{sender[0][0]},#{reciever[0][0]},#{flags[0][0]}"
