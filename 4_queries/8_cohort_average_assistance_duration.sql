SELECT avg(total_duration) as average_total_duration
FROM (
  SELECT cohorts.name as cohort, sum(completed_at - started_at) as total_duration
  FROM assistance_requests
  JOIN students ON students.id = assistance_requests.student_id
  JOIN cohorts ON cohorts.id = cohort_id
  GROUP BY cohort
) as requests_total_duration;