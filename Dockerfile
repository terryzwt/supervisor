FROM zterry95/docker-php7:7.1-base
RUN pecl install redis -y && docker-php-ext-enable redis
RUN pecl install pcntl -y && docker-php-ext-enable pcntl
RUN apt-get -y update && apt-get -y install python-pip && pip install supervisor
#ADD supervisord.conf /etc/supervisor/
#ADD startup.sh /root
EXPOSE 9001
VOLUME /app/web
WORKDIR /app/web
ENV LARAVEL_WORKER_NUM 4
#CMD ["/bin/bash",  "-c", "/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf"]
CMD ["/usr/local/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
