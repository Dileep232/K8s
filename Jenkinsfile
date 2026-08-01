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
                sh 'docker build -t new:one .'
            }
        }
   } 
}

        
