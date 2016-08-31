import java_cup.runtime.*;

/* CODIGO DE USUARIO */
%%

%class Lexer

%standalone
%line		// permite acceder a la linea corriente a traves de la variable yyline 
%column 	// permite acceder a la columna corriente a traves de la variable yycolumn


%{   
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

"bool"		{/* return symbol(sym.BOOL, yytext()); */}
"break" 	{/* return symbol(sym.BREAK, yytext()); */}
"class" 	{/* return symbol(sym.CLASS, yytext()); */}
"continue" 	{/* return symbol(sym.CONTINUE, yytext()); */}
"else" 		{/* return symbol(sym.ELSE, yytext()); */}
"extern" 	{/* return symbol(sym.EXTERN, yytext()); */}
"float" 	{/* return symbol(sym.FLOAT, yytext()); */}
"for" 		{/* return symbol(sym.FOR, yytext()); */}
"if" 		{/* return symbol(sym.IF, yytext()); */}
"integer" 	{/* return symbol(sym.INTEGER, yytext()); */}
"return" 	{/* return symbol(sym.RETURN, yytext()); */}
"void" 		{/* return symbol(sym.VOID, yytext()); */}
"while" 	{/* return symbol(sym.WHILE, yytext()); */}

// assign_op
"="		{/* return Symbol(sym.ASSIGN);*/}
"+="	{/* return Symbol(sym.PLUSASSING);*/}
"-="	{/* return Symbol(sym.SUBASSING);*/}

// arith_op
"+" 	{/* return Symbol(sym.PLUS);*/}
"-"		{/* return Symbol(sym.SUB);*/}
"*" 	{/* return Symbol(sym.MULT);*/}
"/" 	{/* return Symbol(sym.DIV);*/}
"%"		{/* return Symbol(sym.MOD);*/}

// rel_op
"<" 	{/* return Symbol(sym.LESS);*/}
">"		{/* return Symbol(sym.GREATER);*/}
"<="	{/* return Symbol(sym.LESSEQUAL);*/}
">="	{/* return Symbol(sym.GREATEREQUAL);*/}

// eq_op
"=="	{/* return Symbol(sym.EQUAL);*/}
"!="	{/* return Symbol(sym.NOTEQUAL);*/}

// cond_op
"&&" 	{/* return Symbol(sym.AND);*/}
"||"	{/* return Symbol(sym.OR);*/}

{digit}			{ /*return symbol(sym.DIGIT, new String(yytext()));*/}
{int_literal}	{ /*return symbol(sym.int, new String(yytext()));*/}
{float_literal} { /*return symbol(sym.FLOAT, new String(yytext()));*/}
{alpha_num}		{ /*return symbol(sym.ALPHANUM, new String(yytext()));*/}
{id} 			{ /*return symbol(sym.ID, new String(yytext()));*/}

{whiteSpace} {System.out.println("espacio blanco");}
}   

[^]		{System.err.println("Caracter ilegal: "+ yytext() +" (linea "+ yyline+ ", columna "+ yycolumn +")"); }


//<<EOF>> {System.out.println("EOF"); }
