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
                docker build -t new:${BUILD_NUMBER} .
                docker tag new:${BUILD_NUMBER} dileep232/new:${BUILD_NUMBER}
                '''
            }
        }
        stage('Deploying to container') {
            steps {
                sh '''
                docker rm -f c1 || true
                docker run -d --name c1 -p 9000:8080 new:${BUILD_NUMBER}
                '''
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
                sh '''
                docker push dileep232/new:${BUILD_NUMBER}
                '''
            }
        }
   } 
}

        
