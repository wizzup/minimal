// this program show simple boost program_options usage
//

#include <iostream>
#include <boost/program_options.hpp>

namespace po = boost::program_options;

int main(int argc, char* argv[])
{
    // Declare the supported named options.
    po::options_description name_desc("Options for [program]");
    name_desc.add_options()
        ("help", "this help message")
        ("string,S", po::value<std::string>(), "pass string option to program")
        ("int,I", po::value<int>()->default_value(0), "pass int option to program")
        ;

    // declare position options
    po::positional_options_description pos_desc; 
    pos_desc.add("string", -1);

    // define variables map
    po::variables_map vmap;

    // get variables form command line
    // NOTE: it is a long function call, boost
    po::store(
            po::command_line_parser(argc, argv). 
                options(name_desc).
                positional(pos_desc).
                run(), vmap); 

    // update vmap so we can call vmap["name"].as<type>()
    po::notify(vmap);

    // print help message if request and exit 
    if (vmap.count("help"))
    {
        std::cout << name_desc << std::endl;
        return 1;
    }
    
    //
    // print option value if defined
    //

    if(vmap.count("string"))
        std::cout << "string is " << vmap["string"].as<std::string>() << std::endl;

    if(vmap.count("int"))
        std::cout << "int is " << vmap["int"].as<int>() << std::endl;

    return 0;
}
