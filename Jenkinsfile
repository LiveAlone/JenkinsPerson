node() {
    deleteDir()
    stage 'Checkout'
    dir('source'){
        git url: 'https://github.com/LiveAlone/SpringBootStander.git', branch: 'master'
        stage 'Building'
        sh 'mvn clean package -Dmaven.test.skip=true'
        dir('target'){
            stage 'deploy'
            sh "java -jar boot-demo-1.0-SNAPSHOT.jar > log.file &"
        }
    }
}