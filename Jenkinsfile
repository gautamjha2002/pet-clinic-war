pipeline{
    agent any

    tools {
        maven "MAVEN"
    }
    
    stages{
        stage('Fetch code from github'){
            steps{
                git branch: 'main', url: 'https://github.com/gautamjha2002/pet-clinic-war.git'
            }
        }
        stage('Test the application'){
            steps{
                sh 'mvn test'
            }
        }
        stage('Package artifact and archive it'){
            steps{
                sh 'mvn install'
            }
            post{
                success{
                    echo "Archive the artifact"
                    archiveArtifacts artifacts:'**/*.war'
                }
            }
        }

        // stage('Deploy on Tomcat Server'){
        //    steps{
        //        build job: 'Deploy On Tomcat Server'
        //    }
       // }

    }
}
