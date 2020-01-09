#!/bin/bash
# A shell script to dump SPF, DKIM, and DMARC records
# Usage: ./checkMailStuff.sh <domain> <selector>

if [ -z "$1" ]
then
    echo "Usage: ./checkMailStuff.sh <domain> <selector>"
    echo "The selector is optional, but if not provided"
    echo "the DKIM check will be skipped"
    exit 1
fi
echo
echo "Checking for DKIM, SPF, and DMARC on $1 using selector $2"

ECHO ---------DKIM---------
if [ -z "$2" ]
then
    echo No DKIM Selector Provided. Skipping DKIM Checks
else
    dig $2._domainkey.$1 TXT +noall +answer | grep -v "^;"
fi

ECHO ---------SPF---------
dig $1 TXT +noall +answer | grep -v "^;" | grep "v=spf1"

ECHO ---------DMARC---------
dig _dmarc.$1 TXT +noall +answer | grep -v "^;"
ECHO

