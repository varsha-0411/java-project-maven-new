pipeline {
    agent any
    tools {maven'mymav'}
    stages {

        stage('checkout git') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'varsha', url: 'https://github.com/varsha-0411/java-project-maven-new.git']])
            }
        }

        stage('compile') {
            steps {
                sh 'mvn compile'
            }
        }

        stage('test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('package') {
            steps {
                sh 'mvn package'
            }
        }
		stage ('docker build image') {
		    steps {
			    sh 'docker build -t  img211 .'
			}
		}
		stage ('run') {
		    steps {
			    sh 'docker run -itd --name vacont -p 9090:8080 img211'
			}
		}
        
    }
}
