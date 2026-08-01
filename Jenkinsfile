pipeline {
    agent any
    stages {
        stage('git checkout') { 
            steps {
                deleteDir()
                git 'https://github.com/Dileep232/K8s.git'
            }
        }
        stage('Docker-image build') {
            steps {
                sh '
                docker rmi -f new:one || true
                docker build -t new:one .'
            }
        }
        stage('Deploying to container') {
            steps {
                sh 'docker run -d --name c1 new:one'
            }
        }  
   } 
}

        
