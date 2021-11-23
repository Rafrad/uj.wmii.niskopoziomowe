#include <stdio.h>

extern "C" int suma (int n, int * tab);         /* prototyp funkcji */

int main()
{
        int n = 5;
	int tab[] = {1, 2, 3, 4, 5};
        printf("%d\n", suma(n, tab));
        return 0;
}
