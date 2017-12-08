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
        stage('Database') {
     
         
            node('merda') {
              
                docker.image('rapha29c/alpine_mariadb').withRun('-d -v $PWD/data:/data -p 3307:3306') { c ->
              
                }
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
