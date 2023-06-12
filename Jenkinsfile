pipeline {
    agent any
    tools {
        terraform 'Terraform'
    }
    stages {

        stage('Checkout SCM') {
            steps{
                git branch: 'infra', url: "https://github.com/Pratyush-Misra/crypto-tracker.git"
            }
        }

        stage ("init") {
            steps {
                sh ("terraform init")
            }
        }

        stage ("terraform Action") {
            steps {
                echo "Terraform action is –> ${action}"
                sh ("terraform ${action} –auto-approve")
            }
        }
    }
}