import java.io.*;

// CodeWriter does not detect last line in input file


public class VMTranslator {
   public static void main(String[] args) throws IOException {
    	String fileName = args[0];

        // converts file from .vm format to .asm, keeps the same name
	   CodeWriter c = new CodeWriter(fileName);
      
	 	// if fileName is a directory, process all .vm files in the directory using
	 	// a separate Parser each time
	 	if(!(fileName.contains(".vm"))) { // if command line argument is a directory         
	 		File[] vmFiles = new File(fileName).listFiles(); // array of all files in the directory
	 		for(File f : vmFiles) { // parse each .vm file in the directory
            if(f.getName().contains(".vm")){
	 			   Parser p = new Parser(fileName+"/"+f.getName());
	 			   writeFromFile(p,c);
            }
	 		}
	 	} else { // if command line argument is a .vm file
	 		Parser p = new Parser(fileName);
	 		writeFromFile(p,c);
	 	}
	 
		c.close();
   }
   
   public static void writeFromFile(Parser p, CodeWriter c) {   
       // c.writeInit();  
             
        while(p.hasMoreCommands()) {	
            p.advance(); // advances to next line in input
            //System.out.println(p.currCmnd);
            
        	   String command = p.currCmnd;
            String commandType = p.commandType();
            if(commandType.equals("C_ARITHMETIC") && !(commandType.equals("C_RETURN"))) {
               c.writeArithmetic(command);
            } else if(commandType.equals("C_PUSH") || commandType.equals("C_POP")) {
               String segment = p.arg1();
           	   int index = p.arg2();
         	   c.writePushPop(commandType, segment, index);
            } 
            else if(commandType.equals("C_LABEL")||commandType.equals("C_GOTO")||commandType.equals("C_IF")) {
               String label = c.currentFunctionName + "$" + p.arg1();
               if(commandType.equals("C_LABEL")) {
                  c.writeLabel(label);
               } else if(commandType.equals("C_GOTO")) {
                  c.writeGoto(label);
               } else if(commandType.equals("C_IF")) {
                  c.writeIf(label);
               } 
            }
            else if(commandType.equals("C_FUNCTION")||commandType.equals("C_CALL")) {
               String functionName = p.arg1();
               int numLocals = p.arg2();
               if(commandType.equals("C_FUNCTION"))
                  c.writeFunction(functionName, numLocals);
               else
                  c.writeCall(functionName, numLocals);
               
            }
            else if(commandType.equals("C_RETURN")) {
               c.writeReturn();
            }
        }
   }
}