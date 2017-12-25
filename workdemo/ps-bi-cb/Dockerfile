#  Dockerfile for a Java webapp running 
FROM docker.idc.cedu.cn/system/tomcat:7.0.76-2

ENV POOL_CODE @POOL_CODE@
ENV APP_VERSION @APP_VERSION@
ENV APP_BUILD_VERSION @APP_BUILD_VERSION@
ENV APP_CONTEXT @APP_CONTEXT@
ENV APP_JAVA_HOME /home/qingqing/webapps

# add fonts
ADD http://conf.idc.cedu.cn/font/simsunb.ttf /usr/share/fonts/
ADD http://conf.idc.cedu.cn/font/simhei.ttf /usr/share/fonts/

RUN test -d /home/qingqing/webapps || install -m 777 /home/qingqing/webapps
ADD *${APP_BUILD_VERSION}*.war /home/qingqing/webapps/${APP_CONTEXT}.war

EXPOSE 8080