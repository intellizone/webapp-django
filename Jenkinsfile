pipeline {
  agent {
    kubernetes {
      yaml '''
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
        '''
    }
  }
  stages {
    stage('Setup build') {
      steps {
        container('docker') {
          sh 'docker version;'
          sh 'apk update aws-cli'
          sh 'aws sts get-caller-identity'
        }
      }
    }
  }
}