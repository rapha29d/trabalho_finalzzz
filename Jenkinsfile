pipeline {
  agent none
  stages {
    stage('Back-end') {
      agent {
        docker {
          image 'maven:3-alpine'
          args '-v /root/.m2:/root/.m2'
        }
        
      }
      steps {
        sh 'mvn -B -DskipTests clean package'
      }
    }
    stage('Data-base') {
      agent {
        docker {
          image 'rapha29c/alpine_mariadb'
        }
        
      }
      steps {
        sh 'login -u rapha29c -p b90b7fa5'
        sh 'pull rapha29c/alpine_mariadb'
        sh 'run -d -v $PWD/data:/data -p 3307:3306 --name mariadb rapha29c/alpine_mariadb'
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