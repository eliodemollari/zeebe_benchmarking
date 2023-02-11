instanceName="zeebe-client-instance"

#create the load deploying the simple BPMN process
gcloud compute ssh $instanceName --zone europe-west4-a -- 'cd zeebe_benchmarking/zeebe_client && sudo node zeebe_client.js'

#create the load deploying the more complex BPMN process
# gcloud compute ssh $instanceName --zone europe-west4-a -- 'cd zeebe_benchmarking/zeebe_client && sudo node zeebe_client_complex.js'