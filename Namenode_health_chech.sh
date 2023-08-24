[root@gb-wat-svv-0574 a-dh209686]# cat /opt/namenode_health/nn_health.sh
#!/bin/bash
#Written by : Devendra Singh
# Script for checking Namenode's health for Wat2 and wat3 BDA and DR clsuters

Namenodes="/opt/namenode_health/namenodes.txt"
output_file="/opt/namenode_health/nn_health.txt"

# Checking the status of the namenodes
echo "Starting Namenodes health checks on `date`"

for host  in $(cat $Namenodes)
   do
      ssh $host -T  "jps | grep -i namenode"
        if [ $? -eq 0 ];then
        echo "Namenode $host is  healthy"
        else
        echo "Namenode $host is  DOWN"
####### Sending mail to the group
        read -r -d '' MSG_BODY <<- EOM
        NAMENODE $host IS DOWN,KINDLY TAKE REQUIRED ACTION
EOM

    echo "$MSG_BODY" | mail -r svc_hadoopops@dunnhumby.co.uk -s "NAMENODE  $host IS DOWN,KINDLY TAKE REQUIRED ACTION" HadoopOps@dunnhumby.com

        fi
   done
