pipeline {
    agent {
        docker {
            image 'ghcr.io/cirruslabs/flutter:3.24.5'
        }
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Flutter Pub Get') {
            steps {
                sh 'flutter pub get'
            }
        }
        stage('Build APK') {
            steps {
                sh 'flutter build apk --release'
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: 'build/app/outputs/flutter-apk/app-release.apk', allowEmptyArchive: true
        }
    }
}