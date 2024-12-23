#!/bin/bash

# lyx 6/9/2024

# Set the directories for input and output
output_dir="/data/output_pod5s"

# Ensure the output directory exists
mkdir -p "${output_dir}"

# Find all .fast5 files in the /data directory and its subdirectories
# and check if any files found
if find /data -type f -name '*.fast5' | grep -q '.'; then
    # Show all .fast5 files found
    echo "The following .fast5 files found in the /data:"
    find /data -type f -name '*.fast5'

    # Process each .fast5 file using the pod5 conversion command
    echo "Start converting .fast5 files to .pod5 format..."
    while IFS= read -r file; do
        pod5 convert fast5 "${file}" --output "${output_dir}/" --one-to-one /data/
    done < <(find /data -type f -name '*.fast5')
    echo "pod5 conversion completed. Results are in ${output_dir}"
else
    echo "Error: No .fast5 files found in /data." >&2
    exit 1
fi
