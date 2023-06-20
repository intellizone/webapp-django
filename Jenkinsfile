podTemplate(yaml: '''
        apiVersion: v1
        kind: Pod
        spec:
          serviceAccountName: ecr-sa
          containers:
          - name: docker
            image: docker
            securityContext:
                privileged: true
            tty: true
''') {
  node(POD_LABEL) {
    stages {
    stage('Setup build') {
      steps {
        container('docker') {
          sh 'docker version;'
          sh 'apk add aws-cli'
          sh 'aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 535602729160.dkr.ecr.us-west-2.amazonaws.com'
        }
      }
    }
    stage('Building') {
      steps {
        container('docker') {
          sh "docker build -t webapp-django:v0.0.2 ."
          sh 'docker tag webapp-django:v0.0.2 535602729160.dkr.ecr.us-west-2.amazonaws.com/webapp-django:v0.0.2'
        }
      }
    }
    stage('Pushing to ECR') {
      steps {
        container('docker') {
          sh 'docker push 535602729160.dkr.ecr.us-west-2.amazonaws.com/webapp-django:v0.0.2'
        }
      }
    }
  }
}
}
