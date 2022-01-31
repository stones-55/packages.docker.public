FROM nginx:1.21.3

ENV TZ Asia/Tokyo
RUN echo "${TZ}" > /etc/timezone \
  && dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update && apt-get -y install logrotate
