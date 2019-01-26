pipeline {
    agent {
        docker 'jekyll/jekyll:3.8'
    }
    stages {
        stage('Jekyll Build') {
            steps {
                checkout scm
                sh 'bundle install'
                sh 'make build'
            }
        }
        stage('Deploy') {
            steps {
                sh 'make deploy'
            }
        }
    }
}
