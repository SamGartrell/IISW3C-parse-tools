/* "trunk" is first 2 folders of the URI stem, here, where referrer is <keyword>. gives counts */
select
count(*),
to_lowercase(extract_prefix(cs-uri-stem, 2, '/')) as trunk
from '[LOGFILEPATH]'
where cs(Referer) like '%<keyword>%'
group by trunk
order by count(*) desc