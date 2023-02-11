zeebeClientInstanceName="zeebe-client-instance"
prometheusInstanceName="prometheus-instance"
zeebeClusterInstanceName="zeebe-cluster-instance"

# delete zeebe-client
gcloud compute instances delete $zeebeClientInstanceName --zone europe-west4-a --delete-disks="all" --quiet

# delete zeebe-cluster
gcloud compute instances delete $zeebeClusterInstanceName --zone europe-west4-a --delete-disks="all" --quiet

# delete prometheus
gcloud compute instances delete $prometheusInstanceName --zone europe-west4-a --delete-disks="all" --quiet