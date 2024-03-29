import io
import pandas as pd
import requests
if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test

@data_loader
def load_data(*args, **kwargs):

    url = 'https://raw.githubusercontent.com/TOmelchenko/LifeExpectancyProject/main/data/Metadata_Country_API_8_DS2_en_csv_v2_11368.csv'
    
    data = pd.read_csv(url, sep=",")
    return data


@test
def test_output(output, *args) -> None:
    
    assert output is not None, 'The output is undefined'
