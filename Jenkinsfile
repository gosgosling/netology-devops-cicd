pipeline {
    agent any

    stages {
        
        stage('Build') {
            steps {
                
                sh 'go build -o app .'
                
            }
        }
        

        stage('Test') {
            steps {
                sh 'go test -v'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t 127.0.0.1:8082/hello-app:$BUILD_NUMBER .'
            }
        }

        stage('Run') {
            steps {
                sh 'echo "12345678" | docker login 127.0.0.1:8082 -u admin --password-stdin && docker push 127.0.0.1:8082/hello-app:$BUILD_NUMBER && docker logout'
            }
        }
    }
}