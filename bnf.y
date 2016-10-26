/* 
 * C definitions to be set before the grammar 
 * yylex and yyerror must be defined along with any headers that are to be used
 * and if the tokens cannot be an integer this is also defined here. 
 */
%{
  #include <stdio.h>
  int yylex(void);
  void yyerror(const char*);
%}

/* 
 * Set of tokens to be used in the grammar 
 */

%token firstInitial
%token lastInitial

%%

/* 
 * BNF syntax of the grammar
 */

input: |input initials

initials: firstInitial lastInitial '\n' {
  printf("success\n");
  return 0;
}

%%
/* 
 * C program to be run.
 * yylex is used to convert the input into tokens
 * yyerror is what occurs upon a syntax error defined by the grammar
 */

#include <string.h>

int yylex(){
  char c = getchar();
  switch(c){
    case('A'):
    case('a'):
      return firstInitial;
    case('M'):
    case('m'):
      return lastInitial;
    default:
      return c;
  }
}

void yyerror(const char* err){
  fprintf(stderr, "%s\n", err);
}

int lexparse(char* word){
  /* 
   * This takes an input string and returns 0 if it follows the grammar.
   * obviously it can return anything you want.
   */
  ungetc('\n', stdin);
  for(int i = strlen(word) - 1; i >= 0; i--)
    ungetc(word[i], stdin);
  return yyparse(); 
}
