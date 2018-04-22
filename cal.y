%{
	#include <stdio.h>
	int ipow(int,int);
	int yyerror(char*);
	int yylex();
	int regs[26] = {0};
%}

%token LETTER
%token DIGIT
%left '+' '-'
%left '*' '/' '%'
%left '^'
%left UMINUS
%start program

%%
program:
program stmt '\n'
| program error '\n' {yyerrok;}
|
;

stmt:
LETTER '=' expr {regs[$1]=$3;}
| expr {printf("%d\n",$1);}
|
;

expr:
expr '+' expr {$$=$1+$3;}
| expr '-' expr {$$=$1-$3;}
| expr '/' expr {$$=$1/$3;}
| expr '*' expr {$$=$1*$3;}
| expr '%' expr {$$=$1%$3;}
| expr '^' expr {$$=ipow($1,$3);}
| '-' expr %prec UMINUS {$$=-$2;}
| '(' expr ')' {$$=$2;}
| LETTER {$$=regs[$1];};
| DIGIT
;

%%

int main(int argc, char const *argv[])
{
	return yyparse();
}

int ipow(int base,int index) {
	if(index==0) { return 1;}
	int result=1;
	for(int i=0;i<index;i++){
		result*=base;
	}
	return result;
}

int yyerror(char *error) {
	fprintf(stderr, "%s\n", error);
	return 0;
}