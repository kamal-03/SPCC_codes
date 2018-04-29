%%
[a-zA-Z]+ {
	yymore();
	printf("yytext after yymore = %s\n",yytext);
}
. {yymore();}
%%

int main()
{
	yylex();
	return 0;
}
