import java.util.Hashtable;
import java.util.ArrayList;
import java.util.Enumeration;

public class SymbolTable {

   // represents the value of the subroutine symbol   
   private class Value {
      String type;
      String kind;
      int index;
      
      public Value(String t, String k, int i) {
         type = t;
         kind = k;
         index = i;
      }
      
      public String getType() { return type; }
      public String getKind() { return kind.toUpperCase(); }
      public int getIndex() { return index; }
   }
   
   Hashtable<String, Value> classST; // symbol table for the current class
   Hashtable<String, Value> subroutineST; // symbol table for the current subroutine
   int staticIndex;
   int fieldIndex;
   int argumentIndex;
   int varIndex;
   
   public SymbolTable() {
      classST = new Hashtable<String, Value>();
      subroutineST = new Hashtable<String, Value>();
      staticIndex = 0; // running index for static class variables
      fieldIndex = 0; // running index for field class variables
      argumentIndex = 0; // running index for subroutine arguments
      varIndex = 0; // running index for subroutine local variables
   }
   
   public void startSubroutine() {
      subroutineST = new Hashtable<String, Value>(); // clear the table when a subroutine is started
      argumentIndex = 0;
      varIndex = 0;
   }
   
   public void define(String name, String type, String kind) {
      if(kind.equalsIgnoreCase("STATIC")){
         classST.put(name, new Value(type, "STATIC", staticIndex++));
      } else if(kind.equalsIgnoreCase("FIELD")) {
         classST.put(name, new Value(type, "FIELD", fieldIndex++));
      } else if(kind.equalsIgnoreCase("ARG")) {
         subroutineST.put(name, new Value(type, "ARG", argumentIndex++));
      } else if(kind.equalsIgnoreCase("VAR")) {
         subroutineST.put(name, new Value(type, "LOCAL", varIndex++));
      }
   }
   
   public int varCount(String kind) {
      int count = 0;
      Hashtable<String, Value> ht;
      
      if(kind.equalsIgnoreCase("STATIC") || kind.equalsIgnoreCase("FIELD")) {
         ht = classST;
      } else if(kind.equalsIgnoreCase("ARG") || kind.equalsIgnoreCase("VAR")) {
         ht = subroutineST;
      } else {
         return 0; // exit method and return 0
      }
      Enumeration e = ht.keys();
      while(e.hasMoreElements()) {
         String varName = (String)e.nextElement(); // gets the key 
         String k = ht.get(varName).getKind(); // gets the value of the key
         if(k.equals(kind)) { 
            count++; // increments counter if there is a match
         }
      }
      return count;
   }
   
   public String kindOf(String name) {
      // this method returns the kind of variable that is passed into it
      Value subVal = subroutineST.get(name); // gets the value of the variable in the subroutine, if it exists
      Value classVal = classST.get(name); // gets the value of the variable in the class, if it exists
      if(subVal != null) {  // sees if the variable is in the current subroutine first
         return subVal.getKind(); 
      } else if(classVal != null) { // sees if the variable is in the class if it is not in the subroutine
         return classVal.getKind();
      }
      return "NONE"; // returns NONE if it does not exist
   }
   
   public String typeOf(String name) { // should only call if the variable exists in the scope
      Value subVal = subroutineST.get(name); // gets the value of the variable in the subroutine, if it exists
      Value classVal = classST.get(name); // gets the value of the variable in the class, if it exists
      if(subVal != null) {  // sees if the variable is in the current subroutine first
         return subVal.getType(); 
      } else if(classVal != null) { // sees if the variable is in the class if it is not in the subroutine
         return classVal.getType();
      }
      return "NONE"; // returns NONE if it does not exist
   }
   
   public int indexOf(String name) { // should only call if the variable exists in the scope
      Value subVal = subroutineST.get(name); // gets the value of the variable in the subroutine, if it exists
      Value classVal = classST.get(name); // gets the value of the variable in the class, if it exists
      if(subVal != null) {  // sees if the variable is in the current subroutine first
         return subVal.getIndex(); 
      } else if(classVal != null) { // sees if the variable is in the class if it is not in the subroutine
         return classVal.getIndex();
      }
      return -1; // returns NONE if it does not exist
   }
}