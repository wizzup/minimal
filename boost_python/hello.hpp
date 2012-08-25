#include <iostream>

#include <boost/python.hpp>

void hello();

BOOST_PYTHON_MODULE(libhello)
{
    using namespace boost::python;
    def("hello", hello);
}


