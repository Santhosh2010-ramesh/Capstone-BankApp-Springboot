#----------------------------------
# Stage 1: Build the Spring Boot app
#----------------------------------

FROM public.ecr.aws/amazoncorretto/amazoncorretto:17

LABEL maintainer="Santhosh R <santhosh1020@gmail.com>"
LABEL app="bankapp"

WORKDIR /app

# Copy source code to container
COPY . /app

# Build application, skip tests
RUN mvn clean package -DskipTests=true

#--------------------------------------
# Stage 2: Run the Spring Boot app
#--------------------------------------

FROM public.ecr.aws/amazoncorretto/amazoncorretto:17

WORKDIR /app

# Copy jar from builder stage
COPY --from=builder /app/target/*.jar app.jar

# Expose port
EXPOSE 8080

# Run the app
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
