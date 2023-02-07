FROM tomcat:latest

LABEL maintainer="Tien"

ADD ./target/LoginWebApp-1.war /usr/local/tomcat/webapps/

RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz

EXPOSE 8888

CMD ["catalina.sh", "run"]
