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
        sh 'docker rmi localimage || true'
        sh 'docker build -t localimage .'
        // sh 'nohup java -jar boot-demo-1.0-SNAPSHOT.jar'
        stage 'deploy'
        sh 'docker stop localimage || true'
        sh 'docker rm localimage || true'
        sh 'docker run -d -p 127.0.0.1:8080:8080 localimage'
    }
}