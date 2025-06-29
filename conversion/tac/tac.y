%{
	#include<stdio.h>
	#include<stdlib.h>
	int yylex();
	void yyerror(char *);
	char gencode(char,char,char,char);
%}

%union {char dval;}
%token <dval> num;
%type <dval> E
%left '+' '-'
%left '*' '/'

%%
	S: E {printf("\nt=%c\n",$1);};
	E: E '+' E {$$= gencode($$,$1,'+',$3);}|
	   E '-' E {$$= gencode($$,$1,'-',$3);}|
	   E '*' E {$$= gencode($$,$1,'*',$3);}|
	   E '/' E {$$= gencode($$,$1,'/',$3);}|
	   '('E')' {$$=$2;}|
	 num {$$=$1;};
	
%%

int yywrap(){return 1;}
int main(){yyparse(); return 0;}
void yyerror(char *s){printf("error...%s",s);}
