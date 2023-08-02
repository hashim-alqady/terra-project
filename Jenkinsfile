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
        //withCredentials([usernamePassword(credentialsId: 'aws', usernameVariable: 'user', passwordVariable: 'password')]) {
            echo 'start build2'
           // sh "aws configure -u $user -p $password"
            sh 'terraform plan'
        //}
      }
    }

    stage('Terraform Apply') {
      steps {
        echo 'start apply'
        sh 'terraform apply -auto-approve'
      }
    }

    stage('docker test') {
      steps {
        echo 'start docker test'
        sh 'docker ps'
      }
    }
  }
}