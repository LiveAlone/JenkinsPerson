node() {
    stage 'Checkout'
    dir('source'){
        deleteDir()
        git url: 'https://github.com/LiveAlone/SpringBootStander.git', branch: 'master'
        stage 'Building'
        sh 'mvn clean package -Dmaven.test.skip=true'
    }
}