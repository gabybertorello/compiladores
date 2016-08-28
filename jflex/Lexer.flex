%%
%class Lexer
%standalone
/* 
The current line number can be accessed with the variable yyline 
and the current column number with the variable yycolumn. 
*/ 
%line 
%column 
 


digit = [0-9]
int_literal = {digit}+ 
float_literal = {int_literal} "." {int_literal}
alpha_num = {alpha} | {digit} | "_"
id = {alpha} {alpha_num}*
alpha = [a-zA-Z]
bool_literal = "true" | "false"
literal = {int_literal} | {float_literal} | {bool_literal} 


cond_op = "&&" | "||"
eq_op = "==" | "!="
rel_op = "<" | ">" | ">=" | "<="
arith_op = "+" | "-" | "*" | "/" | "%"
bin_op = {arith_op} | {rel_op} | {eq_op} | {cond_op}	
assign_op = "=" | "+=" | "-="
type = "integer" | "float" | "bool" | {id} | "void"
lineOfCharacters = [^\r\n]
oneLineComment = "//" {lineOfCharacters}
whiteSpace = [\t\r \n\f]
/*
location = {id} (.{id})* | {id} (.{id})* "[" {expr} "]"
method_call = {id} (.{id})* ( ({expr}+ ,)*)
expr =  {literal} | {location} | {method_call} | {expr} | {expr} {bin_op} {expr} | "-" {expr} | "!" {expr} | "("{expr}")" 
*/

%%


<YYINITIAL>
{
{oneLineComment} { System.out.println("one line comment "); }
"bool" { System.out.println("bool "); }
"break" { System.out.println("break "); }
"class" { System.out.println("class "); }
"continue" { System.out.println("continue "); }
"else" { System.out.println("else "); }
"extern" { System.out.println("extern "); }
"false" { System.out.println("false "); }
"float" { System.out.println("float "); }
"for" { System.out.println("for "); }
"if" { System.out.println("digit "); }
"integer" { System.out.println("integer "); }
"return" { System.out.println("return "); }
"true" { System.out.println("true "); }
"void" { System.out.println("void "); }
"while" { System.out.println("while "); }

{digit} { System.out.println("digit "); }
{int_literal} { System.out.println("int_literal "); }
{float_literal} { System.out.println("float_literal "); }
{alpha_num} { System.out.println("alpha_num "); }
{id} { System.out.println("id "); }
{bool_literal} { System.out.println("bool_literal "); }
{literal} { System.out.println("literal "); }
{cond_op} { System.out.println("cond_op "); }
{eq_op} { System.out.println("eq_op "); }
{rel_op} { System.out.println("rel_op "); }
{arith_op} { System.out.println("arith_op "); }
{assign_op} { System.out.println("assign_op "); }
{type} { System.out.println("location "); }
{whiteSpace} {}
}   

[^] {System.err.println("Illegal character: "+ yytext() +" at line "+ yyline+ ", column "+ yycolumn); }


// <<EOF>> {System.out.println("EOF"); }