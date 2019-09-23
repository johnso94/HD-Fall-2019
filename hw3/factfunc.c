#include<stdio.h>
#include<math.h>

int fact(int n){
  int count, ans;
  if (n>10 || n<0){
    printf("that is not a small positive integer");
    return 1;
  }
  if (n==0){
    ans = 1;
  }
  else{
    count = n;
    ans = n;
    while (count>1){
      count -= 1;
      ans *= count;
    }
  }
  return ans;
}
int main(){
  int n;
  printf("enter a positive integer");
  scanf("%d", &n);
  int ans;
  ans = fact(n);
  printf("The factorial of %d is %d\n",n,ans);
}
