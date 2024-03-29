import io
import pandas as pd
import requests
if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test

@data_loader
def load_data(*args, **kwargs):

    url = 'https://raw.githubusercontent.com/TOmelchenko/LifeExpectancyProject/main/data/API_8_DS2_en_csv_v2_11368.csv'
    

    life_exp_dtype = {
                    'Country Name': str,
                    'Country Code': str,
                    'Indicator Name': str,
                    'Indicator Code': str,
                    '1960': float,
                    '1961': float,
                    '1962': float,
                    '1963': float,
                    '1964': float,
                    '1965': float,
                    '1966': float,
                    '1967': float,
                    '1968': float,
                    '1969': float,
                    '1970': float,
                    '1971': float,
                    '1972': float,
                    '1973': float,
                    '1974': float,
                    '1975': float,
                    '1976': float,
                    '1977': float,
                    '1978': float,
                    '1979': float,
                    '1980': float,
                    '1981': float,
                    '1982': float,
                    '1983': float,
                    '1984': float,
                    '1985': float,
                    '1986': float,
                    '1987': float,
                    '1988': float,
                    '1989': float, 
                    '1990': float,
                    '1991': float,
                    '1992': float,
                    '1993': float,
                    '1994': float,
                    '1995': float,
                    '1996': float,
                    '1997': float,
                    '1998': float,
                    '1999': float,
                    '2000': float,
                    '2001': float,
                    '2002': float,
                    '2003': float,
                    '2004': float,  
                    '2005': float,
                    '2006': float,
                    '2007': float,
                    '2008': float,
                    '2009': float,
                    '2010': float,
                    '2011': float,
                    '2012': float, 
                    '2013': float,
                    '2014': float,
                    '2015': float,
                    '2016': float,
                    '2017': float,  
                    '2018': float,
                    '2019': float,
                    '2020': float,
                    '2021': float,
                    '2022': float           
                }       
    #parse_dates = ['tpep_pickup_datetime', 'tpep_dropoff_datetime']
    #df = pd.read_csv(url, sep=",", dtype=life_exp_dtype, skiprows=3)
    data = pd.read_csv(url, sep=",", dtype=life_exp_dtype, skiprows=4)
    return data


@test
def test_output(output, *args) -> None:
    
    assert output is not None, 'The output is undefined'
