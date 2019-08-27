import java.io.*;
import java.util.*;

public class Parser {   
   String line = null;
   String currCmnd = "";
      
   FileReader fileReader;
   BufferedReader bufferedReader;
   
   public Parser(String fileName) {
      try {
         fileReader = new FileReader(fileName);
         bufferedReader = new BufferedReader(fileReader);
      } catch(FileNotFoundException ex) {
         System.out.println("Unable to open file '" + fileName + "'");
      }
   }  
   
   public String parseInput() {
      String l = line.replaceAll("\\s+",""); // removes white-space in line
      int slashIndex = 0;
      for(int i = 0; i < l.length(); i++) {
         if(l.substring(i,i+1).equals("/")) {
            slashIndex = i;
         }
      }
      if(slashIndex != 0) {
         l = l.substring(0, slashIndex-1); // truncates line and omits comment
      }
      return l;
   }
   
   public boolean hasMoreCommands() {
      try {
         line = bufferedReader.readLine();
         if(line != null) {
            line = parseInput();
         }
      } catch(IOException ex) {
         ex.printStackTrace();
      }
      if(line != null) return true;
      return false;
   }
   
   public void advance() { // called if hasMoreCommands() == true
      currCmnd = line;
   }
   
   public String commandType() {
      if(line != null && line.length() > 1) {
         String s = line.substring(0,1);
         if(s.equals("@")) return "A_COMMAND";
         else if(s.equals("(")) return "L_COMMAND";
         else if(s.equals("D") || s.equals("A") || s.equals("M") || s.equals("0")) return "C_COMMAND";
         else return "";
      }
      return "";
   }
   
   public String symbol() {
      // only call when commandType() == A or L
      if(commandType().equals("A_COMMAND"))
         return line.substring(1, line.length());
      else
         return line.substring(1, line.length()-1);
   }
   
   public String dest() {
      int equalsSign = 0;
      for(int i = 0; i < currCmnd.length(); i++) {
         String s = currCmnd.substring(i,i+1);
         if(s.equals("=")) {
            equalsSign = i;
         }
      }
      String destMnemonic = currCmnd.substring(0,equalsSign);
      if(equalsSign != 0) return destMnemonic;
      return null;
   }
   
   public String comp() {
      // look for equals sign or semicolon
      int equalsSign = 0;
      int semicolon = 0;
      for(int i = 0; i < currCmnd.length(); i++) {
         String s = currCmnd.substring(i,i+1);
         if(s.equals("=")) {
            equalsSign = i;
         } else if(s.equals(";")) {
            semicolon = i;
         }
      }
      
      // stores the comp mnemonic
      String compMnemonic = currCmnd.substring(equalsSign+1,currCmnd.length());
      if(equalsSign != 0) {
         return compMnemonic; // returns everything after the = sign
      } else if(semicolon != 0) {
         return currCmnd.substring(0,1); // returns character before ";JMP"
      }
      return "";
   }
   
   public String jump() {
      if(currCmnd.substring(1,2).equals(";")) {
         return currCmnd.substring(2,5); // returns the jump mnemonic
      }
      return null;
   }
}