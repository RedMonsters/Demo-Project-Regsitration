node {
   
   def server = Artifactory.server('ajitkatta.jfrog.io')
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
        rtMaven.tool = 'Maven' // Tool name from Jenkins configuration
        rtMaven.run pom: 'pom.xml', goals: 'clean compile test'
    }
 stage('SonarScan') {
     withSonarQubeEnv(credentialsId: 'SatyaSaiPavanKumar'){
         withMaven(jdk: 'Java', maven: 'Maven') {
          //  sh 'mvn clean package sonar:sonar' 
             sh 'mvn clean verify sonar:sonar ' +
             ' -Dsonar.host.url=https://sonarcloud.io ' +
             ' -Dsonar.organization=redmonsters '  + 
             ' -Dsonar.login=c12567b670f2e3d95752ed609ad85a0455aa927e ' +
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
         
        rtMaven.tool = 'Maven' // Tool name from Jenkins configuration
        rtMaven.deployer releaseRepo: 'ajitkatta-artifactory-primary-0-releases-local', snapshotRepo: 'ajitkatta-artifactory-primary-0-snapshots-local', server: server
        rtMaven.resolver releaseRepo: 'ajitkatta-artifactory-primary-0-releases', snapshotRepo: 'ajitkatta-artifactory-primary-0-snapshots', server: server
        rtMaven.deployer.deployArtifacts = true // Disable artifacts deployment during Maven run
     }
   
    //stage ('Install') {
    //    rtMaven.run pom: 'pom.xml', goals: 'install', buildInfo: buildInfo
    // }
 
    stage ('Deploy') {
        rtMaven.deployer.deployArtifacts buildInfo
    }
        
    stage ('Publish build info') {
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
