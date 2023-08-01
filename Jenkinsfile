pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout your Terraform files from version control
                git 'https://github.com/your-repo.git'
            }
        }

        stage('Terraform Init') {
            steps {
                // Initialize the Terraform working directory
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                // Generate an execution plan for your infrastructure
                sh 'terraform plan -out=tfplan'
            }
        }
        
        stage('Terraform Apply') {
            steps {
                // Create the EC2 instance
                sh 'terraform apply -input=false tfplan'
            }
        }
    }
}