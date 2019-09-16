#include<stdio.h>
#include<math.h>

int main(){
  int N = 5;
  int count = 0;
  printf("x  sqrt(x)\n-  -------\n");
  /* invariant: count square roots have been printed so far*/
  while (count < N){
    printf("%d\t%f\n", count+1,sqrt(count+1));
    count = count +1;
  }
}
