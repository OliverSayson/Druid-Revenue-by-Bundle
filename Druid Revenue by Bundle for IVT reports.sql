SELECT
t.publisherId,
t.bundleId,
t.Revenue from (
SELECT
publisherId,
bundleId,
round(sum(sharableRevenue),2) as Revenue
FROM "supply-activities"
WHERE TIME_EXTRACT(__time,'YEAR') = 2024
AND TIME_EXTRACT(__time, 'MONTH') IN (6)
--AND TIME_EXTRACT(__time, 'DAY') IN (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)
and publisherId IN ()
GROUP BY 1,2) t
WHERE t.Revenue >= 1