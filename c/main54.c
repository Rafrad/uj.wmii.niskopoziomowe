#include <stdio.h>

typedef struct{
	    int min;
	        int max;
} MM;

MM minmax(int N, ...);         /* prototyp funkcji */

int main()
{
	  MM wynik = minmax(7, 8, -2, 4 , 90, 4, 100, -50);
	    printf("min = %d, max = %d \n", wynik.min, wynik.max);
	      return 0;
}
