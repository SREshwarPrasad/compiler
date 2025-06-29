//identify tokens

%{
#include<stdio.h>
%}

%%
void|int|char|float|double|if|else|for|while  		printf("%s is a keyword\n",yytext);
"\is"|"\is not" 								printf("%s is an identity operator\n",yytext); 
"\in"|"\not in" 								printf("%s is a membership operator\n",yytext); 
true|false|and|or|not  							printf("%s is a logical operator\n",yytext);
[0-9]|[1-9]([0-9])* 							printf("%s is an integer \n",yytext);
[a-zA-Z]([a-zA-Z0-9])* 							printf("%s is an identifier\n",yytext);  
"+"|"-"|"*"|"/"|"%"|"//"|"**"  						printf("%s is an arithmetic operator\n",yytext);
"<"|">"|"<="|">="|"=="|"!="  					printf("%s is an arithmetic operator\n",yytext);
"&"|"|"|"^"|"~"|"\<<"|"\>>"|"\|"  					printf("%s is a bitwise operator\n",yytext);
"="|"+="|"-="|"*="|"/="|"%="|"//="|"**="    		printf("%s is an assignment operator\n",yytext); 
"("|")"|"{"|"}"|"["|"]" 							printf("%s is a paranthesis\n",yytext); 
";"|":" 										printf("%s is a delimiter \n",yytext); 
[ \t] 										;
. 											printf("%s is a special character\n",yytext); 
%%

int main(){
yylex();
return 0;
}
int yywrap(){return 0;}
void yyerror(){printf("error...");}
