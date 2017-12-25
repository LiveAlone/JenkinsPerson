#!/bin/bash
#export the environment
JAVA_HOME=/usr/local/jdk
WORK_HOME="/home/qingqing/webapps/$APP_CONTEXT"
CONF="$WORK_HOME/conf:/home/qingqing/data/conf"
export JAVA_HOME
export LANG=zh_CN.GB18030


#run the program
CLASSPATH=$WORK_HOME/bin:$JAVA_HOME/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$CONF
for jar in `ls $WORK_HOME/lib/*.jar`
do
   CLASSPATH="$CLASSPATH":"$jar"
done

$JAVA_HOME/bin/java -Ddisconf.env=${envType} -DENV_TYPE=${envType} -DHOSTNAME=`hostname -i` -DIS_CONTAINER=1 -classpath $CLASSPATH com.qingqing.livebroker.command.WsCommand >/dev/null