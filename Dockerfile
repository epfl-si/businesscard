FROM ghcr.io/epfl-si/common-libs:v0.2.0
LABEL maintainer "isas-fsd@groupes.epfl.ch"

USER root
RUN set -e -x; apt -qy update; apt -qy install apache2; apt clean
RUN a2enmod remoteip cgid
RUN a2disconf serve-cgi-bin

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP root
ENV APACHE_RUN_DIR /tmp
ENV APACHE_PID_FILE /tmp/apache.pid
ENV APACHE_LOG_DIR /tmp
ENV TEQUILA_REDIRECT_PORT 80

COPY conf/docker/ports.conf /etc/apache2/ports.conf

COPY conf/docker/25-businesscard.conf /etc/apache2/conf-enabled/

RUN set -e -x; mkdir -p /var/www/Tequila/Sessions; chmod 1777 /var/www/Tequila/Sessions
COPY conf/docker/Tequila/Config.pm /opt/dinfo/lib/perl/Tequila/

COPY cpanfile /root
RUN cpanm --installdeps --notest /root || cat /root/.cpanm/work/*/build.log

COPY htdocs/ /var/www/html/
COPY cgi-bin/ /var/www/cgi-bin/
COPY private /var/www/private
COPY ./cgi-bin/tmpl_labels.inc /opt/dinfo/lib/perl/tmpl_labels.inc

COPY conf/docker/docker-entrypoint.sh /
COPY scripts /var/www/scripts
ENTRYPOINT ["/docker-entrypoint.sh"]
