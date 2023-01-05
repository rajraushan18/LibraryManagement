FROM openjdk:11
AGR JAR_FILE
COPY target/LibraryManagement.jar LibraryManagement.jar
ENTRYPOINT ["java","-jar","/LibraryManagement.jar"]
