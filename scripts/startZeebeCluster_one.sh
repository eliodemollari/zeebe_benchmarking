instanceName="zeebe-instance"

# Clone the project
gcloud compute ssh $instanceName --zone europe-west4-a -- 'git clone https://github.com/eliodemollari/zeebe_benchmarking.git'

# run prometheus
gcloud compute ssh $instanceName --zone europe-west4-a -- 'cd zeebe_benchmarking/monitoring && sudo docker compose up -d'

# run first configuration of zeebe
gcloud compute ssh $instanceName --zone europe-west4-a -- 'cd zeebe_benchmarking/zeebe_cluster/cluster_config_one && sudo docker compose up -d'
