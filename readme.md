TEST GENERATOR AND SOLUTION COMPAROR  
A program intended to run a test generator and compare solutions' result.  
Can only be run on Powershell (mostly associated with Windows).  
Currently only support C++.
  
How to use:  
Place the solutions' source into to .\solution folder.  
Place the test generator code into .\test folder.  
If you want to reset (delete all the test and some thing else), run the reset.ps1 script by typing it name in the Powershell enviroment.
If you want to generate test, build and run solution, compare outputs between solutions, run the TGSC.ps1 script by typing it name in the Powershell enviroment.
  
The test generator should write to the standard out stream (std::cout and printf in C++ without any redirection). Check the file gen.cpp in folder .\test if you want an example.  
The solution read from file and write to standard out stream. The input file name should be the first command argument passed to the solutions (common denoted as argv[1] in C++). Please check the C++ files in .\solution folder for an example.

There are 4 variable in the TGSC.ps1 (which is also the main file), together they determine the behavior of the program. Their function are self-explained in the their name.  
  
$generate_test: determined if the program should run the test generator or not. if the value of the variable is 1, the test generator will be run.  
The tests are created and placed in the .\test folder. They are named by their number in ".inp"  extension.  
If use want to include your custom tests, make sure to name them follow by the rule above. The largest number in the name of the tests should be equals to $number_of_tests.  
  
$number_of_tests_to_generate: Determine how many test the test generator will make.
$number_of_test: Determine the actual number of test.  
If you wish to use your custom tests and also test generator, make sure the number of your custom tests and the number of tests created by the generator add up to $number_of_test. If you just want to use the test generator alone, make sure the two number are equal to each other.  
  
$build_solution_source: Determine if the program should build the solutions' source to executable or not. if the value of the variable is 1, the program will build the sources. It is better to leave it as 1.  
  
$run_solution_executable: Determine if the program should run the solutions' executable or not. if the value of the variable is 1, the program will run the executables. The result of each test run by each solution will be place in the sub folder of .\solution folder. The outputs will be named by their respective inputs in ".out" extension. The variable should mostly be 1.  
  
$compare_solution_result: Determine if the outputs are compared or not. if the value of the variable is 1, the program will compare the outputs. The results of the comparisons will be a table, each line coresponds to a test and each collumn coresponds to a solutions. Two solutions have the same output on a test will have the same number in the cell coresponds to the test and the solutions. The variable should mostly be 1.  
  
There are example of solutions and test generator. Please remove them before using.
  
Created by Nguyen Thanh Toan.
If there is any bug, please send feedback to:  
https://github.com/thanhtoan1742/TestGeneratorAndSolutionComparor/issues  
or send an email to:  
thanhtoan1742@gmail.com