import java.io.File;
import java.io.PrintStream;
import java.io.IOException;


// compileOp(): add multiply and division functionality
// compileTerm()

public class CompilationEngine {
 
   File compiledFile;
   PrintStream outstream;
   JackTokenizer tokenizer;
   SymbolTable st;
   VMWriter vm;
 
   String[] ops = { "+","-","*","/","&","|","<",">","="};
   
   String className = "";
 
   public CompilationEngine(String inFile, String outFile) throws IOException {
    	compiledFile = new File(outFile);
      outstream = new PrintStream(compiledFile);
      
      if (!compiledFile.exists()) {
         compiledFile.createNewFile();
      } 
      
      tokenizer = new JackTokenizer(inFile); 
      tokenizer.advance(); 
 
      st = new SymbolTable();  
      vm = new VMWriter(outFile);
   }
   
   public String outputNextToken() {
      String currToken = tokenizer.currentToken();
      outstream.println(tokenizer.generateXML());

      if(tokenizer.hasMoreTokens()) {
         tokenizer.advance();
      }
      return currToken; // returns the token that is printed to the output file
   }
   
   public void compileClass() {
      System.out.println("in compileClass()");
      
		outputNextToken(); // should be "<keyword> class </keyword>"
      outputNextToken(); // should output the class name
      outstream.println("(kind: class, being defined)");
      outputNextToken(); // should be "<symbol> { </symbol>"
      
      String t = tokenizer.currentToken();
      while(!(t.equals("constructor") || t.equals("function") || t.equals("method"))) {
         compileClassVarDec();
         t = tokenizer.currentToken();
      }
      while(!t.equals("}")) {
         compileSubroutine();
         t = tokenizer.currentToken();
      }
      outputNextToken(); // should be "<symbol> } </symbol>"
      
   }
 
   public void compileClassVarDec() {
      System.out.println("in compileClassVarDec()");
      
      String kind = outputNextToken(); // should either be "static" or "field"
      String type = outputNextToken(); // variable data type
      String name = outputNextToken(); // name of the variable
      
      st.define(name, type, kind); // adds the variable to the class symbol table
      outstream.println("(kind: "+kind+", being defined, index:" + st.indexOf(name)+")");
      
      while(tokenizer.currentToken().equals(",")) {
         outputNextToken(); // ','
         name = outputNextToken(); // name of the variable
         st.define(name, type, kind);
         outstream.println("(kind: "+kind+", being defined, index:" + st.indexOf(name)+")");
      }
      
      outputNextToken(); // outputs semicolon      
   }
 
   public void compileSubroutine() {
      System.out.println("in compileSubroutine()");
              
      outputNextToken(); // 'constructor'|'function'|'method'
      outputNextToken(); // return type
      outputNextToken(); // subroutine name
      
      outstream.println("(kind: subroutine, being defined)");
      
      outputNextToken(); // '('
      compileParameterList(); // parameters
      outputNextToken(); // ')'
      compileSubroutineBody();
      
   }
   
   public void compileSubroutineBody() {
      System.out.println("in compileSubroutineBody()");
      outputNextToken(); // '{'
      
      while(!isStatement(tokenizer.currentToken()) && !(tokenizer.currentToken().equals("}"))) { // checks if the current token marks the beginning of a statement
         compileVarDec(); // handle variable declarations
      } 
      
      compileStatements(); // subroutine statements
      
      outputNextToken(); // '}'
   }
 
   public void compileParameterList() {
      System.out.println("in compileParameterList()");
      
      if(!tokenizer.currentToken().equals(")")) { // check to see if there are arguments
         String type = outputNextToken(); // argument variable type
         String name = outputNextToken(); // argument variable name
         
         st.define(name, type, "ARG"); // adds the argument variable to the subroutine symbol table
         outstream.println("(kind: argument, being used, index:" + st.indexOf(name)+")");
         
         while(tokenizer.currentToken().equals(",")) {
            outputNextToken(); // ','
            type = outputNextToken(); // argument var type
            name = outputNextToken(); // argument var name
            
            st.define(name, type, "ARG"); // adds the argument variable to the subroutine symbol table
            outstream.println("(kind: argument, being used, index:" + st.indexOf(name)+")");
         }
      }     
   }
 
   public void compileVarDec() {
      System.out.println("in compileVarDec()");
      
      String kind = outputNextToken(); // keyword 'var'
      String type = outputNextToken(); // variable type
      String name = outputNextToken(); // variable name
      
      st.define(name, type, kind); // add the variable to the symbol table
      outstream.println("(kind: "+kind+", being defined, index:" + st.indexOf(name)+")");
      
      while(tokenizer.currentToken().equals(",")) {
         outputNextToken(); // ','
         name = outputNextToken(); // variable name
         st.define(name, type, kind);
         outstream.println("(kind: "+kind+", being defined, index:" + st.indexOf(name)+")");
      }
      
      outputNextToken(); // ';'      
   }
 
   public void compileStatements() {
      System.out.println("in compileStatements()");
            
      while(isStatement(tokenizer.currentToken())) {
          compileStatement();
      }       
   }
   
   public void compileStatement() {
      System.out.println("in compileStatement()");
      switch(tokenizer.currentToken()) {
         case "let":
            compileLet();
            break;
         case "if":
            compileIf();
            break;
         case "while":
            compileWhile();
            break;
         case "do":
            compileDo();
            break;
         case "return":
            compileReturn();
            break;
         default:
            break;
      }
   }
 
   public void compileDo() {
      System.out.println("in compileDo()");
      
      outputNextToken(); // 'do'
      subroutineCall();  // expression
      outputNextToken(); // ';'      
   }
 
   public void compileLet() {
      System.out.println("in compileLet()");
      
      outputNextToken(); // 'let'
      String name = outputNextToken(); // variable name
      outstream.println("(kind: "+st.kindOf(name)+", being used, index: "+ st.indexOf(name)+")");
      
      if(tokenizer.currentToken().equals("[")) {
         outputNextToken(); // '['
         compileExpression();
         outputNextToken(); // ']'
      }
      
      outputNextToken();  // '='
      compileExpression();
      outputNextToken(); // ';'      
   }
 
   public void compileWhile() {
      System.out.println("in compileWhile()");
      
      outputNextToken(); // 'while'
      outputNextToken(); // '('
      compileExpression();
      outputNextToken(); // ')'
      outputNextToken(); // '{'
      compileStatements();
      outputNextToken(); // '}'   
   }
 
   public void compileReturn() {
      System.out.println("in compileReturn()");      
      outputNextToken(); // 'return'
      
      if(!tokenizer.currentToken().equals(";")) {
         compileExpression();
      }
      
      outputNextToken(); // ';'      
   }
 
   public void compileIf() {
      System.out.println("in compileIf()");       
       outputNextToken(); // 'if'
       outputNextToken(); // '('
       compileExpression();
       outputNextToken(); // ')'
       outputNextToken(); // '{'
       compileStatements();
       outputNextToken(); // '}'
       
       if(tokenizer.currentToken().equals("else")) {
         outputNextToken(); // 'else'
         outputNextToken(); // '{'
         compileStatements();
         outputNextToken(); // '}'
       }       
   }
 
   public void compileExpression() {
      System.out.println("in compileExpression()");
      
      compileTerm();
      
      while(isOp(tokenizer.currentToken())) {
         compileOp(); // 'op'
         compileTerm();
      }
      
   }
 
   public void compileTerm() {
      System.out.println("in compileTerm()");
      
      String token = tokenizer.currentToken();
      String next = tokenizer.nextToken();
      String type = tokenizer.tokenType();    
      
      System.out.println("token: " + token + ", next: " + next);
      
      if(type.equals("INT_CONST") || type.equals("STRING_CONST") || type.equals("KEYWORD")) {
         outputNextToken(); // integer constant, string constant, or keyword
      } else if(type.equals("IDENTIFIER")) {   
         if(next.equals("(") || next.equals(".")) { // subroutine call   
            subroutineCall();
         } else if(next.equals("[")) { // array entry
            String name = outputNextToken(); // array name
            outstream.println("(kind: "+ st.kindOf(name) + ", being used, index:" + st.indexOf(name)+")");
            outputNextToken(); // '['
            compileExpression();
            outputNextToken(); // ']'
         } else { // variable name
            String name = outputNextToken();
            outstream.println("(kind: " + st.kindOf(name) + ", being used, index:" + st.indexOf(name)+")");
         }
      } else if(token.equals("-") || token.equals("~")) {
         compileUnaryOp();
         compileTerm();
      } else {
         outputNextToken(); // '('
         compileExpression();
         outputNextToken(); // ')'
      }
   }
   
   public void subroutineCall() { 
      System.out.println("in subroutineCall()");
      
      // Compiler I
      String next = tokenizer.nextToken();
      if(next.equals(".")) {
         String name = outputNextToken(); //  className | varName
         outstream.println("(kind: "+ st.kindOf(name) +", being used, index: " + st.indexOf(name)+")");
         outputNextToken(); // '.'
      }
      outputNextToken(); // subroutine name
      outputNextToken(); // '('
      compileExpressionList();
      outputNextToken(); // ')'
   }
 
   public void compileExpressionList() {
      System.out.println("in compileExpressionList()");
      
      if(!tokenizer.currentToken().equals(")")) { // sees if there is at least one expression
         compileExpression();
         
         while(tokenizer.currentToken().equals(",")) { // compile the remaining expressions
            outputNextToken(); // ','
            compileExpression();
         }
      }
   }
   
   public void compileOp() {
      System.out.println("in compileOp()");
      if(isOp(tokenizer.currentToken())) {
         outputNextToken(); // op
      }
   }
   
   public void compileUnaryOp() {
   System.out.println("in compileUnaryOp()");
      if(tokenizer.currentToken().equals("-") || tokenizer.currentToken().equals("~")) {
         outputNextToken(); // unaryOp
      }
   }
   
   public void compileKeywordConstant() {
      System.out.println("in compileConstant()");
      if(isKeywordConstant(tokenizer.currentToken())) {
         outputNextToken(); // 'true'|'false'|'null'|'this'
      }
   }
   
   public boolean isOp(String s) {
      for(String op : ops) {
         if(op.equals(s)) return true;
      }
      return false;
   }
   
   public boolean isStatement(String s) {
      if(s.equals("let") || s.equals("if")|| s.equals("while") || s.equals("do") || s.equals("return")) return true;
      return false;
   }
   
   public boolean isKeywordConstant(String s) {
      if(s.equals("true") || s.equals("false")|| s.equals("null") || s.equals("this")) return true;
      return false;
   }
  
}