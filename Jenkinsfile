pipeline{
    agent any
    
    stages {
        stage('Git Checkout') {
            steps {
                script {
                    git branch: 'dev', url: 'https://github.com/Pratyush-Misra/crypto-tracker.git'
                }
            }
        }
    }
}