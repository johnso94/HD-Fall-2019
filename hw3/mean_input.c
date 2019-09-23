#include <stdio.h>

float mean_input(){
  float sum = 0;
  int i = 0;
  int val;
  while (scanf("%d", &val)!=EOF){
    sum = (sum *i + val)/(i+1);
    i+=1;
  }
  return sum;
}

int main(){
  printf("enter some integers");
  float a = mean_input();
  printf("the mean of those ints is %f", a);
}
