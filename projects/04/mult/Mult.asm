// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// PSEUDOFUNCTION
// i = 0;
// sum = 0;
// while(i < M[R1]) {
// 	  sum += M[R0];
//	  i++;
// }
// R2 = sum;

	@i   		
	M=0  		// M[i]=0
	@sum
	M=0;		// M[sum]=0
(LOOP)
	// conditional part of while statement
	@i
	D=M 		// D=M[i]
	@R1	
	D=D-M		// D=M[i]-M[R1]
	@END
	D;JGE		// jump to END if (M[i]-M[R1])=0 or M[i] >= M[R1]

	// performs sum += R0
	@R0
	D=M 		// D=M[R0]
	@sum
	M=M+D 		// M[sum]=M[sum]+M[R0]

	// i++
	@i
	M=M+1		// M[i]=M[i]+1 (i++)
	@LOOP
	0;JMP 		// go to beginning of loop
(END)
	// sets M[R2]=M[sum]
	@sum
	D=M 		// D=M[sum]
	@R2
	M=D 		// M[R2]=M[sum]
	@END
	0;JMP



