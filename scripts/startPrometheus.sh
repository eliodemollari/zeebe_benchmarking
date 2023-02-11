instanceName="prometheus-instance"

# Clone the project
gcloud compute ssh $instanceName --zone europe-west4-a -- 'git clone https://github.com/eliodemollari/zeebe_benchmarking.git'

# run prometheus
gcloud compute ssh $instanceName --zone europe-west4-a -- 'cd zeebe_benchmarking/monitoring && sudo docker compose up -d'