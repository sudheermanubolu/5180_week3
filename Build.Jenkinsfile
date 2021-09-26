pipeline {
    agent { lables 'dind' }
    stages {
        stage 'Checkout') {
            steps {
                script {
                    git([url: 'https://github.com/sudheermanubolu/5180_week3.git', branch: 'main', credentialsId: 'ismailyenigul-github-user-token'])
                }
            }
        }
        stage('Build') {
            steps {
                script{
                    dockerImage = docker.build 'sudheermanubolu/5180_week3'
                }
            }
        }
        stage('image push') {
            steps{
                script {
                    docker.withRegistry( '', sudheermanubolu-dockerhub ) {
                        dockerImage.push("$BUILD_NUMBER")
                        dockerImage.push('latest')
                    }
                }
            }
        }
        stage('Remove Unused docker image') {
            steps{
                sh "docker rmi sudheermanubolu/5180_week3:$BUILD_NUMBER"
                sh "docker rmi sudheermanubolu/5180_week3:latest"
            }
        }
}