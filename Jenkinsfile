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
        sh '''
        docker build -t 192.168.33.80:5000/meeting_server:${BUILD_NUMBER} .
        docker push 192.168.33.80:5000/meeting_server:${BUILD_NUMBER}'''

    }
    stage('Deploy To Server') {
        // docker.image('generik/ansible').inside {
            sh '''cd scripts
            sudo ansible-playbook -e BUILDNUMBER=${BUILD_NUMBER} -i hosts deploy.yml'''
        // }
    }
}