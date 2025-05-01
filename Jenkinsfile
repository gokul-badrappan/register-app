pipeline {
    agent { label 'Jenkins-Agent' }

    tools {
        jdk 'Java17'
        maven 'Maven3'
    }

    environment {
        APP_NAME = "register-app-pipeline"
        RELEASE = "1.0.0"
        DOCKER_USER = "gokul0880"
        IMAGE_NAME = "${DOCKER_USER}/${APP_NAME}"
        IMAGE_TAG = "${RELEASE}-${BUILD_NUMBER}"
        DOCKER_CREDENTIAL_ID = 'dockerhub' // Replace with your DockerHub credential ID
        JENKINS_API_TOKEN = credentials("JENKINS_API_TOKEN")
    }

    stages {
        stage("Cleanup Workspace") {
            steps {
                cleanWs()
            }
        }

        stage("Checkout from SCM") {
            steps {
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/gokul-badrappan/register-app'
            }
        }

        stage("Build Application") {
            steps {
                sh "mvn clean package -DskipTests=false"
            }
        }

        stage("Test Application") {
            steps {
                sh "mvn test"
            }
        }

        stage("SonarQube Analysis") {
            steps {
                script {
                    withSonarQubeEnv(credentialsId: 'jenkins-sonarqube-token') {
                        sh "mvn sonar:sonar"
                    }
                }
            }
        }

        stage("Quality Gate") {
            steps {
                script {
                    waitForQualityGate abortPipeline: false, credentialsId: 'jenkins-sonarqube-token'
                }
            }
        }

        stage("Prepare Docker Context") {
            steps {
                script {
                    sh 'mkdir -p docker-context'
                    sh 'cp target/*.war docker-context/app.war'
                    sh 'cp Dockerfile docker-context/'
                }
            }
        }

        stage("Build & Push Docker Image") {
            steps {
                script {
                    docker.withRegistry('', DOCKER_CREDENTIAL_ID) {
                        def dockerImage = docker.build("${IMAGE_NAME}:${IMAGE_TAG}", 'docker-context')
                        dockerImage.push()
                        dockerImage.push("latest")
                    }
                }
            }
        }

        stage("Trivy Scan") {
            steps {
                sh "docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image ${IMAGE_NAME}:${IMAGE_TAG} --no-progress --scanners vuln --exit-code 0 --severity HIGH,CRITICAL --format table"
            }
        }

        stage("Cleanup Docker Images") {
            steps {
                sh "docker rmi ${IMAGE_NAME}:${IMAGE_TAG} || true"
                sh "docker rmi ${IMAGE_NAME}:latest || true"
            }
        }

        stage("Trigger CD Pipeline") {
            steps {
                script {
                    def cd_url = "http://ec2-13-202-21-200.ap-south-1.compute.amazonaws.com:8080/job/gitops-register-app-cd/buildWithParameters"
                    sh "curl -v -k --user clouduser:${JENKINS_API_TOKEN} -X POST -H 'cache-control: no-cache' -H 'content-type: application/x-www-form-urlencoded' --data-urlencode IMAGE_TAG=${IMAGE_TAG} ${cd_url}?token=gitops-token"
                }
            }
        }
    }
}
