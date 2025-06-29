%{
	#include<stdio.h>
	#include<stdlib.h>
	int yylex();
	int yyerror(char *);
%}

%token FOR IF ELSE id nums 
%token plus minus star divide
%token LT GT LE GE EQ NEQ
%token equal PE ME SE DE
%token scolon NL
%token lp rp lc rc
%token pp mm

%%

S: F{printf("\nInput accepted\n"); exit(0);};

F: FOR lp conditions rp NL lc NL F NL rc | W; 
W: 			   IF lp cond rp NL lc NL W NL rc NL W											 
			|  IF lp cond rp NL lc NL W NL rc NL ELSE NL lc NL W NL rc 		
			|  IF lp cond rp NL lc NL W NL rc G ELSE NL lc NL W NL rc   		
			|E |/**/; 

G: 			  NL ELSE IF lp cond rp NL lc NL W NL rc NL 
			| NL ELSE IF lp cond rp NL lc NL W NL rc NL G;

cond: 		id op1 id
				|id op1 nums;

conditions: id equal val scolon id op1 val scolon id inc;
inc: pp|mm;

E: 			id equal K scolon | id op3 val scolon;

K: 			val op2 K
				|val;

val:			id
				|nums;
				
op1:			LT |GT |LE|GE|EQ|NEQ;

op2:			plus|minus|star|divide;
op3: PE|ME| SE|DE;
%%

int main() { while(1) {yyparse();} return 0; }
int yywrap() {return 0;}
int yyerror(char *s){printf("error... %s\n",s); exit(0); return 0;}



/*

FOR lp conditions rp NL 
lc  
	FOR lp conditions rp  
	lc  
		IF lp cond rp  
		lc  
			stmt;  
		rc  
	rc  
rc


IF lp cond rp 
{ 
	IF lp cond rp 
	{  
		W  
	 }  
	ELSE IF lp cond rp  
	{  
		W  
	}  
	ELSE  
	 {  
		W 
	 }  
 }  
ELSE IF lp cond rp  
{  
	W  
}  
ELSE  
 {  
	W 
 }

*/

/*
NL ELSE IF lp cond rp NL lc NL W NL rc NL 
				| NL ELSE IF lp cond rp NL lc NL W NL rc NL G;
if()
{
	W
} G else 
{
	W
}
G: 
\n
else if()
{
	W
}
G ....
stopping point:
\n
else if()
{
	W
} \n


if()
{
	...	
}
W

or 

if()
{
	W
}
else
{
	W
}

or





*/
