#  Dockerfile for a Java webapp running 
FROM docker.idc.cedu.cn/qingqing/openjdk:8u141

ENV POOL_CODE=@POOL_CODE@  \
    APP_VERSION=@APP_VERSION@  \
    APP_BUILD_VERSION=@APP_BUILD_VERSION@  \
    APP_CONTEXT=@APP_CONTEXT@  \
    APP_JAVA_HOME="/home/qingqing/webapps"

ADD apps-start.sh /home/qingqing/
ADD *${APP_BUILD_VERSION}*.tar.gz /home/qingqing/webapps/$APP_CONTEXT

RUN chmod 755 /home/qingqing/apps-start.sh

WORKDIR /home/qingqing/webapps/$APP_CONTEXT/

ENTRYPOINT ["/home/qingqing/apps-start.sh"]

