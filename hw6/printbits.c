#include <stdio.h>
#include <math.h>

void print_bits(char bit){
  int i = 7;
  int x;
  for(i; i>=0; i--){
    x = ((bit >> i) & 1);
    printf("%d ", x);
  }
  printf("\n");
  return;
}

int main(){
  char bit;
  printf("enter a character: ");
  scanf("%s", &bit);
  printf("The bits of %s are ");
  print_bits(bit);
  printf("\n");
  return 0;
}
