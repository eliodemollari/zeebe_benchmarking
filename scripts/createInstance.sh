instanceName="zeebe-instance"

gcloud compute instances create $instanceName \
    --image=ubuntu-minimal-2210-kinetic-arm64-v20230126 \
    --image-project=ubuntu-os-cloud \
    --zone europe-west4-a


# install nodes
gcloud compute ssh $instanceName --zone europe-west4-a -- 'sudo curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -'
gcloud compute ssh $instanceName --zone europe-west4-a -- 'sudo apt install -y nodejs'

# install docker engine
gcloud compute ssh $instanceName --zone europe-west4-a -- 'sudo apt-get update'
gcloud compute ssh $instanceName --zone europe-west4-a -- 'sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release'

gcloud compute ssh $instanceName --zone europe-west4-a -- 'sudo mkdir -p /etc/apt/keyrings'
gcloud compute ssh $instanceName --zone europe-west4-a --  'sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg'


gcloud compute ssh $instanceName  --zone europe-west4-a -- 'sudo echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null'

gcloud compute ssh $instanceName  --zone europe-west4-a -- 'sudo apt-get update'
gcloud compute ssh $instanceName  --zone europe-west4-a -- 'sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin'
