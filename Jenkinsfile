pipeline {
    agent {
        docker {
            image 'maven:3-alpine' 
            args '-v /root/.m2:/root/.m2' 
        }
    }

    stages {
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
           

       stage ('Run Application') {
        try {
          // Start database container here
         sh 'docker run -d -v $PWD/data:/data -p 3307:3306 --name mariadb rapha29c/alpine_mariadb'

         
        } catch (error) {
        } finally {
          // Stop and remove database container here
          //sh 'docker-compose stop db'
          //sh 'docker-compose rm db'
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
