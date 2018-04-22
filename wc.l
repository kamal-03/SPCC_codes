%{
	int linecount=0,wordcount=0,charcount=0;
%}

%%
[\n] {linecount++;charcount++;}
[ \t]+ {charcount+=yyleng;}
[^ \n\t]+ {charcount+=yyleng;wordcount+=1;}
%%

int main(int argc, char const *argv[])
{
	yylex();
	printf("%7d %7d %7d\n",linecount,wordcount,charcount);
	return 0;
}
