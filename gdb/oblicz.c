#include <stdio.h>

long oblicz(short a, int b, long c) {
	a = ceil(pow(b, a));
        b = (a >= 0) ? 0 : 31;
	a = a + b;
        a = a & 0x1f;
	a = a - b;
        return a + c;
}

int main(){
	short a;
	int  b;
    	long c;
	printf(" Podaj trzy liczby : ");	
	scanf("%hd %d %ld", &a, &b, &c);	
	printf(" Wynik : %ld \n", oblicz(a, b, c));
	return 0;
}
