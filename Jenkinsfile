pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "mvn"
    }

    stages {
        stage('checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/NguyenTienHCL/CI-CD-using-Docker.git'
            }
        }
        
        stage('execute maven') {
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage('build image') {
            steps {
                sh 'sudo docker build -t samplewebapp:latest .' 
                sh 'sudo docker tag samplewebapp tiennguyenhcl/samplewebapp:latest'
            }    
        }
        
        stage('run container') {
            steps {
                sh "sudo docker run -d -p 8090:8080 tiennguyenhcl/samplewebapp"
            }
        }
    }
}
