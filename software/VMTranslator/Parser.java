import java.io.*;
import java.util.*;

public class Parser {
   String line = null;
   String currCmnd = "";
      
   FileReader fileReader;
   BufferedReader bufferedReader;
  
   Map<String, String> commands = new HashMap<String, String>();
   ArrayList<String> segments = new ArrayList<String>();
   
   public Parser(String fileName) {
      try {
         fileReader = new FileReader(fileName);
         bufferedReader = new BufferedReader(fileReader);
      } catch(FileNotFoundException ex) {
         System.out.println("Unable to open file '" + fileName + "'");
      }
      commands.put("add", "C_ARITHMETIC");
      commands.put("sub", "C_ARITHMETIC");
      commands.put("neg", "C_ARITHMETIC");
      commands.put("eq", "C_ARITHMETIC");
      commands.put("gt", "C_ARITHMETIC");
      commands.put("lt", "C_ARITHMETIC");
      commands.put("and", "C_ARITHMETIC");
      commands.put("or", "C_ARITHMETIC");
      commands.put("not", "C_ARITHMETIC");
      commands.put("push", "C_PUSH");
      commands.put("pop", "C_POP");
      commands.put("label", "C_LABEL");
      commands.put("if-goto", "C_IF");
      commands.put("goto", "C_GOTO");
      commands.put("function", "C_FUNCTION");
      commands.put("return", "C_RETURN");
      commands.put("call", "C_CALL");
      segments.add("argument");
      segments.add("local");
      segments.add("static");
      segments.add("constant");
      segments.add("this");
      segments.add("that");
      segments.add("pointer");
      segments.add("temp");
   } 
   
   public boolean hasMoreCommands() {
      try {
         line = bufferedReader.readLine();
         if(line != null) {
            line = parseInput(); // removes white-space and comments from the line
         }
      } catch(IOException ex) {
         ex.printStackTrace();
      }
      if(line != null) return true;
      return false;
   }
   
   public String parseInput() {
      String l = line.replaceAll("\\s+",""); // removes white-space in line
 
      int slashIndex = 0;
      if(l.contains("//"))
         l = l.substring(0, l.indexOf("//"));
      return l;
   }
   
   
   public void advance() { // called if hasMoreCommands() == true
      currCmnd = line; 
   }
   
   public String commandType() { // returns the type of command from the current line in the VM file
      String command = currCmnd;     
      
      Set<String> set = commands.keySet(); // creates set of all keys (commands) in commands hashmap
      Object[] keys = set.toArray(); // converts set of keys to array of keys
      
      // looks through all keys (commands) in commands hashmap
      for(int i = 0; i < commands.size(); i++) {
         String key = (String) keys[i]; // gets a command from commands hashmap to compare
         if(command.contains("if-goto")) return "C_IF"; // must check before checking for 'goto'
         
         if(command.contains(key)) { // check if current line contains a command
            return commands.get(keys[i]); // return the command's command type
         }
      }
      return "";
   }
   
   public String arg1() { // not called when commandType() == C_RETURN
      String command = currCmnd;
      Set<String> set = commands.keySet(); // creates set of all keys (commands) in commands hashmap
      Object[] keys = set.toArray(); // converts set of keys to array of keys
      
      for(int i = 0; i < commands.size(); i++) {
         String key = (String) keys[i]; // gets a command from commands hashmap to compare
         if(command.contains(key)) { // check if current line contains a command
            if(commandType().equals("C_ARITHMETIC")) return key; // returns arithmetic command name with no arg
            else if(commandType().equals("C_IF")) {
               // only works when 3 is added not sure why
               return command.substring(key.length()+3, command.length());
            }
            else if(commandType().equals("C_LABEL") || commandType().equals("C_GOTO")) {
               return command.substring(key.length(), command.length());
            }
            else if(commandType().equals("C_FUNCTION")||commandType().equals("C_CALL")) {
               return command.substring(key.length(), command.length()-1);
            }
            else { // command is C_PUSH or C_POP
               for(String arg : segments) {
                  if(command.contains(arg)) return arg; // returns first argument after command name
               }
            }
         } 
      }
      return "";
   }
   
   public int arg2() {
      String command = currCmnd;
      int arg1Index = command.indexOf(arg1()); // finds index of arg1
      int arg2Index = arg1Index + arg1().length(); // finds index of arg2
      String arg2 = command.substring(arg2Index); // gets String value of arg2
      return Integer.parseInt(arg2); // return integer value of arg2
   }
}