cmake_minimum_required(VERSION 2.8)

## Boost with python ##
#set(Boost_DETAILED_FAILURE_MSG        ON)
#set(Boost_DEBUG        ON)
#set(Boost_NO_SYSTEM_PATHS       ON)
#set(Boost_USE_MULTITHREADED     ON)
#set(Boost_USE_STATIC_LIBS       OFF)
#set(Boost_USE_STATIC_RUNTIME    OFF)

find_package(Boost COMPONENTS python REQUIRED)
#message("Boost_FOUND? ${Boost_FOUND}")
#message("Boost_USE_MULTITHREADED? ${Boost_USE_MULTITHREADED}")
#message("Boost_USE_STATIC_RUNTIME? ${Boost_USE_STATIC_RUNTIME}")
#message("Boost_USE_STATIC_LIBS? ${Boost_USE_STATIC_LIBS}")
#message("Boost_INCLUDE_DIRS? ${Boost_INCLUDE_DIRS}")
#message("Boost_LIBRARIES? ${Boost_LIBRARIES}")

# this should be set to match the version of boost_python
set(Python_ADDITIONAL_VERSIONS 2.7)

find_package(PythonLibs)
#message("PythonLibs")
#message("PYTHONLIBS_FOUND ${PYTHONLIBS_FOUND}")
#message("PYTHON_LIBRARIES ${PYTHON_LIBRARIES}")
#message("PYTHON_INCLUDE_PATH ${PYTHON_INCLUDE_PATH}")
#message("PYTHON_INCLUDE_DIRS ${PYTHON_INCLUDE_DIRS}")
#message("PYTHON_DEBUG_LIBRARIES ${PYTHON_DEBUG_LIBRARIES}")
#message("PYTHONLIBS_VERSION_STRING ${PYTHONLIBS_VERSION_STRING}")

if(Boost_FOUND AND PYTHONLIBS_FOUND)
    message("HAPPY :)")
endif(Boost_FOUND AND PYTHONLIBS_FOUND)

include_directories(
    ${Boost_INCLUDE_DIRS}
    ${PYTHON_INCLUDE_DIRS}  
)

add_library(hello SHARED hello.cpp)

target_link_libraries(hello
    ${Boost_LIBRARIES}
    ${PYTHON_LIBRARIES} 
)
