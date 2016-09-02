package ctdsCompiler;

import java.io.*;
import java_cup.runtime.*;

public class Main {
	static public void main(String args[])throws Exception {    
	  try {
			ComplexSymbolFactory sf = new ComplexSymbolFactory();
			if (args.length==0){
				Lexer l = new Lexer (System.in);
				parser p = new parser (l,sf);
				p.parse();
				System.out.print("HOLA");
			}else{
				Lexer l = new Lexer (new java.io.FileInputStream(args[0]));
				parser p = new parser (l,sf);
				p.parse(); 
			}    
	  }catch (Exception e) {
			e.printStackTrace();
		} 
	}
}

