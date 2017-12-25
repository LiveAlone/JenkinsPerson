FROM docker.idc.cedu.cn/qingqing/nginx:10.2-2

ENV POOL_CODE @POOL_CODE@
ENV APP_VERSION @APP_VERSION@
ENV APP_BUILD_VERSION @APP_BUILD_VERSION@
ENV APP_CONTEXT @APP_CONTEXT@

RUN mkdir -p /home/qingqing/source
RUN mkdir -p /home/qingqing/webapps/static/

ADD nginx-static.conf /usr/local/nginx/conf/vhost/
ADD nginx-start.sh /home/qingqing/
ADD *${APP_BUILD_VERSION}*.zip /home/qingqing/source/${APP_BUILD_VERSION}.zip
ADD manifest*.json /home/qingqing/source/

RUN chmod 755 /home/qingqing/nginx-start.sh

EXPOSE 80

WORKDIR /home/qingqing

CMD /home/qingqing/nginx-start.sh