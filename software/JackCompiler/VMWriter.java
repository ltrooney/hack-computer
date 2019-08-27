import java.io.File;
import java.io.PrintStream;
import java.io.IOException;

public class VMWriter {

   File file;
   PrintStream outstream;
   
   public VMWriter(String outFile) throws IOException {
      file = new File(outFile);
      outstream = new PrintStream(file);
      
      if (!file.exists()) {
         file.createNewFile();
      } 
      
   }
   
   public void writePush(String segment, int index) {
      // segment = CONST, ARG, LOCAL, STATIC, THIS, THAT, POINTER, TEMP
      if(segment.equalsIgnoreCase("CONST")) {
         outstream.println("push constant " + index);
      } else if(segment.equalsIgnoreCase("ARG")) {
         outstream.println("push argument " + index);
      } else if(segment.equalsIgnoreCase("LOCAL") || segment.equalsIgnoreCase("STATIC") ||
                segment.equalsIgnoreCase("THAT") || segment.equalsIgnoreCase("POINTER") || segment.equalsIgnoreCase("TEMP")) {
         outstream.println("push " + segment.toLowerCase() + " " + index);
      } else if(segment.equalsIgnoreCase("FIELD") || segment.equalsIgnoreCase("THIS")) {
         outstream.println("push this" + " " + index);
      }
   }
   
   public void writePop(String segment, int index) {
      // segment = CONST, ARG, LOCAL, STATIC, THIS, THAT, POINTER, TEMP
      if(segment.equalsIgnoreCase("CONST")) {
         outstream.println("pop constant " + index);
      } else if(segment.equalsIgnoreCase("ARG")) {
         outstream.println("pop argument " + index);
      } else if(segment.equalsIgnoreCase("LOCAL") || segment.equalsIgnoreCase("STATIC") || segment.equalsIgnoreCase("THIS") ||
                segment.equalsIgnoreCase("THAT") || segment.equalsIgnoreCase("POINTER") || segment.equalsIgnoreCase("TEMP")) {
         outstream.println("pop " + segment.toLowerCase() + " " + index);
      }
   }
   
   public void writeArithmetic(String command) {
      // command = ADD, SUB, NEG, EQ, GT, LT, AND, OR, NOT
      outstream.println(command.toLowerCase());
   }
   
   public void writeLabel(String label) {
      outstream.println("label " + label);
   }
   
   public void writeGoto(String label) {
      outstream.println("goto " + label);
   }
   
   public void writeIf(String label) {
      outstream.println("if-goto " + label);
   }
   
   public void writeCall(String name, int nArgs) {
      outstream.println("call " + name + " " + nArgs);
   }
   
   public void writeFunction(String name, int nLocals) {
      outstream.println("function " + name + " " + nLocals);
   }
   
   public void writeReturn() {
      outstream.println("return");
   }
   
   public void close() {
      outstream.close();
   }
}