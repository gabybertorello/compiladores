package ctdsCompiler;

import java.io.*;
 
public class Main {
static public void main(String argv[]) {    
  /* Start the parser */
  try {
    parser p = new parser(new Lexer(new FileReader(argv[0])));
    Object result = p.parse().value;      
  } catch (Exception e) {
    e.printStackTrace();
  }
}
}
