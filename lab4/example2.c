#include <stdio.h>
#include <math.h>

int main() {
  printf("Example C program\n");
  int gl;
  printf("enter an integer value\n");
  scanf("%d", &gl);
  printf("gl=%d\n", gl);

  int i;
  float f;
  printf("enter and integer and a float\n");
  scanf("%d %f", &i, &f);
  printf("i=%d  f=%f\n", i, f);

  i = i * gl;
  f = f * gl;
  printf("i=%d  f=%f\n", i, f);

  printf("The square root of %d is %f\n", i, sqrt(i));

  if (i < 10) 
    printf("%d is small\n", i);
  else
    printf("%d is not small\n", i);

  if (i < 0) 
    printf("%d is negative\n", i);
  else {
    printf("%d is non-negative ", i);
    printf("and the square root of %d is %f\n", i, sqrt(i));
  }

  if (i < 10) 
    printf("%d is small\n", i);
  else if (i < 100)
    printf("%d is medium\n", i);
  else /* assert:  i >= 100 */
    printf("%d is large\n", i);

  return i;

}
