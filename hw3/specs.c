#include <stdio.h>
#include <math.h>

double mean(double x, double y) {
  double a = (x+y)/2;
  return a;
}
long sum_input(){
  int val;
  int sum = 0;
  while (scanf("%d", &val) != EOF){
      sum = sum + val;
  }
  return sum;
}
float a, b;
int main(){
  printf("enter two values: ");
  scanf("%f %f", &a, &b);
  printf("The mean of %f and %f is %f\n",a,b,mean(a,b));
  int sum = sum_input();
  printf("the sum of the numbers you entered is %d",sum);
  return 0;
}
