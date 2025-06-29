%{

	#include<stdio.h>
	#include<string.h>
	#include"y.tab.h"
	extern YYSTYPE yylval;
%}

%%

[a-zA-Z][a-zA-Z0-9]* {strcpy(yylval.var,yytext); return id;}
"+" {return p;}
"-" {return mi;}
"*" {return mul;}
"/" {return divi;}
"=" {return eq;}
"\n" {return nl;}
[ \t] {}
. {;}

%%
