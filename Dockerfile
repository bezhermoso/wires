FROM node:6.2

RUN apt-get update -y && \
  apt-get install -y \
  git \
  nginx \
  curl \
  inotify-tools


VOLUME /opt/wireframes

COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY nginx/bin/add-site /usr/local/bin/add-site
COPY nginx/bin/start.sh /usr/local/bin/start.sh
RUN npm install -g pm2 nodemon

WORKDIR /opt/app

COPY . /opt/app
RUN chmod +x /opt/app/start.sh
RUN npm install

EXPOSE 80 3300
CMD ["./start.sh"]
