%{
#include <stdio.h>
#include <stdlib.h>
#define YYDEBUG 1

#define TIP_INT 1
#define TIP_REAL 2
#define TIP_CAR 3

%}

%union {
  	int l_val;
	char *p_val;
}

%token MATRICE
%token CONSTANTA
%token FA
%token DE
%token PRGORAM
%token VARIABILA
%token BUCLA
%token INCEPE
%token SFARSIT
%token INCEPUT
%token STOP
%token DACA
%token CATTIMPCE
%token PENTRU
%token CITESTE
%token ALTFEL
%token INTERG
%token IMPRIMARE
%token REAL
%token CARACTER
%token ID
%token <p_val> CONSTANTA_REAL
%token <p_val> CONSTANTA_SIR
%token <p_val> NEW_SPACE

%token CHAR
%token INTREG
%token REAL

%token ATRIBUT
%token NE
%token LE
%token GE

%left '+' '-'
%left DIV MOD '*' '/'
%left OR
%left AND
%left NOT

%type <l_val> expr_stat factor_stat constanta
%%

prog_sursa:	PROGRAM ID ';' bloc '.'
		;
bloc:		sect_const sect_var instr_comp
		;
sect_const:	/* empty */
		| CONSTANTA lista_const
		;
lista_const:	decl_const
		| list_const decl_const
		;
sect_var: 	/* empty */
		| VAR lista_var
		;
lista_var:	decl_var
		| lista_var decl_var
		;
decl_const:	ID '=' {sp=0;} expr_stat ';'
		printf("*** %d %g ***\n", $4, pop());
		;
decl_var: 	lista_id ':' tip ';'
		;
lista_id:	ID
		|
		;
tip:		tip_simplu
		;
tip_simplu:	INTREG
		| REAL
		| CHAR
		;
expr_stat:	factor_stat
		| expr_stat '+' expr_stat	{
			if($1==TIP_REAL || $3==TIP_REAL) $$=TIP_REAL;
			else if($1==TIP_CAR) $$=TIP_CAR;
				else $$=TIP_INT;
			push(pop()+pop());
						}
		| expr_stat '-' expr_stat	{
			if($1==TIP_REAL || $3==TIP_REAL) $$=TIP_REAL;
			else if($1==TIP_CAR) $$=TIP_CAR;
				else $$=TIP_INT;
			push(-pop()+pop());
						}
		| expr_stat '*' expr_stat	{
			if($1==TIP_REAL || $3==TIP_REAL) $$=TIP_REAL;
			else if($1==TIP_CAR) $$=TIP_CAR;
				else $$=TIP_INT;
			push(pop()*pop());
						}
		| expr_stat '/' expr_stat	
		| expr_stat DIV expr_stat
		| expr_stat MOD expr_stat
		;
factor_stat:	ID		{}
		| CONSTANTA
		| '(' expr_stat ')'	{$$=$2;}
		;
CONSTANTA:	CONSTANTA_INT 	{
			$$ = TIP_INT;
			push(atof($1));
				}
		| CONSTANTA_REAL
			$$ = TIP_REAL;
			push(atof($1));
		| CONSTANTA_CAR	{
			$$ = TIP_CAR;
			push((double)$1[0]);
				}
		;
instr_comp:	INCEPE lista_instr SFARSIT
		;
lista_instr:	instr
		| lista_instr ';' instr
		;
instr:		/* empty
		| instr_atrib
		| instr_if
		| instr_while
		| instr_comp
		| instr_read
		| instr_print
		;
instr_atrib:	VARIABILA ATRIBUT expresie
		;
VARIABILA:	ID
		| ID '[' expresie ']'
		| ID '.' ID
		;
expresie:	factor
		| expresie '+' expresie
		| expresie '-' expresie
		| expresie '*' expresie
		| expresie '/' expresie
		| expresie DIV expresie
		| expresie MOD expresie
		;
factor:		ID
		| constanta {}
		| ID '(' lista_expr ')'
		| '(' expresie ')'
		| ID '[' expresie ']'
		| ID '.' ID
		;
lista_expr:	expresie
		| lista_expr ',' expresie
		;
instr_if:	DACA conditie ATUNCI instr ramura_else
		;
ramura_else: 	/* empty */
		ALTFEL instr
		;
conditie:	expr_logica
		| expresie op_rel expresie
		;
expr_logica:	factor_logic
		| expr_logica AND expr_logica
		| expr_logica OR expr_logica
		;
factor_logic:	'(' conditie ')'
		| NOT factor_logic
		;
op_rel:		'='
		| '<'
		| '>'
		| NE
		| LE
		| GE
		;
instr_while:	CATTIMPCE conditie FA instr
		;
instr_print:	IMPRIMARE '(' lista_elem ')'
		;
lista_elem:	element
		| lista_elem ',' element
		;
element: 	expresie
		| CONSTANTA_SIR
		;
instr_read:	READ '(' lista_variab ')'
		;
lista_variab:	variabila
		| lista_variab ',' variabila
		;

%%

yyerror(char *s)
{
  printf("%s\n", s);
}

extern FILE *yyin;

main(int argc, char **argv)
{
  if(argc>1) yyin = fopen(argv[1], "r");
  if((argc>2)&&(!strcmp(argv[2],"-d"))) yydebug = 1;
  if(!yyparse()) fprintf(stderr,"\tO.K.\n");
}