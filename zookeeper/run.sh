#!/bin/sh
set -e
ZK_CFG_FILE=/opt/zookeeper/conf/zoo.cfg


if [ -f ${ZK_CFG_FILE} ]; then
	echo "Okey ! ${ZK_CFG_FILE} is here"
else
	if [ -z "${ZK_CONFIG}" ]; then
		echo "${ZK_CFG_FILE} is not here"
		echo "You should specify ZK_CONFIG env variable with config values"
		exit 1
	fi
fi

echo 'dataDir=/var/lib/zookeeper' > ${ZK_CFG_FILE} 

for line in $(echo "${ZK_CONFIG}" | tr "," "\n"); do
	echo "$line" >> ${ZK_CFG_FILE} 
done

if [ -e /var/lib/zookeeper/myid ]; then
	echo "zookeeper node id found"
else
	if [ -z ${ZK_ID} ]; then
		echo "zookeeper node id not found, here are your options:"
		echo "You should specify ZK_ID env variable with id"
		exit 1
	fi

    echo "${ZK_ID}" > "/var/lib/zookeeper/myid"
fi

exec /opt/zookeeper/bin/zkServer.sh start-foreground
