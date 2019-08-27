import java.io.*;

public class Assembler {
   public static void main(String[] args) throws IOException {
      String fileName = args[0];
      Parser p = new Parser(fileName);
      Code c = new Code();
      SymbolTable st = new SymbolTable();
      
      int ROMAddress = 0; // keeps track of instruction address
      int RAMAddress = 16;
      
      // output file
      String outputFileName = fileName.substring(0, fileName.length()-4)+".hack";
      File file = new File(outputFileName);
      PrintStream outfile = new PrintStream(file);
      
      if (!file.exists()) {
         file.createNewFile();
      }
      
      st.addEntry("SP", 0);
      st.addEntry("LCL", 1);
      st.addEntry("ARG", 2);
      st.addEntry("THIS", 3);
      st.addEntry("THAT", 4);
      st.addEntry("R0", 0);
      st.addEntry("R1", 1);
      st.addEntry("R2", 2);
      st.addEntry("R3", 3);
      st.addEntry("R4", 4);
      st.addEntry("R5", 5);
      st.addEntry("R6", 6);
      st.addEntry("R7", 7);
      st.addEntry("R8", 8);
      st.addEntry("R9", 9);
      st.addEntry("R10", 10);
      st.addEntry("R11", 11);
      st.addEntry("R12", 12);
      st.addEntry("R13", 13);
      st.addEntry("R14", 14);
      st.addEntry("R15", 15);
      st.addEntry("SCREEN", 16384);
      st.addEntry("KBD", 24576);
      
      // first-pass
      while(p.hasMoreCommands()) { 
         p.advance(); // sets current command to current line in input
         
         String commandType = p.commandType();  
              
         if(commandType.equals("C_COMMAND")) {
            ROMAddress++;
         } else if(commandType.equals("A_COMMAND")) {
            ROMAddress++;
         } else if(commandType.equals("L_COMMAND")) {               
            // add the symbol to the symbol table if it doesnt already contain it
            String symbol = p.symbol();
            if(!st.contains(symbol)) {
               st.addEntry(symbol, ROMAddress); 
            }  
         }
      }
      
      p = new Parser(fileName);
      
      // second-pass
      while(p.hasMoreCommands()) { 
         p.advance(); // sets current command to current line in input
         
         String commandType = p.commandType();  
              
         if(commandType.equals("C_COMMAND")) {
               // C-command mnemonics
               String compMnemonic = p.comp();  
               String destMnemonic = p.dest();                            
               String jumpMnemonic = p.jump();         		
               
               // binary representation of C-command mnemonics
               String compBinary = c.comp(compMnemonic);
               String destBinary = c.dest(destMnemonic);
               String jumpBinary = c.jump(jumpMnemonic);
               
               // prints to outfile the complete binary C-command            
               outfile.println("111" + compBinary + destBinary + jumpBinary); 
 
         } else if(commandType.equals("A_COMMAND")) {              
               String symbol = p.symbol();
               if(st.contains(symbol)) {  
                  symbol = Integer.toString(st.getAddress(symbol));               
               } else {
                  // DOESNT WORK WHEN DIRECTLY ADDRESSING BY NUMBER
                  boolean parsable = true;   
                  try { // check to see if String input could be parsed to an integer
                     Integer.parseInt(symbol); // converts String address to int
                  } catch(NumberFormatException e) {
                     parsable = false;
                  } 
                   
                  if(!parsable) { // symbol is NOT an integer address
                     st.addEntry(symbol, RAMAddress);
                     symbol = Integer.toString(RAMAddress);
                     RAMAddress++;
                  } 
               }
               
               // converts string address to integer
               int decimal = Integer.parseInt(symbol);  
               
               // converts int address to string binary            
               String outString = Integer.toBinaryString(decimal);
               
               outfile.print("0"); // prints the first 0 of A-command
               
               // prints leading zeroes of binary A-command
               for(int i = 0; i < (15-outString.length()); i++) {
                  outfile.print("0");
               }
               // appends the A-command address in binary
               outfile.println(outString);
               
         }
         System.out.println(p.currCmnd);
      }
      
      outfile.close();
   }
}