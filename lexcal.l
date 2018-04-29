%{
	#include <ctype.h>
%}

NUM [0-9]+
%%
(.)*{NUM}[*]{NUM}(.)*|(.)*{NUM}[/]{NUM}(.)* {
	char buffer[500];
	int oper1=0,oper2=0,result,lastnondigit=-1,i=0,j=0,k=0;
	for(;yytext[i]!='*'&&yytext[i]!='/';i++) {
		if(isdigit(yytext[i])) {
			oper1=oper1*10+(yytext[i]-'0');
			buffer[j++]=yytext[i];
		} else {
			buffer[j++]=yytext[i];
			lastnondigit=i;
			oper1=0;
		}
	}
	char operator=yytext[i++];
	while(isdigit(yytext[i])) {
		oper2=oper2*10+(yytext[i++]-'0');
	}
	switch(operator) {
		case '*': result=oper1*oper2;
		break;
		case '/': result=oper1/oper2;
		break;
	}
	char resbuffer[33];
	sprintf(resbuffer,"%d",result);
	for(j=lastnondigit+1;resbuffer[k]!='\0';j++,k++) {
		buffer[j]=resbuffer[k];
	}
	for(;yytext[i]!='\0';i++,j++) {
		buffer[j]=yytext[i];
	}
	for(j--;j>=0;j--) {
		unput(buffer[j]);
	}
}
(.)*{NUM}[+]{NUM}(.)*|(.)*{NUM}[-]{NUM}(.)* {
	char buffer[500];
	int oper1=0,oper2=0,result,lastnondigit=-1,i=0,j=0,k=0;
	for(;yytext[i]!='+'&&yytext[i]!='-';i++) {
		if(isdigit(yytext[i])) {
			oper1=oper1*10+(yytext[i]-'0');
			buffer[j++]=yytext[i];
		} else {
			buffer[j++]=yytext[i];
			lastnondigit=i;
			oper1=0;
		}
	}
	char operator=yytext[i++];
	while(isdigit(yytext[i])) {
		oper2=oper2*10+(yytext[i++]-'0');
	}
	switch(operator) {
		case '+': result=oper1+oper2;
		break;
		case '-': result=oper1-oper2;
		break;
	}
	char resbuffer[33];
	sprintf(resbuffer,"%d",result);
	for(j=lastnondigit+1;resbuffer[k]!='\0';j++,k++) {
		buffer[j]=resbuffer[k];
	}
	for(;yytext[i]!='\0';i++,j++) {
		buffer[j]=yytext[i];
	}
	for(j--;j>=0;j--) {
		unput(buffer[j]);
	}
}
{NUM}\n {printf("%s",yytext);}

.\n {;}
%%

int main(int argc, char const *argv[])
{
	yylex();
	return 0;
}