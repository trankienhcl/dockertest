pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven"
    }

    stages {
        stage('checkout') {
            steps {
                git credentialsId: 'git_creds', url: 'https://github.com/trankienhcl/dockertest.git'
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
                withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
                    sh "sudo docker login -u anhdo98 -p ${dockerHubPwd}"
                }
                sh 'sudo docker push samplewebapp:latest'
            }    
        }
        stage('run container') {
            steps {
                sh "docker run -d -p 8888:8080 trankienhcl/samplewebapp"
            }
        }
        stage("Deploy docker image to Tomcat server"){
            steps{
                //def dockerRun = 'docker run -p 8080:8080 -d --name my-app-1 trankienhcl/samplewebapp:latest'
                sshagent(['dev-server']) {
                    sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.1.53 ${dockerRun}"
                }
            } 
        }   
    }
}
