#!/bin/bash

# Check if ParamSpider output file and XSSTrike script are provided
if [ $# -lt 2 ]; then
    echo "Usage: $0 <paramspider_output_file> <xsstrike_script>"
    exit 1
fi

paramspider_output="$1"
xsstrike_script="$2"

# Check if the XSSTrike script exists
if [ ! -f "$xsstrike_script" ]; then
    echo "XSSTrike script not found: $xsstrike_script"
    exit 1
fi

# Create a timestamped directory for the XSSTrike output files
output_dir="xsstrike_output_$(date +'%Y%m%d%H%M%S')"
mkdir "$output_dir"

# Iterate through each parameter in the ParamSpider output file
while IFS= read -r param; do
    # Run XSSTrike on the current parameter and save the output
    output_file="$output_dir/$(echo "$param" | tr -d '\/:?&=')_xss.txt"
    echo "Scanning parameter: $param"
    python3 "$xsstrike_script" -u "$param" 2>&1 | tee "$output_file"
done < "$paramspider_output"

echo "XSS scanning completed. Output saved in: $output_dir"

