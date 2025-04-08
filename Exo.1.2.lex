%{
#include <stdio.h>
int counter;
%}
%%
"Dossier" 
[1-9][0-9]? 
[0-9]{8}
\n 
[A-Z]+(-[A-Z]+)*\/[A-Z]+(-[A-Z]+)*	{ printf("%s ", yytext); }
T([0-9]{2,6})				{ ++counter; } 
[A-Z0-9]+(-[A-Z0-9]+)* 
([0-9]{2})\/([0-9]{1,2})(\/([0-9]{2}))? 
([0-9]{2}):([0-9]{2}) 
"places" 
<<EOF>>					{ printf("a acheté des places de %d concerts.\n", counter); exit(0); }
[\ \t]					{ /* Ignore spaces and tabs */ }
.					{ printf("Unknown token: %s\n", yytext); return 0; }
%%
int main(void)
{
	counter = 0;
	yylex();
	return 0;
}
