#include <stdio.h>
#include <math.h>

float moInterest(float a, float b){
  float i = a * b /1200;
  return i;
}

int main(){
  float a = 100, b = .3;
  printf("the interest for the month is %f\n", moInterest(a,b));
  return 0;
}
