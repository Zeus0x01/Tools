#!/bin/bash
echo "
                                  ___        ___  _
               _______ _   _ ___ / _ \__  __/ _ \/ |
              |_  / _ \ | | / __| | | \ \/ / | | | |
               / /  __/ |_| \__ \ |_| |>  <| |_| | |
              /___\___|\__,_|___/\___//_/\_\\___/|_|
"
echo "Welcome to zeus0x01 - Subdomain & Parameter Collector"


# Default values
target_domain=""

# Function to display usage instructions
usage() {
    echo "Usage: $0 -d <target_domain>"
    exit 1
}

# Parse command line arguments
while getopts ":d:" opt; do
    case $opt in
        d)
            target_domain="$OPTARG"
            ;;
        \?)
            echo "Invalid option: -$OPTARG"
            usage
            ;;
        :)
            echo "Option -$OPTARG requires an argument."
            usage
            ;;
    esac
done

# Check if the target domain is provided
if [ -z "$target_domain" ]; then
    echo "Target domain (-d) is required."
    usage
fi

# Step 1: Subdomain Enumeration using subfinder
echo "Enumerating subdomains using subfinder for domain: $target_domain..."
subfinder -d "$target_domain" -silent | sort -u > subdomains.txt

# Step 2: Check for live subdomains using httpx
echo "Checking for live subdomains using httpx..."
httpx -l subdomains.txt -mc 200 -o live.txt

# Step 3: Collect parameters using paramspider on live.txt
echo "Collecting parameters using paramspider on live.txt..."
paramspider -l live.txt 

echo "Parameter collection completed."
