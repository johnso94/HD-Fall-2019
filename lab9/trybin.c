#include <stdio.h>
#include <math.h>


int main(){
  int x = 37;
  printf("x has value %d in decimal, and %x in hexadecimal\n", x, x);
  printf("x&1 has value %d in decimal, and %x in hexadecimal\n", x&1, x&1);
  printf("x|1 has value %d in decimal, and %x in hexadecimal\n", x|1, x|1);
  printf("x << 1 has value %d in decimal, and %x in hexadecimal\n", x << 1, x << 1);
  printf("x << 4 has value %d in decimal, and %x in hexadecimal\n", x << 4, x << 4);
  printf("x >> 2 has value %d in decimal, and %x in hexadecimal\n", x >> 2, x >> 2);
  printf("(x>>4)&1 has value %d in decimal, and %x in hexadecimal\n", (x >> 4) & 1, (x >> 4) & 1);
  printf("(x >> 5) & &1 has value %d in decimal, and %x in hexadecimal\n", (x >> 5) & 1, (x >> 5) & 1);
}
