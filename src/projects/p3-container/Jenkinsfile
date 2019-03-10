pipeline {
    agent none
    stages {
        stage('Jekyll Build') {
            agent {
                docker {
                    image 'docker:18.09'
                    args '-u root:root --network=host'
                }
            }
            steps {
                checkout scm
                sh 'whoami'
                sh 'apk add --no-cache make bash'
                sh 'CI_COMMIT_SHA="$GIT_COMMIT" make build'
            }
        }
        stage('Deploy') {
            agent {
                docker {
                    image 'ditemikuthesisdemo/deploy:1.0'
                    args '--network=host'
                }
            }
            steps {
                sh 'make deploy'
            }
        }
    }
}
