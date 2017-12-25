node() {
    deleteDir()
    sh 'echo ************************'
    sh 'pwd'
    sh 'ls -al'
    sh 'echo ************************'
    stage 'Checkout'
    dir('source'){
        git url: 'https://github.com/LiveAlone/SpringBootStander.git', branch: 'master'
        stage 'Building'
        sh 'mvn clean package -Dmaven.test.skip=true'
        dir('target'){
            stage 'deploy'
            sh 'ls -al'
        }
    }
}