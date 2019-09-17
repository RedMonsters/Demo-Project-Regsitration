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
     //withSonarQubeEnv(credentialsId: 'SatyaSaiPavanKumar'){
         withMaven(jdk: 'Java', maven: 'Maven') {
          //  sh 'mvn clean package sonar:sonar' 
             sh 'mvn clean verify sonar:sonar ' +
             ' -Dsonar.host.url=https://sonarcloud.io ' +
             ' -Dsonar.organization=redmonsters-github '+ 
             ' -Dsonar.login=8120bdc0fdf10655bbb351212a73ede8761bf477 '
             ' -Dsonar.links.ci='
            // }
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
