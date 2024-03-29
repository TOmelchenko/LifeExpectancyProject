import pandas as pd

if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@transformer
def transform(data, *args, **kwargs):
    
    df = pd.DataFrame(data)

    df.rename(columns={'TableName': 'CountryName'}, inplace=True)
    df.rename(columns={'Country Code': 'CountryCode'}, inplace=True)

    df.drop(columns=['Unnamed: 5'], axis=1, inplace=True)

    print(f"Preprocessing rows with empty CountryCode: {df['CountryCode'].isna().sum()}")
   
    return df[df['CountryCode'].notna()] 


@test
def test_output(output, *args) -> None:
    
    assert output['CountryCode'].isna().sum() == 0, 'There are empty CountryCode'
    assert output is not None, 'The output is undefined'
