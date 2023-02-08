instanceName="zeebe-instance"

# install dependencies
gcloud compute ssh $instanceName --zone europe-west4-a -- 'cd zeebe_benchmarking && sudo npm install'

#create the load
gcloud compute ssh $instanceName --zone europe-west4-a -- 'cd zeebe_benchmarking/zeebe_client && sudo node zeebe_client_complex.js'
