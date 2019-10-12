node {
   def server = Artifactory.server('satyasaipavan.jfrog.io')
   def buildInfo = Artifactory.newBuildInfo()
   def rtMaven = Artifactory.newMavenBuild()
   def app
  
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
//stage('SonarScan') {
   //  withSonarQubeEnv(credentialsId: 'SatyaSaiPavanKumar'){
       //  withMaven(jdk: 'Java', maven: 'Maven') {
           //  sh 'mvn clean package sonar:sonar' 
           //  sh 'mvn clean verify sonar:sonar ' +
           //  ' -Dsonar.host.url=https://sonarcloud.io ' +
            // ' -Dsonar.organization=redmonsters '  + 
           //  ' -Dsonar.login=c12567b670f2e3d95752ed609ad85a0455aa927e ' +
           //  ' -Dsonar.projectKey=redmonsters ' +
           //  ' -Dsonar.links.ci='
        //    }
       // }
  // }

  stage('Package') {
    withMaven(jdk: 'Java', maven: 'Maven') {
      sh 'mvn package'
     } 
  }
 stage ('Artifactory') {
        // Obtain an Artifactory server instance, defined in Jenkins --> Manage..:
         
        rtMaven.tool = 'Maven' // Tool name from Jenkins configuration
        rtMaven.deployer server: server, releaseRepo: 'libs-release-local', snapshotRepo: 'libs-snapshot-local'
        rtMaven.resolver server: server, releaseRepo: 'libs-release', snapshotRepo: 'libs-snapshot'
        rtMaven.deployer.deployArtifacts = false // Disable artifacts deployment during Maven run
       
     }
   
   stage ('install') {
             rtMaven.run pom: 'pom.xml', goals: 'install -Dmaven.repo.local=.m2', buildInfo: buildInfo
    }      
   
    stage ('Deploy') {
        rtMaven.deployer.deployArtifacts buildInfo
    }
        
    stage ('Publish build info') {
        server.publishBuildInfo buildInfo
    }
    
  stage('Docker Build') {
    app = docker.build("satyasaipavan/accountregistration")     
}
  
 stage('push DockerImage to Hub') {
    withDockerRegistry(credentialsId: 'DOCKERHUB', url: 'https://index.docker.io/v1/') {
          sh 'docker tag satyasaipavan/accountregistration satyasaipavan/accountregistration:latest'
          sh 'docker push satyasaipavan/accountregistration:latest'
      }
   }
  stage("App deployment started"){
     sh 'oc login --token=FCBPjWD82qKLUHjMZj6YgpQcfcFQ5T7xLmoL6SfseT0 --server=https://api.us-west-1.starter.openshift-online.com:6443'
     sh 'oc project Redmonsters'
     sh 'oc new-app --name demoregistration satyasaipavan/accountregistration' 
     sh 'oc expose svc demoregistration' 
    }
 }
