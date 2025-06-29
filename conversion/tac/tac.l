%{
	#include<stdio.h>
	#include<stdlib.h>
	#include"y.tab.h"
	char ch='a';
%}

%%
[0-9]+	{yylval.dval = yytext[0]; return num;}
"\n" {return 0;}
. {return yytext[0];}	
	
%%

char gencode(char res, char f, char op, char s)
{
	printf("\n%c=%c %c %c",ch,f,op,s);
	return ch++;
}
