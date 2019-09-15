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
 stage('SonarScan') {
      //withSonarQubeEnv('SonarQube') {
         withMaven(jdk: 'Java', maven: 'Maven') {
             //sh 'mvn clean package sonar:sonar' 
             sh 'mvn clean verify sonar:sonar ' +
             ' -Dsonar.host.url=https://sonarcloud.io ' +
             ' -Dsonar.organization=RedMonsters '+ 
             ' -Dsonar.login=22093b89240fb40d4e91ed86b830455791415750 ' +
             ' -Dsonar.links.ci='
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
