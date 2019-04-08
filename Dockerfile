FROM      maven:3.6.0-jdk-8-alpine as builder
RUN       apk add --update git
RUN       git clone https://github.com/trekawek/jhttp.git
WORKDIR   /jhttp
RUN       mvn clean package

FROM      openjdk:8u201-jre-alpine3.9
WORKDIR   /root/
COPY      --from=builder /jhttp/target/jhttp*.jar .
EXPOSE    8888
CMD       java -jar jhttp*.jard
