# checkMailStuff
Quick shell script to check for DKIM, SPF, and DMARC on a domain. 
Usage: ./checkMailStuff.sh <domain> <selector>
The selector is optional, but if not provided
the DKIM check will be skipped
