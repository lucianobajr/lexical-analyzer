%{
#include <stdio.h>
%}

/* This tells flex to read only one input file */
%option noyywrap

/* definicoes regulares */

/* \t => tabulação; \n => quebra de linha; */
ws [ \t\n]

digit [0-9]

low [a-z]
upper [A-Z]

bank-account {digit}{10}

/* cpf =>  000\. 000\. 000-00*/
cpf {digit}{3}[.]{digit}{3}[.]{digit}{3}[-]{digit}{2}

/* CNPJ =>  XX. XXX. XXX/0001-XX */
cnpj {digit}{2}[.]{digit}{3}[.]{digit}{3}[/]{digit}{4}[-]{digit}{2}

/* dd/mm/aaaa */
birth {digit}{2}[/]{digit}{2}[/]{digit}{4}
/* xxx */
CVV {digit}{3}

password [a-zA-Z0-9@#$%^&!+=]{8,15}
email [A-Za-z0-9_.-]+[@][A-Za-z0-9_.-]+[.][A-Za-z]{2,3}
bank-branch {digit}{4}
credit-card {digit}{16}
bank-account-type {upper}+
bar-code {digit}{44}
check-number {digit}{6}
CEP {digit}{5}[-]{digit}{3}
token [A-Za-z0-9!@$#%^&*()_+=-]{8,16}
processing-batch [A-Z0-9]{6}
hour {digit}{2}[:]{digit}{2}[:]{digit}{2}
captcha [A-Za-z0-9]{5}

%%
{ws}+ { /*Espaços em branco, tabulação e quebra de linha devem ser ignorados.*/ }
{bank-account} {{ printf("Foi encontrado um número de conta bancária. LEXEMA: %s\n", yytext); }}
{cpf} {{ printf("Foi encontrado um CPF. LEXEMA: %s\n", yytext); }}
{cnpj} {{ printf("Foi encontrado um CNPJ. LEXEMA: %s\n", yytext); }}
{birth} {{ printf("Foi encontrado uma data de nascimento. LEXEMA: %s\n", yytext); }}
{CVV} {{ printf("Foi encontrado uma código de segurança (CVV). LEXEMA: %s\n", yytext); }}
{password} {{ printf("Foi encontrado uma senha. LEXEMA: %s\n", yytext); }}
{email} {{ printf("Foi encontrado um email. LEXEMA: %s\n", yytext); }}
{bank-branch} {{ printf("Foi encontrado uma agência bancária. LEXEMA: %s\n", yytext); }}
{credit-card} {{ printf("Foi encontrado um número de cartão de crédito. LEXEMA: %s\n", yytext); }}
{bank-account-type} {{ printf("Foi encontrado um tipo de conta bancária. LEXEMA: %s\n", yytext); }}
{bar-code} {{ printf("Foi encontrado um código de barras. LEXEMA: %s\n", yytext); }}
{check-number} {{ printf("Foi encontrado um número de cheque. LEXEMA: %s\n", yytext); }}
{CEP} {{ printf("Foi encontrado um CEP. LEXEMA: %s\n", yytext); }}
{token} {{ printf("Foi encontrado um token de seguraça avançado. LEXEMA: %s\n", yytext); }}
{processing-batch} {{ printf("Foi encontrado um número de lote de processamento. LEXEMA: %s\n", yytext); }}
{hour} {{ printf("Foi encontrado um valor de hora. LEXEMA: %s\n", yytext); }}
{captcha} {{ printf("Foi encontrado um código de verificação de imagem (CAPTCHA). LEXEMA: %s\n", yytext); }}
. { printf("Token não reconhecido. LEXEMA: %s\n", yytext); }
%%

/*codigo em C. Foi criado o main, mas podem ser criadas outras funcoes aqui.*/
int main(void)
{
    /* Call the lexer, then quit. */
    yylex();
    return 0;
}