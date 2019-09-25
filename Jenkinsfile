node {
   
   def server = Artifactory.server('https://ajitkatta.jfrog.io/ajitkatta/webapp/')
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
 stage ('Artifactory') {
        // Obtain an Artifactory server instance, defined in Jenkins --> Manage..:
         
        rtMaven.tool = 'Maven-3.6.0' // Tool name from Jenkins configuration
        rtMaven.deployer releaseRepo: 'libs-release-local', snapshotRepo: 'libs-snapshot-local', server: server
        rtMaven.resolver releaseRepo: 'libs-release', snapshotRepo: 'libs-snapshot', server: server
        rtMaven.deployer.deployArtifacts = false // Disable artifacts deployment during Maven run
     }
    stage ('Install', 'Deploy','Publish build info') {
        rtMaven.run pom: 'pom.xml', goals: 'install', buildInfo: buildInfo
        rtMaven.deployer.deployArtifacts buildInfo
        server.publishBuildInfo buildInfo
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
