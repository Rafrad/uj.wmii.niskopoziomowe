#include <stdio.h>

extern long double iloczyn_skalarny(int n, long double * x, long double * y);

int main()
{
	int n = 5;
	long double x[5] = {1., 2., 3., 4., 5.};
	long double y[5] = {5., 4., 3., 2., 1.};
	printf("%Lf\n", iloczyn_skalarny(n, x, y));
	return 0;
}
