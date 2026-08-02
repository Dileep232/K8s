pipeline {
    agent any

    stages {

        stage('Git Checkout') {
            steps {
                deleteDir()
                git 'https://github.com/Dileep232/K8s.git'
            }
        }

        stage('Docker Image Build') {
            steps {
                sh '''
                docker build -t new:${BUILD_NUMBER} .

                docker tag new:${BUILD_NUMBER} dileep232/new:${BUILD_NUMBER}

                docker tag new:${BUILD_NUMBER} dileep232/new:latest
                '''
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'Dockercred',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASSWD'
                    )
                ]) {
                    sh '''
                    echo "$DOCKER_PASSWD" | docker login -u "$DOCKER_USER" --password-stdin
                    '''
                }
            }
        }

        stage('Push Image to DockerHub') {
            steps {
                sh '''
                docker push dileep232/new:${BUILD_NUMBER}

                docker push dileep232/new:latest
                '''
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                ssh root@3.106.182.99 \
                "kubectl set image deployment/myapp-deployment myapp=dileep232/new:latest"
                '''
            }
        }
    }
}

        
