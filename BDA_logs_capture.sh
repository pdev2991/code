#! /bin/bash
# script for collecting BDA basic logs

read -p "please provide the the BDA server name: " host

echo "Collecting basic logs imageinfo,bdacheckhw and bdachecksw"

ssh $host -T "imageinfo>/tmp/imageinfo.txt;bdacheckhw>/tmp/bdacheckhw.txt;bdachecksw>/tmp/bdachecksw.txt"

echo "collecting  sosreport"
ssh $host -T "sosreport --batch"


echo "collecting oswatcher logs"
i
ssh $host -T "cd /var/log/oswatcher;tar cvzf /tmp/oswatcher-$host.gz archive"

echo "logs collected,please find all the logs under /tmp and for sosreport /var/tmp"

exit 0
