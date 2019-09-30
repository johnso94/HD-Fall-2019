#include <stdio.h>
#include <math.h>

int read_array(char ch[], int size){
  int i =0;
  while (scanf("%c",&ch[i])!= EOF && i < size && ch[i] != '\n'){
    i++;
  }
  return i;
}


int main(){
  char arr[50];
  int number = read_array(arr, 49);
  int i=0;
  printf("%s\n", arr);
  return 0;
}
