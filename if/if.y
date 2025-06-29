%{
	#include<stdio.h>
	#include<stdlib.h>
	int yylex();
	int yyerror(char *);
%}

%token IF ELSE id nums 
%token plus minus star divide
%token LT GT LE GE EQ NEQ
%token equal PE ME SE DE
%token scolon NL
%token lp rp lc rc

%%

S: 			W{printf("\nInput accepted\n"); exit(0);};
W: 			  IF lp cond rp NL lc NL W NL rc NL {printf("Its if / nested if.."); }
			| IF lp cond rp NL lc NL W NL rc NL ELSE NL lc NL W NL rc 
			| IF lp cond rp NL lc NL W NL rc G ELSE NL lc NL W NL rc   		
			| E; 
G: 			 NL ELSE IF lp cond rp NL lc NL W NL rc NL 
		       | NL ELSE IF lp cond rp NL lc NL W NL rc NL G;
cond: 		id op1 id | id op1 nums;
E: 			id equal K scolon;
K: 			val op2 K|val;
val:			id|nums;		
op1:			LT|GT|LE|GE|EQ|NEQ;
op2:			plus|minus|star|divide|PE|ME| SE|DE;
%%

int main() { while(1) {yyparse();} return 0; }
int yywrap() {return 0;}
int yyerror(char *s){printf("error... %s\n",s); exit(0); return 0;}
