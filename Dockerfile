FROM ghcr.io/epfl-si/common-libs:v0.2.0
LABEL maintainer "isas-fsd@groupes.epfl.ch"

USER root
RUN set -e -x; apt -qy update; apt -qy install apache2; apt clean
RUN a2enmod remoteip

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP root
ENV APACHE_RUN_DIR /tmp
ENV APACHE_PID_FILE /tmp/apache.pid
ENV APACHE_LOG_DIR /tmp

COPY conf/docker/ports.conf /etc/apache2/ports.conf

COPY conf/docker/25-businesscard.conf /etc/apache2/conf-enabled/

COPY conf/docker/docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
