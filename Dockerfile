FROM alpine:latest

ENV SERVER_USER='vintagestory'

ENV PROJECT_PATH="/var/vintage_story"
ENV SERVER_PATH="${PROJECT_PATH}/server"
ENV DATA_PATH="${PROJECT_PATH}/data"
ENV SCRIPTS_PATH="/bin"

ENV SCREENING_PROJECT_PATH="\/var\/vintage_story"
ENV SCREENING_SERVER_PATH="${SCREENING_PROJECT_PATH}\/server"
ENV SCREENING_DATA_PATH="${SCREENING_PROJECT_PATH}\/data"
ENV SCREENING_SCRIPTS_PATH="\/bin"

USER root

COPY ./dist/scripts.tar.gz /tmp/scripts.tar.gz

WORKDIR /tmp

RUN addgroup $SERVER_USER && adduser -D -G $SERVER_USER $SERVER_USER && mkdir -p $SERVER_PATH && mkdir -p $DATA_PATH && mkdir -p $SCRIPTS_PATH && tar -xzf /tmp/scripts.tar.gz -C $SCRIPTS_PATH && rm -rf /tmp/* && chown -R $SERVER_USER:$SERVER_USER $PROJECT_PATH && chmod -R +x $SCRIPTS_PATH/* && $SCRIPTS_PATH/vs_crontab && apk update --no-cache && apk --no-cache add supercronic bash procps tar screen wget gcompat aspnetcore7-runtime

#icu-libs krb5-libs libgcc libintl libstdc++ zlib libgdiplus openssl fontconfig busybox-suid

USER $SERVER_USER

WORKDIR $SERVER_PATH

ENTRYPOINT vs_startup
