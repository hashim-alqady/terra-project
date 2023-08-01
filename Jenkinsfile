pipeline {
  agent any

  stages {
    
    stage('Initialize Terraform') {
      steps {
        echo 'start init'
        sh 'terraform init'
        
      }
    }

    stage('Terraform Plan') {
      steps {
        echo 'start plan'
        sh 'terraform plan'
      }
    }

    stage('Terraform Apply') {
      steps {
        echo 'start apply'
        sh 'terraform apply -auto-approve'
      }
    }
  }
}