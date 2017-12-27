# Use an official Python runtime as a parent image
FROM cemmersb/centos-jdk8

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Make port 80 available to the world outside this container
EXPOSE 8080

# Run app.py when the container launches
CMD java -jar boot-demo-1.0-SNAPSHOT.jar