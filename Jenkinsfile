pipeline{
    agent any
    parameters{
        string(name:"rke_version",defaultValue:"v0.2.0",description:"RKE version")
        string(name:"kubectl_version",defaultValue:"v1.14.1",description: "Kubectl version")
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
        stage("Build QEMU"){
            steps{
                echo "====++++executing Build QEMU++++===="
                dir("ubuntu"){
                sh "packerio build \
                    -var rke_version=${params.rke_version} \
                    -var kubectl_version=${params.kubectl_version} \
                    -only=ubuntu-1604-qemu \
                    ubuntu1604.json"
                }
            }
            post{
                success{
                    echo "====++++Build QEMU executed succesfully++++===="
                }
                failure{
                    echo "====++++Build QEMU execution failed++++===="
                }
            }
        }
        stage("Convert to VMDK"){
            steps{
                echo "====++++executing Convert to VMDK++++===="
                dir("ubuntu"){
                    sh "qemu-img convert -f qcow2 -O vmdk output-ubuntu-1604-qemu/packer-ubuntu-1604-qemu conversion-files/ubuntu-disk001.vmdk"
                }
                dir("ubuntu/conversion-files"){
                    sh "packerio build ova-builder.json"
                }
            }
            post{
                success{
                    echo "====++++Convert to VMDK executed succesfully++++===="
                }
                failure{
                    echo "====++++Convert to VMDK execution failed++++===="
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