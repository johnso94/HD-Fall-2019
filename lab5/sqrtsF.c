#include<stdio.h>
#include<math.h>

int main(){
  int N = 5;
  printf("x  sqrt(x)\n-  -------\n");
  /* invariant: count square roots have been printed so far*/
  for (int count = 0; count < N; count++){
    printf("%d\t%f\n", count+1,sqrt(count+1));
  }
  return 3;
}
