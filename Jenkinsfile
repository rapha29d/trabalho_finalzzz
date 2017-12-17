pipeline {
  agent none
  stages {
    stage('build') {
      parallel {
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
        stage('DataBase') {
          agent {
            docker {
              args '-d -v $PWD/data:/data -p 3307:3306 --name mariadb'
              image 'rapha29c/alpine_mariadb'
            }
            
          }
          steps {
            echo 'database'
          }
        }
        stage('teste') {
          agent {
            node {
              label 'zzz'
            }
            
          }
          steps {
            node(label: 'sdf') {
              echo 'bnghj'
            }
            
          }
        }
      }
    }
  }
}