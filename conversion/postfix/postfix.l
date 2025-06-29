%{
	#include<stdio.h>
	#include<stdlib.h>
	#include "y.tab.h"
	char ch = 'a';
%}

%%

[0-9]+ {yylval.dval = yytext[0]; return NUM; }
[ \t] {}
"\n" {return 0;}
. {return yytext[0];}

%%

char GenCode(char res, char first, char second, char op){
	printf("\n%c=%c %c %c\n",ch,first,second,op);
	return ch++;

}
