FROM openjdk:11

WORKDIR /var/lib/jenkins/workspace/Registraion/

copy /target/account-1.0-SNAPSHOT.jar /Registration.jar

CMD ["java" , "-jar" , "/Registration.jar"]
