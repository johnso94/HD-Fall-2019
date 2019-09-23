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
  int q;
  printf("enter a positive integer");
  scanf("%d", &q);
  int ans;
  printf("k\t k!\n -\t -------\n");
  for (int i = 0; i <= q; i++){
    ans = fact(i);
    printf("The factorial of %d is %d\n",i,ans);
  }
  return 0;
}
