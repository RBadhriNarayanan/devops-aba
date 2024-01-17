pipeline {
    agent any

    triggers {
        // Trigger pipeline on push events to any branch
        githubPush(branches: [[name: 'main', branchFilter: 'sample.py']])
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/RBadhriNarayanan/devops-aba.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Define image name and tag
                    def imageName = 'my-python-app'
                    def imageTag = "${BUILD_NUMBER}"

                    // Build the image
                    dockerImage = docker.build("${imageName}:${imageTag}")
                }
            }
        }
    }
}
