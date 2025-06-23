# Java 17 + Maven 3.9.x
FROM public.ecr.aws/docker/library/maven:3.9.6-amazoncorretto-17

LABEL maintainer="Santhosh <santhoshramesh2010@gmail.com>"
LABEL app="bankapp"

WORKDIR /app

COPY . /app

RUN ./mvnw clean install -DskipTests

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "target/bankapp-0.0.1-SNAPSHOT.jar"]
