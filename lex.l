%{
    #include <stdio.h>
    #include "parser.tab.h"
%}

/* token descriptions */
%%

"+"                     { return ADD; }
"-"                     { return SUB; }
"/"                     { return DIV; }
"*"                     { return MUL; }
"^"                     { return POWER; }

print                   { return PRINT; }
"("                     { return LPARAN; }
")"                     { return RPARAN; }


\"[^"]*\"               {
                            size_t len = strlen(yytext);
                            memmove(yytext, yytext + 1, len); 
                            yytext[len - 2] = '\0';            
                            yylval.str_val = strdup(yytext);  
                            return STRING;                    
                        }
[0-9]+                  { yylval.int_val=atoi(yytext); return INTEGER; }
"#".*                   { } /* remove comment */
\n                      { /* ignore end of line */; }
[ \t]+                  { /* ignore whitespace */; }

%%

int yywrap(void) {
    return 1;
}