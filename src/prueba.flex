%%
%standalone
%line
%column
%char
%class Scanner
%{

%}


%%
";" { System.out.println("Semicolon"); }
"+" { System.out.println("Plus"); }
"*" { System.out.println("Times"); }


[ \t\r\n\f] { /* ignore white space. */ }
. { System.err.println("Illegal character: "+yytext()); }