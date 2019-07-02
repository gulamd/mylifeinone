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
                                   sh 'scp -o StrictHostKeyChecking=no target/*.war ubuntu@18.219.190.218:/home/ubuntu/Distros/apache-tomcat-8.5.42/webapps'
			}
		}
		stage('Publishing-to-Nexus') {
			steps { 
				nexusPublisher nexusInstanceId: '1234', nexusRepositoryId: 'Snapshot', packages: [[$class: 'MavenPackage', mavenAssetList: [], mavenCoordinate: [artifactId: 'gamutkart', groupId: 'com.gamutgurus', packaging: 'war', version: '1.1-SNAPSHOT']]]
			}
			
		}

	}
    }
}
