# Overview

The pipeline is used to query data from SQL Server and insert it into BigQuery. The pipeline is scheduled to run at a specific time using Cloud Scheduler. The pipeline is deployed as a containerized service using Cloud Run. The pipeline is triggered by a HTTP request by Cloud Scheduler.

The Cloud Run service is written in Python and uses the pyodbc library to connect to SQL Server and the google-cloud-bigquery library to connect to BigQuery. The pipeline is deployed using Cloud Build and the docker image is stored in Artifact Registry. The pipeline is triggered by a HTTP request by Cloud Scheduler at scheduled time.

# Services Required

- Artifact Registry: This is required to store the docker images. An image of the function is created and pushed to the registry.
- Cloud Run: This is required to deploy the function as a containerized service.
- Cloud Scheduler: This is required to schedule the function to run at a specific time.

# Permissions Required

A service account is required to be created with the following permissions:

- Artifact Registry Reader: This is required to pull the docker image from the registry. Required for Cloud Run to pull the image and deploy the function.
- Artifact Registry Writer: This is required to push the docker image to the registry. Required for deployment of the function post development.
- Cloud Run Admin: This is required to deploy the function as a containerized service.
- Cloud Scheduler Admin: This is required to create the scheduler to run the function at a specific time.
- BigQuery Data Editor: This is required to insert data into the BigQuery table.
- BigQuery User: This is required to query the BigQuery table.
- Storage Object User: This is required to create and read objects to the Cloud Storage bucket.

> Note: The roles can be changed later by looking at the Security Insights and identifying the permissions required after using the services for a while. Then specific permissions can be granted to the service account.
