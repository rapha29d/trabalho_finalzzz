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
        sh 'mvn test'
        sh './jenkins/scripts/deliver.sh'
      }
    }
    stage('Data-base') {
      agent {
        docker {
          image 'rapha29c/alpine_mariadb'
          args '-d -v $PWD/data:/data -p 3307:3306'
        }
        
      }
      steps {
        echo 'merda'
      }
    }
  }
}