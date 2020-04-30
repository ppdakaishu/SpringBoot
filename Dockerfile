FROM maven:3.6.3-jdk-8 AS build
ADD ./opt/app
WORKDIR /opt/app
RUN mvn -B -DskipTests clean package

FROM openjdk:8-jdk-alpine
# MAINTAINER cbw  "70129526@qq.com"
LABEL Author="cbw"
VOLUME /tmp
COPY --from=build /opt/app/target/cbw-springBoot-docker.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]