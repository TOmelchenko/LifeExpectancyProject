import pyarrow as pa
import pyarrow.parquet as pq
import os


if 'data_exporter' not in globals():
    from mage_ai.data_preparation.decorators import data_exporter

os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = "/home/src/dataengproject.json"


@data_exporter
def export_data(data, *args, **kwargs):

    bucket_name = kwargs['BUCKET_NAME']
    project_id = kwargs['PROJECT_ID']
    table_name = kwargs['TABLE_NAME']
    root_path = f'{bucket_name}/{table_name}'   

    table = pa.Table.from_pandas(data)

    gcs = pa.fs.GcsFileSystem()

    pq.write_to_dataset(
        table,
        root_path=root_path,
        basename_template='life_expectancy_raw_data-{i}.parquet',
        filesystem=gcs,
        existing_data_behavior="overwrite_or_ignore"
    )

