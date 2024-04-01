
# Project overview

## Dataset

For this learning project, the [Health](https://data.worldbank.org/topic/health) dataset from [World Bank Open Data](https://data.worldbank.org/) has been chosen. It contains plenty of metrics from which the following have been selected to build the final dashboard:

- Population, total
- Population, male
- Population, female
- Life expectancy at birth, male (years)
- Life expectancy at birth, total (years)
- Life expectancy at birth, female (years)

The dataset includes data broken down by countries and years effective from the 1960 year. For the final dashboard, the data for the last 10 years (2013 - 2022) has been taken.
The data file can be loaded directly from the [site](https://api.worldbank.org/v2/en/topic/8?downloadformat=csv). For this project downloaded files have been saved in Github, from where they are being processed. 


## Technologies

- Cloud: GCP
- Infrastructure as code (IaC): Terraform - for setting infrastructure.
- Workflow orchestration: Mage
	- for the pipeline for processing selected dataset and putting it to a datalake (GCS);
	- for the pipeline for moving the data from the lake to a data warehouse (BigQuery)
- Data Warehouse: BigQuery - for data warehouse.
- Batch processing: dbt - for transforming the data in the data warehouse for preparing it for visualization.
- Visualization: Looker - for building a dashboard.


## Dashboard
The dashboard shows the population and life expectancy by country and year. It can be accessible by the [link](https://lookerstudio.google.com/reporting/a992f160-b0a9-4422-8874-28eb883f14f8/page/lTmuD?access=viewer&requester=igomelch@gmail.com)
![](https://github.com/TOmelchenko/LifeExpectancyProject/blob/main/img/dashboard.png)



## Set up the project
### Preconditions
To reproduce the project the user should have:
1. The account in Google Cloud. (The free account can be created using this [link](https://www.googleadservices.com/pagead/aclk?sa=L&ai=DChcSEwjJm9zOo5yFAxWLloMHHWtRC8IYABABGgJlZg&ase=2&gclid=Cj0KCQjw8J6wBhDXARIsAPo7QA-7TwY9Z_NOp8MF5-Uikf-3tlIBo4E88nQHNl-IdFbo_50hqtZejC0aAvTnEALw_wcB&ohost=www.google.com&cid=CAESVuD2E44zX3le4ANwT04VAPiBvDmskYuwWTSw89U5atZl69L4sEN3eMiCBqGxrjf9CS_ir6abSbWFGfIZ_LnJGuOJfMD28qQRpuoHddoitniAF_WqhIoF&sig=AOD64_3eiEfZt1OLBL6LpLrAi6TI5Vyf5w&q&nis=4&adurl&ved=2ahUKEwi9zNTOo5yFAxVW_7sIHZhODNAQqyQoAHoECAoQDA))
2. Google Cloud SDK (The installation can be found [here](https://cloud.google.com/sdk/docs/install-sdk))
3. The account in dbt. (The free account can be opened using this [link](https://www.getdbt.com/signup))
4. Terraform installed. (The installation instructions can be found [here](https://developer.hashicorp.com/terraform/install))
5. Docker installed.

### Run the project
1. Clone the project repository: ```https://github.com/TOmelchenko/LifeExpectancyProject.git``` or ```git@github.com:TOmelchenko/LifeExpectancyProject.git```

2. In Google Cloud create a project: DataEngProject.
3. Create a service account: DataEngProject_DataUser
4. Grant this service account such privileges: BigQuery Admin, Storage Admin, Storage Object Admin, Viewer
5. Create JSON key (right-click on service account actions) and save it on your computer.
6. Copy data from your JSON key to the file ```~/LifeExpectancyProject/mage/dataengproject.json```
7. Point this key to the environmental variable GOOGLE_APPLICATION_CREDENTIALS:
```
export GOOGLE_APPLICATION_CREDENTIALS='~/LifeExpectancyProject/mage/dataengproject.json'

```
7. Authorize login - launch the command
```
gcloud auth application-default login

gcloud auth activate-service-account --key-file $GOOGLE_APPLICATION_CREDENTIALS

```

8. Create GCS bucket and BigQuery dataset using terraform:

```
cd terraform
terraform init
terraform plan ## Enter your project ID
terraform apply ## Enter your project ID
```
9. Load data using Mage:

- Run these commands:
```
cd mage
cp dev.env .env && rm dev.env
```

- Check the ```PROJECT_NAME=life_expectancy_project``` in the ```.env ``` file

- Run docker image and pull the latest version
```
docker compose up -d
docker pull mageai/mageai:latest
```

- The mage can be accessible via the link: http://localhost:6789/ You should see the ```life_expectancy_project``` with 2 pipelines:
![](https://github.com/TOmelchenko/LifeExpectancyProject/blob/main/img/pipelines.png)
- You have to set variables for each pipeline, which are being used in data exporter/data loader scripts. This can be done in 2 ways:
1. First:
- open the file ``` ~/LifeExpectancyProject/mage/life_expectancy_project/pipelines/life_expectancy_to_gcs_load/metadata.yaml``` and in the variables section in the very end set:
```
  BUCKET_NAME:  <your bucket name> ##life_expectancy_dataengproject-417719 - my bucket name
  PROJECT_ID: <your project id>##dataengproject-417719 - my project id

```
-  open the file ``` ~/LifeExpectancyProject/mage/life_expectancy_project/pipelines/life_expectancy_to_bigquery_load/metadata.yaml```  and in the variables section in the very end set:
```
  BUCKET_NAME:  <your bucket name> ##life_expectancy_dataengproject-417719 - my bucket name
  DB_NAME: <db name in BigQuery>##dataengproject-417719 - my db name that equal project id
```
2. Second: 
- open mage interface and in the variable section for ```life_expectancy_to_gcs_load``` pipeline update 2 variables:
![](https://github.com/TOmelchenko/LifeExpectancyProject/blob/main/img/pipeline_variables.png)
for the ```life_expectancy_to_bigquery_load``` pipeline update only BUCKET_NAME.

The pipelines are scheduled to run at 12.05 p.m. UTC and 12.15 p.m. UTC every day this month. Also, they can be launched manually:
- First - click on ```life_expectancy_to_gcs_load``` and press **Run once** button.
- Second - click on ```life_expectancy_to_bigquery_load``` and press **Run once** button.
After running these two pipelines you should have 3 parquet files in the GCP bucket:

```
dim_country-0.parquet
dim_indicator-0.parquet
life_expectancy_raw_data-0.parquet
```
and 3 tables in BigQuery dataset:
```
dim_country_stg
dim_indicator_stg
life_expectancy_stg

```
 
10. Prepare the final dataset with dbt:
- Set up BigQuery connection - load the JSON key, created in step 5.
![](https://github.com/TOmelchenko/LifeExpectancyProject/blob/main/img/dbt_bigquery_connection.png)
- Update in Connection the Dataset to ```life_expectancy```
![](https://github.com/TOmelchenko/LifeExpectancyProject/blob/main/img/dbt_dataset_name.png)
- Update in the file ```schema.yaml``` the old database name to the name you have in BigQuery
![](https://github.com/TOmelchenko/LifeExpectancyProject/blob/main/img/dbt_database_name.png)
- The dbt job runs At 12.30 pm UTC, only in April. The model can be also triggered manually by ```dbt run``` command.
- After dbt run is completed the ```datamart_life_expectancy``` view should be created in BigQuery:![](https://github.com/TOmelchenko/LifeExpectancyProject/blob/main/img/data_mart_view.png)

11. The final dashboard can be accessible by the [link](https://lookerstudio.google.com/reporting/a992f160-b0a9-4422-8874-28eb883f14f8/page/lTmuD?access=viewer&requester=igomelch@gmail.com)



Remark: To avoid additional charges from Google Cloud after the trial period it's better to remove the created GCS bucket and BigQuery dataset. It can be done manually or by terraform command:
```
terraform destroy
```

TODO
1. Tests
2. Load dataset file directly from the [site](https://data.worldbank.org/topic/health) not copying it to GitHub
3. Add clustering to the datamart table.


