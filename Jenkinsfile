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
          final def RECIPIENTS = emailextrecipients([
                [$class: 'DevelopersRecipientProvider'],
                [$class: 'CulpritsRecipientProvider']
            ])
            final def SUBJECT = "${env.JOB_NAME} ${env.BRANCH_NAME} - Build #${env.BUILD_NUMBER} - FAILED!"
            final def CONTENT = "Check console output at ${env.BUILD_URL} to view the results."
            if (RECIPIENTS != null && !RECIPIENTS.isEmpty()) {
                mail to: RECIPIENTS, replyTo: "raphapaes_al@hotmail.com", subject: SUBJECT, body: CONTENT
            } else {

                mail to: "jenkins-admins", replyTo: "raphapaes_al@hotmail.com", subject: SUBJECT, body: CONTENT
            }


            /* Must re-throw exception to propagate error */
            throw error

    } finally {
      junit '**/target/surefire-reports/*.xml'
      
    }
  }
}
