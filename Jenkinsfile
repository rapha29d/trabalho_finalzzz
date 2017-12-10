node {
    checkout scm
   
    docker.image('rapha29c/alpine_mariadb').withRun('-d -v $PWD/data:/data -p 3307:3306') { c ->
        
       
    }
    docker.image('maven:3-alpine').withRun('-v /root/.m2:/root/.m2') { d ->
        sh 'mvn -B -DskipTests clean package'
        sh 'mvn test'
        junit 'target/surefire-reports/*.xml'
        sh './jenkins/scripts/deliver.sh'
    }
    
}
