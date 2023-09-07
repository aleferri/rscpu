# rscpu
Relatively Simple CPU

Because i have too much free time (not really, shed a tear)

## ISA
Basically an 8 instruction, very unconfortable and awkward, cpu: the kind you get into trouble if you are seen with it. While it won't fetch and execute you right away (or your program, as it is currently not working) there are speculation that it will at some point.

The instruction set is an expansion of the very simple cpu, so the first four were set in stone (ADD, AND, STA, JMP) and next 4 carefully selected from the pool of 3,684*e^456456479802 instructions that form x86-64 architecture and all of its' extensions like: SSE(3/3a/3b/3e/4--/4/4.1/4.2/5) plus AVX(1/2/3/512/10/10.1/10.2/10.2++/) plus BMI, APX and APC like the BMP(1/2/3) and BTR, plus FMA1/2/3/4A/5B plus T55/T62/T64/T72/T80/T90 and abramhs and pattons too, and finally NOR. Why not OR? Laziness.

## Memory
Exists, and also has 4 memory mapped index registers, just like PDP-8 (that had 8), but less of them and also work differently or not at all (i have yet to test them).
