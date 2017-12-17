pipeline {
  agent none
  stages {
    stage('build') {
      parallel {
        stage('DataBase') {
          agent {
            docker {
              args '-d -v $PWD/data:/data -p 3307:3306'
              image 'rapha29c/alpine_mariadb'
            }
            
          }
          steps {
            echo 'database'
          }
        }  
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
          }
        }
        
      }
    }
  }
}
