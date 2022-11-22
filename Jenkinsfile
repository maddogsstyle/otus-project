pipeline {
    agent any

    stages {
        
        stage('Install Docker') {
            steps {
                echo 'Installing Docker'
                sh '''curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
                  && tar xzvf docker-17.04.0-ce.tgz \
                  && mv docker/docker /usr/local/bin \
                  && rm -r docker docker-17.04.0-ce.tgz'
                 '''
            }
        }

        stage('Delete workspace before build starts') {
            steps {
                echo 'Deleting workspace'
                deleteDir()
            }
        }

        stage('Build docker image [crawler]') {
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
                sh 'docker rmi achuprin/jenkins-images:latest'
            }
        }
    }
}