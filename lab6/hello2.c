#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int main() {
  sleep(10);
  pid_t pid = getpid();
  printf("pid =%d  %s",pid,"A different message!\n");
  return 0;
}
