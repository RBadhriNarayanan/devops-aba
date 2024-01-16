pipeline {
    agent any

    triggers {
        // Trigger pipeline on push events to any branch
        githubPush()
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
                    def imageTag = "${BUILD_NUMBER+1}"

                    // Build the image
                    dockerImage = docker.build("${imageName}:${imageTag}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'docker login registry.hub.docker.com -u $DOCKER_USER -p $DOCKER_PASSWORD'
                    sh "docker image tag ${imageName}:${imageTag} rbadhrinarayanan/${imageName}:${imageTag}"
                    sh "docker push rbadhrinarayanan/${imageName}:${imageTag}"
                }
            }
        }
    }
}
