pipeline {
    agent any

    triggers {
        // Trigger pipeline on push events to any branch
        githubPush(branch: 'main')
    }

    stages {
        stage('Check for Changes in sample.py') {
          steps {
            script {
              // Check if sample.py has been modified in the current commit
              def changeset = currentBuild.changeSets.last()
              def hasSamplePyChanges = changeset.items.any { item -> item.commitId == changeset.commitId && item.paths.any { it.endsWith('sample.py') } }
    
              if (!hasSamplePyChanges) {
                echo "No changes detected in sample.py. Skipping build."
                currentBuild.result = 'ABORTED' // Mark the build as aborted
                return // Exit the stage
              }
            }
          }
        }
        
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
