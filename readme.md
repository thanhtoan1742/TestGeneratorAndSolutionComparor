
# TEST GENERATOR AND SOLUTION COMPAROR  
A program intended to run a test generator and compare solutions' result.  
Can only be run on **_Powershell_** (mostly associated with **_Windows_**).  
Currently only support **_C++_**.

# Installation
Just download the repository.
  
# How to use:  
Place the solutions' source into to `.\solution` folder.  
Place the test generator code into `.\test` folder.  
If you want to reset (delete all the tests' input and output):
```powershell
.\reset.ps1
```
If you want to generate test, build and run solution, compare outputs between solutions:
```powershell
.\TGSC.ps1
```
# Details
* **Write a test generator**
The test generator should write to the standard out stream (`std::cout` and `printf` in **C++** without any redirection).   
Check the file `gen.cpp` in folder `.\test` if you want an example.   
* **Write a solution**
The solution read from file and write to standard out stream.  
The input file name should be the first command argument passed to the solution (common denoted as `argv[1]` in **C++**). Please check the **C++** files in `.\solution` folder for an example.

There are 4 variable in the `TGSC.ps1` , together they determine the behavior of the program. 
* **`$generate_test`**
If the value of the variable is 1, the test generator will be run.  
The tests are created and placed in the `.\test` folder. They are named by their number in `.inp`  extension.  
If you want to include your custom tests, make sure to name them follow by the rule above. The largest number in the name of the tests should be equal to `$number_of_tests`.  
* **`$number_of_tests_to_generate`**
Determine how many test the test generator will make.
* **`$number_of_test`**
 Determine the actual number of test.  
If you wish to use your custom tests and also test generator, make sure the number of your custom tests and the number of tests created by the generator add up to `$number_of_test`. If you just want to use the test generator alone, make sure the two number are equal to each other.  
  
* **`$build_solution_source`**  
If the value of the variable is 1, the program will build the sources. It is better to leave it as 1.  
  
* **`$run_solution_executable`**  
If the value of the variable is 1, the program will run the executables. The output of each test run by each solution will be place in the solution's sub folder in `.\solution` folder. The outputs will be named by their respective inputs in `.out` extension. This variable should mostly be 1.  
  
* **`$compare_solution_result`**  
If the value of the variable is 1, the program will compare the outputs. The results of the comparisons will be a matrix, each line corresponds to a test and each column corresponds to a solutions. Two solutions have the same output on a test will have the same number in the cell corresponds to the test and the solutions. The matrix will be saved to `result.log` by default. This variable should mostly be 1.  
  
There are example of solutions and test generator. Please remove them before using the program.
  
# Feedback
If there is any bug, please send feedback to:  
[GitHub](
https://github.com/thanhtoan1742/TestGeneratorAndSolutionComparor)  
or send an email to:  
thanhtoan1742@gmail.com
# Authors 
Created by Nguyen Thanh Toan.