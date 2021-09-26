node('dind') {
    
     stage('unit-tests') {
        sh(script: """
            hostname
            id -a
            docker run --rm alpine /bin/sh -c "echo hello world"
        """)
    }
}
