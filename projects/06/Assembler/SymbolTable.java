import java.util.Hashtable;

public class SymbolTable {

   Hashtable<String, Integer> symbolTable;

   public SymbolTable() {
      symbolTable = new Hashtable<String, Integer>();
   }
   
   public void addEntry(String symbol, int address) {
      symbolTable.put(symbol, address);
   }
   
   public boolean contains(String symbol) {
      return symbolTable.containsKey(symbol);
   }
   
   public int getAddress(String symbol) {
      return symbolTable.get(symbol);
   }
}