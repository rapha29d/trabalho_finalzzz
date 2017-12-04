pipeline {
  agent {
    docker {
      image 'rapha29c/alpine_mariadb'
      args '-p 3307:3306'
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
        stage('zzz') {
          steps {
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