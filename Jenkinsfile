pipeline {
    agent any
    tools {
        terraform 'Terraform'
    }
    stages {

        stage('Checkout SCM') {
            steps{
                git branch: 'dev', url: "https://github.com/Pratyush-Misra/crypto-tracker.git"
            }
        }

        stage ("init") {
            steps {
                sh ("terraform init")
            }
        }

        stage ("terraform Action") {
            steps {
                sh ("terraform apply -auto-approve")
            }
        }
    }
}