FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install -y openjdk-17-jdk -y

# Copie apenas o arquivo pom.xml primeiro para aproveitar o cache do Maven
COPY . .

# Baixe as dependências do Maven
RUN apt-get install maven -y
RUN mvn clean install

FROM openjdk:17-jdk-slim

EXPOSE 8080

WORKDIR /app

# Copie o arquivo JAR do estágio de construção
COPY --from=build /target/todolist-1.0.0.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]