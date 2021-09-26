pipeline {
        agent { dockerfile true }
        stages ('Git Checkout') {
            steps {
                git([url: 'https://github.com/sudheermanubolu/5180_week3.git', branch: 'main', credentialsId: '883617ec-4da5-4529-b906-fa3da9cb2ad7'])
            }
        }
        stage('Build') {
            steps {
                script{
                    dockerImage = docker.build sudheermanubolu/5180_week3
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