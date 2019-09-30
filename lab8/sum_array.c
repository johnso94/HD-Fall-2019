#include <stdio.h>
#include <math.h>

int sum_array(int a[], int size){
  int i = 0;
  int sum = 0;
  while (i<size){
      sum = sum + a[i];
      i++;
  }
  return sum;
}
float a, b;
int main(){
  int arr[4] = {16,40,20,82};
  int val = sum_array(arr, 4);
  printf("the sum of the numbers in the array is %d",val);
  return 0;
}
