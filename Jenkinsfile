pipeline {
   agent any

stages { 
	
    stage('cloud run deploy') {
        steps {
		        sh "gcloud run deploy cloudrun-jenkins --region us-central1 --platform managed --allow-unauthenticated --source ."
        }
    }
    
}
}