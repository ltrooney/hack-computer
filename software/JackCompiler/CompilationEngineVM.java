import java.io.File;
import java.io.PrintStream;
import java.io.IOException;
import java.util.Hashtable;

public class CompilationEngineVM {
 
   JackTokenizer tokenizer;
   SymbolTable st;
   VMWriter vm;
 
   String[] ops = { "+","-","*","/","&","|","<",">","="};
   
   String className;
   String calleeName;
   String subroutineType;
   String subroutineReturnType;
   boolean calleeIsMethod;
   boolean calleeIsFunction;
   int numFieldVars;
   int numParameterListArgs;  // the number of arguments defined in the current subroutine
   int numExpressionListArgs; // the number of arguments passed into a called subroutine
   int numLocalVars;
   String subroutineName;
   boolean currFunctionIsMethod;
   int ifLabelIndex;
   int whileLabelIndex;
 
   public CompilationEngineVM(String inFile, String outFile) throws IOException {
      // initialize instance variables
      className = "";
      calleeName = "";
      subroutineType = "";
      subroutineReturnType = "";
      numFieldVars = 0;
      numParameterListArgs = 0;
      numExpressionListArgs = 0;
      numLocalVars = 0;
      subroutineName = "";
      currFunctionIsMethod = false;
      ifLabelIndex = 0;
      whileLabelIndex = 0;
      calleeIsMethod = false;
      calleeIsFunction = false;
      
      tokenizer = new JackTokenizer(inFile); 
      tokenizer.advance(); 
 
      st = new SymbolTable();  
      vm = new VMWriter(outFile);
   }
   
   public void compileClass() {
      //System.out.println("in compileClass()");
      
		tokenizer.advance(); // skips 'class'
      className = tokenizer.currentToken(); // class name
      tokenizer.advance(); // advances
      tokenizer.advance(); // skips '{'
      
      numFieldVars = 0;
      
      String t = tokenizer.currentToken();
      while(!(t.equals("constructor") || t.equals("function") || t.equals("method"))) {
         compileClassVarDec();
         t = tokenizer.currentToken();
      }
      while(!t.equals("}")) {
         compileSubroutine();
         t = tokenizer.currentToken();
      }
      
      // skips closing '}' 
      vm.close();
   }
 
   public void compileClassVarDec() {
      //System.out.println("in compileClassVarDec()");
            
      String kind = tokenizer.currentToken(); // should either be "static" or "field"
      tokenizer.advance();
      String type = tokenizer.currentToken(); // variable data type
      tokenizer.advance();
      String name = tokenizer.currentToken(); // name of the variable
      tokenizer.advance();
      
      st.define(name, type, kind); // adds the variable to the class symbol table
      if(kind.equals("field")) numFieldVars++; // keeps track of the number of field variables
      System.out.println("(name: " + name + ", kind: "+kind+", being defined, index:" + st.indexOf(name)+")");
      
      while(tokenizer.currentToken().equals(",")) {
         tokenizer.advance(); // skips ','
         name = tokenizer.currentToken(); // name of the variable
         tokenizer.advance();
         st.define(name, type, kind);
         if(kind.equals("field")) numFieldVars++;
         System.out.println("(name: " + name + ", kind: "+kind+", being defined, index:" + st.indexOf(name)+")");
      }
      
      tokenizer.advance(); // skips ';'      
   }
 
   public void compileSubroutine() {
      //System.out.println("in compileSubroutine()");
      st.startSubroutine(); // creates new subroutine symbol table
                    
      subroutineType = tokenizer.currentToken(); // 'constructor'|'function'|'method'
      tokenizer.advance(); // advances
      
      subroutineReturnType = tokenizer.currentToken(); // stores return type
      tokenizer.advance();
      
      subroutineName = className + "." + tokenizer.currentToken(); // subroutine name
      tokenizer.advance(); // advances
      
      System.out.println("COMPILING THE SUBROUTINE: " + subroutineName);
      
      tokenizer.advance(); // skips '('
      
      compileParameterList(); // compiles the subroutine arguments and gets # of arguments
      if(subroutineType.equals("method")) {
         numParameterListArgs += 1;
         currFunctionIsMethod = true;
      } else {
         currFunctionIsMethod = false;
      }
            
      tokenizer.advance(); // skips ')'
      compileSubroutineBody();
   }
   
   public void compileSubroutineBody() {
      //System.out.println("in compileSubroutineBody()");
      tokenizer.advance(); // skips '{'
      
      // reset the VM label indexes for if/while statements
      ifLabelIndex = 0;
      whileLabelIndex = 0; 
      
      numLocalVars = 0;
      
      while(!isStatement(tokenizer.currentToken()) && !(tokenizer.currentToken().equals("}"))) { // checks if the current token marks the beginning of a statement
         compileVarDec(); // handle variable declarations
      } 
      vm.writeFunction(subroutineName, numLocalVars); // writes the function declaration with the correct # of local vars
      
      if(subroutineType.equals("constructor")) {         
         vm.writePush("CONST", numFieldVars); // pushes the number of field variables as a constant
         vm.writeCall("Memory.alloc", 1); // calls Memory.alloc on that number
         vm.writePop("POINTER", 0);
      }
      
      if(currFunctionIsMethod) {
         vm.writePush("ARG", 0);
         vm.writePop("POINTER", 0);
      }
      
      compileStatements(); // subroutine statements
      
      tokenizer.advance(); // skips '}'
   }
 
   public void compileParameterList() {
      //System.out.println("in compileParameterList()");
      numParameterListArgs = 0;
      
      if(!tokenizer.currentToken().equals(")")) { // check to see if there are arguments
         String type = tokenizer.currentToken(); // argument variable type
         tokenizer.advance(); // advances
         String name = tokenizer.currentToken(); // argument variable name
         tokenizer.advance(); // advances
         numParameterListArgs++;
         
         st.define(name, type, "ARG"); // adds the argument variable to the subroutine symbol table
         System.out.println("(name: " + name + ", kind: ARG, being used, index:" + st.indexOf(name)+")");
         
         while(tokenizer.currentToken().equals(",")) {
            tokenizer.advance(); // skips ','
            type = tokenizer.currentToken(); // argument var type
            tokenizer.advance(); // advances
            name = tokenizer.currentToken(); // argument var name
            tokenizer.advance(); // advances
            numParameterListArgs++;
            
            st.define(name, type, "ARG"); // adds the argument variable to the subroutine symbol table
            System.out.println("(name: " + name + ", kind: ARG, being used, index:" + st.indexOf(name)+")");
         }
      }  
   }
 
   public void compileVarDec() {
      //System.out.println("in compileVarDec()");
      
      String kind = tokenizer.currentToken(); // keyword 'var' 
      tokenizer.advance(); // skips keyword 'var'
      String type = tokenizer.currentToken(); // variable type
      tokenizer.advance();
      String name = tokenizer.currentToken(); // variable name
      tokenizer.advance();
            
      st.define(name, type, kind); // add the variable to the symbol table
      numLocalVars++;
      System.out.println("(name: " + name + ", kind: VAR" + ", being defined, index:" + st.indexOf(name)+")");
      
      while(tokenizer.currentToken().equals(",")) {
         tokenizer.advance(); // skips ','
         name = tokenizer.currentToken(); // variable name
         tokenizer.advance();
         st.define(name, type, kind);
         numLocalVars++;
         System.out.println("(name: " + name + ", kind: VAR" + ", being defined, index:" + st.indexOf(name)+")");
      }
      
      tokenizer.advance(); // skips ';'      
   }
 
   public void compileStatements() {
      //System.out.println("in compileStatements()");
            
      while(isStatement(tokenizer.currentToken())) {
          compileStatement();
      }       
   }
   
   public void compileStatement() {
      //System.out.println("in compileStatement()");
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
      //System.out.println("in compileDo()");
      
      tokenizer.advance(); // skips 'do'
      subroutineCall();  // expression
      
      // if calling a void function or method then pop temp 0      
      if(calleeIsMethod || calleeIsFunction) {
         vm.writePop("TEMP", 0); 
      }
      
      tokenizer.advance(); // skips ';'      
   }
 
   public void compileLet() {
      //System.out.println("in compileLet()");
      boolean statementIsArray = false;
      
      tokenizer.advance(); // 'let'
      String name = tokenizer.currentToken(); // variable name
      tokenizer.advance(); // advance
      System.out.println("(name: " + name + ", kind: "+st.kindOf(name)+", being used, index: "+ st.indexOf(name)+")");
      
      if(tokenizer.currentToken().equals("[")) {
         statementIsArray = true;
         tokenizer.advance(); // skips '['
         compileExpression();
         vm.writePush(st.kindOf(name), st.indexOf(name)); // pushes the value of the array at the index
         vm.writeArithmetic("ADD");
         tokenizer.advance(); // skips ']'
      }
      
      tokenizer.advance();  // skips '='
      compileExpression();           
      tokenizer.advance(); // skips ';'
            
      String kind = "";
      if(st.kindOf(name).equals("FIELD")) {
         kind = "THIS";
      } else if(st.kindOf(name).equals("VAR")) { 
         kind = "LOCAL";
      } else {
         kind = st.kindOf(name);
      }
      
      if(!statementIsArray) {
         vm.writePop(kind, st.indexOf(name)); // pops the let statement evaluation back into the variable 
      } else {
         vm.writePop("TEMP", 0); // pops the expression evaluation to the TEMP segment
         vm.writePop("POINTER", 1); // pops array index 
         vm.writePush("TEMP", 0); // pushes the expression evaluation
         vm.writePop("THAT", 0); // pops it to the 'THAT' segment
      }   
   }
 
   public void compileWhile() {
      //System.out.println("in compileWhile()"); 
      tokenizer.advance(); // skips 'while'
      tokenizer.advance(); // skips '('
      
      String whileTrueLabel = subroutineName + "$WHILE_TRUE" + whileLabelIndex;
      String whileFalseLabel = subroutineName + "$WHILE_FALSE" + whileLabelIndex;
      //String whileTrueLabel = "WHILE_EXP" + whileLabelIndex;
      //String whileFalseLabel = "WHILE_END" + whileLabelIndex;
      
      whileLabelIndex++;
      
      vm.writeLabel(whileTrueLabel);
      compileExpression();
      vm.writeArithmetic("NOT");
      vm.writeIf(whileFalseLabel);
      
      tokenizer.advance(); // skips ')'
      tokenizer.advance(); // skips '{'
      compileStatements();
      tokenizer.advance(); // skips '}'   
      
      vm.writeGoto(whileTrueLabel);
      vm.writeLabel(whileFalseLabel);     
   }
 
   public void compileReturn() {
      //System.out.println("in compileReturn()");      
      tokenizer.advance(); // 'return' 
      
      if(!tokenizer.currentToken().equals(";")) { // returns the expression evaluation
         compileExpression();
      } else if(subroutineReturnType.equals("void")) { // returns 0 if return type is void
         vm.writePush("CONST", 0);
      }
      
      vm.writeReturn();
      
      tokenizer.advance(); // ';'
   }
 
   public void compileIf() {
       //System.out.println("in compileIf()");           
       tokenizer.advance(); // skips 'if'
       tokenizer.advance(); // skips '('
       compileExpression(); // compiles the conditional statement
       tokenizer.advance(); // skips ')'
       tokenizer.advance(); // skips '{'

       String ifFalseLabel = subroutineName + "$IF_FALSE" + ifLabelIndex;
       String ifTrueLabel = subroutineName + "$IF_TRUE" + ifLabelIndex;
       String endLabel = subroutineName + "$IF_END" + ifLabelIndex;
       //String ifFalseLabel = "IF_FALSE" + ifLabelIndex;
       //String ifTrueLabel = "IF_TRUE" + ifLabelIndex;
       //String endLabel = "IF_END" + ifLabelIndex;
       
       ifLabelIndex++;

       vm.writeIf(ifTrueLabel); // write VM label if TRUE
       vm.writeGoto(ifFalseLabel); 
       vm.writeLabel(ifTrueLabel); // write VM label if FALSE
       compileStatements(); // compiles if conditional is TRUE     
              
       tokenizer.advance(); // skips '}'
       
       if(tokenizer.currentToken().equals("else")) { // contains an else statement
         tokenizer.advance(); // skips 'else'
         tokenizer.advance(); // skips '{'
         vm.writeGoto(endLabel);
         vm.writeLabel(ifFalseLabel);
         compileStatements(); // compiles if the conditional is false
         tokenizer.advance(); // skips '}'
         vm.writeLabel(endLabel);
       } else {
         vm.writeLabel(ifFalseLabel);
       }    
   }
 
   public void compileExpression() {
      //System.out.println("in compileExpression()");
      
      compileTerm(); // writes the first expression
      
      while(isOp(tokenizer.currentToken())) {
         String op = tokenizer.currentToken(); // stores operator
         tokenizer.advance(); // advances to second expression
         compileTerm(); // compiles the second expression
         switch(op) { // writes the operator
         case "+":
            vm.writeArithmetic("ADD");
            break;
         case "-":
            vm.writeArithmetic("SUB");
            break;
         case "*":
            vm.writeCall("Math.multiply", 2);
            break;
         case "/":
            vm.writeCall("Math.divide", 2);
            break; 
         case "&":
            vm.writeArithmetic("AND");
            break;   
         case "|":
            vm.writeArithmetic("OR");
            break;
         case "<":
            vm.writeArithmetic("LT");
            break;
         case ">":
            vm.writeArithmetic("GT");
            break;
         case "=":
            vm.writeArithmetic("EQ");
            break;
         default:
            break; 
         }
      }     
   }
 
   public void compileTerm() {
      //System.out.println("in compileTerm()");
      
      String token = tokenizer.currentToken();
      String next = tokenizer.nextToken();
      String type = tokenizer.tokenType();   
            
      if(type.equals("INT_CONST")) {
         vm.writePush("CONST", tokenizer.intVal()); // push constant n
         tokenizer.advance();
      } else if(type.equals("STRING_CONST")) {
         String str = token;
         int length = str.length()-2; // length of the string (minus 2 because of the quotes) 
         vm.writePush("CONST", length);
         vm.writeCall("String.new", 1); 
         
         for(int i = 1; i <= length; i++) {
            vm.writePush("CONST", (int) str.charAt(i)); // pushes the character in its ASCII
            vm.writeCall("String.appendChar", 2); // calls String.appendChar(nextChar)
         }
         tokenizer.advance();
      } else if(type.equals("IDENTIFIER")) {   
         if(next.equals("(") || next.equals(".")) { // subroutine call   
            subroutineCall();
         } else if(next.equals("[")) { // array entry
            String name = tokenizer.currentToken(); // array name
            tokenizer.advance(); // advances
            tokenizer.advance(); // skips '['  
            compileExpression(); // pushes the index of the array
            vm.writePush(st.kindOf(name), st.indexOf(name)); // pushes the array name
            tokenizer.advance(); // skips ']'
            vm.writeArithmetic("ADD"); // adds the array name and the index
            vm.writePop("POINTER", 1); // pops the array at the index into the pointer segment
            vm.writePush("THAT", 0); // pushes it back onto the stack
         } else { // variable name
            String name = tokenizer.currentToken();
            int index = st.indexOf(name);
            String kind = st.kindOf(name); 
            
            if(subroutineType.equals("method") && kind.equals("ARG")) { index++; }
            
            System.out.println("(name: " + name + ", kind: "+kind+", being used, index: "+ index +")");     
            vm.writePush(kind, index);
            tokenizer.advance();
         }
      } else if(type.equals("KEYWORD")) {
         if(token.equals("null") || token.equals("false")) {
            vm.writePush("CONST", 0);
         } else if(token.equals("true")) {
            vm.writePush("CONST", 0);
            vm.writeArithmetic("NOT");
         } else if(token.equals("this")) {
            vm.writePush("POINTER", 0);
         }
         tokenizer.advance(); // advances to next token
      } else if(token.equals("-") || token.equals("~")) {   
         String unaryOp = tokenizer.currentToken(); // stores the unary op
         tokenizer.advance(); // advances to the operand
         compileTerm(); // compiles the operand
         if(unaryOp.equals("-")) {
            vm.writeArithmetic("NEG");
         } else if(unaryOp.equals("~")) {
            vm.writeArithmetic("NOT");
         }
      } else {
         tokenizer.advance(); // skips '(' 
         compileExpression();
         tokenizer.advance(); // skips ')'
      }    
   }
   
   public void subroutineCall() { 
      //System.out.println("in subroutineCall()"); 
      calleeIsMethod = false;
      calleeIsFunction = false;
      boolean methodPrecededByVarName = false;
      
      String next = tokenizer.nextToken();
      if(next.equals(".")) {
         calleeName = tokenizer.currentToken(); //  className | varName
         
         if(!(st.kindOf(calleeName).equals("NONE"))) { // checks to see if it is in the class or subroutine symbol table
            calleeIsMethod = true; // subroutine call is in the form 'varName.xxx();'
            methodPrecededByVarName = true;
         } else {
            calleeIsFunction = true; // subroutine call is in the form 'className.xxx();'
         }
         
         tokenizer.advance(); // advances
         tokenizer.advance(); // skips '.'
      } else {
         calleeName = className;
         calleeIsMethod = true; // subroutine call is in the form 'xxx();'
      }
      
      String subroutineName = tokenizer.currentToken(); // subroutine name  

      tokenizer.advance(); // advances
      tokenizer.advance(); // skips '('
      
      if(calleeIsMethod) {
         if(methodPrecededByVarName) {
             if(st.kindOf(calleeName).equalsIgnoreCase("LOCAL")) {
               vm.writePush("LOCAL", 0);
             } else {
               vm.writePush("THIS", st.indexOf(calleeName));
             }
             compileExpressionList();
             tokenizer.advance(); // skips ')'
             vm.writeCall(st.typeOf(calleeName) + "." + subroutineName, numExpressionListArgs+1);
         } else {
             vm.writePush("POINTER", 0);
             compileExpressionList();
             tokenizer.advance(); // skips ')'
             vm.writeCall(className + "." + subroutineName, numExpressionListArgs+1);
         }
      } else {
         compileExpressionList();
         tokenizer.advance(); // skips ')'
         vm.writeCall(calleeName + "." + subroutineName, numExpressionListArgs);
      }  
   }
 
   public void compileExpressionList() {
      //System.out.println("in compileExpressionList()");
      numExpressionListArgs = 0;
      
      if(!tokenizer.currentToken().equals(")")) { // sees if there is at least one expression
         compileExpression();
         numExpressionListArgs++;
         
         while(tokenizer.currentToken().equals(",")) { // compile the remaining expressions
            tokenizer.advance(); // skips ','
            compileExpression();
            numExpressionListArgs++;
         }
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

}