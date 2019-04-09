pipeline{
    agent any
    parameters{
        string(name:"rke_version",defaultValue:"0.2.0",description:"RKE version")
        string(name:"kubectl_version",defaultValue:"1.14.1",description: "Kubectl version")
    }
    stages{
        stage("Preperation"){
            steps{
                echo "========Preperation========"
                git 'https://github.com/kanuahs/rke-packer.git'
            }
            post{
                success{
                    echo "========Preperation executed successfully========"
                }
                failure{
                    echo "========Preperation execution failed========"
                }
            }
        }
        stage("Build"){
            steps{
                echo "====++++executing Build++++===="
                dir("ubuntu"){
                sh "packerio build \
                    -var rke_version=${params.rke_version} \
                    -var kubectl_version=${params.kubectl_version} \
                    -only=ubuntu-1604-vbox \
                    ubuntu1604.json"
                }
            }
            post{
                success{
                    echo "====++++Build executed succesfully++++===="
                }
                failure{
                    echo "====++++Build execution failed++++===="
                }
            }
        }
    }
    post{
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}