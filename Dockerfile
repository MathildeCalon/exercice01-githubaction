FROM maven AS builder

WORKDIR /app

COPY pom.xml .

RUN mvn dependency:go-offline

COPY src ./src

RUN mvn package

FROM openjdk

WORKDIR /app

COPY --from=builder /app/target/exercice3_etudiant-0.0.1-SNAPSHOT.jar .

EXPOSE 80

ENTRYPOINT ["java", "-jar", "exercice3_etudiant-0.0.1-SNAPSHOT.jar"]