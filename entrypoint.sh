#!/bin/bash

# lyx 6/9/2024

# Set input and output directories
INPUT_DIR="/mnt/in"
OUTPUT_DIR="/mnt/out"

# Source the script to set THREAD_NUM
echo -e "\e[0;34mInfo: Running set.thread.num.sh to set THREAD_NUM...\e[0m"
source /root/set.thread.num.sh

# Find and list all .fast5 files
tmpfile=$(mktemp)
find $INPUT_DIR -type f -name "*.fast5" > "$tmpfile"

# Check if any .fast5 files were found
if [ ! -s "$tmpfile" ]; then
    echo "Error: No .fast5 files found in $INPUT_DIR." >&2
    rm "$tmpfile"
    exit 1
fi

# Process each .fast5 file with pod5 conversion
while IFS= read -r file; do
    BASE_NAME=$(basename -- "$file" .fast5)
    echo -e "\e[0;34mInfo: Converting ${BASE_NAME} to .pod5 format...\e[0m"
    
    pod5 convert fast5 "${file}" --output "${OUTPUT_DIR}/" --one-to-one "${OUTPUT_DIR}"

    # Check whether the previous command was successful
    if [ $? -ne 0 ]; then
        echo "Error running pod5 on $file" >&2
        exit 1
    fi
done < "$tmpfile"
rm "$tmpfile"

echo -e "\e[0;34mInfo: pod5 conversion completed. Results are in ${OUTPUT_DIR}\e[0m"
