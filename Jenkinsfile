pipeline {
    agent any
    stages {
        stage('Checkout'){
            steps{
                sh 'git clone https://github.com/LiveAlone/SpringBootStander.git'
            }
        }
        stage('Build') {
            steps {
                sh 'ls -al'
            }
        }
        stage('deploy'){
            steps{
                sh 'java -version'
                sh 'echo author yaoqijun hehe'
            }
        }
    }
}