#include <stdio.h>

int iloraz (int a, int b);         /* prototyp funkcji */

int main()
{
        int c=1, d=2;
        scanf("%d %d",&c,&d);
        printf("%d\n", iloraz(c,d));
        return 0;
}
