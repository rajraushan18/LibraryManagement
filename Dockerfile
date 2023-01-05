#FROM openjdk:11
#AGR JAR_FILE
#COPY target/LibraryManagement.jar LibraryManagement.jar
#ENTRYPOINT ["java","-jar","/LibraryManagement.jar"]

FROM openjdk:11
EXPOSE 8080
ADD target/librarymanagement.jar librarymanagement.jar
ENTRYPOINT ["java","-jar","librarymanagement.jar"]
