%{
	#include<stdio.h>
	#include<stdlib.h>
	int yylex();
	int yyerror(char *);
	char GenCode(char, char, char, char);
%}

%union {char dval;}
%token NL
%token<dval> NUM
%type<dval> E
%left '+' '-'
%left '*' '/'

%%

S: E {printf("\nt=%c\n",$1); exit(0);}
E: E'+'E {$$=GenCode($$,'+',$1,$3);}|
   E'-'E {$$=GenCode($$,'-',$1,$3);}|
   E'*'E {$$=GenCode($$,'*',$1,$3);}|
   E'/'E {$$=GenCode($$,'/',$1,$3);}|
   '('E')' {$$=$2;} 
  |NUM {$$=$1;}
;
%%

int main(){yyparse(); return 0;}
int yywrap() {return 0;}
int yyerror(char *s){printf("error..%s",s); return 0;}
