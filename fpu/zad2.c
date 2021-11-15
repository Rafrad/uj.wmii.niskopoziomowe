#include <stdio.h>

extern void prostopadloscian(float a, float b, float  c, float * objetosc, float * pole);

int main()
{
	float obj, pol;
	prostopadloscian(2., 3., 4., &obj, &pol);
	printf("%f, %f\n", obj, pol );
	return 0;
}
