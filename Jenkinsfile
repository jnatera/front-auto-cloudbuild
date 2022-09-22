pipeline {
   agent any

stages {
    stage('Run gcloud') {
        steps {
		        sh "cat /etc/os-release"
		        sh "pwd"
				sh "ls"

                sh "gcloud --version"
				sh "gcloud auth list"
        }
    }
	  
	
    stage('cloud run deploy') {
        steps {
		        sh "gcloud run deploy cloudrun-jenkins --region us-central1 --platform managed --allow-unauthenticated --source ."
        }
    }
    
}
}