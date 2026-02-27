pipeline {
    agent any

    stages {

        stage('Clone') {
            steps {
                git 'https://github.com/sanjeeva001/myapp.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t sanjeeva001/myapp:v1 .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh 'docker push sanjeeva001/myapp:v1'
            }
        }
    }
}
