package ctdsCompiler;

/*
File Name: Main.java
To Create: 
After .flex, and .cup, have been created.
> javac Main.java

To Run: 
> java Main input.test

*/

import java.io.*;
//import java_cup.Lexer;
//import java_cup.parser;
 
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
