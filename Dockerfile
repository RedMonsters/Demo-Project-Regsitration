FROM  Ubuntu:14.04

MAINTAINER  satyasaipavan

RUN sudo apt-get update

RUN sudo apt-get install default-jdk -y

RUN sudo chmod 777 /etc/environment

RUN vim /etc/environment > JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

CMD /bin/bash

CMD wget {https://satyasaipavan.jfrog.io/satyasaipavan/webapp/#/artifacts/browse/tree/General/libs-snapshot-local/com/hellokoding/account/1.0-SNAPSHOT/account-1.0-20191003.121659-1.jar}

EXPOSE 8000

