FROM jleight/phusion-mono:3.12.0
MAINTAINER Jonathon Leight <jonathon.leight@jleight.com>

RUN set -x \
  && apt-get update \
  && apt-get install -y mediainfo sqlite3 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/*

ENV APP_HOME    /opt/sonarr
ENV APP_DATA    /var/opt/sonarr
ENV APP_URL     http://update.sonarr.tv/v2/master/mono/NzbDrone.master.tar.gz

RUN set -x \
  && groupadd -r -g 300 sonarr \
  && useradd -r -u 300 -d "${APP_DATA}" -g sonarr sonarr \
  && mkdir -p "${APP_DATA}" \
  && chown sonarr:sonarr "${APP_DATA}" \
  && mkdir -p "${APP_HOME}" \
  && curl -kL "${APP_URL}" | tar -xz -C "${APP_HOME}" --strip-components=1 \
  && chown -R sonarr:sonarr "${APP_HOME}"

ADD sonarr-service.sh /etc/service/sonarr/run

EXPOSE 8989
VOLUME ["/var/opt/sonarr"]