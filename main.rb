#!/usr/bin/env ruby

# Take a file path from a cmd line argument
if ARGV.length != 1
    puts "Please provide the path to brainfuck program"
    exit
end
bf_filename = ARGV[0]
unless File.exist?(bf_filename)
    puts "File %s doesnt exist" % [bf_filename]
    exit
end

# Open the file
FILE = File.read(bf_filename)
size = FILE.size

# bf_chars = ['>','<','+','-','.',',','[',']']
bf_pointer = 0
bf_tape = [0]

# print "Brainfuck characters: ", bf_chars
# puts
# puts
# puts "File content: ", FILE

puts
for i in 0..(FILE.size-1) do
    case FILE[i]
    when '>'
        bf_pointer+=1
        if bf_pointer >= bf_tape.size-1 
            bf_tape << 0
        end
        puts FILE[i],'{incrementing pointer ptr=%d}'% bf_pointer
    when '<'
        bf_pointer-=1
        puts FILE[i],'{decrementing pointer ptr=%d}'% bf_pointer

        if bf_pointer < 0 
            puts "ERROR: Using negative tape pointer."
            exit 1
        end
    when '+'
        bf_tape[bf_pointer]+=1
        puts FILE[i],'{incrementing contents cont=%d ptr=%d}' % [ bf_tape[bf_pointer], bf_pointer ]
    when '-'
        bf_tape[bf_pointer]-=1
        puts FILE[i],'{decrementing contents cont=%d ptr=%d}' % [ bf_tape[bf_pointer], bf_pointer ]
    when '.'
        print bf_tape[bf_pointer].chr
        puts FILE[i],'{printing %s }' % bf_tape[bf_pointer].chr
    when ','
        puts FILE[i],'{handling , }'
    when '['
        puts FILE[i],'{handling [ }'
    when ']'
        puts FILE[i],'{handling ] }'
    else
        print FILE[i]
    end
end

puts
puts "DEBUG INFO:"
puts "pointer: "+bf_pointer.to_s
print "tape: ", bf_tape, "\ntape size: ", bf_tape.size


# def FILE.remove_nonbf_chars
#     puts "HELLO from inside method"
#     puts FILE
# end

# FILE.remove_nonbf_chars
# puts "File content: ", FILE.remove_nonbf_chars


