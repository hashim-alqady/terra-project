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

    stage('Install Docker Engine') {
      steps {
        script {
          sh 'ssh -i "ssh_key.pem" ec2-user@ec2-44-202-64-22.compute-1.amazonaws.com  "sudo yum update -y && sudo yum install docker -y && sudo service docker start && sudo usermod -a -G docker ec2-user && docker --version"'
        }
      }
    }

  }
}