pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "sanjeeva001/myapp:v1"
    }

    stages {

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh 'docker push $DOCKER_IMAGE'
            }
        }

        // ⭐ NEW STAGE — ADD THIS
        stage('Deploy Container') {
            steps {
                sh '''
                docker stop myapp-container || true
                docker rm myapp-container || true
                docker pull sanjeeva001/myapp:v1
                docker run -d -p 3000:3000 --name myapp-container sanjeeva001/myapp:v1
                '''
            }
        }

    }
}
