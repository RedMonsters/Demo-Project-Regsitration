#Use an official Python runtime as a parent image
FROM docker pull phusion/baseimage

MAINTAINER satyasaipavan

# Set the working directory to /app
WORKDIR home/ubuntu/Docker

# Copy the current directory contents into the container at /app
ADD . home/ubuntu/Docker

# Install any needed packages specified in requirements.txt
CMD ["mvn", "param1", "param2"?]

# Install python newrelic agent on this docker image
#RUN pip install newrelic ( to avoid this layer, added newrelic inside requirement.txt)

# Make port 80 available to the world outside this container
EXPOSE 5000

# Define environment variable
ENV NAME Redmonsters

#When you launch the container, it runs the script and then exits
ENTRYPOINT ["", "run-program"]

#Default environment variables
ENV NEW_RELIC_LOG=stderr \
    NEW_RELIC_LOG_LEVEL=info \
    NEW_RELIC_ENABLED=true

# Run app.py when the container launches
CMD ["python", "app.py"]
