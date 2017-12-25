FROM docker.idc.cedu.cn/qingqing/node:8.1.4

ENV POOL_CODE @POOL_CODE@
ENV APP_VERSION @APP_VERSION@
ENV APP_BUILD_VERSION @APP_BUILD_VERSION@
ENV APP_CONTEXT @APP_CONTEXT@

RUN mkdir -p /home/qingqing/data/conf
RUN mkdir -p /home/qingqing/webapps/
RUN mkdir -p /home/qingqing/source/

ADD *${APP_BUILD_VERSION}*.zip /home/qingqing/source/${APP_BUILD_VERSION}.zip
RUN  cd /home/qingqing/source/ && unzip -qo *.zip -d /home/qingqing/webapps/ && rm *.zip -f

EXPOSE 8080

WORKDIR /home/qingqing/webapps/

CMD ["node","./bin/run"]