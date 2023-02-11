instanceName="zeebe-cluster-instance"

# Clone the project
gcloud compute ssh $instanceName --zone europe-west4-a -- 'git clone https://github.com/eliodemollari/zeebe_benchmarking.git'

# run first configuration of zeebe
# to run different zeebe_cluster configurations you can change the path: /broker_three/partition_5 to the desired config folder
gcloud compute ssh $instanceName --zone europe-west4-a -- 'cd zeebe_benchmarking/zeebe_cluster/broker_three/partition_5 && sudo docker compose up -d'
