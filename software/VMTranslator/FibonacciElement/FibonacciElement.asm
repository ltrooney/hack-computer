@256
D=A
@SP
M=D
@return-address0
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=A
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=A
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=A
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@0
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Sys.init
0;JMP
(return-address0)
(Main.fibonacci)
@i
M=1
D=M
(Main.fibonacciLOOP)
@i
D=M
@0
D=D-A
@Main.fibonacciCONTINUED
D;JGT
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@i
M=M+1
@Main.fibonacciLOOP
0;JMP
(Main.fibonacciCONTINUED)
@ARG
D=M
@0
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
A=M-1
A=A-1
D=M
A=A+1
D=D-M
@SP
M=M-1
@TRUE0
D;JLT
@FALSE0
0;JMP
(TRUE0)
@SP
A=M-1
M=-1
@CONTINUE0
0;JMP
(FALSE0)
@SP
A=M-1
M=0
@CONTINUE0
0;JMP
(CONTINUE0)
@SP
M=M-1
@SP
A=M
D=M
@Main.fibonacci$IF_TRUE
D;JNE
@Main.fibonacci$IF_FALSE
0;JMP
(Main.fibonacci$IF_TRUE)
@ARG
D=M
@0
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@FRAME
M=D
@FRAME
D=A
@5
D=D-A
A=D
D=M
@RET
M=D
@SP
M=M-1
@SP
A=M
D=M
@R13
M=D
@ARG
D=M
@0
D=D+A
@R14
M=D
@R13
D=M
@R14
A=M
M=D
@ARG
D=M+1
@SP
M=D
@FRAME
A=M
D=A
@1
D=D-A
A=D
D=M
@THAT
M=D
@FRAME
A=M
D=A
@2
D=D-A
A=D
D=M
@THIS
M=D
@FRAME
A=M
D=A
@3
D=D-A
A=D
D=M
@ARG
M=D
@FRAME
A=M
D=A
@4
D=D-A
A=D
D=M
@LCL
M=D
@RET
0;JMP
(Main.fibonacci$IF_FALSE)
@ARG
D=M
@0
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
A=M-1
A=A-1
D=M
A=A+1
D=D-M
@SP
M=M-1
@SP
A=M-1
M=D
@return-address1
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=A
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=A
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=A
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Main.fibonacci
0;JMP
(return-address1)
@ARG
D=M
@0
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
A=M-1
A=A-1
D=M
A=A+1
D=D-M
@SP
M=M-1
@SP
A=M-1
M=D
@return-address2
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=A
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=A
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=A
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Main.fibonacci
0;JMP
(return-address2)
@SP
A=M-1
A=A-1
D=M
A=A+1
D=D+M
@SP
M=M-1
@SP
A=M-1
M=D
@LCL
D=M
@FRAME
M=D
@FRAME
D=A
@5
D=D-A
A=D
D=M
@RET
M=D
@SP
M=M-1
@SP
A=M
D=M
@R13
M=D
@ARG
D=M
@0
D=D+A
@R14
M=D
@R13
D=M
@R14
A=M
M=D
@ARG
D=M+1
@SP
M=D
@FRAME
A=M
D=A
@1
D=D-A
A=D
D=M
@THAT
M=D
@FRAME
A=M
D=A
@2
D=D-A
A=D
D=M
@THIS
M=D
@FRAME
A=M
D=A
@3
D=D-A
A=D
D=M
@ARG
M=D
@FRAME
A=M
D=A
@4
D=D-A
A=D
D=M
@LCL
M=D
@RET
0;JMP
@256
D=A
@SP
M=D
@return-address3
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=A
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=A
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=A
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@0
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Sys.init
0;JMP
(return-address3)
(Sys.init)
@i
M=1
D=M
(Sys.initLOOP)
@i
D=M
@0
D=D-A
@Sys.initCONTINUED
D;JGT
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@i
M=M+1
@Sys.initLOOP
0;JMP
(Sys.initCONTINUED)
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
@return-address4
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=A
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=A
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=A
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Main.fibonacci
0;JMP
(return-address4)
(Sys.init$WHILE)
@Sys.init$WHILE
0;JMP
(END)
@END
0;JMP
