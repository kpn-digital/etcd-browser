FROM ubuntu:14.04

RUN apt-get update
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y nodejs

RUN mkdir /app
ADD . /app/

RUN groupadd -g 1024 ebrowser && \
  useradd -u 1024 -g ebrowser ebrowser && \
  chown -R ebrowser:ebrowser /app

WORKDIR /app
EXPOSE 8080

USER 1024

CMD ["nodejs", "server.js"]
