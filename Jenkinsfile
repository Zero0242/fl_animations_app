pipeline {
    agent {
        docker {
            image 'ghcr.io/cirruslabs/flutter:3.24.5'
            args '-u root:root'
        }
    }
    stages {
        stage('Flutter Pub Get') {
            steps {
                sh '''
                pwd
                ls -la
                echo "Mensajes de Debug"
                flutter pub get
                '''
            }
        }
        stage('Build APK') {
            steps {
                sh 'flutter build apk --release -v'
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: 'build/app/outputs/flutter-apk/app-release.apk', allowEmptyArchive: true
            sh 'flutter clean'
        }
    }
}