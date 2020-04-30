FROM openjdk:8-jdk-alpine
MAINTAINER cbw  "70129526@qq.com"
VOLUME /tmp
COPY /target/cbw-springBoot-docker.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]