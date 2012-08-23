// hello SWIG interface file
//
%module hello_module

%{
#include "hello.hpp"
%}
// 
// exported interfaces
void hello();

