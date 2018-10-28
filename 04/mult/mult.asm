// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@R2 
M=0  // 0 de R2 shokka suru
@R1 
D=M  // take the secound number
@i
M=D  // save it to repeat the sum that much of times

(MULT)
@i
D=M
@END
D;JEQ // end the cicle if i = 0

@R0
D=M
@R2
M=D+M // in the first cicle sums 0 + the first number, and accumulate for the next cicle

@i 
M=M-1 // count how many times it was added

@MULT 
0; JMP // go to next cicle


(END)
@END
0; JMP