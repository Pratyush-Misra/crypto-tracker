pipeline {
    agent any
    tools {
        terraform 'Terraform'
    }

    environment {
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
                // sh ("terraform plan")
            }
        }

        stage ("terraform apply") {
            steps {
                sh ("terraform apply -auto-approve")
            }
        }

        stage ("docker build run") {
            steps {
                sh ("sudo docker build -t pm20080/crypto:1 .")
                sh ("sudo docker run -p 3000:3000 pm20080/crypto:1")
            }
        }
    }
}