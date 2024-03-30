with year_data_10 as (
    select
        country.countryname as country,
        country.region as region,
        ind.indicatorname as indicatorname,
        ind.indicatorcode as indicatorcode,
        fact._2013 as _2013,
        fact._2014 as _2014,
        fact._2015 as _2015,
        fact._2016 as _2016,
        fact._2017 as _2017,
        fact._2018 as _2018,
        fact._2019 as _2019,
        fact._2020 as _2020,
        fact._2021 as _2021,
        fact._2022 as _2022
    from `dataengproject-417719`.`life_expectancy`.`fact_life_expectancy` as fact
    join `dataengproject-417719`.`life_expectancy`.`dim_country` as country
    on fact.countrycode = country.countrycode  and country.region is not null
    join `dataengproject-417719`.`life_expectancy`.`dim_indicator` as ind
    on fact.indicatorcode = ind.indicatorcode
    where ind.indicatorcode in ('SP.POP.TOTL.MA.IN', 'SP.POP.TOTL.FE.IN', 'SP.POP.TOTL' , 'SP.DYN.LE00.MA.IN', 'SP.DYN.LE00.IN', 'SP.DYN.LE00.FE.IN')
   
),

population_men as (
    select
        country,
        region,
        _2013 as number_in_year,
        '2013' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL.MA.IN')
    union all
    select
        country,
        region,
        _2014 as number_in_year,
        '2014' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL.MA.IN')
    union all
    select
        country,
        region,
        _2015 as number_in_year,
        '2015' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL.MA.IN')
    union all
    select
        country,
        region,
        _2016 as number_in_year,
        '2016' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL.MA.IN')
    union all
    select
        country,
        region,
        _2017 as number_in_year,
        '2017' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL.MA.IN')
    union all
    select
        country,
        region,
        _2018 as number_in_year,
        '2018' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL.MA.IN')
    union all
        select
        country,
        region,
        _2019 as number_in_year,
        '2019' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL.MA.IN')
    union all
    select
        country,
        region,
        _2020 as number_in_year,
        '2020' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL.MA.IN')
    union all
    select
        country,
        region,
        _2021 as number_in_year,
        '2021' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL.MA.IN')
    union all
    select
        country,
        region,
        _2022 as number_in_year,
        '2022' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL.MA.IN')
),

population_wom as (
    select
        country,
        region,
        _2013 as number_in_year,
        '2013' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL.FE.IN')
    union all
    select
        country,
        region,
        _2014 as number_in_year,
        '2014' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL.FE.IN')
    union all
    select
        country,
        region,
        _2015 as number_in_year,
        '2015' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL.FE.IN')
    union all
    select
        country,
        region,
        _2016 as number_in_year,
        '2016' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL.FE.IN')
    union all
    select
        country,
        region,
        _2017 as number_in_year,
        '2017' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL.FE.IN')
    union all
    select
        country,
        region,
        _2018 as number_in_year,
        '2018' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL.FE.IN')
    union all
    select
        country,
        region,
        _2019 as number_in_year,
        '2019' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL.FE.IN')
    union all
    select
        country,
        region,
        _2020 as number_in_year,
        '2020' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL.FE.IN')
    union all
    select
        country,
        region,
        _2021 as number_in_year,
        '2021' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL.FE.IN')
    union all
    select
        country,
        region,
        _2022 as number_in_year,
        '2022' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL.FE.IN')
),

population_tot as(
    select
        country,
        region,
        _2013 as number_in_year,
        '2013' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL')
    union all
    select
        country,
        region,
        _2014 as number_in_year,
        '2014' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL')
    union all
    select
        country,
        region,
        _2015 as number_in_year,
        '2015' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL')
    union all
    select
        country,
        region,
        _2016 as number_in_year,
        '2016' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL')
    union all
    select
        country,
        region,
        _2017 as number_in_year,
        '2017' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL')
    union all
    select
        country,
        region,
        _2018 as number_in_year,
        '2018' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL')
    union all
    select
        country,
        region,
        _2019 as number_in_year,
        '2019' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL')
    union all
    select
        country,
        region,
        _2020 as number_in_year,
        '2020' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL')
    union all
    select
        country,
        region,
        _2021 as number_in_year,
        '2021' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL')
    union all
    select
        country,
        region,
        _2022 as number_in_year,
        '2022' as year_expl
    from year_data_10
    where indicatorcode in ('SP.POP.TOTL')
),

life_exp_men as (
    select
        country,
        region,
        _2013 as number_in_year,
        '2013' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.MA.IN')
    union all
    select
        country,
        region,
        _2014 as number_in_year,
        '2014' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.MA.IN')
    union all
    select
        country,
        region,
        _2015 as number_in_year,
        '2015' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.MA.IN')
    union all
    select
        country,
        region,
        _2016 as number_in_year,
        '2016' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.MA.IN')
    union all
    select
        country,
        region,
        _2017 as number_in_year,
        '2017' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.MA.IN')
    union all
    select
        country,
        region,
        _2018 as number_in_year,
        '2018' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.MA.IN')
    union all
        select
        country,
        region,
        _2019 as number_in_year,
        '2019' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.MA.IN')
    union all
    select
        country,
        region,
        _2020 as number_in_year,
        '2020' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.MA.IN')
    union all
    select
        country,
        region,
        _2021 as number_in_year,
        '2021' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.MA.IN')
    union all
    select
        country,
        region,
        _2022 as number_in_year,
        '2022' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.MA.IN')
),

life_exp_wom as (
    select
        country,
        region,
        _2013 as number_in_year,
        '2013' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.FE.IN')
    union all
    select
        country,
        region,
        _2014 as number_in_year,
        '2014' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.FE.IN')
    union all
    select
        country,
        region,
        _2015 as number_in_year,
        '2015' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.FE.IN')
    union all
    select
        country,
        region,
        _2016 as number_in_year,
        '2016' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.FE.IN')
    union all
    select
        country,
        region,
        _2017 as number_in_year,
        '2017' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.FE.IN')
    union all
    select
        country,
        region,
        _2018 as number_in_year,
        '2018' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.FE.IN')
    union all
    select
        country,
        region,
        _2019 as number_in_year,
        '2019' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.FE.IN')
    union all
    select
        country,
        region,
        _2020 as number_in_year,
        '2020' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.FE.IN')
    union all
    select
        country,
        region,
        _2021 as number_in_year,
        '2021' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.FE.IN')
    union all
    select
        country,
        region,
        _2022 as number_in_year,
        '2022' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.FE.IN')
),

life_exp_tot as(
    select
        country,
        region,
        _2013 as number_in_year,
        '2013' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.IN')
    union all
    select
        country,
        region,
        _2014 as number_in_year,
        '2014' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.IN')
    union all
    select
        country,
        region,
        _2015 as number_in_year,
        '2015' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.IN')
    union all
    select
        country,
        region,
        _2016 as number_in_year,
        '2016' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.IN')
    union all
    select
        country,
        region,
        _2017 as number_in_year,
        '2017' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.IN')
    union all
    select
        country,
        region,
        _2018 as number_in_year,
        '2018' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.IN')
    union all
    select
        country,
        region,
        _2019 as number_in_year,
        '2019' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.IN')
    union all
    select
        country,
        region,
        _2020 as number_in_year,
        '2020' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.IN')
    union all
    select
        country,
        region,
        _2021 as number_in_year,
        '2021' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.IN')
    union all
    select
        country,
        region,
        _2022 as number_in_year,
        '2022' as year_expl
    from year_data_10
    where indicatorcode in ('SP.DYN.LE00.IN')
)

select pt.country, 
        pt.region, 
        pt.year_expl, 
        pt.number_in_year as population_total, 
        pm.number_in_year as population_men,
        pw.number_in_year as population_women,
        lt.number_in_year as life_expectancy_total,
        lm.number_in_year as life_expectancy_men,
        lw.number_in_year as life_expectancy_women

from population_tot pt
join population_men pm on pt.country = pm.country and pt.year_expl = pm.year_expl
join population_wom pw on pt.country = pw.country and pt.year_expl = pw.year_expl
join life_exp_tot lt on pt.country = lt.country and pt.year_expl = lt.year_expl
join life_exp_men lm on pt.country = lm.country and pt.year_expl = lm.year_expl
join life_exp_wom lw on pt.country = lw.country and pt.year_expl = lw.year_expl