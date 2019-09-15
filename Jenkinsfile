node {
   stage('Code checkout') {
      echo 'Checout Code and clone it inside jenkins workspace.'
        git 'https://github.com/RedMonsters/registration-login-spring-xml-maven-jsp-mysql.git'          
     }
 stage('Build') {
     withMaven(jdk: 'Java', maven: 'Maven')  {
      sh 'mvn clean compile'
     } 
 }
 stage('Test') {
     withMaven(jdk: 'Java', maven: 'Maven') {
      sh 'mvn test'
     }  
 } 
 stage('Sonar CodeAnalysis') {
     withSonarQubeEnv(credentialsId: 'sonarsecret') { 
      sh 'mvn clean verify sonar:sonar'
        }
 }
  stage('Package') {
    withMaven(jdk: 'Java', maven: 'Maven') {
      sh 'mvn package'
     } 
  }
 stage('Artifactory') {
     
   }
   
   stage('Docker Build') {
     
   }
   
   stage('Deploy to Dev') {
     
   }
   stage('Deploy to Stage') {
     
   }
   stage('Deploy to Prod') {
     
   }
}
