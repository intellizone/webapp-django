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
          serviceAccount: ecr-sa
          serviceAccountName: ecr-sa
        '''
    }
  }
  stages {
    stage('Run maven') {
      steps {
        container('docker') {
          sh 'docker version;'
          
        }
      }
    }
  }
}