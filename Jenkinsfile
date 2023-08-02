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
        sh 'terraform destroy -auto-approve'
      }
    }

    stage('Install Docker Engine') {
      steps {
        script {
          sh 'ssh -i ~/.ssh/id_rsa.pub ubuntu@${EC2_INSTANCE_IP}  "sudo apt-get update -y && sudo apt-get install -y docker.io"'
        }
      }
    }

  }
}