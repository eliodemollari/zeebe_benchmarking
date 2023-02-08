instanceName="zeebe-instance"

gcloud compute scp $instanceName:~/result.txt result.txt --zone europe-west4-a
