cmake_minimum_required(VERSION 2.8)

# swig settings
find_package(SWIG REQUIRED)
include(${SWIG_USE_FILE})

# python lib settings
find_package(PythonLibs REQUIRED)
include_directories(${PYTHON_INCLUDE_PATH})

include_directories(${CMAKE_CURRENT_SOURCE_DIR})

# output python module settings
set_source_files_properties(hello.i PROPERTIES CPLUSPLUS ON)
swig_add_module(hello_module PYTHON hello.i hello.cpp)
swig_link_libraries(hello_module ${PYTHON_LIBRARIES})

