package ctdsCompiler;

import java_cup.runtime.*;

/* CODIGO DE USUARIO */
%%

%class Lexer

%standalone
%line	// se puede acceder a la linea corriente a traves de la variable yyline 
%column // se puede acceder a la columna corriente a traves de la variable yycolumn
%cup

%{   
    /* To create a new java_cup.runtime.Symbol with information about
       the current token, the token will have no value in this
       case. */
    private Symbol symbol(int type) {	
        return new Symbol(type, yyline, yycolumn);
    }
    
    /* Also creates a new java_cup.runtime.Symbol with information
       about the current token, but this object has a value
. */
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}


/* OPCIONES Y DECLARACIONES */

// Macros
digit = [0-9]
int_literal = {digit}+
float_literal = {int_literal} "." {int_literal}
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

//"bool" { return symbol(sym.PLUS , yytext()); }
"break" { System.out.println("break "); }
"class" { System.out.println("class "); }
"continue" { System.out.println("continue "); }
"else" { System.out.println("else "); }
"extern" { System.out.println("extern "); }
"float" { System.out.println("float "); }
"for" { System.out.println("for "); }
"if" { System.out.println("digit "); }
"integer" { System.out.println("integer "); }
"return" { System.out.println("return "); }
"void" { System.out.println("void "); }
"while" { System.out.println("while "); }

// assign_op
"="		{} 
"+="	{}
"-="	{}

// arith_op
"+" 	{}
"-"		{}
"*" 	{}
"/" 	{}
"%"		{}

// rel_op
"<" 	{}
">"		{}
"<="	{}
">="	{}

// eq_op
"=="	{}
"!="	{}

// cond_op
"&&" 	{}
"||"	{}

//{digit} { return symbol(sym.NUMBER , "Number"); }
{int_literal} { System.out.println("int_literal "); }
{float_literal} { System.out.println("float_literal "); }
{alpha_num} { System.out.println("alpha_num "); }
{id} { System.out.println("id "); }

{whiteSpace} {System.out.println("espacio blanco");}
}   

[^] {System.err.println("Caracter ilegal: "+ yytext() +" (linea "+ yyline+ ", columna "+ yycolumn +")"); }


//<<EOF>> {System.out.println("EOF"); }
