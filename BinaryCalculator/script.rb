#!/usr/bin/env ruby

# Note: you'll have to change the line endings
# to LF for the dot slash shebang to work.

puts "It works!"
begin
	STDIN.gets
rescue Interrupt => e
	nil
end