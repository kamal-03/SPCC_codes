%{
char *less;
%}

%%
[a-zA-Z]{3} {
	yyless(3);
	printf("Everything except '%s' will be scanned again\n",yytext);
}

. {}
 
%%
 
int main()
{
	yylex();
	return 0;
}
