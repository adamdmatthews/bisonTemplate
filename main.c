#include <stdio.h>
#include "bnf.tab.c"

int main(){
  printf("I have created a grammar that accepts my initials\n");
  
  int total = 0;
  int success = 0;

  printf("\nTesting \"AM\"\n"); 
  if(!lexparse("AM")) success++;
  total++;

  printf("\nTesting \"am\"\n"); 
  if(!lexparse("am")) success++;
  total++;

  printf("\nTesting \"ab\"\n"); 
  if(!lexparse("ab")) success++;
  total++;

  printf("\n%d of %d were successful\n", success, total);

  return 0;
}
