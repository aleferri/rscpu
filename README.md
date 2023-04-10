# rscpu
Relatively Simple CPU

Because i have too much free time (not really, shed a tear)

## ISA
Basically an 8 instruction, very unconfortable and awkward, cpu: the kind you get into trouble if you are seen with it. While it won't fetch and execute you right away (or your program, as it is currently not working) there are speculation that it will at some point.

The instruction set is an expansion of the very simple cpu, so the first four were set in stone (ADD, AND, STA, JMP) and next 4 carefully selected from the pool of 3,684 instruction of the x86-64 architecture, plus NOR. Why not OR? Laziness.

## Memory
Exists, and also has 4 memory mapped index registers, just like PDP-8 (that had 8), but less of them and also work differently or not at all (i have yet to test them).
