FROM openjdk:11

WORKDIR /opt/Docker

copy /var/lib/jenkins/workspace/Registration/target/account-1.0-SNAPSHOT.jar /Registration.jar

CMD ["java" , "-jar" , "/Registration.jar"]
