#!/bin/bash

# Check if ParamSpider output file and DalFox binary are provided
if [ $# -lt 2 ]; then
    echo "Usage: $0 <paramspider_output_file> <dalfox_binary>"
    exit 1
fi

paramspider_output="$1"
dalfox_binary="$2"

# Check if the DalFox binary exists
if [ ! -f "$dalfox_binary" ]; then
    echo "DalFox binary not found: $dalfox_binary"
    exit 1
fi

# Create a timestamped directory for the DalFox output files
output_dir="dalfox_output_$(date +'%Y%m%d%H%M%S')"
mkdir "$output_dir"

# Iterate through each URL in the ParamSpider output file
while IFS= read -r url; do
    # Run DalFox on the current URL and save the output
    output_file="$output_dir/$(echo "$url" | tr -d '\/:?&=')_xss.txt"
    echo "Scanning URL: $url"
    "$dalfox_binary" url "$url" --output "$output_file"
done < "$paramspider_output"

echo "XSS scanning completed. Output saved in: $output_dir"
