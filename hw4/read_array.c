#include <stdio.h>
#include <math.h>

int read_array(int a[], int size){
  int i =0;
  while (scanf("%d",&a[i])!= EOF && i < size){
    i++;
  }
  return i;
}


int main(){
  int arr[10];
  int number = read_array(arr, 10);
  printf("There are %d elements in the array and here they are in reverse order: ", number);
  int i=0;
  for (i;i<number;i++){
    printf("%d, ", arr[number-1-i]);
  }
  printf("\n");
  return 0;
}
