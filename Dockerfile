FROM debian:buster
LABEL maintainer "olivier.delobre@epfl.ch"

################################################################################
# System packages
################################################################################
RUN chmod 1777 /tmp && apt-get update && apt-get install -y \
        apache2 \
        libaio1 \
        libapache2-mod-perl2 \
        default-libmysqlclient-dev \
        locales \
        default-mysql-client \
        unzip \
        gettext-base \
        openssl \
        cpanminus \
        make \
        libdbi-perl \
        gcc \
        vim \
        curl \
    --no-install-recommends && rm -rf /var/lib/apt/lists/*

################################################################################
# Localization
################################################################################
RUN echo "Europe/Zurich" > /etc/timezone && \
    dpkg-reconfigure --frontend=noninteractive tzdata && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    sed -i -e 's/# de_CH.UTF-8 UTF-8/de_CH.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"' > /etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8 && \
    update-locale LC_CTYPE=en_US.UTF-8 && \
    update-locale LC_NUMERIC=de_CH.UTF-8 && \
    update-locale LC_TIME=de_CH.UTF-8 && \
    update-locale LC_COLLATE=en_US.UTF-8 && \
    update-locale LC_MONETARY=de_CH.UTF-8 && \
    update-locale LC_MESSAGES=en_US.UTF-8 && \
    update-locale LC_PAPER=de_CH.UTF-8 && \
    update-locale LC_NAME=de_CH.UTF-8 && \
    update-locale LC_ADDRESS=de_CH.UTF-8 && \
    update-locale LC_TELEPHONE=de_CH.UTF-8 && \
    update-locale LC_MEASUREMENT=de_CH.UTF-8 && \
    update-locale LC_IDENTIFICATION=de_CH.UTF-8

################################################################################
# Users & groups
################################################################################
RUN groupadd apache && \
    useradd -r --uid 1001 -g apache apache

################################################################################
# Perl deps (DBD::Oracle, Tequila, ...)
################################################################################
RUN mkdir -p /opt/oracle && \
    mkdir -p /opt/dinfo/lib/perl/Accred && \
    mkdir -p /opt/dinfo/lib/perl/Cadi && \
    mkdir -p /opt/dinfo/lib/perl/Tequila && \
    mkdir -p /opt/dinfo/etc && \
    mkdir -p /home/dinfo

COPY cpanfile cpanfile
RUN cpanm --installdeps --notest . || cat /root/.cpanm/work/*/build.log

################################################################################
# Config
################################################################################
COPY ./conf/docker/tequila.conf /home/dinfo
RUN touch /etc/tequila.conf
COPY ./conf/docker/25-businesscard.epfl.ch.conf /home/dinfo

################################################################################
# Vhost
################################################################################
RUN mkdir -p /var/www/vhosts/businesscard.epfl.ch/cgi-bin && \
    mkdir -p /var/www/vhosts/businesscard.epfl.ch/conf && \
    mkdir -p /var/www/vhosts/businesscard.epfl.ch/htdocs/js && \
    mkdir -p /var/www/vhosts/businesscard.epfl.ch/htdocs/styles && \
    mkdir -p /var/www/vhosts/businesscard.epfl.ch/htdocs/images && \
    mkdir -p /var/www/vhosts/businesscard.epfl.ch/logs && \
    mkdir -p /var/www/vhosts/businesscard.epfl.ch/private/Tequila/Sessions && \
    mkdir -p /var/www/vhosts/businesscard.epfl.ch/private/lib/lib/perl5

COPY ./conf/businesscard.conf /var/www/vhosts/businesscard.epfl.ch/conf/businesscard.conf

WORKDIR /var/www/vhosts/businesscard.epfl.ch

################################################################################
# Apache
################################################################################
RUN mkdir -p /etc/apache2/conf.d && \
    mkdir /etc/apache2/ssl

COPY ./conf/docker/apache2.conf /etc/apache2/apache2.conf
COPY ./conf/docker/ports.conf /etc/apache2/ports.conf
COPY ./conf/docker/25-businesscard.epfl.ch.conf /etc/apache2/sites-available/25-businesscard.epfl.ch.conf
COPY ./conf/docker/dinfo-perl.conf ./conf/docker/perl.conf \
     /etc/apache2/conf.d/

RUN echo "umask 0002" >> /etc/apache2/envvars && \
    a2enmod ssl  && \
    a2enmod rewrite && \
    a2enmod headers && \
    a2enmod env && \
    a2enmod remoteip && \
    a2enmod cgi && \
    a2dissite 000-default.conf && \
    a2dissite default-ssl.conf && \
    a2ensite 25-businesscard.epfl.ch.conf

################################################################################
# Libraries
################################################################################
COPY ./accred-libs/Accred/. /opt/dinfo/lib/perl/Accred/
COPY ./cadi-libs/Cadi/. /opt/dinfo/lib/perl/Cadi/
COPY ./tequila-epfl/lib/Tequila/. /opt/dinfo/lib/perl/Tequila/
COPY ./tequila-perl-client/Tequila/Client.pm /opt/dinfo/lib/perl/Tequila/Client.pm
COPY ./cgi-bin/tmpl_labels.inc /opt/dinfo/lib/perl/tmpl_labels.inc

################################################################################
# App
################################################################################
COPY ./cgi-bin/. /var/www/vhosts/businesscard.epfl.ch/cgi-bin/
COPY ./htdocs/. /var/www/vhosts/businesscard.epfl.ch/htdocs/
COPY ./private/. /var/www/vhosts/businesscard.epfl.ch/private/

################################################################################
# Entrypoint
################################################################################
COPY ./conf/docker/docker-entrypoint.sh /home/dinfo/
RUN chmod a+x /home/dinfo/docker-entrypoint.sh

################################################################################
# Ownership so that these folders can be written when running in K8S
################################################################################
RUN chgrp -R 0 /opt/dinfo/etc && chmod -R g=u /opt/dinfo/etc && \
    chgrp -R 0 /etc/tequila.conf && chmod -R g=u /etc/tequila.conf && \
    chgrp -R 0 /etc/apache2/sites-available && chmod -R g=u /etc/apache2/sites-available && \
    chgrp -R 0 /var/www/vhosts/businesscard.epfl.ch && chmod -R g=u /var/www/vhosts/businesscard.epfl.ch && \
    chgrp -R 0 /home/dinfo && chmod -R g=u /home/dinfo && \
    chgrp -R 0 /var/log/apache2 && chmod -R g=u /var/log/apache2

ENV TERM=xterm
ENV TZ=Europe/Zurich
ENV PERL5LIB=/opt/dinfo/lib/perl

# Use Apache2 graceful stop to terminate
STOPSIGNAL SIGWINCH
USER 1001
EXPOSE 8080
ENTRYPOINT ["/home/dinfo/docker-entrypoint.sh"]