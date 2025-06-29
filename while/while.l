%{
	#include<stdio.h>
	#include "y.tab.h"
%}

%%

while {return WHILE;}
if {return IF;}
else {return ELSE;}
[a-zA-Z][a-zA-Z0-9]* {return id;}
[0-9]+ {return nums;}

"(" {return lp;}
")" {return rp;}
"{" {return lc;}
"}" {return rc;}

"+" {return plus;}
"-" {return minus;}

"<" {return LT;}
">" {return GT;}

";" {return scolon;}

"=" {return equal;}
"\n" {return NL;}

[ \t] {}
. {;}


%%
