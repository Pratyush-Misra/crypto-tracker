pipeline{
    agent any
    
    parameters {
        choice(name: 'choice', choices: 'create\ndelete', description: 'Choose create/destroy')
    }

    stages {

        stage('Git Checkout') {
            when{expression{param.action == 'create'}}
            steps {
                script {
                    git branch: 'dev', url: 'https://github.com/Pratyush-Misra/crypto-tracker.git'
                }
            }
        }

        stage('Unit Test') {
            steps {
                // Add unit tests code
                sh 'Unit Tests'
            }
        }

        stage('Integration Test') {
            steps {
                // Add integration tests code
                sh 'Integration Tests'
            }
        }
    }
}