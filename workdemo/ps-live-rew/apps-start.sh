#!/bin/bash
#export the environment
JAVA_HOME=/usr/local/openjdk8
WORK_HOME="/home/qingqing/webapps/$APP_CONTEXT"
CONF="$WORK_HOME/conf:/home/qingqing/data/conf"
export JAVA_HOME
export LANG=zh_CN.GB18030
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$WORK_HOME/lib:$WORK_HOME/so
export PATH=$PATH:$WORK_HOME/bin
#run the program
CLASSPATH=$WORK_HOME/bin:$JAVA_HOME/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$CONF
for jar in `ls $WORK_HOME/lib/*.jar`
do
   CLASSPATH="$CLASSPATH":"$jar"
done
chmod 755 -R bin
$JAVA_HOME/bin/java -Xms128M -Xmx400M -XX:PermSize=64M -XX:MaxPermSize=128M -Ddisconf.env=${envType} -DENV_TYPE=${envType} -DHOSTNAME=`hostname -i` -DIS_CONTAINER=1 -classpath $CLASSPATH com.qingqing.rew.LiveRewApplication $@
