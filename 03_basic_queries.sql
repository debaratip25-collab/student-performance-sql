-- ============================================================
-- PROJECT: Student Performance Database & Analytics Dashboard
-- FILE: 03_basic_queries.sql
-- DESCRIPTION: Core data retrieval queries — student records,
--              enrollments, attendance, marks, course summaries
-- ============================================================

USE student_performance_db;

-- ============================================================
-- QUERY 1: Fetch All Student Records
-- PURPOSE: View complete list of all registered students
-- LOGIC: Simple SELECT with JOIN to get department name
-- ============================================================
SELECT
    s.student_code,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    s.email,
    s.gender,
    d.department_name,
    s.enrollment_year,
    s.current_semester,
    s.status
FROM students s
JOIN departments d ON s.department_id = d.department_id
ORDER BY s.enrollment_year DESC, s.student_code;

-- ============================================================
-- QUERY 2: Course-wise Student Enrollment Count
-- PURPOSE: How many students enrolled in each course?
-- LOGIC: COUNT enrollments grouped by course
-- ============================================================
SELECT
    c.course_code,
    c.course_name,
    c.course_level,
    CONCAT(i.first_name, ' ', i.last_name) AS instructor_name,
    d.department_name,
    COUNT(e.student_id)                    AS total_enrolled,
    c.max_students,
    ROUND(COUNT(e.student_id) * 100.0 / c.max_students, 1) AS occupancy_pct
FROM courses c
LEFT JOIN enrollments e  ON c.course_id     = e.course_id
LEFT JOIN instructors i  ON c.instructor_id = i.instructor_id
LEFT JOIN departments d  ON c.department_id = d.department_id
GROUP BY c.course_id, c.course_code, c.course_name, c.course_level,
         instructor_name, d.department_name, c.max_students
ORDER BY total_enrolled DESC;

-- ============================================================
-- QUERY 3: Student-wise Attendance Summary
-- PURPOSE: How many classes did each student attend?
-- LOGIC: COUNT attendance records by status, grouped by student
-- ============================================================
SELECT
    s.student_code,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    c.course_name,
    COUNT(a.attendance_id)                 AS total_classes,
    SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) AS present_count,
    SUM(CASE WHEN a.status = 'Absent'  THEN 1 ELSE 0 END) AS absent_count,
    SUM(CASE WHEN a.status = 'Late'    THEN 1 ELSE 0 END) AS late_count,
    ROUND(
        SUM(CASE WHEN a.status IN ('Present','Late') THEN 1 ELSE 0 END) * 100.0
        / NULLIF(COUNT(a.attendance_id), 0), 1
    ) AS attendance_pct
FROM students s
JOIN attendance a ON s.student_id = a.student_id
JOIN courses c    ON a.course_id  = c.course_id
GROUP BY s.student_id, s.student_code, student_name, c.course_id, c.course_name
ORDER BY student_name, c.course_name;

-- ============================================================
-- QUERY 4: Student-wise Marks Summary (weighted total score)
-- PURPOSE: What is each student's total and average score per course?
-- LOGIC: JOIN marks → assessments, calculate weighted percentages
-- ============================================================
SELECT
    s.student_code,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    c.course_name,
    COUNT(m.mark_id)                        AS assessments_taken,
    SUM(m.marks_obtained)                   AS total_marks_obtained,
    SUM(a.total_marks)                      AS total_marks_possible,
    ROUND(SUM(m.marks_obtained) * 100.0 / NULLIF(SUM(a.total_marks), 0), 2) AS overall_percentage
FROM students s
JOIN marks       m ON s.student_id    = m.student_id
JOIN assessments a ON m.assessment_id = a.assessment_id
JOIN courses     c ON a.course_id     = c.course_id
GROUP BY s.student_id, s.student_code, student_name, c.course_id, c.course_name
ORDER BY c.course_name, overall_percentage DESC;

-- ============================================================
-- QUERY 5: Instructor-wise Course Summary
-- PURPOSE: Which instructor teaches how many courses and students?
-- LOGIC: JOIN instructors → courses → enrollments
-- ============================================================
SELECT
    CONCAT(i.first_name, ' ', i.last_name) AS instructor_name,
    i.designation,
    d.department_name,
    COUNT(DISTINCT c.course_id)             AS courses_taught,
    COUNT(DISTINCT e.student_id)            AS total_students,
    AVG(f.rating)                           AS avg_student_rating
FROM instructors i
LEFT JOIN courses     c ON i.instructor_id = c.instructor_id
LEFT JOIN enrollments e ON c.course_id     = e.course_id
LEFT JOIN feedback    f ON c.course_id     = f.course_id
LEFT JOIN departments d ON i.department_id = d.department_id
GROUP BY i.instructor_id, instructor_name, i.designation, d.department_name
ORDER BY total_students DESC;

-- ============================================================
-- QUERY 6: Course Completion Tracking
-- PURPOSE: How many students completed, dropped, or failed each course?
-- LOGIC: GROUP BY course + completion status with CASE for color coding
-- ============================================================
SELECT
    c.course_code,
    c.course_name,
    COUNT(e.student_id) AS total_enrolled,
    SUM(CASE WHEN e.completion_status = 'Completed' THEN 1 ELSE 0 END) AS completed,
    SUM(CASE WHEN e.completion_status = 'Dropped'   THEN 1 ELSE 0 END) AS dropped,
    SUM(CASE WHEN e.completion_status = 'Failed'    THEN 1 ELSE 0 END) AS failed,
    SUM(CASE WHEN e.completion_status = 'Enrolled'  THEN 1 ELSE 0 END) AS ongoing,
    ROUND(
        SUM(CASE WHEN e.completion_status = 'Completed' THEN 1 ELSE 0 END) * 100.0
        / NULLIF(COUNT(e.student_id), 0), 1
    ) AS completion_rate_pct
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_code, c.course_name
ORDER BY completion_rate_pct DESC;

-- ============================================================
-- QUERY 7: Feedback Analysis per Course
-- PURPOSE: Average rating and satisfaction metrics per course
-- LOGIC: AVG of multiple rating columns grouped by course
-- ============================================================
SELECT
    c.course_name,
    CONCAT(i.first_name, ' ', i.last_name) AS instructor_name,
    COUNT(f.feedback_id)                    AS total_feedback,
    ROUND(AVG(f.rating), 2)                 AS avg_overall_rating,
    ROUND(AVG(f.teaching_quality), 2)       AS avg_teaching_quality,
    ROUND(AVG(f.course_content), 2)         AS avg_course_content,
    MIN(f.rating)                           AS min_rating,
    MAX(f.rating)                           AS max_rating,
    SUM(CASE WHEN f.rating >= 4 THEN 1 ELSE 0 END) AS positive_feedback_count
FROM feedback f
JOIN courses    c ON f.course_id    = c.course_id
JOIN instructors i ON f.instructor_id = i.instructor_id
GROUP BY c.course_id, c.course_name, instructor_name
ORDER BY avg_overall_rating DESC;

-- ============================================================
-- QUERY 8: Department-wise Student Count and Status
-- PURPOSE: Overview of students across all departments
-- LOGIC: GROUP BY department with status breakdown using CASE
-- ============================================================
SELECT
    d.department_name,
    d.department_code,
    COUNT(s.student_id)                                     AS total_students,
    SUM(CASE WHEN s.status = 'Active'    THEN 1 ELSE 0 END) AS active,
    SUM(CASE WHEN s.status = 'Graduated' THEN 1 ELSE 0 END) AS graduated,
    SUM(CASE WHEN s.status = 'Inactive'  THEN 1 ELSE 0 END) AS inactive,
    SUM(CASE WHEN s.status = 'Dropped'   THEN 1 ELSE 0 END) AS dropped
FROM departments d
LEFT JOIN students s ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name, d.department_code
ORDER BY total_students DESC;
