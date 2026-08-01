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
                sh '''
                docker rmi -f new:one || true
                docker build -t new:one .
                docker tag new:one dileep232/new:one'''
            }
        }
        stage('Deploying to container') {
            steps {
                sh '''
                docker rm -f c1 || true
                docker run -d --name c1 -p 9000:8080 new:one'''
            }
        }  
        stage('logi to dockerhub') {
            steps {
                withCredentials ([usernamePassword(
                    credentialsId: 'Dockercred',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASSWD'
                    )
                    ]) {
                    sh '''echo "$DOCKER_PASSWD" | docker login -u "$DOCKER_USER" --password-stdin'''
                }
            }
        }
        stage('Pushing image to central') {
            steps {
                sh 'docker push dileep232/new:one'
            }
        }
   } 
}

        
