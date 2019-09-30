#include <stdio.h>

int mean_array(int arr[], int size){
  int sum = 0;
  int i = 0;
  int val;
  while (i < size){
    sum = (sum *i + arr[i])/(i+1);
    i+=1;
  }
  return sum;
}

int main(){
  int arr[4] = {16,40,20,82};
  int a = mean_array(arr, 4);
  printf("the mean of that array is %d", a);
}
