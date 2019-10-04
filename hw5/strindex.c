#include <stdio.h>

int strindex(char str[], char value){
  int x = -1;
  int i = 0;
  while (str[i] != value && str[i] != '\0'){
    i++;
  }
  if (str[i] == value)
    x = i;
  return x;
}

int main(){
  int x;
  x = strindex("The end", 'a');
  printf("The return value from strindex(\"The end\", \'a\') is %d\n", x);
  return 0;
}
