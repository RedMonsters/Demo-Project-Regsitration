FROM openjdk:11

WORKDIR /var/lib/jenkins/workspace/Registraion/target

CMD ["java" , "-jar" , "account-1.0-SNAPSHOT.jar"]
