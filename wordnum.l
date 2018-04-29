%%
[0-9]+\.[0-9]+ {printf("%s is a floating point number\n",yytext);}
[0-9]+[ \t\n] {for(int i=0;yytext[i+1]!='\0';i++) {printf("%c",yytext[i]);} printf(" is an integer\n");}
[a-zA-Z]+[ \t\n] {for(int i=0;yytext[i+1]!='\0';i++) {printf("%c",yytext[i]);} printf(" is a word\n");}
. {}
%%

int main(int argc, char const *argv[])
{
	yylex();
	return 0;
}