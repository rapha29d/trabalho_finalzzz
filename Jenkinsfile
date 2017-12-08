pipeline {
  agent none
  stages {
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
    stage('Maven') {
      agent {
        docker {
          image 'maven:3-alpine'
          args '-v /root/.m2:/root/.m2'
        }
        
      }
      steps {
        sh 'mvn -B -DskipTests clean package'
      }
      steps {
        sh 'mvn test'
      }
      post {
        always {
          junit 'target/surefire-reports/*.xml'
          
        }
        
      }
     steps {
        sh './jenkins/scripts/deliver.sh'
      }
    }
   
   
  }
}
