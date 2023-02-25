/*** Definition Section ***/
%{
#include <string.h>

typedef struct {
    char token[257];
    int symbolTableCode;
}PIF;

typedef struct{
    char token[257];
    int index;
}ST;

ST SymbolTable[100];
int stLength = 0;

PIF ProgramInternalForm[300];
int pifLength = 0;

int errorFound = 0;
int lineNumber = 1;


int addToST(char* token) {
	for(int i = 0; i < stLength; i++) {
		
		if(strcmp(SymbolTable[i].token, token) == 0) {
		  return SymbolTable[i].index;
		}
	}
	strcpy(SymbolTable[stLength].token, token);
	SymbolTable[stLength].index = stLength;
	stLength++;
	
	return stLength - 1;
}

void addToPIF(char* token, int stCode) {
	strcpy(ProgramInternalForm[pifLength].token, token);
	ProgramInternalForm[pifLength].symbolTableCode = stCode;
	
	pifLength++;
}

void showSymbolTable() {
    printf("~~~~~~~ Symbol table ~~~~~~~\n");
    
    for(int i = 0 ; i < stLength; i++) {
        printf(" %s  %d", SymbolTable[i].token, SymbolTable[i].index);
        printf("\n");
    }
    
    printf("~~~~~~~ End ST ~~~~~~~\n");
    printf("\n");
}

void showProgramInternalForm() {
    printf("~~~~~~~ Program internal form ~~~~~~~\n");
    
    for(int i = 0; i < pifLength; i++) {
    
        printf(" %s  %d ", ProgramInternalForm[i].token, ProgramInternalForm[i].symbolTableCode);
        printf("\n");
    }
    
    printf("~~~~~~~ End PIF ~~~~~~~\n");
    printf("\n");
}

%}

%option noyywrap
%option caseless

REAL_NUMBER  [+-]?(0|[1-9][0-9]*).[0-9]+
INT_NUMBER  [+-]?(0|[1-9][0-9]*)
IDENTIFIER   [a-z][a-z0-9_]*
STRING       \".*\"

/*** Rule Section ***/
%%
					/* yytext is the text in the buffer */
matrice					{ addToPIF(yytext, -1); return MATRICE;}
constanta				{ addToPIF(yytext, -1); return CONSTANTA;}
fa					{ addToPIF(yytext, -1); return FA;}
de					{ addToPIF(yytext, -1); return DE;}
program					{ addToPIF(yytext, -1); return PROGRAM;}
variabila				{ addToPIF(yytext, -1); return VARIABILA;}
bucla					{ addToPIF(yytext, -1); return BUCLA;}
incepe                                   { addToPIF(yytext, -1); return INCEPE;}
sfarsit					{ addToPIF(yytext, -1); return SFARSIT;}
inceput					{ addToPIF(yytext, -1); return INCEPUT;}
stop					{ addToPIF(yytext, -1); return STOP;}
daca                                    	{ addToPIF(yytext, -1); return DACA;}
CatTimpCe                                   { addToPIF(yytext, -1); return CATTIMPCE;}
pentru                                    	{ addToPIF(yytext, -1); return PENTRU;}
scrie                                   { addToPIF(yytext, -1); return SCRIE;}
citeste                                    { addToPIF(yytext, -1); return CITESTE;}
altfel                                    { addToPIF(yytext, -1); return ALTFEL;}
intreg                                    	{ addToPIF(yytext, -1); return INTREG;}
real                                    { addToPIF(yytext, -1); return REAL;}
caracter                                    { addToPIF(yytext, -1); return CARACTER;}
imprimare				{ addToPIF(yytext, -1); return IMPRIMARE;}
\;                                    	{ addToPIF(yytext, -1); return DIV;}
\(                                    	{ addToPIF(yytext, -1); return '(';}
\)                                    	{ addToPIF(yytext, -1); return ')';}
\,                                    	{ addToPIF(yytext, -1); return ',';}
\+                                    	{ addToPIF(yytext, -1); return '+';}
\-                                    	{ addToPIF(yytext, -1); return '-';}
\*                                    	{ addToPIF(yytext, -1); return '*';}
\/                                    	{ addToPIF(yytext, -1); return '/';}
\%                                    	{ addToPIF(yytext, -1); return '%';}
\>                                    	{ addToPIF(yytext, -1); return G;}
\<                                    	{ addToPIF(yytext, -1); return L;}
\>=                                    	{ addToPIF(yytext, -1); return GE;}
\<=                                    	{ addToPIF(yytext, -1); return LE;}
\=                                    	{ addToPIF(yytext, -1); return E;}
\==                                    	{ addToPIF(yytext, -1); return EE;}
\and                                    { addToPIF(yytext, -1); return AND;}
\or                                    	{ addToPIF(yytext, -1); return OR;}
\!=                                    	{ addToPIF(yytext, -1); return NE;}
{IDENTIFIER}				{ int stCode = addToST(yytext); addToPIF(yytext, stCode); return ID}
{REAL_NUMBER}				{ int stCode = addToST(yytext); addToPIF(yytext, stCode); yylval.p_val = yytext; return CONSTANTA_REAL}
{INT_NUMBER}                           { int stCode = addToST(yytext); addToPIF(yytext, stCode); yylval.p_val = yytext; return CONSTANTA_REAL}
{STRING}				{ int stCode = addToST(yytext); addToPIF(yytext, stCode); yylval.p_val = yytext; return CONSTANTA_SIR}
[\n]					{ ++lineNumber; Return NEW_SPACE}
[ \t\n]+             			{ ; /* eat up whitespace */ Return EUWS}
.                			{ errorFound = 1; printf("Illegal token %s at line %d !", yytext, lineNumber); printf("\n"); return ERROR}
%%

/* yywrap() - wraps the above rule section */
int yywrap() {}

int main(int argc, char** argv) {

	FILE *fp;
	fp = fopen(argv[1], "r");
	
	/* yyin - takes the file pointer which contains the input*/
	yyin = fp;

	/* yylex() - this is the main flex function which runs the Rule Section
	yylex();
	
	if (errorFound == 0) {
    		showSymbolTable();
    		showProgramInternalForm();
	}
  
	return 0;
}*/
