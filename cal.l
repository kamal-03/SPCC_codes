%{
	#include "y.tab.h"
	extern int yylval;
	extern int yyerror(char*);
%}

%%
[0-9]+ {yylval=atoi(yytext); return DIGIT;}
[a-z] {yylval=yytext[0]-'a'; return LETTER;}
[-+*%^/=\n()] {return *yytext;}
[ \t] ;
. {yyerror("Invalid character");};
%%