import pyarrow as pa
import pyarrow.parquet as pq
import os


if 'data_exporter' not in globals():
    from mage_ai.data_preparation.decorators import data_exporter

os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = "/home/src/dataengproject-417719-a6a2d06410da.json"

bucket_name = 'life_expectancy_dataengproject-417719'
project_id = 'dataengproject-417719'

table_name = 'life_expectancy_data'

root_path = f'{bucket_name}/{table_name}'

@data_exporter
def export_data(data, *args, **kwargs):
    #data['tpep_pickup_date'] = data['tpep_pickup_datetime'].dt.date

    table = pa.Table.from_pandas(data)

    gcs = pa.fs.GcsFileSystem()

    pq.write_to_dataset(
        table,
        root_path=root_path,
        basename_template='life_expectancy_raw_data-{i}.parquet',
        filesystem=gcs,
        existing_data_behavior="overwrite_or_ignore"
    )

