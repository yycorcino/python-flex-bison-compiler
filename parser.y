%{

#include <stdio.h>
#include <string.h>
#include <stdlib.h> 
#include <math.h>

int yylex();
void yyerror(const char *s);
extern FILE *yyin;
extern FILE *yyout;

%}

%union {
    int int_val;           
    char* str_val;       
};

/* available tokens && set the type of tokens */
%token ADD SUB DIV MUL POWER
%token PRINT LPARAN RPARAN STRING INTEGER

%type <int_val> INTEGER
%type <int_val> exp

%type <str_val> STRING
%type <str_val> expr_for_print print_stmt

/* set precedence */
%left PLUS MINUS
%left MUL DIV
%nonassoc UMINUS

/* grammar rules %% actions when matched */
%% 

statements: statements statement | /* empty */ ;

statement: print_stmt;

print_stmt: PRINT LPARAN expr_for_print RPARAN { printf("%s\n", $3); free($3); } ;

expr_for_print: exp  { char buffer[20]; sprintf(buffer, "%d", $1); $$ = strdup(buffer); }
              | INTEGER { char buffer[20]; sprintf(buffer, "%d", $1); $$ = strdup(buffer); }
              | STRING { $$ = $1; }
              ;

exp: INTEGER           { $$ = $1; }
   | exp ADD exp       { $$ = $1 + $3; }
   | exp SUB exp       { $$ = $1 - $3; }
   | exp DIV exp       { if ($3 == 0) yyerror("Divide by Zero"); else $$ = $1 / $3; }
   | exp MUL exp       { $$ = $1 * $3; }
   | exp POWER exp     { $$ = pow($1, $3); }
   | LPARAN exp RPARAN { $$ = $2; }

%%

void yyerror(const char *s) { printf("Parser Error: %s\n", s); }

int main(int argc, char *argv[]) {

    // parse given file
    int out;
    yyin = fopen(argv[1], "r");
    out = yyparse();
    fclose(yyin);
    
    return out;
}
