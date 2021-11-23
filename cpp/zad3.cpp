#include <stdio.h>

extern "C" int iloczyn (int n, ...);         /* prototyp funkcji */

int main()
{
        printf("%d\n", iloczyn(10, 1, 2, 3, 4, 1, 1, 1, 1, 1, 10));
        printf("%d\n", iloczyn(4, 1, 2, 3, 4));
        return 0;
}
