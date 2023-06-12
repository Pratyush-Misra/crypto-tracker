pipeline {
    agent any
    tools {
        terraform 'Terraform'
    }

    enviroment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')    
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
                sh ("terraform plan")
            }
        }

        stage ("terraform apply") {
            steps {
                sh ("terraform apply -auto-approve")
            }
        }
    }
}