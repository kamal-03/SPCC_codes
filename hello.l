%%
.+ { printf("Hello world");}
%%

int main(int argc, char const *argv[])
{
	yylex();
	return 0;
}