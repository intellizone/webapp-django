pipeline {
  agent {
    kubernetes {
      yaml '''
        apiVersion: v1
        kind: Pod
        spec:
          containers:
          - name: docker
            image: docker
            securityContext:
                privileged: true
            tty: true
          serviceAccountName: ecr-sa
        '''
    }
  }
  stages {
    stage('Setup build') {
      steps {
        container('docker') {
          sh 'docker version;'
          sh 'sleep 2700'
        }
      }
    }
  }
}