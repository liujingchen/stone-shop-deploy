FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y curl

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
RUN echo "deb [ arch=amd64,arm64  ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get update
RUN apt-get install -y build-essential nodejs mongodb-org unzip python

VOLUME /data/db
ADD https://github.com/liujingchen/stone-shop/archive/master.zip /tmp/stone-shop.zip
RUN unzip /tmp/stone-shop.zip -d /var/local/
RUN mv /var/local/stone-shop-master /var/local/stone-shop
COPY users.json /var/local/stone-shop/users.json

COPY start.sh /var/local/stone-shop/start.sh

WORKDIR /var/local/stone-shop
RUN npm install
EXPOSE 8080

CMD ./start.sh
