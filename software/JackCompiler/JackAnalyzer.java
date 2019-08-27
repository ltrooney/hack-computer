import java.io.*;
 
 
public class JackAnalyzer {
 
   /*
   * 1. Create a JackTokenizer from the Xxx.jack input file.
   * 2. Create an output file called Xxx.xml and prepare it for writing.
   * 3. Use the CompilationEngine to compile the input JackTokenizer into the output
file.
   */
 
   public static void main(String[] args) throws IOException {
      String fileName = args[0];
 
      JackTokenizer tokenizer;
      String outFileName;
      boolean inputFileIsDirectory = false;
      CompilationEngineVM ce;
 
      if(!fileName.contains(".jack")) { // name is directory
      	inputFileIsDirectory = true;
      }
      
      String vmFileName = "";
     
      // parses the .jack file if single file or all .jack files if directory
      if(inputFileIsDirectory) {
         File[] jackFiles = new File(fileName).listFiles(); // array of all files in the directory
	 		for(File f : jackFiles) { // parse each .jack file in the directory
            if(f.getName().contains(".jack")){
               vmFileName = f.getName().substring(0, f.getName().length()-5) + ".vm";
               outFileName = "/Users/lukerooney/Desktop/Projects/Java/HackComputer/JackCompiler/"+fileName+"/"+vmFileName;
       
	 			   ce = new CompilationEngineVM(fileName+"/"+f.getName(), outFileName); // creates a tokenizer from each input file in directory
               ce.compileClass();
            }
	 		}
      } else {
         outFileName = fileName.substring(0, fileName.length()-5) + ".vm";;
         ce = new CompilationEngineVM(fileName, outFileName); // creates a tokenizer from the single input file
         ce.compileClass();
      } 
   }
}
