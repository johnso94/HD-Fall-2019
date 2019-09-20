#include<stdio.h>
#include<math.h>

int power(int base, int exp){
  int i = base;
  for (int q = 1; q < exp; q++){
    i *= base;
  }
  return i;
}

int main(){
  int a;
  int b;
  printf("Enter two integers:\n");
  scanf("%d",&a);
  scanf("%d",&b);
  printf("%d raised to %d is %d",a,b,power(a,b));
}
