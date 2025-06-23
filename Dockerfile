# Use a full JDK image with Maven + Java 17
FROM public.ecr.aws/amazoncorretto/amazoncorretto:17


# Maintainer
LABEL maintainer="Santhosh <santhoshramesh2010@gmail.com>"
LABEL app="bankapp"

# Set working directory
WORKDIR /app

# Copy source code into container
COPY . /app

# Fix mvnw permission
RUN chmod +x mvnw

# Build the app (skip tests)
RUN ./mvnw clean install -DskipTests

# Expose port 8080
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "target/bankapp-0.0.1-SNAPSHOT.jar"]
