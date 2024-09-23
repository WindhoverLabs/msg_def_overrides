#!/bin/bash

# Check if a filename was provided
if [ -z "$1" ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

# Run autopep8 with --diff on the provided file and capture the output
diff_output=$(autopep8 --diff --aggressive --aggressive "$1")

# Check if the output is non-empty (i.e., there are formatting issues)
if [ -n "$diff_output" ]; then
    echo "Formatting issues detected in $1."
    exit 1
else
    echo "No formatting issues detected in $1."
    exit 0
fi
