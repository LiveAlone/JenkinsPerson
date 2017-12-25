node() {
    sh 'echo ****************** current dir before delete checkout'
    sh 'ls -al'
    sh 'echo *******************************************'
    deleteDir()
    sh 'echo ****************** current dir after delete checkout'
    sh 'ls -al'
    sh 'echo *******************************************'
    stage 'Checkout'
    dir('source'){
        sh 'echo ****************** current dir before delete'
        sh 'ls -al'
        sh 'echo *******************************************'
        deleteDir()
        sh 'echo ****************** current dir after delete'
        sh 'ls -al'
        sh 'echo *******************************************'
        git url: 'https://github.com/LiveAlone/SpringBootStander.git', branch: 'master'
        stage 'Building'
        sh 'mvn clean package -Dmaven.test.skip=true'
        dir('target'){
            stage 'deploy'
            sh 'ls -al'
        }
    }
}