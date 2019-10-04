# include <stdio.h>

void strappend(char arr[], char str[]){
  int a = 0;
  int b = 0;
  while (arr[a] != '\0'){
    a++;
  }
  while (str[b] != '\0' && (a+b<100)){
    arr[a] = str[b];
    a++;
    b++;
  }
  return;
}

int main(){
  char A[100] = "From start ";
  strappend(A, "to finish");
  printf("%s\n", A);
  return 0;
}
