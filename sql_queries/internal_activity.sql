/* 
counts requests to a particular stem, aggregated by hour, for internal IP addresses only
*/
SELECT TO_LOCALTIME(QUANTIZE(TO_TIMESTAMP(date, time), 3600)) AS [Hour],
         COUNT(*) AS [Requests]
    FROM '[LOGFILEPATH]'
WHERE (cs-uri-stem = '/metromap/js/script.min.js') and (
c-ip LIKE '10.%'
OR c-ip LIKE '172.16.%'
OR c-ip LIKE '172.17.%'
OR c-ip LIKE '172.18.%'
OR c-ip LIKE '172.19.%'
OR c-ip LIKE '172.2%.'
OR c-ip LIKE '172.30.%'
OR c-ip LIKE '172.31.%'
OR c-ip LIKE '192.168.%'
)

GROUP BY Hour
ORDER BY Hour
