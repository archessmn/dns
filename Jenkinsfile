library 'github.com/archessmn/jenkins-library@main'

pipeline {
    agent any

    environment {
        CLOUDFLARE_API_TOKEN = credentials('cloudflare-api-token-archessmn-dns')
    }

    stages {
        stage('Check Formatting') {
            steps {
                script {
                    nixSh(script: "tofu fmt -check")
                }
            }
        }
        
        stage('Init') {
            steps {
                script {
                    nixSh(script: "tofu init")
                }
            }
        }

        stage('Plan') {
            when {
                anyOf {
                    branch 'main'
                    changeRequest()
                }
            }

            steps {
                script {
                    nixSh(script: "tofu plan")
                }
            }
        }

        stage('Apply') {
            when {
                branch 'main'
            }

            steps {
                script {
                    nixSh(script: "tofu apply -auto-approve")
                }
            }
        }
    }
}