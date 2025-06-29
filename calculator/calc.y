%{
#include<stdio.h>
#include<math.h>
int yylex();
int yyerror(char *s);
%}

%token NUMS p mi m d lp rp
%left p mi
%left m d


%%

S: E {printf("Result is: %d\n",$$);}
E: E p E {$$ = $1+$3;} 
   |E mi E {$$ = $1-$3;}
   |E m E {$$ = $1*$3;}
   |E d E {
   	if($3!=0) 
   	{
   		$$ = $1/$3;
   	} 
   	else 	
   	{ 
   		yyerror("error");}
   	}
   | lp E rp {$$=$2;}
   |NUMS {$$=$1;}
   ;
  
%%

int main()
{
	printf("Enter input: ");
	yyparse();
	return 0;
}
int yywrap(){return 1;}
int yyerror(char *s){printf("There's an error! %s",s);}
