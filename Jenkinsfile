pipeline {
    agent any
    
    tools{
        maven "MAVEN"
    }

    stages {
	
		stage("Checkout code"){
			steps
			{
				checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/rajraushan18/LibraryManagement.git']])
				echo 'Check Out'
			}
        }
        stage('Clean') {
            steps {
                bat 'mvn -f pom.xml clean'
                echo 'Cleaning..'
            }
        }
        stage('Compile') {
            steps {
                bat 'mvn -f pom.xml compile'
                echo 'Compiling..'
            }
        }
        stage('Test') {
            steps {
                bat 'mvn -f pom.xml test'
                echo 'Testing..'
            }
        }
	stage('Build Docker Image'){
	     steps{
		script{
			bat 'docker build -t rajraushan/jenkins-docker .'
			echo 'building docker image..'
		}
	      }
	}   
	    
	    
      	stage('Packaging') {
            steps {
                bat 'mvn -f pom.xml package'
                echo 'Packageing..'
            }
        }
        stage('Install') {
            steps {
                bat 'mvn -f pom.xml install'
                echo 'Installing..'
            }
        }
	 stage('push image to hub'){
	     steps{
		script{
			withCredentials([string(credentialsId: 'dockernewpwd', variable: 'dockernew-pwd')]) {
				sh 'docker login -u rajraushan -p ${dockernew-pwd}'  
			}	    	
			bat 'docker push rajraushan/jenkins-docker'
		}		    
	      }	    
	 }
        
      
    }
}
