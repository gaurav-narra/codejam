#!/bin/bash -xe

if [  -f "$1/question_$2.rb" ]; then
  exit
fi

mkdir -p $1
touch "$1/question_$2.rb"
chmod +x "$1/question_$2.rb"

mkdir -p $1/inputs
touch "$1/inputs/input_$2.txt"

mkdir -p $1/outputs

echo "#!/usr/bin/ruby -w

input  = File.new('inputs/input_$2.txt', 'r')
output = File.new('outputs/output_$2.txt', 'wb')

" >> "$1/question_$2.rb"


