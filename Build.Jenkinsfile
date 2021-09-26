pipeline {
      agent {
    kubernetes {
      yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    name: dind-agent
spec:
  containers:
  - name: dind
    image: docker:dind
    imagePullPolicy: Always
    tty: true
    securityContext:
      privileged: true
    volumeMounts:
      - name: docker-graph-storage
        mountPath: /var/lib/docker
  volumes:
    - name: docker-graph-storage
      emptyDir: {}
"""
    }
  }
    stages {
        stage ('Git Checkout') {
            steps {
                git([url: 'https://github.com/sudheermanubolu/5180_week3.git', branch: 'main', credentialsId: '883617ec-4da5-4529-b906-fa3da9cb2ad7'])
            }
        }
        stage('Build') {
            steps {
                container('dind') {
                    sh 'docker info'
                    sh "docker build -t sudheermanubolu/5180_week3:$BUILD_NUMBER"
                    //sh "docker push sudheermanubolu/5180_week3:$BUILD_NUMBER"
                }
            }
        }
        // stage('image push') {
        //     steps{
        //         script {
        //             docker.withRegistry( '', sudheermanubolu-dockerhub ) {
        //                 dockerImage.push("$BUILD_NUMBER")
        //                 dockerImage.push('latest')
        //             }
        //         }
        //     }
        // }
        // stage('Remove Unused docker image') {
        //     steps{
        //         sh "docker rmi sudheermanubolu/5180_week3:$BUILD_NUMBER"
        //         sh "docker rmi sudheermanubolu/5180_week3:latest"
        //     }
        // }
    }
}