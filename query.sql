-- task 3

SELECT
    v.position_name,
    e.area_id,
    e.employer_name
FROM vacancy AS v
INNER JOIN employer AS e ON v.employer_id = e.employer_id
WHERE
    v.compensation_from is null AND v.compensation_to is null
ORDER BY v.creation_date DESC
LIMIT 10;

-- task 4

SELECT 
    avg(CASE WHEN v.compensation_gross IS TRUE
             THEN v.compensation_from
             ELSE v.compensation_from  * 1.13
        END
    ) AS avg_compensation_from,
    avg(CASE WHEN v.compensation_gross IS TRUE
             THEN v.compensation_to
             ELSE v.compensation_to * 1.13
        END
    ) AS avg_compensation_to,
    avg(CASE WHEN v.compensation_gross IS TRUE
             THEN (v.compensation_to + v.compensation_from) / 2
             ELSE ((v.compensation_to * 1.13 + v.compensation_from * 1.13) / 2)
        END
    ) AS avg_compensation_avg,
    avg(CASE WHEN v.compensation_gross IS TRUE
             THEN v.compensation_to - v.compensation_from
             ELSE (v.compensation_to * 1.13 - v.compensation_from * 1.13)
        END
    ) AS avg_salary_range
FROM vacancy AS v;

-- task 5

SELECT
    all_app.employer_name,
    max(all_app.app_cnt) AS max_app_cnt
FROM (
    SELECT
        e.employer_id,
        e.employer_name,
        v.position_name,
        count(a.vacancy_id) AS app_cnt
    FROM employer AS e
    INNER JOIN vacancy AS v ON v.employer_id = e.employer_id
    LEFT JOIN application AS a ON a.vacancy_id = v.vacancy_id
    GROUP BY e.employer_id, v.vacancy_id
) AS all_app
GROUP BY all_app.employer_id, all_app.employer_name
ORDER BY max_app_cnt DESC, all_app.employer_name
LIMIT 5;

-- task 6

SELECT
    percentile_cont(0.5) WITHIN GROUP (ORDER BY all_vac.pos_cnt)
FROM (
    SELECT
        count(v.vacancy_id) AS pos_cnt
    FROM vacancy AS v
    RIGHT JOIN employer AS e ON v.employer_id = e.employer_id
    GROUP BY e.employer_id
) AS all_vac;

-- task 7

SELECT
    all_first_apps.area_id,
    min(all_first_apps.first_app) AS first_app,
    max(all_first_apps.first_app) AS latest_app
FROM (
    SELECT
        e.area_id,
        v.vacancy_id,
        min(a.creation_date - v.creation_date) AS first_app
    FROM application AS a
    INNER JOIN vacancy AS v ON v.vacancy_id = a.vacancy_id
    INNER JOIN employer AS e ON v.employer_id = e.employer_id
    GROUP BY e.area_id, v.vacancy_id
) AS all_first_apps
GROUP BY all_first_apps.area_id;
