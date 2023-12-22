FROM alpine:latest

ENV VS_SERVER_USER='vintagestory'

#days
ENV VS_BACKUPS_AGE_LIMIT=5
#format date for backups
ENV VS_BACKUPS_DATE_FORMAT="%dd-%mm-%Y_%H:%M:%S"
#crontab format value
ENV VS_BACKUP_PERIODICITY="0 0 * * *"

ENV VS_PROJECT_PATH="/var/vintage_story"
ENV VS_SERVER_PATH="${VS_PROJECT_PATH}/server"
ENV VS_DATA_PATH="${VS_PROJECT_PATH}/data"
ENV VS_SCRIPTS_PATH="/bin"

ENV VS_SCREENING_PROJECT_PATH="\/var\/vintage_story"
ENV VS_SCREENING_SERVER_PATH="${VS_SCREENING_PROJECT_PATH}\/server"
ENV VS_SCREENING_DATA_PATH="${VS_SCREENING_PROJECT_PATH}\/data"
ENV VS_SCREENING_SCRIPTS_PATH="\/bin"

USER root

COPY ./dist/scripts.tar.gz /tmp/scripts.tar.gz

WORKDIR /tmp

RUN addgroup $VS_SERVER_USER && adduser -D -G $VS_SERVER_USER $VS_SERVER_USER && mkdir -p $VS_SERVER_PATH && mkdir -p $VS_DATA_PATH && mkdir -p $VS_SCRIPTS_PATH && tar -xzf /tmp/scripts.tar.gz -C $VS_SCRIPTS_PATH && rm -rf /tmp/* && chown -R $VS_SERVER_USER:$VS_SERVER_USER $VS_PROJECT_PATH && chmod -R +x $VS_SCRIPTS_PATH/* && $VS_SCRIPTS_PATH/vs_crontab && apk update --no-cache && apk --no-cache add supercronic bash procps tar screen wget gcompat aspnetcore7-runtime

#icu-libs krb5-libs libgcc libintl libstdc++ zlib libgdiplus openssl fontconfig busybox-suid

USER $VS_SERVER_USER

WORKDIR $VS_SERVER_PATH

ENTRYPOINT vs_startup
