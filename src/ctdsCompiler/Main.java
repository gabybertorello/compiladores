package ctdsCompiler;

import java.io.*;
import java_cup.runtime.*;

public class Main {
	static public void main(String args[])throws Exception {    
	  try {
			if (args.length==0){
				Lexer l = new Lexer (System.in);
				parser p = new parser (l);
				p.parse();
			}else{
				Lexer l = new Lexer (new java.io.FileInputStream(args[0]));
				parser p = new parser (l);
				p.parse(); 
			}    
	  }catch (Exception e) {
			e.printStackTrace();
		} 
	}
}

