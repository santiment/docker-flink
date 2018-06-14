podTemplate(label: 'docker-flink', containers: [
  containerTemplate(name: 'docker', image: 'docker', ttyEnabled: true, command: 'cat', envVars: [
    envVar(key: 'DOCKER_HOST', value: 'tcp://docker-host-docker-host:2375')
  ])
]) {
  node('docker-flink') {
    stage('Build Image') {
      container('docker') {
        def scmVars = checkout scm

        if (env.BRANCH_NAME == "master") {
          withDockerRegistry([ credentialsId: "dockerHubCreds", url: "" ]) {
              sh "docker build -t santiment/flink:${env.BRANCH_NAME} ."
              sh "docker push santiment/flink:${env.BRANCH_NAME}"
          }
        }
      }
    }
  }
}
