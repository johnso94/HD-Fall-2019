#include <stdio.h>
#include <math.h>

double max(double x, double y) {
  if (x<y)
    return y;
  else
    return x;
}
float a, b;
int main(){
  printf("enter two values: ");
  scanf("%f %f", &a, &b);
  printf("The call max(%f, %f) returns the value %f\n",a,b,max(a,b));
  return 0;
}
