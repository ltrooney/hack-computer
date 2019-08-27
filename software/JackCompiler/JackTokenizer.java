import java.io.*;
import java.util.ArrayList;
 
 
public class JackTokenizer {
   String line; // current line of input
   String currentToken; // currentToken being looked at
   
   ArrayList<String> tokens; // all tokens in the file
   int tokenIndex; // index of currentToken
   
   boolean containsMultiLineComment; // whether the current line contains a portion of a multi-line comment
   boolean quoteBeginsString;  // indicates if the current token is a string

   String[] keywords = { 
   	"class", "constructor", "function", "method", "field", "static", "var", "int",
   	"char", "boolean", "void", "true", "false", "null", "this", "let", 
   	"do", "if", "else", "while", "return"
   };
 
   String[] symbols = {
   	"{", "}", "(", ")", "[", "]", ".", ",", ";", "+", "-", "*",
   	"/", "&", "|", "<", ">", "=", "~"
   };
 
   FileReader fileReader;
   BufferedReader bufferedReader;
 
 
   public JackTokenizer(String fileName) {
      line = "";
      currentToken = "";
      tokens = new ArrayList<String>(); // contains all tokens
      tokenIndex = 0;
      containsMultiLineComment = false;
      quoteBeginsString = false;
      
      try {
         fileReader = new FileReader(fileName); // reads the input file
         bufferedReader = new BufferedReader(fileReader);
         
         while((line = bufferedReader.readLine()) != null) { // reads each individual line in the file
            line = parseInput(); // eliminates extra white-space from line
            
            if(containsMultiLineComment) {
               if(line.contains("*/")) { // line becomes everything after the comment
                  line = line.substring(line.indexOf("*/")+2, line.length());
                  containsMultiLineComment = false;
               } else { // line is a comment, so move to the next line
                  continue;
               }
            }
            
            if(!line.equals(""))
               System.out.println("INSTRUCTION: " + line);
            
            String token = "";
            for(int i = 0; i < line.length(); i++) { // reads each character on line
               String character = String.valueOf(line.charAt(i)); // current character being read
               
               if(character.equals("\"")) { // search has encountered a quote
                  quoteBeginsString = !quoteBeginsString; 
               }
               
               if(quoteBeginsString) {
                  token += character; // adds whatever is in the string including white-space
               } else { // quote encountered ended a string
                  if(!character.equals(" ")) {
                     token += character; // adds the current character to the temporary token
                     
                     String nextCharacter = "";
                     
                     if(i < line.length() - 1) {
                        nextCharacter = String.valueOf(line.charAt(i));
                     }
                     
                     for(String kw : keywords) { // looks for a keyword match
                        // make sure the keyword is by itself and not within an identifier
                        if(token.equals(kw) && !(nextCharacter.matches("[a-zA-Z0-9_]"))) { 
                           tokens.add(token);
                           token = "";
                           break;
                        }
                     }
                     
                     for(String s : symbols) { // looks for a symbol match
                        if(character.equals(s)) {
                           String tokenWithoutSymbol = token.substring(0, token.length()-1);
                           if(!tokenWithoutSymbol.equals("")) { 
                              tokens.add(tokenWithoutSymbol);  // adds the name before the symbol if it is not empty 
                           }
                           
                           String previousSymbol;
                           if(tokens.size() > 1) previousSymbol = tokens.get(tokens.size()-1);
                           else previousSymbol = "";
                           
                           if((s.equals("+") && previousSymbol.equals("+")) || // handles the symbol "++" 
                              (s.equals("-") && previousSymbol.equals("-")) || // handles "--"
                              (s.equals("<") && previousSymbol.equals("=")) || // handles "<="
                              (s.equals(">") && previousSymbol.equals("="))) { // handles ">="
                                 tokens.set(tokens.size()-1, previousSymbol + character); // sets last element in list to the combined symbols
                           } else {
                              tokens.add(character); // adds the symbol
                           }
                           token = "";
                           break;
                        }
                     }
                  } else {
                     if(!token.equals("")) {
                        tokens.add(token); // adds the current token if there is a space
                        token = "";
                     }
                  }
               }             
            }
         }
         
      } catch(Exception e) {
         e.printStackTrace();
         System.out.println("Unable to open file '" + fileName + "'");
      } 
   }
 
   // only removes comments, not whitespace
   public String parseInput() {
      String l = line.replaceAll("\\s+"," ").trim(); // replaces any white-space with a single space
      int slashIndex = 0;
      if(l.contains("//")) {
         l = l.substring(0, l.indexOf("//"));   // eliminates the comment from the line
      } else if(l.contains("/*")) {
         if(l.contains("*/")) {
            // eliminate comment from the line
            String beforeComment = l.substring(0, l.indexOf("/*"));
            String afterComment = l.substring(l.indexOf("*/")+2, l.length());
            l =  beforeComment + afterComment;
         } else { // multi-line comment
            l = l.substring(0, l.indexOf("/*"));
            containsMultiLineComment = true;
         }
      }  
      return l;
   }
 
   public boolean hasMoreTokens() {
      if(tokenIndex != tokens.size()) return true;
      return false;
   }
 
   public void advance() { // only called when hasMoreTokens() == true
      currentToken = tokens.get(tokenIndex);
      System.out.println("token: " + currentToken + ", advancing to next");
      tokenIndex++;
   }
   
   public void backOneToken() {
      currentToken = tokens.get(tokenIndex-1);
   }
   
   public String currentToken() {
      return currentToken;
   }
   
   public String nextToken() {
      if(tokenIndex < tokens.size()-1)  return tokens.get(tokenIndex);
      return "";
   }
   
   public String generateXML() {
      if(tokenType().equals("KEYWORD")) {
            System.out.println("KEYWORD: " + keyWord());
            return "<keyword> " + keyWord() + " </keyword>";
      } else if(tokenType().equals("SYMBOL")) {
         char symbol = symbol();
         String xmlOutput = "";
 
         if(symbol == '<') xmlOutput = "&lt;";
         else if(symbol == '>') xmlOutput = "&gt;";
         else if(symbol == '\"') xmlOutput = "&quot;";
         else if(symbol == '&') xmlOutput = "&amp;";
         else xmlOutput = String.valueOf(symbol); // converts char to String
         
         System.out.println("SYMBOL: " + xmlOutput);
         return "<symbol> " + xmlOutput + " </symbol>";
      } else if(tokenType().equals("INT_CONST")) {
         System.out.println("INT_CONST: " + intVal());
         return "<integerConstant> " + intVal() + " </integerConstant>";
      } else if(tokenType().equals("IDENTIFIER")) {
         System.out.println("IDENTIFIER: " + identifier());
         return "<identifier> " + identifier() + " </identifier>";
      } else if(tokenType().equals("STRING_CONST")) {
         System.out.println("STRING_CONST: " + stringVal());
         return "<stringConstant> " + stringVal() + " </stringConstant>";
      }
      return "";
   }
 
   public String tokenType() {
      // returns KEYWORD, SYMBOL, IDENTIFIER, INT_CONST, or STRING_CONST
 
      // checks to see if token is a valid integer constant
      int intConstant = -1; // set to -1 because it is not a valid number
      boolean isValidIntegerConstant = false;
      try {
         intConstant = Integer.parseInt(currentToken); // parses the current token to an integer value
         if(intConstant >= 0 && intConstant <= 32767)
            isValidIntegerConstant = true;
      } catch(NumberFormatException e) {}
 
      // checks to see if token is a valid string constant
      boolean isValidStringConstant = false;
      if(currentToken.contains("\"") || currentToken.contains("\n")) { // true if token contains " or \n
         isValidStringConstant = true;
      }
 
      // checks to see if token is a valid identifier name
      boolean isValidIdentifier = false;
      try {
         Integer.parseInt(currentToken.substring(0,0)); // tries to parse first character of token as an integer
      } catch(NumberFormatException e) { // runs if first character of token is not a digit
         if(!(currentToken.contains("^[a-zA-Z0-9_]+"))) { // true if token doesn't contain anything that is not alpha, 0-9, or _
            isValidIdentifier = true;
         }
      }
 
      // assigns token type to each keyword
      for(String keyword : keywords) {
      	if(currentToken.equals(keyword)) {
      		return "KEYWORD";
      	}
      }
 
   	// assigns token type to symbols
   	for(String symbol : symbols) {
   		if(currentToken.equals(symbol)) {
   			return "SYMBOL";
   		}
   	}
 
      if(isValidIntegerConstant) {
         return "INT_CONST";
      }
      if(isValidStringConstant) {
         return "STRING_CONST";
      }
      if(isValidIdentifier) {
         return "IDENTIFIER";
      }
      return "";
   }
 
   public String keyWord() { // only called when tokenType() == KEYWORD
      // returns CLASS, METHOD, FUNCTION, CONSTRUCTOR, INT, BOOLEAN, CHAR, VOID, VAR, 
      // STATIC, FIELD, LET, DO, IF, ELSE, WHILE, RETURN, TRUE, FALSE, NULL, or THIS
      return currentToken; // returns the uppercase version of the token
   }
 
   public char symbol() { // only called when tokenType() == SYMBOL
      return currentToken.charAt(0); // returns the symbol as a character
   }
 
   public String identifier() { // only called when tokenType() == IDENTIFIER
      return currentToken; // returns the identifier name
   }
 
   public int intVal() { // only called when tokenType() == INT_CONST
      return Integer.parseInt(currentToken); // returns the token as an integer constant
   }
 
   public String stringVal() { // only called when tokenType() == STRING_CONST
      // returns the token as a string constant
      int indexOfStartQuote = currentToken.indexOf("\"");
      int indexOfEndQuote = currentToken.indexOf("\"", indexOfStartQuote+1);
 
      if(currentToken.contains("\n")) {
         return currentToken.substring(indexOfStartQuote+1, indexOfEndQuote-2);
      }
 
      return currentToken.substring(indexOfStartQuote+1, indexOfEndQuote);
   }

}