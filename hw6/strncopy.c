#include <stdio.h>
#include <math.h>

void strncopy(char arr[], char str[], int val){
  char *ptr = arr;
  char *ptr2 = str;
  int i = 0;
  while(*ptr2 != '\0' && i < val){
    *ptr++ = *ptr2++;
    i++;
  }
  *ptr = '\0';
  return;
}

int main(){
  char A[100];
  strncopy(A, "The end", 5);
  printf("%s\n", A);
  return 0;
}
