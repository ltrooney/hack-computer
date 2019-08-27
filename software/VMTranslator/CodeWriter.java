import java.io.*;

public class CodeWriter {
   String outputFileName;
   File file;
   PrintStream outfile;
   int labelIndex = 0;
   int returnAddressIndex=0;
   String currentFunctionName = "";
         
   public CodeWriter(String inputFileName) throws IOException { 
      int outputNameEnd;
      String outputName ="";
      
      if(inputFileName.contains(".vm")) { // .vm file name
         outputNameEnd = inputFileName.length()-3;
      } else {// directory name
         outputNameEnd = inputFileName.length();
         outputName = "/Users/lukerooney/Desktop/Projects/Java/HackComputer/VMTranslator/"+inputFileName.substring(0, outputNameEnd)+"/";
      }
      
      outputName += inputFileName.substring(0, outputNameEnd)+".asm";

      setFileName(outputName); 
      
      File file = new File(outputFileName);
      outfile = new PrintStream(file);
      
      if (!file.exists()) {
         file.createNewFile();
      }      
   }
   
   public void setFileName(String fileName) {
      outputFileName = fileName;
   }
   
   public void incrementSP() {
   		// M[SP]=M[SP]+1
        outfile.println("@SP");
        outfile.println("M=M+1");
   }
   
   public void decrementSP() {
   		// M[SP]=M[SP]-1
        outfile.println("@SP");
        outfile.println("M=M-1");
   }
   
   public void writeArithmetic(String command) { // writes for arithmetic commands
      // commands: add, sub, neg, eq, gt, lt, and, or, not
            
      if(command.equals("add")||command.equals("sub")) {
         outfile.println("@SP");   
         outfile.println("A=M-1");     // A=M[pointee of SP-1]
         outfile.println("A=A-1");     // A=M[pointee of SP-2]
         outfile.println("D=M");       // D=M[pointee of SP-2]
         outfile.println("A=A+1");     // A=M[poitnee of SP-1]
         
         if(command.equals("add"))
            outfile.println("D=D+M");  // D=M[pointee of SP-2]+M[pointee of SP-1]
         else 
            outfile.println("D=D-M");  // D=M[pointee of SP-2]-M[pointee of SP-1]
            
         decrementSP();                // decrement SP 
         outfile.println("@SP");
         outfile.println("A=M-1");     // A=M[pointee of SP-1]
         outfile.println("M=D");       // M[pointee of SP-1]=M[pointee of SP-2] +/- M[pointee of SP-1]
         
      } else if(command.equals("neg")) {
         // M[SP]=-M[SP]
         outfile.println("@SP");   
         outfile.println("A=M-1");     // A=pointee of SP-1
         outfile.println("D=M");		   // D=M[pointee of SP-1]
         outfile.println("M=-D");      // M[SP]=-M[SP]
      } else if(command.equals("eq")||command.equals("gt")||command.equals("lt")) {
         outfile.println("@SP");       // @SP
         outfile.println("A=M-1");     // A=M[pointee of SP]-1
         outfile.println("A=A-1");     // A=M[pointee of SP]-2
         outfile.println("D=M");       // D=M[pointee of SP-2]
         outfile.println("A=A+1");     // A=M[pointee of SP]-1
         outfile.println("D=D-M");     // D=(M[pointee of SP-2])-(M[pointee of SP-1])
            
         decrementSP();
            
         outfile.println("@TRUE"+labelIndex);
         
         if(command.equals("eq"))
            outfile.println("D;JEQ");   // jump if M[SP-1]=M[SP-2]
         else if(command.equals("gt"))
            outfile.println("D;JGT");   // jump if M[SP-1]>M[SP-2]
         else
            outfile.println("D;JLT");   // jump if M[SP-1]<M[SP-2]
            
         outfile.println("@FALSE"+labelIndex); 
         outfile.println("0;JMP");
            
         // creates a TRUE label that sets M[pointee of SP-1] to -1
         outfile.println("(TRUE"+labelIndex+")"); 
         outfile.println("@SP");
         outfile.println("A=M-1"); 
         outfile.println("M=-1");   
         outfile.println("@CONTINUE"+labelIndex);
         outfile.println("0;JMP");
          
         // creates a FALSE label that sets M[pointee of SP-1] to 0
         outfile.println("(FALSE"+labelIndex+")"); 
         outfile.println("@SP");
         outfile.println("A=M-1"); 
         outfile.println("M=0");
         outfile.println("@CONTINUE"+labelIndex);
         outfile.println("0;JMP");
            
         // creates a label for the TRUE/FALSE to jump to in order to continue execution
         outfile.println("(CONTINUE"+labelIndex+")");
      } else if(command.equals("and")||command.equals("or")){
         // M[SP-2]=M[SP-2] and/or M[SP-1]
         outfile.println("@SP");   
         outfile.println("A=M-1");     // A=M[pointee of SP-1]
         outfile.println("D=M");       // D=M[pointee of SP-1]
         outfile.println("A=A-1");     // A=M[pointee of SP-2]
         
         if(command.equals("and"))
            outfile.println("D=D&M");  // D=M[pointee of SP-1]&M[pointee of SP-2]
         else
            outfile.println("D=D|M");
         
         decrementSP();                // decrements SP
         outfile.println("@SP");
         outfile.println("A=M-1");     // A=pointee of SP-1
         outfile.println("M=D");       // M[pointee of SP-2]=M[pointee of SP-1]+M[pointee of SP-2]     
      } else if(command.equals("not")) {
         // M[SP-1]=!M[SP-1]
         outfile.println("@SP");   // @SP
         outfile.println("A=M-1"); // A=M[SP]-1
         outfile.println("D=!M");  // D=!M[SP-1]
         outfile.println("M=D");   // M[pointee of SP-1]=!M[pointee of SP-1]
      }
      labelIndex++;  // increments the index for the TRUE/FALSE/CONTINUE labels   
   }
   
   public void writePushPop(String command, String segment, int index) { // writes for push/pop commands
      
      String outputFileNameNoExtension = outputFileName.substring(0,outputFileName.length()-4);

      /* PUSH */
      if(command.equals("C_PUSH")) {     		      	
         if(segment.equals("argument")||segment.equals("local")||segment.equals("this")|| 
            segment.equals("that")||segment.equals("pointer")||segment.equals("temp")) {
               
               // chooses the register based off the segment
               if(segment.equals("pointer")||segment.equals("this"))
                  outfile.println("@THIS");
               else if(segment.equals("temp"))
                  outfile.println("@R5");
               else if(segment.equals("argument"))
                  outfile.println("@ARG");
               else if(segment.equals("local"))
                  outfile.println("@LCL");
               else if(segment.equals("that"))
                  outfile.println("@THAT");
               
               /*  chooses whether to store address of register or M[address of register]
                *  based off of the segment
                */
               if(segment.equals("pointer")||segment.equals("temp"))
                  outfile.println("D=A");     // D=addr. pointee of RAM
               else
                  outfile.println("D=M");     // D=M[pointee of RAM]
                  
               // assembly code remains the same for each segment        
               outfile.println("@"+index); // A=index
               outfile.println("D=D+A");   // D=M[pointee of RAM]+index
               outfile.println("A=D");
               outfile.println("D=M");
               outfile.println("@SP");
               outfile.println("A=M");     // A=M[SP]
               outfile.println("M=D");     // M[pointee of SP]=M[pointee of RAM]+index                  
          } else if(segment.equals("constant")) {
               // M[pointee of SP]=index
               outfile.println("@"+index); 
               outfile.println("D=A"); // D=index
               outfile.println("@SP"); 
               outfile.println("A=M"); // A=M[SP]
               outfile.println("M=D"); // M[pointee of SP] = index            
          } else if(segment.equals("static")) {
               // M[pointee of SP] = M[VM_file.index]
               
               // R13 gets the value of M[VM_file.index]
               outfile.println("@"+outputFileNameNoExtension+"."+index);
               outfile.println("D=M");  // D=M[VM_file.index]
               outfile.println("@R13");
               outfile.println("M=D");  // M[R13]=D
               outfile.println("D=M");  // D=M[R13]
               
               // SP gets the value of R13
               outfile.println("@SP");
               outfile.println("A=M");  // A=M[SP]
               outfile.println("M=D");  // D=RAM[pointee of SP]
               
          }

          incrementSP(); // increments the SP pointer
      } 
      
      /* POP */
      else {    
         decrementSP(); // decrements the SP pointer

         if(segment.equals("pointer")||segment.equals("temp")||segment.equals("local")||
            segment.equals("argument")||segment.equals("this")||segment.equals("that")) {
                
            // D gets the value at RAM[pointee of SP] after SP is decremented
            outfile.println("@SP"); 
            outfile.println("A=M");     // A=M[SP]
            outfile.println("D=M");     // D[pointee of SP] = M[pointee of SP]
            
            // store D into temporary register R13
            outfile.println("@R13");
            outfile.println("M=D");
            
            // chooses which register to pop to
            if(segment.equals("pointer")||segment.equals("this"))
               outfile.println("@THIS");
            else if(segment.equals("temp"))
               outfile.println("@R5");
            else if(segment.equals("local")) 
               outfile.println("@LCL"); 
            else if(segment.equals("argument"))
               outfile.println("@ARG");
            else if(segment.equals("that"))
               outfile.println("@THAT");
            
            // D gets the address value of M[THIS+index]
            if(segment.equals("pointer")||segment.equals("temp"))
               outfile.println("D=A");     // D=address of register
            else
               outfile.println("D=M");     // D=M[pointee addr. of register]
               
            outfile.println("@"+index); // A=index
            outfile.println("D=D+A");   // D=pointee addr. of register+index
            
            // store D (address of M[pointee of register+index]) into R14
            outfile.println("@R14");
            outfile.println("M=D"); 
            
            // R13 holds the value of M[pointee of SP]
            // R14 holds address of M[pointee of register+index]
            // M[pointee of R14]=M[R13]
            outfile.println("@R13");
            outfile.println("D=M");     // D=M[R13]
            outfile.println("@R14");
            outfile.println("A=M");     // A=M[R14]
            outfile.println("M=D");     // M[pointee of R14]=M[R13]
         } else if(segment.equals("constant")) {
            // don't know how to pop a constant
         } else if(segment.equals("static")) {
            // R13 gets the value of M[SP]
            outfile.println("@SP");
            outfile.println("A=M");  // A=M[SP]
            outfile.println("D=M");  // D=M[pointee of SP]
            outfile.println("@R13");
            outfile.println("M=D");  // M[R13]=D
            
            // M[VM_file] gets the value of R13
            outfile.println("@"+outputFileNameNoExtension+"."+index);
            outfile.println("M=D");  // D=RAM[pointee of SP]
         }
      }      
   }
   
   public void writeInit() { 
      outfile.println("@256");
      outfile.println("D=A");
      outfile.println("@SP");
      outfile.println("M=D");     // M[SP]=256 sets the address of the stack pointer
      writeCall("Sys.init", 0);   // calls the Sys.init function     
   }
 
   // program flow command
   public void writeLabel(String label) {
      outfile.println("("+label+")");   
   }
   
   // program flow command
   public void writeGoto(String label) {
      outfile.println("@"+label);
      outfile.println("0;JMP");     // calls the function with the name of the label
   }
   
   // program flow command
   public void writeIf(String label) {
      decrementSP();
      outfile.println("@SP");
      outfile.println("A=M");       // A=pointee address of SP
      outfile.println("D=M");       // D=M[pointee of SP]
      outfile.println("@"+label);
      outfile.println("D;JNE");     // calls function named label if M[pointee of SP] != 0
   }
   
   // function call command
   public void writeCall(String functionName, int numArgs) {
      // push return-address
      // push LCL
      // push ARG
      // push THIS
      // push THAT
      for(int i = 1; i <= 5; i++) {
         if(i==1) outfile.println("@return-address"+returnAddressIndex);
         else if(i==2) outfile.println("@LCL");
         else if(i==3) outfile.println("@ARG");
         else if(i==4) outfile.println("@THIS");
         else outfile.println("@THAT");
         outfile.println("D=A"); // D=symbol address
         outfile.println("@SP"); 
         outfile.println("A=M"); // A=M[SP]
         outfile.println("M=D"); // M[pointee of SP] = index
         incrementSP();
      }
      
      // M[ARG] = M[SP]-n-5
      outfile.println("@SP");
      outfile.println("D=M");       // D=M[SP]
      outfile.println("@"+numArgs);
      outfile.println("D=D-A");     // D=M[SP]-numArgs
      outfile.println("@5");
      outfile.println("D=D-A");     // D=M[SP]-numArgs-5
      outfile.println("@ARG");
      outfile.println("M=D");       // M[ARG]=M[SP]-numArgs-5
      
      // M[LCL] = M[SP]
      outfile.println("@SP");
      outfile.println("D=M");       // D=M[SP]
      outfile.println("@LCL");
      outfile.println("M=D");       // M[LCL]=M[SP]
      
      writeGoto(functionName);
      outfile.println("(return-address"+returnAddressIndex+")"); // make the return-address label unique
      returnAddressIndex++;

   }
   
   // function call command
   public void writeReturn() {
      // M[FRAME] = M[LCL]
      outfile.println("@LCL");
      outfile.println("D=M");       // D=M[LCL]
      outfile.println("@FRAME");
      outfile.println("M=D");       // M[FRAME]=M[LCL]
      
      // RET = *(FRAME-5)
      outfile.println("@FRAME");
      outfile.println("D=A");
      outfile.println("@5");
      outfile.println("D=D-A");     // D=M[FRAME]-5
      outfile.println("A=D");       // A=M[FRAME]-5
      outfile.println("D=M");       // D=M[pointee of FRAME-5]
      outfile.println("@RET");
      outfile.println("M=D");       // M[RET]=M[pointee of FRAME-5]
      
      // *ARG = pop()
      writePushPop("C_POP", "argument", 0);
      
      // M[SP]=M[ARG]+1
      outfile.println("@ARG");
      outfile.println("D=M+1");     // D=M[ARG]+1
      outfile.println("@SP");
      outfile.println("M=D");       // M[SP]=M[ARG]+1
      
      // THAT = *(FRAME-1)
      // THIS = *(FRAME-2)
      // ARG = *(FRAME-3)
      // LCL = *(FRAME-4)
      for(int i = 1; i <= 4; i++) {
         outfile.println("@FRAME");
         outfile.println("A=M");       // A=M[FRAME]
         outfile.println("D=A");
         outfile.println("@"+i);       // choose how much to subtract
         outfile.println("D=D-A");     // D=M[FRAME]-i
         outfile.println("A=D");       // A=M[FRAME]-i
         outfile.println("D=M");       // D=M[pointee of FRAME-i]
         
         // choose which register to change
         if(i==1) outfile.println("@THAT");
         else if(i==2) outfile.println("@THIS");
         else if(i==3) outfile.println("@ARG");
         else outfile.println("@LCL");

         outfile.println("M=D");       // M[register]=M[pointee of FRAME-i]
      }
            
      // goto RET
      writeGoto("RET");
      
   }
   
   // function call command
   public void writeFunction(String functionName, int numLocals) {    
      /* 
         int i = 1
         while(i <= numLocals) {
            PUSH 0
            i++
         }
      */
      currentFunctionName = functionName;
      
      outfile.println("("+functionName+")");
      
      // pre-loop
      outfile.println("@i");
      outfile.println("M=1");  // M[i]=1
      outfile.println("D=M");
      
      // loop conditional
      outfile.println("("+functionName+"LOOP)");
      outfile.println("@i");
      outfile.println("D=M");       // D=M[i]
      outfile.println("@"+numLocals);
      outfile.println("D=D-A");     // D=M[i]-numLocals
      outfile.println("@"+functionName+"CONTINUED");
      outfile.println("D;JGT");     // jump if M[i] > numLocals
      
      // loop body
      writePushPop("C_PUSH", "constant", 0); // push constant 0
      outfile.println("@i");
      outfile.println("M=M+1");     // M[i]+=1
      outfile.println("@"+functionName+"LOOP");
      outfile.println("0;JMP");
      
      // post-loop
      outfile.println("("+functionName+"CONTINUED)");
   }
   
   public void close() {
      // ADD INFINITE LOOP CODE HERE
      outfile.println("(END)");
      outfile.println("@END");
      outfile.println("0;JMP");
      outfile.close();
   }
}