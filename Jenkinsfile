node {
  checkout scm
  env.PATH = "${tool 'Maven3'}/bin:${env.PATH}"
  stage('Package') {
   
      sh 'mvn clean package -DskipTests'
   
  }

  stage('Create Docker Image APP') {
  
      docker.build("rapha29c/aplicacao:${env.BUILD_NUMBER}")
    
  }
  stage('Create Docker Image DataBase') {
    dir('alpine_mariadb') {
      docker.build("rapha29c/alpine_mariadb:${env.BUILD_NUMBER}")
    }
  }

  stage ('Run Application') {
    try {
    
      sh "DB=`docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' mariadb`"
      sh "docker run -e DB_URI=$DB rapha29c/aplicacao:${env.BUILD_NUMBER}"

    } catch (error) {
    } finally {
      
    }
  }

  stage('Run Tests') {
    try {
      
        sh "mvn test"
        docker.build("rapha29c/aplicacao:${env.BUILD_NUMBER}").push()
     
    } catch (error) {
          

    } finally {
      junit '**/target/surefire-reports/*.xml'
      
    }
  }
   post {
        changed {
            script {
                if (currentBuild.currentResult == 'UNSTABLE') { 
                   
                    emailext subject: '$DEFAULT_SUBJECT',
                        body: '$DEFAULT_CONTENT',
                        recipientProviders: [
                            [$class: 'CulpritsRecipientProvider'],
                            [$class: 'DevelopersRecipientProvider'],
                            [$class: 'RequesterRecipientProvider']
                        ], 
                        replyTo: '$DEFAULT_REPLYTO',
                        to: '$DEFAULT_RECIPIENTS'
                }else{
                      if (currentBuild.currentResult == 'FAILURE') { 
                   
                    emailext subject: '$DEFAULT_SUBJECT',
                        body: '$DEFAULT_CONTENT',
                        recipientProviders: [
                            [$class: 'CulpritsRecipientProvider'],
                            [$class: 'DevelopersRecipientProvider'],
                            [$class: 'RequesterRecipientProvider']
                        ], 
                        replyTo: '$DEFAULT_REPLYTO',
                        to: '$DEFAULT_RECIPIENTS'
                }
            }
        }
    }
}
