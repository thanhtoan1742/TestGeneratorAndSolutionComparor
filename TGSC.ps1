Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
$generate_test = 0
$number_of_tests_to_generate = 100
$number_of_tests = 101
$build_solution_source = 1
$run_solution_executable = 1
$compare_solution_result = 1
.\run.ps1 > result.log