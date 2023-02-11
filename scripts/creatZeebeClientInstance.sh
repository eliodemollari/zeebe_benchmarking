instanceName="zeebe-client-instance"

gcloud compute instances create $instanceName \
    --image=ubuntu-minimal-2210-kinetic-arm64-v20230126 \
    --image-project=ubuntu-os-cloud \
    --tags=default-allow-http,default-allow-https,https-server,http-server \
    --zone europe-west4-a


# install nodes
gcloud compute ssh $instanceName --zone europe-west4-a -- 'sudo curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -'
gcloud compute ssh $instanceName --zone europe-west4-a -- 'sudo apt install -y nodejs'

# clone the repo
gcloud compute ssh $instanceName --zone europe-west4-a -- 'git clone https://github.com/eliodemollari/zeebe_benchmarking.git'

# install dependencies
gcloud compute ssh $instanceName --zone europe-west4-a -- 'cd zeebe_benchmarking && sudo npm install'