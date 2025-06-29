%{
	#include<stdio.h>
	#include<string.h>
	#include<stdlib.h>
	int yylex();
	void yyerror(char *s);
%}

%union {char* strl;}
%token IF ELSE lp rp lc rc NL
%token <strl> id nums
%token plus EQ eq sc PR dq
%type <strl> W cond stmt val K printing elseif

%%

S: W {printf("\n\n-->constructed switch<--\n..");exit(0);};
W: IF lp cond rp NL lc NL W NL rc NL
	{
		char var[50],val[50];
		sscanf($3,"%[^=<>!]=%s",var,val);
		printf("\nSWITCH: \nswitch(%s)\n{\n",var);
		printf("\tcase %s:\n\t\t%s;",val,$8);
		printf("\n}");	
	}
	|IF lp cond rp NL lc NL W NL rc NL ELSE NL lc NL W NL rc 
	{
		char var[50],val[50];
		sscanf($3,"%[^=<>!]=%s",var,val);
		printf("\nSWITCH: \nswitch(%s)\n{\n",var);
		printf("\tcase %s:\n\t\t%s;\n",val,$8);
		printf("\tdefault:\n\t\t%s;",$16);
		printf("\n}");			
	}
/*
IF lp cond rp 
lc 
	W  
rc  
ELSE IF lp cond rp  
lc 
	W  
rc ELSE  
lc 
	W  
rc */
	|IF lp cond rp NL lc NL W NL rc elseif ELSE NL lc NL W NL rc NL
	{
		char var[50],val[50];
		sscanf($3,"%[^=<>!]=%s",var,val);
/*
switch() 
{
	case x:
		stmt;
}		
		}		
		*/
		printf("\nSWITCH: \nswitch(%s)\n{\n",var);
		printf("\tcase %s:\n\t\t%s;\n",val,$8);
		printf("%s",$11);
		printf("\tdefault:\n\t\t%s;",$16);
		printf("\n}");				
	}
	|stmt{$$=$1;}
	|printing {$$=$1;};

elseif: NL ELSE IF lp cond rp NL lc NL W NL rc elseif
	{
		char var[50],val[50];
		sscanf($5,"%[^=<>!]=%s",var,val);
		$$=malloc(100);
		sprintf($$,"\tcase %s:\n\t\t%s;\n%s",val,$10,$13);
	}|/*empty*/
	{
		$$=strdup("");
	};
	 
cond: id EQ val
	{
		$$=malloc(100);
		sprintf($$, "%s=%s",$1,$3);
	};
stmt: id eq K sc
	{
		$$=malloc(100);
		sprintf($$,"%s=%s",$1,$3);
	};
printing: PR lp dq val dq rp sc
	{
		$$=malloc(100);
		sprintf($$,"printf(\"%s\");", $4);
	}
	;
K: val plus K 
  {
	$$=malloc(100);
	sprintf($$,"%s+%s",$1,$3);
  }| val {$$=$1;};
val: id{$$=$1;}|nums{$$=$1;};

%%


int yywrap(){return 0;}
int main(){yyparse(); return 0;}
void yyerror(char *s){printf("%s",s);}
