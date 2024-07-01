pipeline {
    agent any

    environment {
        DOCKER_USERNAME = 'viju93'
        DOCKER_PASSWORD = 'capstone'
        IMAGE_NAME_DEV = "dev"
        IMAGE_NAME_PROD = "prod"
    }

    stages {
        stage('Build') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev') {
                        sh 'docker build -t $DOCKER_USERNAME/$IMAGE_NAME_DEV:latest .'
                    } else if (env.BRANCH_NAME == 'main') {
                        sh 'docker build -t $DOCKER_USERNAME/$IMAGE_NAME_PROD:latest .'
                    }
                }
            }
        }

        stage('Push') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev') {
                        sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                        sh 'docker push $DOCKER_USERNAME/$IMAGE_NAME_DEV:latest'
                    } else if (env.BRANCH_NAME == 'master') {
                        sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                        sh 'docker push $DOCKER_USERNAME/$IMAGE_NAME_PROD:latest'
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'main') {
                        sh 'docker-compose up -d'
                    }
                }
            }
        }
    }

    triggers {
        githubPush()
    }

    post {
        always {
            cleanWs()
        }
    }
}

