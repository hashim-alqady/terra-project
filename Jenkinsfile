pipeline {
    agent any

    

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
