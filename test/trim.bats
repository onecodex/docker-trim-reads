#!/usr/bin/env bats

@test "Python 2.7.X should be installed" {
    V=$(python --version 2>&1)
    [[ $V == Python\ 2.7* ]]
}

@test "Test for trim_galore" {
    T=$(trim_galore --version)
    echo $T
    [[ $T == *0.4.1* ]]
}

@test "Test for cutadapt" {
    C=$(cutadapt --version)
    [[ $C == "1.9" ]]
}

@test "Test trim_galore" {
    sh /tmp/test/test_trimming.sh
}
