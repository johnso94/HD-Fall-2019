#include <stdio.h>
#include <math.h>

int getbit(int val, int bitno){
  int x = ((val >> bitno)&1);
  return x;
}

int main(){
  int hex;
  printf("Enter a hexadecimal\n");
  scanf("%x", &hex);
  int i = 7;
  for (i; i>=0; i--){
    printf("%d ", getbit(hex, i));
  }
  printf("\n");
}
