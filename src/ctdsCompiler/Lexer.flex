package ctdsCompiler;

import java_cup.runtime.*;

/* CODIGO DE USUARIO */
%%

%class Lexer

%standalone
%line		// permite acceder a la linea corriente a traves de la variable yyline 
%column 	// permite acceder a la columna corriente a traves de la variable yycolumn
%cup

%{
    public Lexer(java.io.InputStream r, ComplexSymbolFactory sf){
		this(r);
		// this.sf=sf;
    }

    /* Metodo que permite crear un objeto java_cup.runtime.Symbol con informacion
       sobre el token corriente. El token no tendra valor. */
    private Symbol symbol(int type) {	
        return new Symbol(type, yyline, yycolumn);
    }
    
    /* Metodo que permite crear un objeto java_cup.runtime.Symbol con informacion
       sobre el token corriente. El token tendra valor en este caso. */
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}


/* OPCIONES Y DECLARACIONES */

// Macros
digit = [0-9]
int_literal = {digit}+
float_literal = {int_literal} "." {int_literal}
boolean_literal = true | false
alpha = [a-zA-Z]
alpha_num = {alpha} | {digit} | "_"
id = {alpha} {alpha_num}*

lineTerminator = \r|\n|\r\n
lineOfCharacters = [^\r\n]
oneLineComment = "//" {lineOfCharacters}*
severalLinesComments = "/*" [ˆ*] {CommentContent} "*"+ "/" 
CommentContent = = ( [ˆ*] | \*+ [ˆ/*] )*
/* VER!! comments = {oneLineComments} | {severalLinesComments}
// VER!! spaces = {whiteSpaces} | {comments}
*/
whiteSpace = [\t\r \n\f]



/* REGLAS LEXICAS */
%%

<YYINITIAL>
{
{oneLineComment} { System.out.println("one line comment "); }


// Palabras reservadas
"bool"		{return symbol(sym.BOOL); }
"break" 	{ return symbol(sym.BREAK); }
"class" 	{ return symbol(sym.CLASS); }
"continue" 	{ return symbol(sym.CONTINUE); }
"else" 		{ return symbol(sym.ELSE); }
"extern" 	{ return symbol(sym.EXTERN); }
"float" 	{ return symbol(sym.FLOAT); }
"for" 		{ return symbol(sym.FOR); }
"if" 		{ return symbol(sym.IF); }
"integer" 	{ return symbol(sym.INTEGER); }
"return" 	{ return symbol(sym.RETURN); }
"void" 		{ return symbol(sym.VOID); }
"while" 	{ return symbol(sym.WHILE); }

// assign_op
"="	{ return symbol(sym.ASSIGN);}
"+="	{ return symbol(sym.PLUSASSIGN);}
"-="	{ return symbol(sym.SUBASSIGN);}

// arith_op
"+" 	{return symbol(sym.PLUS);}
"-"	{ return symbol(sym.SUB);}
"*" 	{ return symbol(sym.MULT);}
"/" 	{ return symbol(sym.DIV);}
"%"	{ return symbol(sym.MOD);}

// rel_op
"<" 	{ return symbol(sym.LESS);}
">"	{ return symbol(sym.GREATER);}
"<="	{ return symbol(sym.LESSEQUAL);}
">="	{ return symbol(sym.GREATEREQUAL);}

// eq_op
"=="	{ return symbol(sym.EQUAL);}
"!="	{ return symbol(sym.NOTEQUAL);}

// cond_op
"&&" 	{ return symbol(sym.AND);}
"||"	{ return symbol(sym.OR);}
"!"	{ return symbol(sym.NOT);}

{digit}		{ return symbol(sym.DIGIT, new String(yytext()));}
{int_literal}	{ return symbol(sym.INTLIT, new Integer(yytext()));}
{float_literal} { return symbol(sym.FLOATLIT, new Float(yytext()));}
{boolean_literal} { return symbol(sym.BOOLEANLIT, new Boolean(yytext()));}
{alpha_num}	{ return symbol(sym.ALPHANUM, new String(yytext()));}
{id} 		{ return symbol(sym.ID, new String(yytext()));}

{whiteSpace} {System.out.println("espacio blanco");}
}   

[^] {System.err.println("Caracter ilegal: "+ yytext() +" (linea "+ yyline+ ", columna "+ yycolumn +")"); }


// <<EOF>> {System.out.println("EOF"); }
