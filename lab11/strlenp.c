#include <stdio.h>

int strlen(char str[]){
  char *sptr = str;
  int i = 0;
  while(sptr[i] != '\0'){
    i++;
  }
  return i;
}

int main(){
  int x;
  x = strlen("this is a test");
  printf("x is %d", x);
  return 0;
}
