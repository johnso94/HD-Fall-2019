#include <stdio.h>
#include <math.h>

int main(){
  int x = 0xc93e;
  int y;
  printf("Enter a hexadecimal value");
  while (scanf("%x",&y)!=EOF){
    printf("The value of that value  is %d in decimal and %x is hexadecimal\n",y,y);
  }
  return 0;
}
  
