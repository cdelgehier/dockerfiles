docker run -d -P -e "ZK_CONFIG=tickTime=2000,initLimit=10,syncLimit=5,maxClientCnxns=128,forceSync=no,clientPort=2181" -e "ZK_ID=my_zoo" -e "ZOO_LOG_DIR=/var/log/zookeeper" cdelgehier/zookeeper
