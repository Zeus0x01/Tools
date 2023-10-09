# Tools
Recon Tools
# zeus_sub_enum.sh
{usage} ./zeus_sub_enum.sh -d domain.com

you should install subfinder, Httpx, paramspider 

go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

* the main aim
  It takes your domain with this argument -d and pass it to subfinder to collect subdomains, check live subdomian from   httpx and collecting parameters from paramspider 

# paramspider_to_dalfox.sh 
{usage} ./paramspider_to_dalfox.sh <paramspider_output_file> <dalfox_binary>

you should install Dalfox 

go install github.com/hahwul/dalfox/v2@latest

* the main aim
  It takes paramspider output and pass it one by one to dalfox 

# paramspider_to_xsstrike.sh
{usage} ./paramspider_to_xsstrike.sh <paramspider_output_file> <xsstrike_script>

you should install xsstrike 

git clone https://github.com/s0md3v/XSStrike.git

cd xsstrike 

go build .

* the main aim
  It takes paramspider output and pass it one by one to xsstrike  
