#!/bin/bash
#
#################FUNCTION#############
#
# AutoStart Weblogic
# AutoStop Weblogic
#
#####################################
#
# Created by MUZEE 2013-7-23
# Information Muzee Co.,Ltd
# MIS (Thomas.ku)
#
# shutdownweblogic()
# {
cd /
currentlog=$(date +"%Y%m%d%H%M")
mkdir -p /tmp/$currentlog
cd /tmp//$currentlog
jps -l | awk '/weblogic.Server/ {print $1}' > tmp01
tail -n 100000 /root/WebLogs/Stdout.log > Stdout.log
tail -n 100000 /root/WebLogs/Stderr.log > Stderr.log
echo "jstack" `sed -n '1p' tmp01`"|tee $currentlog.jstack" > jstack
chmod 755 jstack
./jstack
echo "jmap -dump:format=b,file=$currentlog.hprof" `sed -n '1p' tmp01` > tmp02
chmod 755 tmp02
./tmp02
tar -czvf $currentlog.tar.gz $currentlog.hprof 
rm -rf $currentlog.hprof
sleep 3
rm -rf jstack tmp*
sleep 5
exit
exit
