pipeline {
	agent any

	stages {
	    stage('Checkout') {
	        steps {
				git 'https://github.com/gulamd/jenkins_build.git'	
			}
		}
		stage('Build') {
	        steps {
				sh '/home/ubuntu/Distros/apache-maven-3.6.0/bin/mvn install'
	        }
		}
		stage('Deployment') {
			steps {
				sshagent(['tomcat-deployment']) {
sh 'scp -o StrictHostKeyChecking=no target/*.war ubuntu@18.191.164.51:/home/ubuntu/Distros/apache-tomcat-8.5.38/webapps'
			}
		}

	}
}
