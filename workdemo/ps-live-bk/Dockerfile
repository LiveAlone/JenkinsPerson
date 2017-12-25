#  Dockerfile for a Java webapp running 
FROM  docker.idc.cedu.cn/qingqing/jdk:7u75

ENV POOL_CODE @POOL_CODE@
ENV APP_VERSION @APP_VERSION@
ENV APP_BUILD_VERSION @APP_BUILD_VERSION@
ENV APP_CONTEXT @APP_CONTEXT@
ENV APP_JAVA_HOME /home/qingqing/webapps

RUN test -d /home/qingqing/webapps || install -o qingqing -d -m 755 /home/qingqing/webapps
RUN test -d /home/qingqing/data/conf || install -o qingqing -d -m 755 /home/qingqing/data/conf
ADD apps-start.sh /home/qingqing/
ADD *${APP_BUILD_VERSION}*.tar.gz /home/qingqing/webapps/$APP_CONTEXT

RUN chmod 755 /home/qingqing/apps-start.sh

EXPOSE 8080
WORKDIR /home/qingqing/webapps

CMD /home/qingqing/apps-start.sh

