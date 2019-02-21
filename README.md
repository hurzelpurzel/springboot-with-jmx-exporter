# springboot-with-jmx-exporter
SpringBoot + Prometheus JMX Exporter

## How to Build

```
./gradlew build
```

## How to Run

```
java -javaagent:jmx_prometheus_javaagent-0.11.0.jar=8081:config.yaml -jar build/libs/gs-spring-boot-0.1.0.jar
```

## Reference

https://spring.io/guides/gs/spring-boot/  
https://github.com/prometheus/jmx_exporter
