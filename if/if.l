%{
	#include<stdio.h>
	#include "y.tab.h"
%}

%%

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
"*" {return star;}
"/" {return divide;}


"<" {return LT;}
">" {return GT;}
"<=" {return LE;}
">=" {return GE;}
"==" {return EQ;}
"!=" {return NEQ;}

";" {return scolon;}

"=" {return equal;}
"+=" {return PE;}
"-=" {return ME;}
"*=" {return SE;}
"/=" {return DE;}

"\n" {return NL;}

[ \t] {}
. {;}


%%
