[root@gb-wat-svb-0227 ~]# cat /nfs/science/shared/util/nfs_home_util.sh
#! /bin/bash
#Writen by Devendra Singh
#Script to check the /nfs/home utilization

path="/nfs/home"
util=`df -h $path | awk '/home/ {print $5}'`
percent_util=${util%"%"}

#checking /nfs/home utilization

if [ $percent_util -le 95 ];then

   echo "/nfs/home is under 95% of the utilzation,currently it is $util"
   else
   echo "/nfs/home is alomost full,currently it is $util"


# Sending email to the science envoirnment support squad

  read -r -d '' MSG_BODY <<- EOM
        /nfs/home is alomost full,current utilization is $util,KINDLY TAKE REQUIRED ACTION
EOM

    echo "$MSG_BODY" | mail -r svc_sciops@dunnhumby.co.uk -s "/nfs/home is alomost full,current utilization is $util,KINDLY TAKE REQUIRED ACTION" ScienceEnvironmentsSupportSquad@dunnhumby.com

fi
