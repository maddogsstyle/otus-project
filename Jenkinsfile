pipeline {
    agent {
        python { image 'python:3.6-alpine' }
    }

    stages {
        

        stage('Delete workspace before build starts') {
            steps {
                echo 'Deleting workspace'
                deleteDir()
            }
        }

        stage('Build docker image crawler') {
            steps{
                    dir('src/crawler') {
                        sh 'docker build -t achuprin/crawler:latest .'
                    }
                }
            }

        stage('Push docker image to DockerHub') {
            steps{
                    withDockerRegistry(credentialsId: 'dockerhub', url: 'https://index.docker.io/v1/') {
                        sh '''
                            docker push achuprin/jenkins-images:latest
                        '''
                    }
                }
            }
        stage('Delete docker image locally') {
            steps{
                container('docker')
                    sh 'docker rmi achuprin/jenkins-images:latest'
                }
            }
        }
}