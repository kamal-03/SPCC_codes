%{
	int count1=0,count2=0,count3=0;
	int flag1=0,flag2=0,flag3=0;
	char lastopen='\0';
%}

%%
[(] {count1++; lastopen='(';}
[{] {count2++; lastopen='{';}
[[] {count3++; lastopen='[';}
[)] {count1--; if(count1<0&&!flag1) {printf("Unmatched )\n");flag1=1;}}
[}] {count2--; if(count2<0&&!flag2) {printf("Unmatched }\n");flag2=1;}}
[]] {count3--; if(count3<0&&!flag3) {printf("Unmatched ]\n");flag3=1;}}
\n {
	if(!flag1 && count1>0) {
		printf("Unmatched (\n");
	}
	if(!flag2 && count2>0) {
		printf("Unmatched {\n");
	}
	if(!flag3 && count3>0) {
		printf("Unmatched [\n");
	}
	count1=0,count2=0,count3=0;
	flag1=0,flag2=0,flag3=0;
}
. {;}
%%

int main(int argc, char const *argv[])
{
	/* Strings like {[}] don't give unmatched output*/
	yylex();
	return 0;
}