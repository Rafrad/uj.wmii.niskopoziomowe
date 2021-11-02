#include <stdio.h>

typedef struct{
    int min;
    int max;
} MinMax;

MinMax minmax( int N, ...);

int main(){
   MinMax wynik = minmax(7, 1, -2, 4 , 90, 4, -11, 101);
   printf("min = %d, max = %d \n", wynik.min, wynik.max);
   
   wynik = minmax(5, 1, -2, 4 , 90, 4, -11, 101);
   printf("min = %d, max = %d \n", wynik.min, wynik.max);
   
   wynik = minmax(1, 0);
   printf("min = %d, max = %d \n", wynik.min, wynik.max);
   
   return 0;
}
