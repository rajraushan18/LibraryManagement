FROM openjdk:11
EXPOSE 8080
COPY target/LibraryManagement.jar LibraryManagement.jar
ENTRYPOINT ["java","-jar","/LibraryManagement.jar"]
