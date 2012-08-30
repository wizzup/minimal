// this program show simple boost program_options usage
//

#include <iostream>
#include <boost/program_options.hpp>

int main(int argc, char* argv[])
{
    // Declare the supported options.
    boost::program_options::options_description description("Options for [program]");
    description.add_options()
        ("help", "this help message")
        ("string", boost::program_options::value<std::string>(), "pass string option to program")
        ("int", boost::program_options::value<int>()->default_value(0), "pass int option to program")
        ;

    // define variables map
    boost::program_options::variables_map vmap;

    // get variables form command line
    boost::program_options::store(
            boost::program_options::parse_command_line(argc, argv, description), vmap); 

    // update vmap so we can call vmap["name"].as<type>()
    boost::program_options::notify(vmap);

    // show help message if request and exit 
    if (vmap.count("help"))
    {
        std::cout << description << std::endl;
        return 1;
    }
    
    // Missing options , tell user that 'string' option is missing
    if(!vmap.count("string"))
    {
        std::cout << "Missing 'string' option. use --help for info about program options " << std::endl;
        return -1;
    }else
    {
        std::cout << "string is " << vmap["string"].as<std::string>() << std::endl;
        std::cout << "int is " << vmap["int"].as<int>() << std::endl;
    }

    return 0;
}
