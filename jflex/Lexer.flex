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


cond_op = "&&" | "||"
eq_op = "==" | "!="
rel_op = "<" | ">" | ">=" | "<="
arith_op = "+" | "-" | "*" | "/" | "%"
bin_op = {arith_op} | {rel_op} | {eq_op} | {cond_op}	
assign_op = "=" | "+=" | "-="
type = "integer" | "float" | "bool" | {id} | "void"



location = {id} (.{id})* | {id} (.{id})* "[" {auxExpr} "]"
method_call = {id} (.{id})* ( ({auxExpr}+ ,)*)


auxExpr = {literal} // | {location} | {method_call}
//expr = {auxExpr} | {auxExpr} {bin_op} {auxExpr} | "-" {auxExpr} | "!" {auxExpr} | "("{auxExpr}")" 

expr = {auxExpr} | {auxExpr} {bin_op} {auxExpr} | "-" {auxExpr} | "!" {auxExpr} | "(" {auxExpr} ")"  

%%

{expr} { System.out.println("expr"); }

/* 
{location} { System.out.println("location "); }
{method_call} { System.out.println("method_call "); }
{expr} { System.out.println("expr "); }
 */