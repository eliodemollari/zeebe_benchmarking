# Zeebe - Cloud Service Benchmarking

To observe the metrics of Camunda Platform 7 (Zeebe) instances, you extract the data from the running instances and display them in a meaningful way. For the purposes of this article, we will use Prometheus for data extraction and Grafana for dashboarding and alerting.

**Prometheus** is an open-source systems monitoring toolkit that collects and stores its metrics as time series data, i.e., metrics information is stored with the timestamp at which it was recorded, alongside optional key-value pairs called labels. You configure the data endpoints you want to periodically extract metrics from and Prometheus stores this information as time series data.

**Grafana** is an open-source toolkit that enables you to query, visualize, alert on, and explore your metrics, logs, and traces wherever they are stored. Grafana provides you with tools to turn time series data into insightful graphs and visualizations. Using Grafana Alerting, you can define alert rules and send alerts through a number of different channels, including PagerDuty, SMS, email, VictorOps, OpsGenie, or Slack.
