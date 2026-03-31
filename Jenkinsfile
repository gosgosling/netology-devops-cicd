pipeline {
    agent any

    stages {
        environment {
        // Замените на реальный адрес Nexus и имя raw-репозитория
        NEXUS_URL = 'http://localhost:8081/repository/repo2'
        }
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
                withCredentials([usernamePassword(credentialsId: 'nexus-credentials', usernameVariable 'NEXUS_USERNAME', passwordVariable 'NEXUS_PASSWORD')]) {
                    sh "curl -v -u ${NEXUS_USERNAME}:${NEXUS_PASSWORD} --upload-file app ${NEXUS_URL}/app-${BUILD_NUMBER}"
                }
            }
        }   
    }
}