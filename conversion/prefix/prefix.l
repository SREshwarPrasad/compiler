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

char GenCode(char res, char op, char first, char second){
	printf("\n%c=%c %c %c\n",ch,op,first,second);
	return ch++;

}
