FROM amazon/aws-cli:2.7.2

ENV TZ Asia/Tokyo
ENV CRONTAB_FILE_PATH "/workdir/crontabs/default.crontab"

RUN yum -y install yum-utils

RUN yum install tzdata -y
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN yum install cronie-noanacron -y

RUN yum -y install jq

RUN yum localinstall -y https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
RUN yum-config-manager --disable mysql57-community
RUN yum-config-manager --enable mysql80-community
RUN rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
RUN yum install -y mysql-community-client

ADD entrypoint.alpine.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh


ENTRYPOINT /entrypoint.sh
