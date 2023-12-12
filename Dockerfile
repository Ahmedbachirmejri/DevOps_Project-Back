# Use an official OpenJDK runtime as a parent image
FROM openjdk:11


# Expose the port that the application will run on
EXPOSE 8084

# Copy the JAR file into the container at /app
COPY target/DevOps_Project-1.0.0-SNAPSHOT.jar DevOps_Project-1.0.0-SNAPSHOT.jar

# Specify the command to run the application
ENTRYPOINT ["java","-jar","DevOps_Project-1.0.0-SNAPSHOT.jar"]
