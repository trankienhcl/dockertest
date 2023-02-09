pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "mvn"
    }

    stages {
        stage('checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/trankienhcl/dockertest.git'
            }
        }
        
        stage('execute maven') {
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage('build image') {
            steps {
                sh 'docker build -t samplewebapp:latest .' 
                sh 'docker tag samplewebapp trankienhcl/samplewebapp:latest'
            }    
        }
        
        stage('run container') {
            steps {
                sh "docker run -d -p 8888:8080 trankienhcl/samplewebapp"
            }
        }
    }
}
