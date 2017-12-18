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
      //sh 'docker login -u rapha29c -p b90b7fa5'
      //docker.build("rapha29c/aplicacao:${env.BUILD_NUMBER}").push()
    }
  }
 
}


