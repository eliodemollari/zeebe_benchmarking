instanceName="zeebe-instance"

gcloud compute instances delete $instanceName --zone europe-west4-a --delete-disks="all" --quiet
