node('dind') {
    
     stage('unit-tests') {
        sh(script: """
            hostname
            curl -sSL https://get.docker.com/ | sh
            docker run --rm alpine /bin/sh -c "echo hello world"
        """)
    }
}
