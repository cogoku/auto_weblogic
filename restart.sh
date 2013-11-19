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
echo "kill -9 " `sed -n '1p' tmp01` > tmp03
chmod 755 tmp03
./tmp03
sleep 3
rm -rf tmp*
/root/bea/user_projects/domains/mtech/startWebLogic.sh &
sleep 5
exit
