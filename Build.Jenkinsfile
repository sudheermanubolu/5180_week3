pipeline {
//       agent {
//     kubernetes {
//       yaml """
// apiVersion: v1
// kind: Pod
// metadata:
//   labels:
//     name: dind-agent
// spec:
//   containers:
//   - name: dind
//     image: docker:dind
//     imagePullPolicy: Always
//     tty: true
//     securityContext:
//       privileged: true
//     volumeMounts:
//       - name: docker-graph-storage
//         mountPath: /var/lib/docker
//   volumes:
//     - name: docker-graph-storage
//       emptyDir: {}
// """
//     }
//   }
    agent { label 'dind' }
    stages {
        stage ('Git Checkout') {
            steps {
                git([url: 'https://github.com/sudheermanubolu/5180_week3.git', branch: 'main', credentialsId: '883617ec-4da5-4529-b906-fa3da9cb2ad7'])
            }
        }
        stage('Build') {
            steps {
                script {
                    dockerImage = docker.build sudheermanubolu/5180_week3
                }
            }
        }
    }
}
