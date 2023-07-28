/* get HTTP verbs, bytes, and time taken for requests by unsecured referrers containing <keyword> */
SELECT TOP 20 	cs-method, 
		COUNT(*) AS Total, 
		AVG(time-taken) AS AvgTime, 
		AVG(sc-bytes) AS AvgBytesSent 
FROM '[LOGFILEPATH]'
WHERE cs(Referer) LIKE 'http:%<keyword>%'
GROUP BY cs-method 
ORDER BY Total DESC