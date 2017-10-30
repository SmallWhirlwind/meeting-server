node {
    stage('Download Project') {
        git 'https://github.com/SmallWhirlwind/meeting-server.git'
    }
    stage('Run Test') {
        docker.image('maven').inside {
            sh '''mvn clean test'''
        }
    }
    stage('Build Server') {
        docker.image('maven').inside {
            sh '''mvn clean package'''
        }
    }
    stage('Build Docker Images') {
        docker.image('docker').inside {
            sh '''docker build -t 192.168.33.80:5000/meeting_server:${BUILD_NUMBER} .'''
        }
    }
    stage('Deploy To Server') {
        docker.image('generik/ansible').inside {
            sh '''ansible-playbook -e BUILDNUMBER=${BUILD_NUMBER} -i ./scripts/hosts ./scripts/deploy.yml'''
        }
    }
}
