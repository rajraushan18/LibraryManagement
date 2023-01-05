#FROM openjdk:11
#AGR JAR_FILE
#COPY target/LibraryManagement.jar LibraryManagement.jar
#ENTRYPOINT ["java","-jar","/LibraryManagement.jar"]

FROM openjdk:11
<<<<<<< HEAD
EXPOSE 8080
ADD target/librarymanagement.jar librarymanagement.jar
ENTRYPOINT ["java","-jar","librarymanagement.jar"]
=======
ARG JAR_FILE
COPY ${JAR_FILE} LibraryManagement.jar
ENTRYPOINT ["java","-jar","/LibraryManagement.jar"]
>>>>>>> 05c1b752e1de4062be65d89a41cf7a309d25976d
