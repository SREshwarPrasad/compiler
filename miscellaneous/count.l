%{
	#include<stdio.h>
	int yylex();
	int keyword =0;
	int op=0;
	int integer=0;
	int id=0;
	int del=0;
	int paranthesis=0;
	int special=0;
	int nl=0;
	int spaces=0;
%}

%%

void|int|char|float|double|if|else|for|while  	{keyword++;}
"\is"|"\is not"|"\in"|"\not in"|true|false|and|or|not|"+"|"-"|"*"|"/"|"%"|"//"|"**"|"<"|">"|"<="|">="|"=="|"!="|"&"|"|"|"^"|"~"|"\<<"|"\>>"|"\|"|"="|"+="|"-="|"*="|"/="|"%="|"//="|"**="  {op++;}
[0-9]|[1-9]([0-9])* 					{integer++;}		
[a-zA-Z]([a-zA-Z0-9])* 				    {id++;}
[^\t\n]			{ch++;}
";"|":" 							{del++;}			
"("|")"|"{"|"}"|"["|"]" 			{paranthesis++;}			
"\n"								{nl++;}			
[ ]						{spaces++;}
. 									{special++;}
%%

int main(){
printf("Input? ");
yylex();
printf("Counts:\n");
printf("\nKeyword: %d",keyword);
printf("\nOperator: %d", op);
printf("\nInteger: %d", integer);
printf("\nIdentifier: %d", id);
printf("\nDelimiter: %d", del);
printf("\nParanthesis: %d", paranthesis);
printf("\nSpecial: %d", special);
printf("\nLines: %d", nl);
printf("\nSpaces: %d\n", spaces);

return 0;
}

int yywrap(){return 1;}
void yyerror(){}
