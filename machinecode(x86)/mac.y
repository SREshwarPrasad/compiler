%{
	#include<stdio.h>
	#include<string.h>
#include<ctype.h>
int yylex();
void yyerror(char *);
FILE *fout;
FILE *fin;

%}

%union {char var[10];}
%token<var> id;
%token p mi mul divi eq nl
%type<var> exp

%%

input: line nl input | nl input| /*empty*/;
line: id eq exp {fprintf(fout,"MOV AX, %s\n ADD AX,%s",$1,$3);};
exp: id p id 	{fprintf(fout,"MOV AX, %s\n ADD AX,%s",$1,$3);}|
     id mi id 	{fprintf(fout,"MOV AX, %s\n SUB AX,%s",$1,$3);}|
     id mul id  {fprintf(fout,"MOV AX, %s\n MUL AX,%s",$1,$3);}|
     id divi id {fprintf(fout,"MOV AX, %s\n DIV AX,%s",$1,$3);}|
     id 	{strcpy($$,$1);};
%%

int yywrap(){return 1;}
void yyerror(char *s){printf("%s",s);}
extern FILE *yyin;
int main(){
	
	fin=fopen("input.txt","r");
fout=fopen("output.txt","w");
yyin=fin;
yyparse();
fclose(fin);
fclose(fout);
return 0;
}
