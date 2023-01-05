pipeline {
    agent any
    
    tools{
        maven "MAVEN"
    }

    stages {
	
		stage("Checkout code"){
			steps
			{
				checkout scmGit(branches: [[name: '*/master']], browser: github('https://github.com/rajraushan18/Advanced_Assignment5/tree/master/AdvancedJavaAssignment5/LibraryManagement'), extensions: [], userRemoteConfigs: [[url: 'https://github.com/rajraushan18/Advanced_Assignment5.git']])
				echo 'Check Out'
			}
        }
        stage('Clean') {
            steps {
                bat 'mvn -f AdvancedJavaAssignment5/LibraryManagement/pom.xml clean'
                echo 'Cleaning..'
            }
        }
        stage('Compile') {
            steps {
                bat 'mvn -f AdvancedJavaAssignment5/LibraryManagement/pom.xml compile'
                echo 'Compiling..'
            }
        }
        stage('Test') {
            steps {
                bat 'mvn -f AdvancedJavaAssignment5/LibraryManagement/pom.xml test'
                echo 'Testing..'
            }
        }
        stage('Packaging') {
            steps {
                bat 'mvn -f AdvancedJavaAssignment5/LibraryManagement/pom.xml package'
                echo 'Packageing..'
            }
        }
        stage('Install') {
            steps {
                bat 'mvn -f AdvancedJavaAssignment5/LibraryManagement/pom.xml install'
                echo 'Installing..'
            }
        }
        
      
    }
}
