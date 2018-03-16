#ifndef EXPECTED_HPP
#define EXPECTED_HPP

#include <stdexcept>
#include <exception>
#include <functional>
#include <variant>
#include <type_traits>

template<typename T>
class Expected
{

public:
	Expected(T t) : state(t), valid(true){}	
	Expected(std::exception_ptr e) : state(e), valid(false){}	
	Expected(std::exception e) : state(std::make_exception_ptr(e)), valid(false){}	
	
	T value() const 
	{
		if(valid) return std::get<T>(state);
		std::rethrow_exception(std::get<std::exception_ptr>(state));
	}
	
	bool isValid()
	{
		if(valid) return true;
		return false;
	}
	
	template<typename F, typename U = std::invoke_result_t<F&, T>>
	Expected<U> apply(F f)
	{
		if(!valid) return std::get<std::exception_ptr>(state);
		try
		{
			return f(std::get<T>(state));
		}
		catch(...)
		{
			return std::current_exception();
		}
	}
private:

	std::variant<T, std::exception_ptr> state;
	bool valid;
		
};

template<typename T>
std::ostream& operator<< (std::ostream& o, Expected<T> e)
{
	try
	{
		o << e.value();
	}
	catch(std::exception &a)
	{
		o << a.what();
	}
	catch(...)
	{
		o << "!!UNEXPECTED ERROR!!";
	}

	return o;
}

#define MixedMode(op)\
template<typename T, typename V>\
auto operator op(Expected<T> t, Expected<V> v)\
{\
	return t.apply([&](T myT){return myT op v.value();});\
}\
template<typename T, typename V>\
auto operator op(Expected<T> t, V v)\
{\
	return t.apply([&](T myT){return myT op v;});\
}\
\
template<typename T, typename V>\
auto operator op(V v, Expected<T> t)\
{\
	return t.apply([&](T myT){return v op myT;});\
}\

#define Compare(op)\
template<typename T, typename V>\
auto operator op(Expected<T> t, Expected<V> v)\
{\
	return t.value() op v.value();\
}\
template<typename T, typename V>\
auto operator op(Expected<T> t, V v)\
{\
	return t.value() op v;\
}\
\
template<typename T, typename V>\
auto operator op(V v, Expected<T> t)\
{\
	return v op t.value();\
}\

MixedMode(+)
MixedMode(-)
MixedMode(*)
MixedMode(/)

Compare(<)
Compare(>)
Compare(<=)
Compare(>=)
Compare(==)
Compare(!=)

#endif
