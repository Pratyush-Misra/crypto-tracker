@Library("jenkins-shared-library") _

pipeline{
    agent any
    
    // parameters {
    //     choice(name: 'action', choices: 'create\ndelete', description: 'Choose create/destroy')
    // }

    stages {

        stage('Git Checkout') {
            // when{ expression { params.action == 'create' } }
            steps {
                gitCheckout(
                    branch: "dev",
                    url: "https://github.com/Pratyush-Misra/crypto-tracker.git"
                )
            }
        }

        stage('Unit Test') {
            steps {
                unitTest()
            }
        }

        stage('Integration Test') {
            steps {
                integrationTest()
            }
        }
    }
}