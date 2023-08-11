FROM ghcr.io/epfl-si/common-web:1.17.2
LABEL maintainer "isas-fsd@groupes.epfl.ch"

USER 0
################################################################################
# System packages
################################################################################
RUN apt-get update && apt-get install -y \
        ca-certificates \
        cpanminus \
        gcc \
        libdbi-perl \
        libnet-ssleay-perl \
        libemail-sender-perl \
        libtext-unidecode-perl \
        libwww-perl \
        make \
        msmtp \
        openssl \
        unzip \
    --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN update-ca-certificates

COPY cpanfile cpanfile
RUN cpanm --installdeps --notest . || ( cat /root/.cpanm/work/*/build.log; exit 1 )

# Businesscards Apache config
COPY ./conf/docker/25-businesscard.conf /etc/apache2/sites-available/


RUN set -e -x; \
    a2enmod cgi ; \
    a2dissite 000-default.conf ; \
    a2dissite default-ssl.conf ; \
    a2ensite 25-businesscard.conf
 
RUN set -e -x; mkdir -p /var/www/Tequila/Sessions; chmod 1777 /var/www/Tequila/Sessions
COPY conf/docker/Tequila/Config.pm /opt/dinfo/lib/perl/Tequila/

COPY htdocs/ /var/www/vhosts/app/htdocs/
COPY cgi-bin/ /var/www/vhosts/app/cgi-bin/
COPY private /var/www/vhosts/app/private/
COPY ./cgi-bin/tmpl_labels.inc /opt/dinfo/lib/perl/tmpl_labels.inc

# The MSMTP EPFL configuration
COPY ./conf/docker/msmtprc.conf /etc/msmtprc
RUN ln -s /usr/bin/msmtp /usr/sbin/sendmail

COPY conf/docker/docker-entrypoint.sh /
COPY scripts /var/www/scripts

USER 1001

ENV TERM=xterm
ENV TZ=Europe/Zurich
ENV PERL5LIB=/opt/dinfo/lib/perl

# Use Apache2 graceful stop to terminate
STOPSIGNAL SIGWINCH
EXPOSE 8080
ENTRYPOINT ["/docker-entrypoint.sh"]
