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

        stage('Upload to Nexus') {
            steps {
                withCredentials([string(credentialsId: 'nexus-password', variable: 'NEXUS_PASSWORD')]) {
                    sh '''
                        curl -v -u admin:12345678 \
                        --upload-file app \
                        http://localhost:8081/#admin/repository/repositories:repo2
                    '''
                }
            }
        }
    }
}