#include <stdio.h>

int strlen(char str[]){
  int i = 0;
  while (str[i] != '\0')
    i++;
  return i;
}

int main(){
  int x;
  x = strlen("The end");
  printf("The return value from strlen(\"The end\") is %d\n", x);
  return 0;
}
