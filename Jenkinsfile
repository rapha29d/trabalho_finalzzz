pipeline {
  agent {
    node {
      label 'teste'
    }
    
  }
  stages {
    stage('build') {
      agent {
        docker {
          image 'maven:3-alpine'
          args '-v /root/.m2:/root/.m2'
        }
        
      }
      steps {
        sh 'mvn -B -DskipTests clean package'
        sh 'mvn test'
      }post {
                always {
                  junit 'target/surefire-reports/*.xml'
                }
            }
    }
  }
}
