%{
#include <stdio.h>
%}

/* This tells flex to read only one input file */
%option noyywrap

/* definicoes regulares */

/* \t => tabulação; \n => quebra de linha; */
ws [ \t\n]

digit [0-9]
positive [+]?{digit}+
negative [-]{digit}+
decimal [+]?[-]?{digit}+[.]{digit}+
/* or decimal ({positive}|{negative})+[.]{digit}+ */

low [a-z]
upper [A-Z]
word ({low}|{upper})+

license-plate {upper}{3}[-]{digit}{4}
phone {digit}{4}[-]{digit}{4}
name {word}[ ]{word}[ ]{word}([ ]{word})?

%%
{ws}+ { /*Espaços em branco, tabulação e quebra de linha devem ser ignorados.*/ }
{positive} { printf("Foi encontrado um número inteiro positivo. LEXEMA: %s\n", yytext); }
{negative} {printf("Foi encontrado um número inteiro negativo. LEXEMA: %s\n", yytext); }
{decimal} {printf("Foi encontrado um número número com parte decimal. LEXEMA: %s\n", yytext); }
{license-plate} {printf("Foi encontrado uma placa. LEXEMA: %s\n", yytext); }
{word} {printf("Foi encontrado uma palavra. LEXEMA: %s\n", yytext); }
{phone} {printf("Foi encontrado um telefone. LEXEMA: %s\n", yytext); }
{name} {printf("Foi encontrado um nome proprio. LEXEMA: %s\n", yytext); }
. { printf("Token não reconhecido. LEXEMA: %s\n", yytext); }
%%

/*codigo em C. Foi criado o main, mas podem ser criadas outras funcoes aqui.*/
int main(void)
{
    /* Call the lexer, then quit. */
    yylex();
    return 0;
}