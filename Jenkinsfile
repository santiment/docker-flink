podTemplate(label: 'docker-flink', containers: [
  containerTemplate(name: 'docker', image: 'docker', ttyEnabled: true, command: 'cat', envVars: [
    envVar(key: 'DOCKER_HOST', value: 'tcp://docker-host-docker-host:2375')
  ])
]) {
  node('docker-flink') {
    container('docker') {
      def scmVars = checkout scm
      def commitHash = scmVars.GIT_COMMIT

      stage('Build 1.4 Image') {
        if (env.BRANCH_NAME == "master") {
          withDockerRegistry([ credentialsId: "dockerHubCreds", url: "" ]) {
            sh "docker build -t santiment/flink:1.4-${env.BRANCH_NAME} -f Dockerfile.1.4 ."
            sh "docker tag santiment/flink:1.4-${env.BRANCH_NAME} santiment/flink:1.4-debian-${commitHash}"
            sh "docker push santiment/flink:1.4-${env.BRANCH_NAME}"
            sh "docker push santiment/flink:1.4-debian-${commitHash}"
          }
        }
      }

      stage('Build 1.6 image') {
        if (env.BRANCH_NAME == "master") {
          withDockerRegistry([ credentialsId: "dockerHubCreds", url: "" ]) {
            sh "docker build -t santiment/flink:1.6-${env.BRANCH_NAME} -f Dockerfile.1.6 ."
            sh "docker tag santiment/flink:1.6-${env.BRANCH_NAME} santiment/flink:1.6-debian-${commitHash}"
            sh "docker push santiment/flink:1.6-${env.BRANCH_NAME}"
            sh "docker push santiment/flink:1.6-debian-${commitHash}"
          }
        }
      }

      stage('Build 1.7 image') {
        if (env.BRANCH_NAME == "master") {
          withDockerRegistry([ credentialsId: "dockerHubCreds", url: "" ]) {
            sh "docker build -t santiment/flink:1.7-${env.BRANCH_NAME} -f Dockerfile.1.7 ."
            sh "docker tag santiment/flink:1.7-${env.BRANCH_NAME} santiment/flink:1.7-debian-${commitHash}"
            sh "docker push santiment/flink:1.7-${env.BRANCH_NAME}"
            sh "docker push santiment/flink:1.7-debian-${commitHash}"
          }
        }
      }
    }
  }
}
