import java_cup.runtime.Symbol;

%%

%class Lexer
%implements java_cup.runtime.Scanner
%function next_token
%type java_cup.runtime.Symbol
%line
%char
%eofval{
  return new Symbol(sym.EOF, yyline, yychar);
%eofval}

DIGITO=[0-9]
LETRA=[a-zA-Z_]
ESPACIO=[\n\ \t\r]+

%%

{ESPACIO}                          { /* se ignoran espacios y saltos de línea */ }
{DIGITO}+("."{DIGITO}+)?           { return new Symbol(sym.NUMERO, yyline, yychar, yytext()); }
{LETRA}({LETRA}|{DIGITO})*         { return new Symbol(sym.ID, yyline, yychar, yytext()); }
"+"                                { return new Symbol(sym.PLUS,   yyline, yychar); }
"-"                                { return new Symbol(sym.MINUS,  yyline, yychar); }
"*"                                { return new Symbol(sym.TIMES,  yyline, yychar); }
"/"                                { return new Symbol(sym.DIVIDE, yyline, yychar); }
"("                                { return new Symbol(sym.LPAREN, yyline, yychar); }
")"                                { return new Symbol(sym.RPAREN, yyline, yychar); }
.                                  { throw new Error("Caracter ilegal: '" + yytext() + "'"); }
