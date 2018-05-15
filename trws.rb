#! /usr/bin/env ruby

require 'optparse'

def modified
  modified_list = []
  `git status`.each_line do |line|
    if line =~ /modified:\s+.*$/
      modified_list << line.match(/modified:\s+(.*)$/).captures.first
    end
  end
  modified_list
end

def remove_trailing_whitespace!(file)
  new_file_text = IO.readlines(file).map do |line|
    line.rstrip
  end

  f = File.open(file, "w")
  f.puts(new_file_text)
  f.close
end

options = {:f => nil}
parser = OptionParser.new do |opts|
  opts.banner = 'Usage: Remove whitespace from files'
  opts.on('-g', 'Run against all git status modified files') do |g|
    if options[:f]
      puts opts
      exit
    end
    options[:g] = g
  end
  opts.on('-f [FILE]', 'Run against file specified') do |f|
    if options[:g] || f.nil?
      puts opts
      exit
    end
    options[:f] = f
  end
end
parser.parse!

if options[:f].nil? && options[:g].nil?
  puts parser
  exit
end

if options[:g]
  modified.each do |file|
    remove_trailing_whitespace!(file)
    puts("Removed whitespace in file: #{file}")
  end
  exit
end

remove_trailing_whitespace!(options[:f])
puts("Removed whitespace in file: #{options[:f]}")

