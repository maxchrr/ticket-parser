%{
#include <stdio.h>
%}
%%
"Dossier" 				{ printf("dossier "); }
[1-9][0-9]?				{ printf("nb "); }
[0-9]{8}				{ printf("codeDossier "); }
\n					{ printf("RC\n"); }
[A-Z]+(-[A-Z]+)*\/[A-Z]+(-[A-Z]+)*	{ printf("prenomNom "); }
T([0-9]{2,6})				{ printf("codeConcert "); }
[A-Z0-9]+(-[A-Z0-9]+)*			{ printf("nomConcert "); }
([0-9]{2})\/([0-9]{1,2})(\/([0-9]{2}))?	{ printf("date "); }
([0-9]{2}):([0-9]{2})			{ printf("heure "); }
"places"				{ printf("places "); }
<<EOF>>					{ printf("FinFichier\n"); exit(0); }
[\ \t]					{ /* Ignore spaces and tabs */ }
.					{ printf("Unknown token: %s\n", yytext); return 0; }
