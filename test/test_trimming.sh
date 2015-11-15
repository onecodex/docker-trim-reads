#!/bin/bash


correct_output=/tmp/test/result.fastq

# Test unzipped file
trim_galore --dont_gzip -o /tmp/test/ /tmp/test/test.fastq
output=/tmp/test/test_trimmed.fq

[ "$(cat $correct_output | md5sum)" = "$(cat $output | md5sum)" ] || return 1
rm $output

# Test gzipped file
gzip /tmp/test/test.fastq
trim_galore --dont_gzip -o /tmp/test/ /tmp/test/test.fastq.gz
output=/tmp/test/test_trimmed.fq

[ "$(cat $correct_output | md5sum)" = "$(cat $output | md5sum)" ] || return 1
rm $output
gunzip /tmp/test/test.fastq.gz

# Test .fa extension
mv /tmp/test/test.fastq /tmp/test/test.fq
trim_galore --dont_gzip -o /tmp/test/ /tmp/test/test.fq
output=/tmp/test/test_trimmed.fq

[ "$(cat $correct_output | md5sum)" = "$(cat $output | md5sum)" ] || return 1
rm $output
