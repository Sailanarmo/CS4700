#include <iostream>


E<double> getRood(double x)
{
	if(x < 0) return std::domain_error("Neg root");
	return std::sqrt(x);
}
	
std::pair<E<double>,E<double>> solve (double a, double b, double c)
{
	auto det = getRoot(b*b - 4 * a*c);
	return std::make_pair((-b + det)/(2xa),(-b-det)/(2*a));
}

int main()
{

	
	
	return 0;

}
