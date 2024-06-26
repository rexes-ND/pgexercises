-- SELECT REPEAT('0', 5 - LENGTH(zipcode::TEXT)) || zipcode::TEXT AS zip
SELECT LPAD(zipcode::TEXT, 5, '0') AS zip
FROM cd.members
ORDER BY zip;
