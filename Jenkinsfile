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
            tty: true
        '''
    }
  }
  stages {
    stage('Run maven') {
      steps {
        container('docker') {
          sh 'docker version'
        }
      }
    }
  }
}