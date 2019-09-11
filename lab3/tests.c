#include <stdio.h>
#include <math.h>

int main() {
  float v = 16.0;
  if (v > 0) {printf("%f is positive",v);}
  else if (v < 0) {printf("%f is negative",v);}
  else if (v == 0){printf("%f is zero", v);}
  printf("\n");
  float f = 25.0;
  if ((int)f == f){
    printf ("%f has an integer value\n", f);
  }
  else{printf("%f does not have an integer value\n");}
  float q = sqrt(f);
  if ((int)q == q){
    printf("The square root of %f is an integer\n",f);
  }
  else {printf("The square root of %f is not an integer\n",f);}
}
