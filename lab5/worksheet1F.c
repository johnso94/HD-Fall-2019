#include <stdio.h>
#include <math.h>
#include <stdbool.h>

int main(){
  int x;
  for (bool b = 1; b; b){
    printf("Enter a non-negative integer  ");
    scanf("%d", &x);
    if (x<0){
      printf("%d is a negative value\n", x);
      b = 0;
      return 0;
    }
    else{
      printf("The square root of %d is %f\n", x, sqrt(x));
    }
  }
}
