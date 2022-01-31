FROM alpine:3.15.0

ENV AWSCLI_VERSION=2.2.41
ENV GLIBC_VER=2.31-r0

RUN apk add --no-cache --virtual .dependencies \
    curl
RUN apk add --no-cache \
    tzdata \
    bash \
    mysql-client

RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# ----------------------------------------------------------------------------------------------------------------------
#  [ add : glibc for aws cli ]
# ----------------------------------------------------------------------------------------------------------------------
RUN curl -sL https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub -o /etc/apk/keys/sgerrand.rsa.pub
RUN curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-${GLIBC_VER}.apk
RUN curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-bin-${GLIBC_VER}.apk
#RUN curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-i18n-${GLIBC_VER}.apk
RUN apk add --no-cache --virtual .glibc \
        glibc-${GLIBC_VER}.apk \
        glibc-bin-${GLIBC_VER}.apk

# ----------------------------------------------------------------------------------------------------------------------
#  [ install : aws cli ]
# ----------------------------------------------------------------------------------------------------------------------
RUN curl -sL https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWSCLI_VERSION}.zip -o awscliv2.zip
RUN unzip awscliv2.zip
RUN aws/install

# ----------------------------------------------------------------------------------------------------------------------
#  [ clean ]
# ----------------------------------------------------------------------------------------------------------------------
RUN rm -rf \
      awscliv2.zip \
      aws \
      /usr/local/aws-cli/v2/*/dist/aws_completer \
      /usr/local/aws-cli/v2/*/dist/awscli/data/ac.index \
      /usr/local/aws-cli/v2/*/dist/awscli/examples \
      glibc-*.apk
RUN apk del --purge .dependencies
RUN apk del --purge tzdata
#    rm -rf /var/cache/apk/*

# ----------------------------------------------------------------------------------------------------------------------
#  [ confirm ]
# ----------------------------------------------------------------------------------------------------------------------
RUN aws --version


# ----------------------------------------------------------------------------------------------------------------------
#  [ main ]
# ----------------------------------------------------------------------------------------------------------------------
ENV CRONTAB_FILE_PATH "/workdir/crontabs/default.crontab"

ADD entrypoint.alpine.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh
