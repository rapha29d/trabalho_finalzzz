node {
  checkout scm
  env.PATH = "${tool 'Maven3'}/bin:${env.PATH}"
  stage('Package') {
   
      sh 'mvn clean package -DskipTests'
   
  }

  stage('Create Docker Image APP') {
  
      docker.build("rapha29c/aplicacao:${env.BUILD_NUMBER}")
    
  }
  stage('Create Docker Image DataBase') {
    dir('alpine_mariadb') {
      docker.build("rapha29c/alpine_mariadb:${env.BUILD_NUMBER}")
    }
  }

  stage ('Run Application') {
    try {
    
      sh "docker run -d -v $PWD/data:/data -p 3307:3306 --name mariadb rapha29c/alpine_mariadb:${env.BUILD_NUMBER}"
      sh "DB=`docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' mariadb`"
      sh "docker run -e DB_URI=$DB rapha29c/aplicacao:${env.BUILD_NUMBER}"

    } catch (error) {
    } finally {
      
      
    }
  }

  stage('Run Tests') {
    try {
      
        sh "mvn test"
      
     
    } catch (error) {
          

    } finally {
      junit '**/target/surefire-reports/*.xml'
     
    }
  }
  stage('Push Images') {
    try {
      //sh 'docker login -u rapha29c -p b90b7fa5'
      //docker.build("rapha29c/aplicacao:${env.BUILD_NUMBER}").push()
      //docker.build("rapha29c/alpine_mariadb:${env.BUILD_NUMBER}").push()
      
     
    } catch (error) {
          

    } finally {
         
    }
   }
   stage('Notification') {
    try {
       mail (to: 'raphapaesal@gmail.com',
         subject: "Job '${env.JOB_NAME}' (${env.BUILD_NUMBER}) jenkins testou seu programa",
         body: "Para ver o resultado va para ${env.BUILD_URL}.");
         
       
      
     
    } catch (error) {
          

    } finally {
         
    }
  }
 
}


