# Use a full JDK image with Maven + Java 17
FROM eclipse-temurin:17-jdk-alpine

# Maintainer
LABEL maintainer="Santhosh <santhoshramesh2010@gmail.com>"
LABEL app="bankapp"

# Set working directory
WORKDIR /app

# Copy source code into container
COPY . /app

# Build the app (skip tests)
RUN ./mvnw clean install -DskipTests

# Expose port 8080
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "target/bankapp-0.0.1-SNAPSHOT.jar"]
