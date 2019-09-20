#include<stdio.h>
#include<math.h>
int main(){
  int n = 0;
  int ans,count;
  if (n==0){
    ans = 1;
  }
  else{
    count = n-1;
    ans = n;
    for (count; count>1; count--){
      ans *= count;
    }
  }
  printf("The factorial of %d is %d\n",n,ans);
}
