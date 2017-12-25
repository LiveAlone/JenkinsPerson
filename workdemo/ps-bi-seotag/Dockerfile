FROM docker.idc.cedu.cn/qingqing/python:2.7

ENV POOL_CODE @POOL_CODE@
ENV APP_VERSION @APP_VERSION@
ENV APP_BUILD_VERSION @APP_BUILD_VERSION@
ENV APP_CONTEXT @APP_CONTEXT@

RUN mkdir -p /home/qingqing/webapps/ /home/qingqing/source/

ADD *${APP_BUILD_VERSION}*.zip /home/qingqing/source/${APP_BUILD_VERSION}.zip
RUN  cd /home/qingqing/source/ && unzip -qo *.zip -d /home/qingqing/webapps/ && cp /home/qingqing/webapps/conf/* /home/qingqing/data/conf/ && rm *.zip -f

EXPOSE 8080

WORKDIR /home/qingqing/webapps

CMD ["/usr/bin/python","./app.py"]