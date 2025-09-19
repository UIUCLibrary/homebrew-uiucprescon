def formulas = []
def casks = []
bottlesBuild = []
node("!windows") {
    stage("Checking for Homebrew files"){
        ws{
            checkout scm
            findFiles( excludes: '', glob: 'Formula/*.rb').each{
                echo "Found ${it.path}"
                formulas << it
            }
            findFiles( excludes: '', glob: 'Casks/*.rb').each{
                echo "Found ${it.path}"
                casks << it
            }
        }
    }
}

def getHomebrewRepositoryPrefix(){
    return sh(returnStdout: true, script: 'brew --repository').trim()
}

pipeline{
    agent none
    parameters {
        booleanParam defaultValue: true, description: '', name: 'AUDIT_FORMULA'
        booleanParam defaultValue: false, description: '', name: 'AUDIT_FORMULA_ONLINE_OPTION'
        booleanParam defaultValue: false, description: '', name: 'BOTTLE_FORMULA'
        booleanParam defaultValue: false, description: '', name: 'BOTTLE_UPLOAD'
    }
    stages{
        stage('Audit'){
            when{
                equals expected: true, actual: params.AUDIT_FORMULA
                beforeAgent true
            }
            environment{
                TAP_USERNAME = 'homebrew-releaser'
                TAP_NAME = 'test'
            }
            parallel{
                stage('Audit Formulas'){
                    agent {
                        label 'mac && homebrew'
                    }
                    environment{
                        HOMEBREW_GITHUB_API_TOKEN=credentials('GithubAPIkey')
                        TAP_PATH="${getHomebrewRepositoryPrefix()}/Library/Taps/${env.TAP_USERNAME}/homebrew-${env.TAP_NAME}"
                    }
                    steps{
                        lock("homebrew ${env.NODE_NAME}"){
                            script{
                                try{
                                    sh(label: 'Update homebrew', script: 'brew update')
                                    sh(label: 'Create a testing tap',
                                       script: """brew tap-new ${env.TAP_USERNAME}/${env.TAP_NAME} --no-git"""
                                    )
                                    sh(label: 'Adding homebrew formula files to test tap',
                                       script: "cp -r Formula/* ${env.TAP_PATH}/Formula"
                                    )
                                    findFiles(glob: 'Formula/*.rb').each{
                                        stage("${it}"){
                                           withEnv(["file=${it}"]) {
                                              catchError(buildResult: 'UNSTABLE', message: "${env.file} failed audit", stageResult: 'UNSTABLE') {
                                                 sh(label: "Auditing ${env.file}", script: "brew audit --verbose ${params.AUDIT_FORMULA_ONLINE_OPTION ? '--online' :''} --formula ${env.TAP_USERNAME}/${env.TAP_NAME}/\$(basename \${file%.rb})")
                                              }
                                           }
                                        }
                                    }
                                } finally {
                                   sh(label: 'Removing testing tap', script: 'brew untap --verbose --force $TAP_USERNAME/$TAP_NAME')
                                }
                             }
                        }
                    }
                }
                stage('Audit Casks'){
                    agent {
                        label 'mac && homebrew'
                    }
                    environment{
                        HOMEBREW_GITHUB_API_TOKEN=credentials('GithubAPIkey')
                        TAP_PATH="${getHomebrewRepositoryPrefix()}/Library/Taps/${env.TAP_USERNAME}/homebrew-${env.TAP_NAME}"
                    }
                    steps{
                        lock("homebrew ${env.NODE_NAME}"){
                            script{
                                try{
                                    sh(label: 'Update homebrew', script: 'brew update')
                                    sh(label: 'Create a testing tap',
                                       script: 'brew tap-new $TAP_USERNAME/$TAP_NAME --no-git'
                                    )
                                    sh(
                                        label: 'Adding homebrew casks files to test tap',
                                        script: "ln -s ${env.WORKSPACE}/Casks ${env.TAP_PATH}/Casks"
                                    )
                                    findFiles(glob: 'Casks/*.rb').each{
                                        stage("${it}"){
                                            withEnv(["file=${it}"]) {
                                                catchError(buildResult: 'UNSTABLE', message: "${env.file} failed audit", stageResult: 'UNSTABLE') {
                                                    sh(label: "Auditing ${env.file}", script: "brew audit --verbose ${params.AUDIT_FORMULA_ONLINE_OPTION ? '--online' :''} --cask ${env.TAP_USERNAME}/${env.TAP_NAME}/\$(basename \${file%.rb})")
                                                }
                                            }
                                        }
                                    }
                                } finally {
                                    sh(label: 'Removing testing tap', script: 'brew untap --force $TAP_USERNAME/$TAP_NAME')
                                }
                            }
                        }
                    }
                }
            }
        }
        stage('Homebrew Bottles'){
            options {
                lock('homebrew')
            }
            when{
                equals expected: true, actual: params.BOTTLE_FORMULA
                beforeInput true
                beforeAgent true
                beforeOptions true
            }
            input {
                message 'Build the following'
                parameters {
                    choice choices: formulas, description: 'Bottle Homebrew formula', name: 'HOMEBREW_FORMULA_FILE'
                    booleanParam defaultValue: false, description: 'Use head instead of version in formula', name: 'INSTALL_HEAD'
                    choice(
                        choices: [
                            'https://nexus.library.illinois.edu/repository/homebrew-bottles',
                            'https://nexus.library.illinois.edu/repository/homebrew-bottles-beta'
                        ],
                        description: 'Where should the bottle files be deployed?',
                        name: 'BOTTLE_URL_ROOT'
                    )
                }
            }
            environment{
                HOMEBREW_BUILD_TAP='uiuclibrary/build'
            }
// todo: Make this upload to folder based on formulat name
// fixme: Make sure that this uploaded as file name not local file name
            stages{
                stage('Build Bottles'){
                    matrix {
                        axes {
                            axis {
                                name 'ARCHITECTURE'
                                values 'arm64','x86_64'
                            }
                        }
                        stages {
                            stage('Build Bottle') {
                                agent {
                                    label "mac && homebrew && ${ARCHITECTURE}"
                                }
                                steps{
                                    withEnv([
                                        "HOMEBREW_FORMULA_FILE=${HOMEBREW_FORMULA_FILE}",
                                        "BOTTLE_URL_ROOT=${BOTTLE_URL_ROOT}"
                                        ]) {
                                        script{
                                            try{
                                                sh '''brew tap-new $HOMEBREW_BUILD_TAP --no-git
                                                      cp -r Formula/* $(brew --repo $HOMEBREW_BUILD_TAP)/Formula/
                                                   '''
                                                try{
                                                    sh '''brew install --build-bottle --verbose --formula "$(brew --repo $HOMEBREW_BUILD_TAP)/$HOMEBREW_FORMULA_FILE"
                                                          brew test "$(brew --repo $HOMEBREW_BUILD_TAP)/$HOMEBREW_FORMULA_FILE"
                                                          brew bottle --json  --root-url=${BOTTLE_URL_ROOT}/ "$(brew --repo $HOMEBREW_BUILD_TAP)/$HOMEBREW_FORMULA_FILE"
                                                       '''
                                                    archiveArtifacts(artifacts: '*.bottle.tar.gz,*.bottle.json', allowEmptyArchive: true)
                                                    def stashName = "bottle-${ARCHITECTURE}"
                                                    stash includes: '*.bottle.tar.gz,*.bottle.json', name: stashName
                                                    bottlesBuild << stashName
                                                } finally{
                                                    sh 'brew uninstall --force --formula "$(brew --repo $HOMEBREW_BUILD_TAP)/$HOMEBREW_FORMULA_FILE"'
                                                }
                                            } finally {
                                                sh 'brew untap --verbose --force $HOMEBREW_BUILD_TAP'
                                            }
                                        }
                                    }
                                }
                                post{
                                    failure{
                                        sh "brew config"
                                    }
                                    cleanup{
                                        sh "brew tap --repair"
                                        cleanWs(
                                            deleteDirs: true,
                                            patterns: [
                                                [pattern: '*.bottle.*', type: 'INCLUDE'],
                                                [pattern: 'logs/', type: 'INCLUDE'],
                                                [pattern: 'home/', type: 'INCLUDE'],
                                                [pattern: 'steps_output.txt', type: 'INCLUDE'],
                                            ]
                                        )
                                    }
                                }
                            }
                        }
                    }
                }
                stage("Upload new bottle to repository"){
                    agent any
                    input {
                        message 'Upload artifact?'
                        parameters {
                            credentials credentialType: 'com.cloudbees.plugins.credentials.common.StandardCredentials', defaultValue: 'jenkins-nexus', name: 'NEXUS_CREDS', required: true
                        }
                    }
                    options {
                        retry(3)
                    }
                    when{
                        equals expected: true, actual: params.BOTTLE_UPLOAD
                        beforeInput true
                    }
                    steps{
                        script{
                            bottlesBuild.each{
                                unstash "${it}"
                            }
                            findFiles( excludes: '', glob: '*.bottle.json').each{
                                def formulaName = HOMEBREW_FORMULA_FILE.replace('Formula/', "").replace(".rb", "")
                                def jsonData = readJSON( file: it.path)
                                def bottle
                                def key = "uiuclibrary/build/${formulaName}".toLowerCase()
                                try{
                                    bottle = jsonData[key]['bottle']
                                } catch(Exception e){
                                    echo "jsonData = ${jsonData}"
                                    error "invalid data with key ${key}"
                                }
                                bottle['tags'].each { tag, tagData ->
                                    def filename
                                    def localFilename
                                    try{
                                        localFilename = tagData['local_filename']
                                        if(!localFilename){
                                            error "${tag} is missing required field local_filename"
                                        }

                                        filename = tagData['filename']
                                        if(!filename){
                                            error "${tag} is missing required field filename"
                                        }
                                    } catch(Exception e){
                                        echo "Unable to extract the information needed to upload file:. Reason: ${e}"
                                        throw e
                                    }
                                    def put_response
                                    try{
                                        put_response = httpRequest authentication: NEXUS_CREDS, httpMode: 'PUT', uploadFile: tagData['local_filename'], url: "${BOTTLE_URL_ROOT}/${filename}", wrapAsMultipart: false
                                    } catch(Exception e){
                                        echo "Unable to upload bottle with the following information.\n${tagData}"
                                        echo "http request response: ${put_response}"
                                        throw e;
                                    }
                                }
                            }
                        }
                    }
                    post{
                        cleanup{
                            cleanWs(
                                deleteDirs: true,
                                patterns: [
                                    [pattern: '*.bottle.*', type: 'INCLUDE'],
                                ]
                            )
                        }
                    }
                }
            }
        }
    }
}