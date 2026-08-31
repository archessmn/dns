library 'github.com/archessmn/jenkins-library@main'

pipeline {
    agent any
    
    options {
        ansiColor('xterm')
    }

    environment {
        CLOUDFLARE_API_TOKEN = credentials('cloudflare-api-token-archessmn-dns')
        PDNS_API_KEY = credentials('servfail-api-token-archessmn')
        PDNS_SERVER_URL = "beta.servfail.network"
        PDNS_NAMESERVER = "miyuki.sakamoto.pl."
        // PATH="/run/current-system/sw/bin"
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