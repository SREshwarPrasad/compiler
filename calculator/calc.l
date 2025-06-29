%{
#include<stdio.h>
#include<math.h>
#include "y.tab.h"
extern int yylval;
%}


%%
[0-9]+ {yylval=atoi(yytext); return NUMS;}
"(" {return lp;}
")" {return rp;}
"+" {return p;}
"-" {return mi;}
"*" {return m;}
"/" {return d;}
[ \t]+ {}
.    {printf("Unrecognised character: %s",yytext);}

%%
