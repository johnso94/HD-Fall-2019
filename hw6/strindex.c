#include <stdio.h>
#include <math.h>

int strindex(char str[], char val){
  int i = 0;
  while(str[i] != val){
    i++;
    if (str[i] == '\0'){
      return -1;
    }
  }
  return i;
}

int main(){
  int x;
  x = strindex("The end", 'a');
  printf("x contains %d\n", x);
  return 0;
}
