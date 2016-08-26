%%
%class Lexer
%standalone

digit = [0-9]
int_literal = {digit}+ 
float_literal = {int_literal} "." {int_literal}
alpha_num = {alpha} | {digit} | "_"
id = {alpha} {alpha_num}*
alpha = [a-zA-Z]
bool_literal = "true" | "false"
literal = {int_literal} | {float_literal} | {bool_literal} 

%%

{literal} { System.out.println("literal"); }