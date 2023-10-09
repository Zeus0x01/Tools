# Tools
Recon Tools
# zeus_sub_enum.sh
# {usage} ./zeus_sub_enum.sh -d domain.com
! you should install subfinder, Httpx, paramspider 
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

* the main aim * 
It takes your domain with this argument -d and pass it to subfinder to collect subdomains, check live subdomian from httpx and collecting parameters from paramspider 
