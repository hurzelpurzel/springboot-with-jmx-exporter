FROM gradle:6.9-jdk8 as builder
WORKDIR /home/gradle
COPY ./ .

RUN  chmod 744 ./gradlew
RUN ./gradlew build


FROM openjdk:8-jdk-alpine as base
COPY ./jmx_prometheus_javaagent-0.11.0.jar jmx_prometheus_javaagent-0.11.0.jar
COPY ./config.yaml config.yaml
EXPOSE 8081
ENV JAVA_TOOL_OPTIONS="-javaagent:jmx_prometheus_javaagent-0.11.0.jar=8081:config.yaml"

FROM base
COPY --from=builder /home/gradle/build/libs/gs-spring-boot-0.1.0.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]
