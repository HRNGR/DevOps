pipeline {
    agent any
    stages('build') {
        steps {
            echo"Wellcome to my first pipeline"
            sh 'echo second step 2'
            sh 'echo another step 3'
            sh '''
            echo 'Multiline"
            echo 'Example'
            '''
            echo 'not using shell'
            {
                
            }
        }
    }
}