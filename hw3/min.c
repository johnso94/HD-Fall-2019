#include <stdio.h>
#include <math.h>

double min(double x, double y) {
  if (x>y)
    return y;
  else
    return x;
}
float a, b;
int main(){
  printf("enter two values: ");
  scanf("%f %f", &a, &b);
  printf("The call min(%f, %f) returns the value %f\n",a,b,min(a,b));
  return 0;
}
