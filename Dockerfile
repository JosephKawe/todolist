FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install openjdk-17-jdk -y

# Defina o diretório de trabalho
WORKDIR /app

# Copie apenas o arquivo pom.xml para aproveitar o cache do Maven
COPY pom.xml .

# Baixe as dependências do Maven
RUN mvn dependency:go-offline

# Copie o restante do código-fonte
COPY . .

# Compile o projeto
RUN mvn clean install

FROM openjdk:17-jdk-slim

# Corrija o comando para minúsculas
EXPOSE 8080

# Defina o diretório de trabalho novamente
WORKDIR /app

# Copie o arquivo JAR do estágio de construção
COPY --from=build /app/target/todolist-1.0.0.jar app.jar

ENTRYPOINT [ "java", "-jar", "app.jar" ]