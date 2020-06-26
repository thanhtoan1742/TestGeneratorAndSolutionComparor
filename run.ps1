# TODO:
# run with test_gen executable and solution executable

clear-host
write-host "TEST GENERATOR AND SOLUTION COMPAROR"
write-host "This is only intended to be used on Windows Power Shell"
write-host "This program can build test with a source"
write-host "This program build solutions' source, run the executables then compare results"
write-host "Currently only support C++"

$number_of_tests = 10

set-location .\test\
$test_gen_file = get-childItem .\*.cpp -File -Name
g++ $test_gen_file
for ($i = 0; $i -lt $number_of_tests; $i++) {
    # execute test_gen
    # the execution depends on how test_gen work
    # example: .\a.exe <args[0]> <args[1]> ... > <input_file>
    $input_file = (resolve-path .\).path + "\" + $i.toString() + ".inp"
    # .\a.exe | out-file -filepath $input_file -encoding utf8NoBom
    $input_content = .\a.exe
    [io.file]::WriteAllLines($input_file, $input_content)
}
set-location .\..

set-location .\solution\
$solution_list = @(get-childItem .\*.cpp -File -Name)
for ($i = 0; $i -lt $solution_list.length; $i++) {
    $solution_list[$i] = [io.path]::GetFileNameWithoutExtension($solution_list[$i])
}

foreach ($solution in $solution_list) {
    $solution_file = $solution + ".cpp"
    if (!(test-path $solution)) {
        new-item $solution -itemtype dir
    }
    else {
        if (test-path ($solution + "\" + $solution_file)) {
            remove-item ($solution + "\" + $solution_file)
        }
    }
    move-item $solution_file $solution
    set-location $solution
    g++ $solution_file 
    for ($i = 0; $i -lt $number_of_tests; $i++) {
        # execute solution
        # the execution depends on how solution work
        # example: .\a.exe $input_file > $output_file
        $input_file = "..\..\test\" + $i.toString() + ".inp"
        $output_file = $i.toString() + ".out"
        .\a.exe $input_file > $output_file 
    }
    set-location .\..
}
set-location .\..

$solution_folder = get-childItem -path ".\solution\" -directory
write-host $solution_folder
for ($i = 0; $i -lt $solution_folder.length; $i++) {
    $solution_folder[$i] = ".\solution\" + $solution_folder[$i]
}
for ($i = 0; $i -lt $number_of_tests; $i++) {
    $output_file = $i.toString() + ".out"
    $result = "0"
    for ($u = 1; $u -lt $solution_folder.length; $u++) {
        $sim = $u
        for ($v = 0; $v -lt $u; $v++) {
            $compare_result = compare-object (get-content ($solution_folder[$u] + "\" + $output_file)) (get-content ($solution_folder[$v] + "\" + $output_file))
            if ($compare_result.length -eq 0) {
                $sim = $v;
                break
            }
            # write-host ($u.toString() + " " + $v.toString());
        }
        $result = $result + " " + $sim.toString()
        # write-host $result
    }
    write-host $result
}