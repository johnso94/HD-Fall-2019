#include<stdio.h>
#include<math.h>
int main(){
  int n = 0;
  int ans,count;
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
  printf("The factorial of %d is %d\n",n,ans);
}
