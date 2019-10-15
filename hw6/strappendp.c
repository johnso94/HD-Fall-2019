#include <stdio.h>

void strappend(char arr[], char str[]){
  char *ptr = arr;
  char *ptr2 = str;
  while (*ptr != '\0'){
    ptr++;
  }
  while (*ptr2 != '\0'){
    *ptr++ = *ptr2++;
  }
  *ptr = '\0';
  return;
}

int main(){
  char A[100] = "From start ";
  strappend(A, "to finish");
  printf("%s\n", A);
  return 0;
}

