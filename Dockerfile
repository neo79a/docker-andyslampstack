FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-add-repository -y ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y imagemagick zip fail2ban curl vim mysql-client supervisor

RUN apt-get install -y php7.4 php7.4-gd php7.4-imagick php7.4-mysql php7.4-zip php7.4-mbstring php7.4-xml php7.4-dom php-bcmath composer php-curl default-jre ghostscript
RUN apt-get install -y zip apache2 apache2-doc apache2-utils ssl-cert libapache2-mod-php mysql-client
RUN a2enmod headers ssl macro rewrite proxy_wstunnel

EXPOSE 80
RUN rm -f /usr/local/apache2/logs/httpd.pid
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
