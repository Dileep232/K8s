# Stage 1 - Build & Test
FROM maven:3.9.9-eclipse-temurin-17 AS builder

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean test package

# Stage 2 - Final Image
FROM tomcat:10.1-jdk17-temurin

COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war
