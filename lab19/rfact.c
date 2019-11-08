#include <stdio.h>
#include <math.h>

int fact(int n){
  if (n==0)
    return 1;
  else
    return n*fact(n-1);
}

int main(){
  printf("enter a non-zero int");
  int x;
  scanf("%d", &x);
  if (x < 0){
    return -1;
  }
  printf("The factorial of %d is %d\n", x, fact(x));
}
  
