node {
  checkout scm
  env.PATH = "${tool 'Maven3'}/bin:${env.PATH}"
  stage('Package') {
    dir('webapp') {
      sh 'mvn clean package -DskipTests'
    }
  }

  stage('Create Docker Image') {
    dir('webapp') {
      docker.build("rapha29c/aplicacao:${env.BUILD_NUMBER}")
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
      dir('webapp') {
        sh "mvn test"
        docker.build("rapha29c/aplicacao:${env.BUILD_NUMBER}").push()
      }
    } catch (error) {

    } finally {
      junit '**/target/surefire-reports/*.xml'
    }
  }
}
