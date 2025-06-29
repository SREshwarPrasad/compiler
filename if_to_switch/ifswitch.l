%{
	#include<stdio.h>
	#include "y.tab.h"
%}

%%

if {return IF;}
else {return ELSE;}
printf {return PR;}
[0-9]+ {yylval.strl = strdup(yytext); return nums;}
[a-zA-Z]([a-zA-Z0-9])* {yylval.strl = strdup(yytext); return id;}
"+" {return plus;}
"==" {return EQ;}
"=" {return eq;}
"(" {return lp;}
")" {return rp;}
"{" {return lc;}
"}" {return rc;}
";" {return sc;}
"\n" {return NL;}
"\"" {return dq;}
[ \t] {}
. {;}


%%
