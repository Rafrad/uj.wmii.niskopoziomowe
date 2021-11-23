#include <stdio.h>

extern "C" double wartosc (double a, double b, double x, int n);         /* prototyp funkcji */

int main()
{
        printf("%lf\n", wartosc(4.0, 3.0, 2.0, 2));
        return 0;
}
