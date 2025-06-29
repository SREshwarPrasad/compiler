%{
	#include<stdio.h>
	#include<stdlib.h>
	int yylex();
	int yyerror(char *);
%}

%token WHILE IF ELSE id nums plus minus LT GT scolon equal NL
%token lp rp lc rc

%%

S: W{printf("\nInput accepted\n"); exit(0);};
W: 			WHILE lp cond rp NL lc NL W NL rc 
				| IF lp cond rp NL lc NL W NL rc NL 											//if 
				| IF lp cond rp NL lc NL W NL rc NL ELSE NL lc NL W NL rc 		//if else
				| IF lp cond rp NL lc NL W NL rc G ELSE NL lc NL W NL rc   		//if else if
				|E; 


G: 			NL ELSE IF lp cond rp NL lc NL W NL rc  
				| NL ELSE IF lp cond rp NL lc NL W NL rc G;

cond: 		id op1 id
				|id op1 nums;

E: 			id equal K scolon;

K: 			val op2 K
				|val;

val:			id
				|nums;
				
op1:			LT
				|GT;

op2:			plus
				|minus;
%%

int main() { while(1) {yyparse();} return 0; }
int yywrap() {return 0;}
int yyerror(char *s){printf("error... %s\n",s); exit(0); return 0;}









/*
W: 			WHILE lp cond rp NL lc NL W NL rc 
				| IF lp cond rp NL lc NL W NL rc NL 											//if 
				| IF lp cond rp NL lc NL W NL rc NL ELSE NL lc NL W NL rc 		//if else
				| IF lp cond rp NL lc NL W NL rc G ELSE NL lc NL W NL rc   		//if else if
				|E; 


WHILE lp cond rp NL 
lc NL 
	IF lp cond rp NL 
	lc NL 
		IF lp cond rp NL 
		lc NL 
			IF lp cond rp NL 
			lc NL 
				WHILE lp cond rp NL 
				lc NL 
					W NL 
				rc NL 
			rc NL  
			NL 
		rc NL  
		NL 
	rc NL 
	NL 
rc	
 		
*/				
