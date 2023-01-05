FROM openjdk:11
ARG JAR_FILE
COPY ${JAR_FILE} LibraryManagement.jar
ENTRYPOINT ["java","-jar","/LibraryManagement.jar"]
