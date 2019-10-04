#include <stdio.h>
#include <math.h>

void strncopy(char arr[], char str[], int A){
  int i = 0;
  while (str[i] != '\0' && i < A){
    arr[i] = str[i];
    i ++;
  }
  arr[i] = '\0';
  return;
}

int main(){
  char A[100];
  strncopy(A, "The end", 5);
  printf("%s\n", A);
  return 0;
}
