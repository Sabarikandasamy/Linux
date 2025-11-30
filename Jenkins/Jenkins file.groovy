pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building...'
        sh 'echo build step; sleep 1'
      }
    }
    stage('Test') {
      steps {
        echo 'Testing...'
        sh 'echo test step; sleep 1'
      }
    }
    stage('Deploy') {
      steps {
        echo 'Deploying...'
        sh 'echo deploy step; sleep 1'
      }
    }
  }
}