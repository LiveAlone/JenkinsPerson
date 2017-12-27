node() {
    deleteDir()
    stage 'Checkout'
    dir('source'){
        git url: 'https://github.com/LiveAlone/SpringBootStander.git', branch: 'master'
        stage 'Building'
        sh 'mvn clean package -Dmaven.test.skip=true'
    }
    dir('dockerfile'){
        git url: 'https://github.com/LiveAlone/JenkinsPerson.git', branch: 'master'
    }
    dir('output'){
        deleteDir()
        sh 'cp ../source/target/boot-demo-1.0-SNAPSHOT.jar .'
        sh 'cp ../dockerfile/Dockerfile .'
        stage 'create image'
        sh 'docker rmi localimage'
        sh 'docker build -t localimage .'
        // sh 'nohup java -jar boot-demo-1.0-SNAPSHOT.jar'
        stage 'deploy'
        sh 'docker run -d -p 8080 localimage'
    }
}