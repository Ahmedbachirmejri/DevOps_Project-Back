pipeline {
    agent any
    tools {
            nodejs 'nodejs21.2.0'
    }
    environment {
    registry = "docker.io/library/devops_back_end"
    registryCredential = 'ahmedbachir-dockerhub'
    dockerImage = ''
}
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
    

        stage('Build Backend') {
            steps {
                script {
                        sh 'mvn clean'
                }
            }
        }

       /* stage('Nexus') {
            steps {
                script {
                    dir('DevOps_Project-Back') {
                         sh "mvn deploy -DskipTests=true"
                    }
                }
            }
        }*/

        stage('Compile Backend') {
            steps {
                script {
                        sh 'chmod +x mvnw'
                        sh './mvnw compile'
                        sh 'mvn install'
                }
            }
        }

        /*stage('Test Backend') {
            steps {
                script {
                    dir('DevOps_Project-Back') {
                    sh 'mvn test'
                    }
                    
                }
            }
        }*/

        /*stage('SonarQube') {
    steps {
        script {
            withSonarQubeEnv(installationName: 'Sonar_devops') {
                dir('DevOps_Project-Back') {
                    sh 'mvn clean verify sonar:sonar \
                        -Dsonar.projectName="Devops-project-V" \
                        -Dsonar.host.url=http://10.0.2.15:9000 \
                        -Dsonar.token=squ_95e336dbc2acf1d92765942019b93b2698023afe'
                }
            }
        }
    }
}*/



        /*
        stage('Build Frontend') {
            steps {
                script {
                    dir('DevOps_Project_Front') {
                        sh 'npm install'
                        sh 'npm run build'
                    }
                }
            }
        }*/

     stage("Docker build backend") {
    steps {
        script {
            dockerImage = docker.build "ahmedbachir/devops-backend"
            sh 'docker push ahmedbachir/devops-backend'
        }
    }
}


stage("Running Docker Compose") {
    steps {
        script {
        sh 'docker compose up -d'
}
    }
}
/*stage('Build Backend') {
            steps {
                
                        sh 'mvn clean'
                    }
                }
            }
        }*/



   /*stage('Push Docker Images to Docker Hub') {
    steps {
        script {
            docker.withRegistry('', registryCredential) {
                dockerImage.push()
                sh "docker tag $registry:$BUILD_NUMBER ahmedbachir/devops-backend:latest"
                sh 'docker push ahmedbachir/devops-backend:latest'
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
    }
}*/

}
}
