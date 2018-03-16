#include <iostream>
#include <cmath>

#include "expected.hpp"

template<typename T>
Expected<T> getRoot(T x)
{
	if(x < 0)
	{
		return std::domain_error("Neg root.");
	}
	return std::sqrt(x);
}

template<typename T>
Expected<T> divThings(T a, T b)
{
	if (b == 0)
	{
		return std::domain_error("0 Divisor. Bad Things");
	}
	return a/b;
}

template<typename T>
Expected<T> mulThings(T a, T b)
{
	return a*b;
}

int main()
{
	
	Expected<double> a = 2.4;
	Expected<double> b = 1.4;
	Expected<double> c = 1.4;
	
	Expected<bool> e = (a < b);	
	
	std::cout << "a: " << a;
	std::cout << std::endl;	
	std::cout << "b: " << b;	
	std::cout << std::endl;	
	std::cout << "c: " << b;	
	std::cout << std::endl;	
	
	std::cout << std::endl;	
	std::cout << "Checking to see if a < b: ";	

	if (e == 0)
	{
		std::cout << "False" << std::endl;
	}
	else
	{
		std::cout << "True" << std::endl;
	}
	
	std::cout << "Checking to see if a > b: ";	
	e = (a > b);
	if (e == 0)
	{
		std::cout << "False" << std::endl;
	}
	else
	{
		std::cout << "True" << std::endl;
	}		
	
	std::cout << "Checking to see if c >= b: ";	
	e = (c >= b);
	if (e == 0)
	{
		std::cout << "False" << std::endl;
	}
	else
	{
		std::cout << "True" << std::endl;
	}
	
	std::cout << "Checking to see if c <= b: ";	
	e = (c <= b);
	if (e == 0)
	{
		std::cout << "False" << std::endl;
	}
	else
	{
		std::cout << "True" << std::endl;
	}
	std::cout << "Checking to see if a == b: ";	
	if(a == b)
	{
		std::cout << "a is equal to b." << std::endl;
	}
	else
	{
		std::cout << "a is not equal to b." << std::endl;
	}
	
	std::cout << "Checking to see if b == c: ";	
	if(b == c)
	{
		std::cout << "b is equal to c." << std::endl;
	}
	else
	{
		std::cout << "b is not equal to c." << std::endl;
	}

	std::cout << std::endl;	
	std::cout << "a + b + c = ";
	std::cout << a + b + c << std::endl;
	
	std::cout << "a - b - c = ";
	std::cout << a - b - c << std::endl;
	
	std::cout << "a * b / c =  ";
	std::cout << a * b / c << std::endl;
	
	std::cout << "Sqrt(4.0) + a * c = ";
	std::cout << getRoot(4.0) + a * c << std::endl;	
	
	std::cout << std::endl;	
	c = getRoot(4.5);
	std::cout << "Setting c = getRoot(4.5): ";
	std::cout << c << std::endl;
	std::cout << "c + a * a = ";
	std::cout << c + a * a << std::endl;
	std::cout << std::endl;	
	
	c = getRoot(-4.0);
	std::cout << "Setting c = getRoot(-4.0): ";
	std::cout << c << std::endl;
	std::cout << "c + a * a = ";
	std::cout << c + a * a << std::endl; 	
	std::cout << std::endl;	

	std::cout << "Setting c = 2: ";
	c = 2;
	std::cout << c << std::endl;
	std::cout << "Setting c = 2 + sqrt(4.5): ";
	c = 2 + getRoot(4.5);
	std::cout << c << std::endl;
	std::cout << std::endl;	

	std::cout << "Setting c = 4.56: ";
	c = 4.56;
	std::cout << c << std::endl;
	std::cout << "Setting c = c + (3 * 5): ";
	std::cout << c + (3 * 5) << std::endl;
	
	return 0;
}
