pipeline {
    agent any

    stages {

        stage('Clone') {
            steps {
                git 'https://github.com/9739349711/myapp.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t 9739349711/myapp:v1 .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh 'docker push 9739349711/myapp:v1'
            }
        }
    }
}
