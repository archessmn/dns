library 'github.com/archessmn/jenkins-library@main'

pipeline {
    agent any
    
    options {
        ansiColor('xterm')
    }

    environment {
        CLOUDFLARE_API_TOKEN = credentials('cloudflare-api-token-archessmn-dns')
        PATH="/run/current-system/sw/bin"
    }

    stages {
        stage('Check Formatting') {
            steps {
                script {
                    sh "nix flake show"
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