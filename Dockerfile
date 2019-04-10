FROM      maven:3.6.0-jdk-8-alpine as builder
RUN       apk add --update git
RUN       git clone https://github.com/Rodce/java-WebServer.git
WORKDIR   /java-WebServer
RUN       mvn clean package

FROM      openjdk:8u201-jre-alpine3.9
WORKDIR   /java-WebServer
COPY      --from=builder /java-WebServer/target/java-WebServer-*-with-dependencies.jar .
EXPOSE    8080
CMD       java -jar java-WebServer-*-with-dependencies.jar
