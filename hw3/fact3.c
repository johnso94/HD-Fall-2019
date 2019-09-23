#include<stdio.h>
#include<math.h>
int main(){
  int n;
  printf("enter a positive integer");
  scanf("%d", &n);
  int ans,count;
  if (n>10 || n<0){
    printf("that is not a small positive integer");
    return 1;
  }
  printf("k\t k!\n-\t--------\n");
  if (n==0){
    ans = 1;
  }
  else{
    count = 0;
    ans = 1;
    printf("0\t1\n");
    while (count < n){
      count += 1;
      ans *= count;
      printf("%d\t%d\n",count,ans);
    }
  }
  printf("The factorial of %d is %d\n",n,ans);
}
