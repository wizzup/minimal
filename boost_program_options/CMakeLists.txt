cmake_minimum_required(VERSION 2.8)

## find rewuired packages
find_package(Boost COMPONENTS program_options REQUIRED)

if(NOT Boost_FOUND)
    message("ERROR: Boost NOT FOUND")
endif(NOT Boost_FOUND)

##### all required package found #####
message("Using Boost")
message("      Boost include @Boost_INCLUDE_DIRS@")
message("      Boost library @Boost_LIBRARIES@")

## program executable
add_executable(program program.cpp)
target_link_libraries(program @Boost_LIBRARIES@)
