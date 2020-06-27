Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
cd .\solution
$solution_list = get-childitem -recurse -file -name -filter "*.cpp"
foreach ($solution in $solution_list) {
    move-item $solution .\
}
cd .\..

$io_list = get-childitem -recurse -file -name -filter "*.out"
foreach ($file in $io_list) {
    remove-item $file
}

$io_list = get-childitem -recurse -file -name -filter "*.inp"
foreach ($file in $io_list) {
    remove-item $file
}
