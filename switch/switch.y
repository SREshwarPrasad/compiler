
%{
	#include<stdio.h>
	#include<stdlib.h>
	int yylex();
	int yyerror(char *);
%}

%token SWITCH CASE DEFAULT BREAK 
%token id nums 
%token plus minus star divide
%token LT GT LE GE EQ NEQ
%token equal PE ME SE DE
%token scolon colon NL
%token lp rp lc rc

%%

S: W{printf("\nInput accepted\n"); exit(0);};
W: 		SWITCH lp val rp NL lc NL cases NL rc;
cases: 	CASE val colon NL E NL BREAK scolon NL cases | 
		CASE val colon NL E NL BREAK scolon NL DEFAULT colon NL E NL
				; 

val: id|nums;
E: id equal K scolon | W | /**/;
K: 			val op2 K|val;
op2:			plus|minus|star|divide;
%%

int main() { while(1) {yyparse();} return 0; }
int yywrap() {return 0;}
int yyerror(char *s){printf("error... %s\n",s); exit(0); return 0;}




/*

This is the skeleton by which we are going to execute the program.. 


SWITCH lp val rp  
lc  
	CASE val colon  
		SWITCH lp val rp  
		lc  
			CASE val colon  
				E  
				BREAK scolon  
			CASE val colon  
				E  
				BREAK scolon  
			CASE val colon  
				E  
				BREAK scolon  
			DEFAULT colon  
				E  
		 
		rc  
		BREAK scolon  
	CASE val colon  
		E  
		BREAK scolon  
	CASE val colon  
		E  
		BREAK scolon  
	DEFAULT colon  
		E  
 
rc
*/
