-- ============================================================
-- PROJECT: Student Performance Database & Analytics Dashboard
-- FILE: 04_analytics_queries.sql
-- DESCRIPTION: Academic insight queries — top/low performers,
--              attendance vs marks, pass/fail, rankings,
--              performance classification, and at-risk detection
-- ============================================================

USE student_performance_db;

-- ============================================================
-- QUERY 1: Top-Performing Students (per course)
-- PURPOSE: Identify the highest scorers in each course
-- LOGIC: Calculate percentage, ORDER BY DESC, use RANK()
-- ============================================================
WITH student_scores AS (
    SELECT
        s.student_id,
        s.student_code,
        CONCAT(s.first_name, ' ', s.last_name) AS student_name,
        c.course_id,
        c.course_name,
        ROUND(SUM(m.marks_obtained) * 100.0 / SUM(a.total_marks), 2) AS percentage
    FROM students    s
    JOIN marks       m ON s.student_id    = m.student_id
    JOIN assessments a ON m.assessment_id = a.assessment_id
    JOIN courses     c ON a.course_id     = c.course_id
    GROUP BY s.student_id, s.student_code, student_name, c.course_id, c.course_name
)
SELECT
    course_name,
    student_code,
    student_name,
    percentage,
    RANK() OVER (PARTITION BY course_id ORDER BY percentage DESC) AS course_rank
FROM student_scores
ORDER BY course_name, course_rank
LIMIT 30;

-- ============================================================
-- QUERY 2: Low-Performing Students (Below 50%)
-- PURPOSE: Find students who are struggling academically
-- LOGIC: Filter percentage < 50 using HAVING clause
-- ============================================================
SELECT
    s.student_code,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    c.course_name,
    ROUND(SUM(m.marks_obtained) * 100.0 / SUM(a.total_marks), 2) AS percentage,
    CASE
        WHEN SUM(m.marks_obtained) * 100.0 / SUM(a.total_marks) < 35 THEN 'Critical — Needs Urgent Help'
        WHEN SUM(m.marks_obtained) * 100.0 / SUM(a.total_marks) < 50 THEN 'Below Average — Needs Support'
        ELSE 'Average'
    END AS intervention_level
FROM students    s
JOIN marks       m ON s.student_id    = m.student_id
JOIN assessments a ON m.assessment_id = a.assessment_id
JOIN courses     c ON a.course_id     = c.course_id
GROUP BY s.student_id, s.student_code, student_name, c.course_id, c.course_name
HAVING percentage < 50
ORDER BY percentage ASC;

-- ============================================================
-- QUERY 3: Students with Low Attendance (Below 75%)
-- PURPOSE: Identify students at risk due to poor attendance
-- LOGIC: Calculate attendance %, filter below threshold
-- ============================================================
SELECT
    s.student_code,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    c.course_name,
    COUNT(a.attendance_id)                 AS total_sessions,
    SUM(CASE WHEN a.status IN ('Present','Late') THEN 1 ELSE 0 END) AS attended,
    ROUND(
        SUM(CASE WHEN a.status IN ('Present','Late') THEN 1 ELSE 0 END) * 100.0
        / NULLIF(COUNT(a.attendance_id), 0), 1
    )                                      AS attendance_pct,
    CASE
        WHEN SUM(CASE WHEN a.status IN ('Present','Late') THEN 1 ELSE 0 END) * 100.0
             / NULLIF(COUNT(a.attendance_id), 0) < 50  THEN '🚨 Critical — Below 50%'
        WHEN SUM(CASE WHEN a.status IN ('Present','Late') THEN 1 ELSE 0 END) * 100.0
             / NULLIF(COUNT(a.attendance_id), 0) < 75  THEN '⚠️  Warning — Below 75%'
        ELSE 'OK'
    END AS attendance_flag
FROM students s
JOIN attendance a ON s.student_id = a.student_id
JOIN courses    c ON a.course_id  = c.course_id
GROUP BY s.student_id, s.student_code, student_name, c.course_id, c.course_name
HAVING attendance_pct < 75
ORDER BY attendance_pct ASC;

-- ============================================================
-- QUERY 4: Course-wise Average Marks
-- PURPOSE: Compare average scores across different courses
-- LOGIC: AVG aggregate function grouped by course
-- ============================================================
SELECT
    c.course_code,
    c.course_name,
    c.course_level,
    CONCAT(i.first_name, ' ', i.last_name) AS instructor,
    COUNT(DISTINCT m.student_id)            AS students_assessed,
    ROUND(AVG(m.marks_obtained * 100.0 / a.total_marks), 2) AS avg_percentage,
    ROUND(MAX(m.marks_obtained * 100.0 / a.total_marks), 2) AS max_percentage,
    ROUND(MIN(m.marks_obtained * 100.0 / a.total_marks), 2) AS min_percentage
FROM courses     c
JOIN assessments a  ON c.course_id     = a.course_id
JOIN marks       m  ON a.assessment_id = m.assessment_id
JOIN instructors i  ON c.instructor_id = i.instructor_id
GROUP BY c.course_id, c.course_code, c.course_name, c.course_level, instructor
ORDER BY avg_percentage DESC;

-- ============================================================
-- QUERY 5: Department-wise Performance Comparison
-- PURPOSE: Which department has the best academic performance?
-- LOGIC: Average marks per student per department
-- ============================================================
SELECT
    d.department_name,
    d.department_code,
    COUNT(DISTINCT s.student_id)            AS total_students,
    ROUND(AVG(m.marks_obtained * 100.0 / a.total_marks), 2) AS dept_avg_percentage,
    ROUND(MAX(m.marks_obtained * 100.0 / a.total_marks), 2) AS top_score,
    ROUND(MIN(m.marks_obtained * 100.0 / a.total_marks), 2) AS lowest_score
FROM departments d
JOIN students    s ON d.department_id  = s.department_id
JOIN marks       m ON s.student_id     = m.student_id
JOIN assessments a ON m.assessment_id  = a.assessment_id
GROUP BY d.department_id, d.department_name, d.department_code
ORDER BY dept_avg_percentage DESC;

-- ============================================================
-- QUERY 6: Pass/Fail Analysis (Pass = 50% and above)
-- PURPOSE: How many students passed or failed in each course?
-- LOGIC: CASE inside SUM to count pass/fail per course
-- ============================================================
WITH student_course_pct AS (
    SELECT
        s.student_id,
        c.course_id,
        c.course_name,
        ROUND(SUM(m.marks_obtained) * 100.0 / SUM(a.total_marks), 2) AS percentage
    FROM students    s
    JOIN marks       m ON s.student_id    = m.student_id
    JOIN assessments a ON m.assessment_id = a.assessment_id
    JOIN courses     c ON a.course_id     = c.course_id
    GROUP BY s.student_id, c.course_id, c.course_name
)
SELECT
    course_name,
    COUNT(*)                                              AS total_students,
    SUM(CASE WHEN percentage >= 50 THEN 1 ELSE 0 END)    AS passed,
    SUM(CASE WHEN percentage <  50 THEN 1 ELSE 0 END)    AS failed,
    ROUND(SUM(CASE WHEN percentage >= 50 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS pass_rate_pct,
    ROUND(AVG(percentage), 2)                             AS avg_score
FROM student_course_pct
GROUP BY course_id, course_name
ORDER BY pass_rate_pct DESC;

-- ============================================================
-- QUERY 7: Performance Category Classification
-- PURPOSE: Classify each student into performance bands
-- LOGIC: CASE statement on percentage ranges
-- ============================================================
SELECT
    s.student_code,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    c.course_name,
    ROUND(SUM(m.marks_obtained) * 100.0 / SUM(a.total_marks), 2) AS percentage,
    CASE
        WHEN SUM(m.marks_obtained) * 100.0 / SUM(a.total_marks) >= 90 THEN 'Outstanding'
        WHEN SUM(m.marks_obtained) * 100.0 / SUM(a.total_marks) >= 75 THEN 'Excellent'
        WHEN SUM(m.marks_obtained) * 100.0 / SUM(a.total_marks) >= 60 THEN 'Good'
        WHEN SUM(m.marks_obtained) * 100.0 / SUM(a.total_marks) >= 50 THEN 'Average'
        WHEN SUM(m.marks_obtained) * 100.0 / SUM(a.total_marks) >= 35 THEN 'Below Average'
        ELSE 'Fail'
    END AS performance_category
FROM students    s
JOIN marks       m ON s.student_id    = m.student_id
JOIN assessments a ON m.assessment_id = a.assessment_id
JOIN courses     c ON a.course_id     = c.course_id
GROUP BY s.student_id, s.student_code, student_name, c.course_id, c.course_name
ORDER BY c.course_name, percentage DESC;

-- ============================================================
-- QUERY 8: At-Risk Student Identification
-- PURPOSE: Find students with BOTH low attendance AND low marks
-- LOGIC: Combine attendance CTE + marks CTE, filter dual risk
-- ============================================================
WITH attendance_summary AS (
    SELECT
        student_id,
        course_id,
        ROUND(SUM(CASE WHEN status IN ('Present','Late') THEN 1 ELSE 0 END) * 100.0
              / NULLIF(COUNT(*), 0), 1) AS attendance_pct
    FROM attendance
    GROUP BY student_id, course_id
),
marks_summary AS (
    SELECT
        m.student_id,
        a.course_id,
        ROUND(SUM(m.marks_obtained) * 100.0 / SUM(a.total_marks), 2) AS marks_pct
    FROM marks m
    JOIN assessments a ON m.assessment_id = a.assessment_id
    GROUP BY m.student_id, a.course_id
)
SELECT
    s.student_code,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    s.email                                 AS contact_email,
    c.course_name,
    att.attendance_pct,
    mk.marks_pct,
    'AT RISK'                              AS risk_status,
    CASE
        WHEN att.attendance_pct < 50 AND mk.marks_pct < 35 THEN 'Critical — Immediate Intervention'
        WHEN att.attendance_pct < 75 AND mk.marks_pct < 50 THEN 'High Risk — Needs Counselling'
        ELSE 'Moderate Risk — Monitor Closely'
    END AS recommended_action
FROM students       s
JOIN attendance_summary att ON s.student_id = att.student_id
JOIN marks_summary      mk  ON s.student_id = mk.student_id AND att.course_id = mk.course_id
JOIN courses            c   ON att.course_id = c.course_id
WHERE att.attendance_pct < 75 AND mk.marks_pct < 50
ORDER BY att.attendance_pct ASC, mk.marks_pct ASC;

-- ============================================================
-- QUERY 9: Student Ranking within Courses (using DENSE_RANK)
-- PURPOSE: Rank students per course without gaps in rank numbers
-- LOGIC: DENSE_RANK() window function PARTITION BY course
-- ============================================================
WITH course_scores AS (
    SELECT
        s.student_code,
        CONCAT(s.first_name, ' ', s.last_name) AS student_name,
        c.course_id,
        c.course_name,
        ROUND(SUM(m.marks_obtained) * 100.0 / SUM(a.total_marks), 2) AS percentage
    FROM students    s
    JOIN marks       m ON s.student_id    = m.student_id
    JOIN assessments a ON m.assessment_id = a.assessment_id
    JOIN courses     c ON a.course_id     = c.course_id
    GROUP BY s.student_id, s.student_code, student_name, c.course_id, c.course_name
)
SELECT
    course_name,
    student_code,
    student_name,
    percentage,
    DENSE_RANK() OVER (PARTITION BY course_id ORDER BY percentage DESC) AS rank_in_course
FROM course_scores
ORDER BY course_name, rank_in_course;

-- ============================================================
-- QUERY 10: Assessment-wise Score Analysis
-- PURPOSE: How did students perform in each type of assessment?
-- LOGIC: GROUP BY assessment type with AVG, MIN, MAX
-- ============================================================
SELECT
    a.assessment_type,
    a.assessment_name,
    c.course_name,
    a.total_marks,
    COUNT(m.mark_id)                              AS submissions,
    ROUND(AVG(m.marks_obtained), 2)               AS avg_marks,
    ROUND(AVG(m.marks_obtained) * 100.0 / a.total_marks, 2) AS avg_pct,
    MAX(m.marks_obtained)                         AS highest,
    MIN(m.marks_obtained)                         AS lowest,
    ROUND(STDDEV(m.marks_obtained), 2)            AS std_deviation
FROM assessments a
JOIN marks   m ON a.assessment_id = m.assessment_id
JOIN courses c ON a.course_id     = c.course_id
GROUP BY a.assessment_id, a.assessment_type, a.assessment_name, c.course_name, a.total_marks
ORDER BY c.course_name, a.assessment_type;

-- ============================================================
-- QUERY 11: Attendance vs Marks Relationship
-- PURPOSE: Does better attendance lead to better marks?
-- LOGIC: Join attendance %, marks %, display side by side
-- ============================================================
WITH att_pct AS (
    SELECT
        student_id, course_id,
        ROUND(SUM(CASE WHEN status IN ('Present','Late') THEN 1 ELSE 0 END)
              * 100.0 / NULLIF(COUNT(*), 0), 1) AS attendance_pct
    FROM attendance GROUP BY student_id, course_id
),
marks_pct AS (
    SELECT m.student_id, a.course_id,
           ROUND(SUM(m.marks_obtained) * 100.0 / SUM(a.total_marks), 2) AS marks_pct
    FROM marks m JOIN assessments a ON m.assessment_id = a.assessment_id
    GROUP BY m.student_id, a.course_id
)
SELECT
    s.student_code,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    c.course_name,
    att.attendance_pct,
    mk.marks_pct,
    CASE
        WHEN att.attendance_pct >= 90 AND mk.marks_pct >= 75 THEN 'High Attendance — High Marks ✅'
        WHEN att.attendance_pct >= 75 AND mk.marks_pct >= 50 THEN 'Good Attendance — Satisfactory Marks'
        WHEN att.attendance_pct <  75 AND mk.marks_pct >= 50 THEN 'Low Attendance — Still Passing ⚠️'
        WHEN att.attendance_pct >= 75 AND mk.marks_pct <  50 THEN 'Good Attendance — Low Marks 🔍'
        ELSE 'Low Attendance — Low Marks 🚨'
    END AS pattern
FROM students s
JOIN att_pct  att ON s.student_id = att.student_id
JOIN marks_pct mk ON s.student_id = mk.student_id AND att.course_id = mk.course_id
JOIN courses c    ON att.course_id = c.course_id
ORDER BY att.attendance_pct DESC;

-- ============================================================
-- QUERY 12: Instructor-wise Student Performance Summary
-- PURPOSE: Which instructors have the best student outcomes?
-- LOGIC: AVG marks grouped by instructor
-- ============================================================
SELECT
    CONCAT(i.first_name, ' ', i.last_name)  AS instructor_name,
    i.designation,
    c.course_name,
    COUNT(DISTINCT m.student_id)             AS students_taught,
    ROUND(AVG(m.marks_obtained * 100.0 / a.total_marks), 2) AS avg_student_percentage,
    SUM(CASE WHEN m.marks_obtained * 100.0 / a.total_marks >= 75 THEN 1 ELSE 0 END) AS excellent_count,
    SUM(CASE WHEN m.marks_obtained * 100.0 / a.total_marks <  50 THEN 1 ELSE 0 END) AS fail_count,
    ROUND(AVG(f.rating), 2)                  AS avg_feedback_rating
FROM instructors i
JOIN courses     c  ON i.instructor_id = c.instructor_id
JOIN assessments a  ON c.course_id     = a.course_id
JOIN marks       m  ON a.assessment_id = m.assessment_id
LEFT JOIN feedback f ON c.course_id = f.course_id
GROUP BY i.instructor_id, instructor_name, i.designation, c.course_id, c.course_name
ORDER BY avg_student_percentage DESC;

-- ============================================================
-- QUERY 13: Course Completion Rate Analysis
-- PURPOSE: Overall course completion rate statistics
-- LOGIC: COUNT completion statuses per course as percentages
-- ============================================================
SELECT
    c.course_name,
    c.course_level,
    COUNT(e.enrollment_id)                  AS total_enrollments,
    SUM(CASE WHEN e.completion_status = 'Completed' THEN 1 ELSE 0 END) AS completed,
    ROUND(
        SUM(CASE WHEN e.completion_status = 'Completed' THEN 1 ELSE 0 END) * 100.0
        / NULLIF(COUNT(e.enrollment_id), 0), 1
    )                                       AS completion_rate,
    ROUND(AVG(
        CASE WHEN e.completion_status = 'Completed'
             THEN DATEDIFF(e.completion_date, e.enrollment_date) END
    ), 0)                                   AS avg_days_to_complete
FROM courses     c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name, c.course_level
ORDER BY completion_rate DESC;

-- ============================================================
-- QUERY 14: Overall Performance Distribution (all courses combined)
-- PURPOSE: What % of students fall in each performance band?
-- LOGIC: CASE classification + percentage count
-- ============================================================
WITH student_overall AS (
    SELECT
        s.student_id,
        CONCAT(s.first_name,' ',s.last_name) AS student_name,
        ROUND(SUM(m.marks_obtained) * 100.0 / SUM(a.total_marks), 2) AS overall_pct
    FROM students    s
    JOIN marks       m ON s.student_id    = m.student_id
    JOIN assessments a ON m.assessment_id = a.assessment_id
    GROUP BY s.student_id, student_name
),
classified AS (
    SELECT student_name, overall_pct,
           CASE
               WHEN overall_pct >= 90 THEN 'Outstanding'
               WHEN overall_pct >= 75 THEN 'Excellent'
               WHEN overall_pct >= 60 THEN 'Good'
               WHEN overall_pct >= 50 THEN 'Average'
               WHEN overall_pct >= 35 THEN 'Below Average'
               ELSE 'Fail'
           END AS category
    FROM student_overall
)
SELECT
    category,
    COUNT(*)                                   AS student_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 1) AS percentage_of_total
FROM classified
GROUP BY category
ORDER BY FIELD(category, 'Outstanding','Excellent','Good','Average','Below Average','Fail');
