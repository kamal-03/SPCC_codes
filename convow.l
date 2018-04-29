%{
	int consonants=0;
	int vowels=0;
%}


%%
[AEIOUaeiou] {vowels++;}
[A-Za-z] {consonants++;}
\n {printf("Number of vowels=%d\nNumber of consonants=%d\n",vowels,consonants); consonants=0; vowels=0;}
. {}
%%

int main(int argc, char const *argv[])
{
	yylex();
	return 0;
}