FROM ubuntu:26.04

ENV VS_SERVER_USER='vintagestory'

#days
ENV VS_BACKUPS_AGE_LIMIT=5
#format date for backups
ENV VS_BACKUPS_DATE_FORMAT="(d-m-y)_%d-%m-%Y_%H:%M:%S"
#crontab format value
ENV VS_BACKUP_PERIODICITY="0 0 * * *"

ENV VS_PROJECT_PATH="/var/vintage_story"
ENV VS_SERVER_PATH="${VS_PROJECT_PATH}/server"
ENV VS_DATA_PATH="${VS_PROJECT_PATH}/data"
ENV VS_SCRIPTS_PATH="/usr/local/bin"
ENV VS_CRONTAB_PATH="/home/${VS_SERVER_USER}/crontab"

ENV VS_SCREENING_PROJECT_PATH="\/var\/vintage_story"
ENV VS_SCREENING_SERVER_PATH="${VS_SCREENING_PROJECT_PATH}\/server"
ENV VS_SCREENING_DATA_PATH="${VS_SCREENING_PROJECT_PATH}\/data"
ENV VS_SCREENING_SCRIPTS_PATH="\/usr\/local\/bin"

ENV SUPERCRONIC_URL="https://github.com/aptible/supercronic/releases/download/v0.2.49/supercronic-linux-amd64"
ENV SUPERCRONIC_FILE="supercronic-linux-amd64"
ENV SUPERCRONIC_SHA1SUM="e63c11a9726b775a6a11801e81af4f3fb926aa68"

USER root

COPY ./dist/scripts.tar.gz /tmp/scripts.tar.gz

WORKDIR /tmp

RUN useradd -m $VS_SERVER_USER && mkdir -p $VS_SERVER_PATH && mkdir -p $VS_DATA_PATH && mkdir -p $VS_SCRIPTS_PATH \
    && tar -xzf /tmp/scripts.tar.gz -C $VS_SCRIPTS_PATH && chown -R $VS_SERVER_USER:$VS_SERVER_USER $VS_PROJECT_PATH && chmod -R +x $VS_SCRIPTS_PATH/* \
    && apt-get update && apt-get -y install screen wget libssl-dev dotnet-runtime-10.0 \
    && wget "${SUPERCRONIC_URL}" && echo "${SUPERCRONIC_SHA1SUM} ${SUPERCRONIC_FILE}" | sha1sum -c - && chmod +x "${SUPERCRONIC_FILE}" && mv "${SUPERCRONIC_FILE}" "${VS_SCRIPTS_PATH}/${SUPERCRONIC_FILE}" && ln -s "${VS_SCRIPTS_PATH}/${SUPERCRONIC_FILE}" $VS_SCRIPTS_PATH/supercronic \
    && ln -s $VS_SERVER_PATH/server.sh $VS_SCRIPTS_PATH/vs_server && bash vs_crontab && apt clean && rm -rf /tmp/*

USER $VS_SERVER_USER

WORKDIR $VS_SERVER_PATH

ENTRYPOINT ["bash", "vs_startup"]
