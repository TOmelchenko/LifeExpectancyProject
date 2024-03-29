import pandas as pd

if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@transformer
def transform(data, *args, **kwargs):
    
    df = pd.DataFrame(data)

    df.columns = ['_' + str(col)  for col in df.columns]

    df.rename(columns={'_Country Name': 'CountryName'}, inplace=True)
    df.rename(columns={'_Country Code': 'CountryCode'}, inplace=True)
    df.rename(columns={'_Indicator Name': 'IndicatorName'}, inplace=True)
    df.rename(columns={'_Indicator Code': 'IndicatorCode'}, inplace=True)

    df.drop(df.columns[[67]], axis=1, inplace=True)
 
    print(f"Preprocessing rows with empty CountryCode: {df['CountryCode'].isna().sum()}")
    print(f"Preprocessing rows with empty IndicatorCode: {df['IndicatorCode'].isna().sum()}")
   
    return  df[(df['CountryCode'].notna()) & (df['IndicatorCode'].notna())] 


@test
def test_output(output, *args) -> None:
    
    assert output['CountryCode'].isna().sum() == 0, 'There are empty CountryCode'
    assert output['IndicatorCode'].isna().sum() == 0, 'There are empty IndicatorCode'
    assert output is not None, 'The output is undefined'
