pipeline {
    agent any
    stages{
        stage('Terraform Init') {
                steps {
                    withCredentials([usernamePassword(credentialsId: 'aws', usernameVariable: 'user', passwordVariable: 'password')]) {
                        echo 'start build2'
                        sh "aws configure -u $user -p $password"
                    
                    
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
}
