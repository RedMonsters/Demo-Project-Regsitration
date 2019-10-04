# Use an official Python runtime as a parent image
FROM wget https://satyasaipavan.jfrog.io/satyasaipavan/webapp/#/artifacts/browse/tree/General/libs-snapshot-local/com/hellokoding/account/1.0-SNAPSHOT/account-1.0-20191003.122515-2.jar

MAINTAINER satyasaipavan

# Install python newrelic agent on this docker image
#RUN pip install newrelic ( to avoid this layer, added newrelic inside requirement.txt)

# Make port 80 available to the world outside this container
EXPOSE 8000

# Define environment variable
ENV NAME RedMonsters

#When you launch the container, it runs the script and then exits
ENTRYPOINT ["newrelic-admin", "run-program"]

# Run app.py when the container launches
CMD ["java -jar", "wget https://satyasaipavan.jfrog.io/satyasaipavan/webapp/#/artifacts/browse/tree/General/libs-snapshot-local/com/hellokoding/account/1.0-SNAPSHOT/account-1.0-20191003.122515-2.jar"]
