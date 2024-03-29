import pandas as pd

if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@transformer
def transform(data, *args, **kwargs):
    
    df = pd.DataFrame(data)

    df.rename(columns={'INDICATOR_CODE': 'IndicatorCode'}, inplace=True)
    df.rename(columns={'INDICATOR_NAME': 'IndicatorName'}, inplace=True)
    
    df.drop(columns=['Unnamed: 4'], axis=1, inplace=True)

    print(f"Preprocessing rows with empty IndicatorCode: {df['IndicatorCode'].isna().sum()}")
   
    return df[df['IndicatorCode'].notna()] 


@test
def test_output(output, *args) -> None:
    
    assert output['IndicatorCode'].isna().sum() == 0, 'There are empty IndicatorCode'
    assert output is not None, 'The output is undefined'
