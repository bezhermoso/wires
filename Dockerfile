FROM nginx:stable

RUN apt-get update -y && \
  apt-get install -y git \
  curl

VOLUME /opt/wireframes

COPY default.conf /etc/nginx/conf.d/default.conf

COPY bin/add-site /usr/local/bin/add-site
COPY bin/start.sh /usr/local/bin/start.sh

CMD ["start.sh"]
