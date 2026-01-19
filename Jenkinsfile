library 'github.com/archessmn/jenkins-library@main'

pipeline {
    agent {
        node 'nomad'
    }

    environment {
        CLOUDFLARE_API_TOKEN = credentials('cloudflare-api-token-ystv-dns')
    }

    stages {
        stage('Check Formatting') {
            steps {
                script {
                    sh(script: "tofu fmt -check")
                }
            }
        }
        
        stage('Init') {
            steps {
                script {
                    sh(script: "tofu init")
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
                    sh(script: "tofu plan")
                }
            }
        }

        stage('Apply') {
            when {
                branch 'main'
            }

            steps {
                script {
                    sh(script: "tofu apply -auto-approve")
                }
            }
        }
    }
}