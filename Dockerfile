# Build stage
FROM maven:3.9.9-eclipse-temurin-23 AS build

# Set working directory
WORKDIR /app

# Copy pom.xml and install dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy source code and build the application
COPY src ./src
RUN mvn clean package -DskipTests

# Runtime stage
FROM eclipse-temurin:23-jdk

# Set working directory
WORKDIR /app

# Copy jar from build stage
COPY --from=build /app/target/quiz-0.0.1-SNAPSHOT.war .

# Expose application port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "quiz-0.0.1-SNAPSHOT.war"]