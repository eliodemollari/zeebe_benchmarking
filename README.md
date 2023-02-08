# Zeebe - Cloud Service Benchmarking

Zeebe is the process automation engine powering Camunda Platform 8.
With Zeebe you can:
- Define processes graphically in BPMN 2.0.
- Choose any gRPC-supported programming language to implement your workers.
- Build processes that react to events from Apache Kafka and other messaging platforms.
- Use as part of a software as a service (SaaS) offering with Camunda Platform 8 or deploy with Docker and Kubernetes (in the cloud or on-premises) with Camunda Platform 8 Self-Managed.
- Scale horizontally to handle very high throughput.
- Rely on fault tolerance and high availability for your processes.
- Export processes data for monitoring and analysis (currently only available through the Elasticsearch exporter added in Camunda Platform 8 Self-Managed).
- Engage with an active community.

## Prerequisites
- Install the [gcloud CLI](https://cloud.google.com/sdk/docs/install)
- Authorize with a user [account](https://cloud.google.com/sdk/docs/authorizing#authorize_with_a_user_account)

## General setup  

Clone the project:
```
git clone https://github.com/eliodemollari/zeebe_benchmarking.git
```

Create a VM instance on Google Cloud Platform: 
```
/scripts/createInstance.sh
```
The following command will create a VM instance and install ```nodejs```, ```npm```, ```docker```. Needed to run the Zeebe_client and start Zeebe_cluster and Prometheus (both running on docker containers).

Start both Zeebe_cluster (SUT) and Prometheus by running: 
```
/scripts/startZeebeCluster_one.sh
```
The script with start a Zeebe_cluster docker container with the following configuration:

```
No. Brokers: 3
Partition: 2
ReplicationFactor: 3
```
To summarize:

To scale throughput, you can increase the number of Partitions to distribute processing over machines in a cluster
For fault tolerance, you can configure the ReplicationFactor; replications function as “hot standby” of your Partitions that are stored on different brokers, making it possible to quickly resume processing after a failure. 

For the second configuration you could run the following command:
```
/scripts/startZeebeCluster_one.sh
```

Which start a Zeebe Cluster with the following configuration:
```
No. Brokers: 3
Partition: 3
ReplicationFactor: 3
```

After having both Zeebe Cluster and Prometheus running, the last step is to start the Zeebe Client and generate load (by deploying one of the two processes into the Cluster). 

Run:
```
/scripts/startZeebeClient_simple.sh
```
to deploy the simple BPMN process

Or choose to deploy the complex BPMN process by running:
```
/scripts/startZeebeClient_complex.sh
```

After the client is running, we can get a visualisation of the instances that are being created and executed by visiting ```http://VM_EXTERNAL_IP_ADDRESS:9090```

```
NOTE:
If Prometheus is not able to scrape the Zeebe cluster endpoint check here: http://VM_EXTERNAL_IP_ADDRESS:9090/targets. You may need to do the following change on the monitoring/prometheus.yml file:
Change 'host.docker.internal:9600' to 'VM_EXTERNAL_IP_ADDRESS:9600'
```

After starting the Zeebe Client, to visualise the results visit: 
```
http://VM_EXTERNAL_IP_ADDRESS:9090/graph?g0.expr=zeebe_gateway_total_requests_total&g0.tab=0&g0.stacked=1&g0.show_exemplars=0&g0.range_input=30m&g1.expr=zeebe_executed_instances_total&g1.tab=0&g1.stacked=1&g1.show_exemplars=0&g1.range_input=30m
```

### The structure of the project:
- Monitoring
- Processes
- Scripts
- Zeebe_client
- Zeebe_cluster

#### Monitoring
To observe the metrics of Camunda Platform 8 (Zeebe) instances, you extract the data from the running instances and display them in a meaningful way. For the purposes of this article, we will use Prometheus for data extraction.

**Prometheus** is an open-source systems monitoring toolkit that collects and stores its metrics as time series data, i.e., metrics information is stored with the timestamp at which it was recorded, alongside optional key-value pairs called labels. You configure the data endpoints you want to periodically extract metrics from and Prometheus stores this information as time series data.


#### Processes
This folder contains the two BPMN processes that will be deployed and executed by zeebe. For the purpose of this project, I have created two processes with a different level of complexity, as you can in the images below:

Simple BPMN Process:
![bug_reported](https://user-images.githubusercontent.com/34032442/217483784-e8708f31-e4a7-4181-8bf8-90bc11eaf1e5.png)

Complex BPMN Process:
![online_ticket_purchase](https://user-images.githubusercontent.com/34032442/217483497-90879e10-6742-4ba9-9962-2136dcb6b785.png)


#### Scripts
Here we can find the scripts necessary to: 
- Create a google cloud instance
- Start Zeebe Client
- Start Zeebe Cluster and Prometheus
- Delete the instance
- Get results


#### Zeebe_client
Used to generate load by deploying BPMN process instances on zeebe 


#### Zeebe_cluster
Starts the main SUT in two different configurations. 





