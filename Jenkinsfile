pipeline {
  agent {
    docker {
      image 'maven:3-alpine'
      args '-v /root/.m2:/root/.m2'
    }
    
  }
  stages {
    stage('Build') {
      parallel {
        stage('Build') {
          steps {
            sh 'mvn -B -DskipTests clean package'
          }
        }
        stage('container') {
          steps {
            sh 'docker build --pull rapha29c/alpine_mariadb'
            sh 'docker run -d -v $PWD/data:/data -p 3307:3306 --name mariadb rapha29c/alpine_mariadb'
          }
        }
      }
    }
    stage('Test') {
      steps {
        sh 'mvn test'
      }
      post {
        always {
          junit 'target/surefire-reports/*.xml'
          
        }
        
      }
    }
    stage('Deliver') {
      steps {
        sh './jenkins/scripts/deliver.sh'
      }
    }
  }
}