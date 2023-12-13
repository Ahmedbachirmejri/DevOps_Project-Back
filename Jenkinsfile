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

       

        stage('Compile Backend') {
            steps {
                script {
                        sh 'chmod +x mvnw'
                        sh './mvnw compile'
                        sh 'mvn install'
                }
            }
        }

        
        stage('Build Frontend') {
            steps {
                script {
                    dir('DevOps_Project_Front') {
                        sh 'npm install'
                        sh 'npm run build'
                    }
                }
            }
        }

        stage('SonarQube') {
    steps {
        script {
            withSonarQubeEnv(installationName: 'Sonar_devops') {
                    sh 'mvn clean verify sonar:sonar \
                        -Dsonar.projectName="Devops-project-V" \
                        -Dsonar.host.url=http://10.0.2.15:9000 \
                        -Dsonar.token=squ_2dadf28dc342ab96e1944d18a199b841d85e6c14'
            }
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

        stage('Test Backend') {
            steps {
                script {
                    sh 'mvn test'
                    
                }
            }
        }

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

        

     
}
}
