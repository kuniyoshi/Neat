use inc::Module::Install;
name 'Neat';
all_from 'lib/Neat.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
