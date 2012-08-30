=====================
boost_program_options
=====================

:author: wisut hantanong
:version: 0.1

.. .. raw:: pdf
.. 
..     PageBreak

.. contents::

Introduction
============

boost program_options_ allowed program to get command line arguments and from configuration file.

There are two types of options in this sample code

#. Named option
#. Position option

Declaration
===========
    
Named options
-------------

Named options declare via boost::program_options::options_description

======  ======  ==============
name    type    default value
======  ======  ==============
help    string  NUll
string  string  NULL
int     int     0
======  ======  ==============

The following code block define named options in table

.. code-block:: c++

    12    po::options_description name_desc("Options for [program]");
    13    name_desc.add_options()
    14        ("help", "this help message")
    15        ("string", po::value<std::string>(), "pass string option to program")
    16        ("int", po::value<int>()->default_value(0), "pass int option to program")
    17        ;

*Ex1:* Printing all supported options via --help name option

.. code-block:: text

    $ ./program --help
    Options for [program]:
    --help                this help message
    --string arg          pass string option to program
    --int arg (=0)        pass int option to program

by following code segment

.. to read below code from awk in vim
.. :r!awk 'NR==34, NR==38 {print NR $0}' program.cpp <CR>

.. code-block:: c++

    34    if (vmap.count("help"))
    35    {
    36        std::cout << name_desc << std::endl;
    37        return 1;
    38    }

Position options
----------------
 
Position options declare via boost::program_options::positional_options_description

*Ex2:* Get first unnamed argument as 'string' option

.. code-block:: text

    $ ./program xyz --int 5
    string is xyz
    int is 5

by following code segment

.. code-block:: c++

    20    po::positional_options_description pos_desc; 
    21    pos_desc.add("string", -1);

store() function
================

The most complex part of using boost::program_options might be these part.
To understand it,  I recommend 'take time to read full documentation'.

.. code-block:: c++

    28    po::store(
    29            po::command_line_parser(argc, argv). 
    30                options(name_desc).
    31                positional(pos_desc).
    32                run(), vmap); 

.. _program_options: http://www.boost.org/doc/libs/1_51_0/doc/html/program_options.html
