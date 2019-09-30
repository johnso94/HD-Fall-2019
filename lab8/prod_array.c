#include <stdio.h>
#include <math.h>

int prod_array(int a[], int size){
  int i, prod = 1;
  for (i = 0; i< size; i++){
    prod = prod * a[i];
  }
  return prod;
}

int main(){
  int arr[3] = {2,3,4};
  int x = prod_array(arr, 3);
  printf("The product is %d\n", x);
}
