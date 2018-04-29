%%
[a-zA-Z]+ {
	printf("yytext = %s\n",yytext);
}
[0-9] {yyterminate();}
. {}
%%
 
int main()
{
	yylex();
	return 0;
}
