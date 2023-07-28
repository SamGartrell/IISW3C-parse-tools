/* breakdown of activity by arcgis tile service, removing the influence of quadkeys when grouping endpoints
targets a specific referrer <keyword> */
select
count(*),
to_lowercase(
    substr(cs-uri-stem, 0,sub(index_of(cs-uri-stem,'tile'),1))
    )
from '[LOGFILEPATH]'
where
cs(Referer) like '%<keyword>%' and cs-uri-stem like '%ArcGIS/rest%'
group by to_lowercase(substr(
    cs-uri-stem, 0,sub(index_of(cs-uri-stem,'tile'),1)
    ))
order by count(*) desc