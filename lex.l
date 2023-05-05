%{
#include <stdio.h>
%}

/* This tells flex to read only one input file */
%option noyywrap

/* definicoes regulares */

/* \t => tabulação; \n => quebra de linha; */
ws [ \t\n]
digit [0-9]
letter [a-zA-Z]

%%
{ws}+ { /*Espaços em branco, tabulação e quebra de linha devem ser ignorados.*/ }
"+"?{digit}+ { printf("Foi encontrado um número inteiro positivo. LEXEMA: %s\n", yytext); }
. { printf("Token não reconhecido. LEXEMA: %s\n", yytext); }
%%

/*codigo em C. Foi criado o main, mas podem ser criadas outras funcoes aqui.*/
int main(void)
{
    /* Call the lexer, then quit. */
    yylex();
    return 0;
}