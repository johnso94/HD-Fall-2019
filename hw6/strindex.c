#include <stdio.h>
#include <math.h>

int strindex(char str[], char val){
  int i = 0;
  char *ptr = str;
  while(*ptr != val){
    if (*ptr == '\0'){
      return -1;
    }
    i++;
    ptr ++;
  }
  return i;
}

int main(){
  int x;
  x = strindex("The end", 'e');
  printf("x contains %d\n", x);
  return 0;
}
