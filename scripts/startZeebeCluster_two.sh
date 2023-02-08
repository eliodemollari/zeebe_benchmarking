instanceName="zeebe-instance"

# Clone the project
gcloud compute ssh $instanceName --zone europe-west4-a -- 'git clone https://github.com/eliodemollari/zeebe_benchmarking.git'

# run prometheus
gcloud compute ssh $instanceName --zone europe-west4-a -- 'cd zeebe_benchmarking/monitoring && sudo docker compose up -d'

# rung second configuration of zeebe_cluster
gcloud compute ssh $instanceName --zone europe-west4-a -- 'cd zeebe_benchmarking/zeebe_cluster/cluster_config_two && sudo docker compose up -d'
