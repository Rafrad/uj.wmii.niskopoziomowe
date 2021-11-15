#include <cstdio>
using namespace std;

extern "C" void tablicuj(double a, double b, double P, double Q, double xmin, double xmax, int k,  double * wartosci);

int main()
{
	  const int rozmiar = 30;
	    double wynik[rozmiar];
	      tablicuj(-1, 1, 1, 2, 0, 1, rozmiar, wynik);
	        for(int i=0; i<rozmiar; ++i){
			    printf("%.15lf\n", wynik[i]);
			      }
		  return 0;
}
