#include <stdio.h>
#include <math.h>
#include <pthread.h>

#define NUM_RECT 10000000
#define NUMTHREADS 4

double gPi = 0.0;
pthread_mutex_t gLock;

void *Area(void *pArg) {
  int myNum = *((int *)pArg);
  int i;
  double h = 2.0 / NUM_RECT;
  double partialSum = 0.0, x;

  for(i = myNum; i < NUM_RECT; i+= NUMTHREADS) {
    x = -1 + (i + 0.5f) * h;
    partialSum += sqrt(1.0 - x * x) * h;
  }

  printf("Thread %d adding %f to global total\n", myNum, partialSum);

  pthread_mutex_lock(&gLock);
  gPi += partialSum;
  pthread_mutex_unlock(&gLock);
  return 0;
}

int main(int argc, char **argv) {
  pthread_t tHandles[NUMTHREADS];
  int tData[NUMTHREADS], i;

  pthread_mutex_init(&gLock, NULL);
  for(i = 0; i < NUMTHREADS; ++i) {
    tData[i] = i;
    pthread_create(&tHandles[i],
                   NULL,
                   Area,
                   (void*)&tData[i]);
  }
  for(i = 0; i < NUMTHREADS; ++i) {
    pthread_join(tHandles[i], NULL);
  }
  gPi *= 2.0;
  printf("Computed value of Pi: %12.f\n", gPi);
  pthread_mutex_destroy(&gLock);
  return 0;
}
