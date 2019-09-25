node {
   
   def server = Artifactory.server('satyasai.jfrog.io')
   def buildInfo = Artifactory.newBuildInfo()
   def rtMaven = Artifactory.newMavenBuild()
   
   stage('Code checkout') {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'gitcred', url: 'https://github.com/RedMonsters/registration-login-spring-xml-maven-jsp-mysql.git']]])          
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
   
   stage ('Unit Test') {
        rtMaven.tool = 'Maven-3.6.0' // Tool name from Jenkins configuration
        rtMaven.run pom: 'pom.xml', goals: 'clean compile test'
    }
 stage('SonarScan') {
     withSonarQubeEnv(credentialsId: 'SatyaSaiPavanKumar'){
         withMaven(jdk: 'Java', maven: 'Maven') {
          //  sh 'mvn clean package sonar:sonar' 
             sh 'mvn clean verify sonar:sonar ' +
             ' -Dsonar.host.url=https://sonarcloud.io ' +
             ' -Dsonar.organization=redmonsters '  + 
             ' -Dsonar.login=8120bdc0fdf10655bbb351212a73ede8761bf477 ' +
             ' -Dsonar.projectKey=redmonsters ' +
             ' -Dsonar.links.ci='
            }
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
