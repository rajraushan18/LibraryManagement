FROM openjdk:11
EXPOSE 8080
ADD target/LibraryManagement.jar LibraryManagement.jar
ENTRYPOINT ["java","-jar","/LibraryManagement.jar"]
