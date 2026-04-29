-- ============================================================
-- PROJECT: Student Performance Database & Analytics Dashboard
-- FILE: 01_schema.sql
-- DESCRIPTION: Complete database schema with all tables,
--              primary keys, foreign keys, and indexes
-- AUTHOR: [Your Name]
-- DATE: 2024
-- ============================================================

-- Create and use the database
CREATE DATABASE IF NOT EXISTS student_performance_db;
USE student_performance_db;

-- ============================================================
-- TABLE 1: departments
-- Stores department/faculty information
-- ============================================================
CREATE TABLE departments (
    department_id   INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    department_code VARCHAR(10)  NOT NULL UNIQUE,
    head_name       VARCHAR(100),
    established_year YEAR,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- TABLE 2: instructors
-- Stores all instructor/teacher information
-- ============================================================
CREATE TABLE instructors (
    instructor_id   INT AUTO_INCREMENT PRIMARY KEY,
    first_name      VARCHAR(50)  NOT NULL,
    last_name       VARCHAR(50)  NOT NULL,
    email           VARCHAR(100) NOT NULL UNIQUE,
    phone           VARCHAR(15),
    department_id   INT,
    designation     VARCHAR(100),
    qualification   VARCHAR(100),
    experience_years INT DEFAULT 0,
    joining_date    DATE,
    status          ENUM('Active', 'Inactive') DEFAULT 'Active',
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- ============================================================
-- TABLE 3: courses
-- Stores all course/subject details
-- ============================================================
CREATE TABLE courses (
    course_id       INT AUTO_INCREMENT PRIMARY KEY,
    course_name     VARCHAR(150) NOT NULL,
    course_code     VARCHAR(20)  NOT NULL UNIQUE,
    department_id   INT,
    instructor_id   INT,
    credits         INT          DEFAULT 3,
    duration_weeks  INT          DEFAULT 16,
    max_students    INT          DEFAULT 60,
    course_level    ENUM('Beginner', 'Intermediate', 'Advanced') DEFAULT 'Beginner',
    start_date      DATE,
    end_date        DATE,
    status          ENUM('Active', 'Completed', 'Upcoming') DEFAULT 'Active',
    description     TEXT,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id)
);

-- ============================================================
-- TABLE 4: students
-- Stores all student personal and academic information
-- ============================================================
CREATE TABLE students (
    student_id      INT AUTO_INCREMENT PRIMARY KEY,
    student_code    VARCHAR(20)  NOT NULL UNIQUE,
    first_name      VARCHAR(50)  NOT NULL,
    last_name       VARCHAR(50)  NOT NULL,
    email           VARCHAR(100) NOT NULL UNIQUE,
    phone           VARCHAR(15),
    date_of_birth   DATE,
    gender          ENUM('Male', 'Female', 'Other'),
    department_id   INT,
    enrollment_year YEAR,
    current_semester INT         DEFAULT 1,
    address         TEXT,
    guardian_name   VARCHAR(100),
    guardian_phone  VARCHAR(15),
    status          ENUM('Active', 'Inactive', 'Graduated', 'Dropped') DEFAULT 'Active',
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- ============================================================
-- TABLE 5: enrollments
-- Links students to courses (many-to-many relationship)
-- ============================================================
CREATE TABLE enrollments (
    enrollment_id   INT AUTO_INCREMENT PRIMARY KEY,
    student_id      INT          NOT NULL,
    course_id       INT          NOT NULL,
    enrollment_date DATE         NOT NULL,
    completion_status ENUM('Enrolled', 'Completed', 'Dropped', 'Failed') DEFAULT 'Enrolled',
    completion_date DATE,
    grade           CHAR(2),
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uq_enrollment (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id)  REFERENCES courses(course_id)
);

-- ============================================================
-- TABLE 6: attendance
-- Daily/session-level attendance tracking
-- ============================================================
CREATE TABLE attendance (
    attendance_id   INT AUTO_INCREMENT PRIMARY KEY,
    student_id      INT          NOT NULL,
    course_id       INT          NOT NULL,
    attendance_date DATE         NOT NULL,
    status          ENUM('Present', 'Absent', 'Late', 'Excused') DEFAULT 'Present',
    remarks         VARCHAR(200),
    marked_by       INT,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id)  REFERENCES courses(course_id),
    FOREIGN KEY (marked_by)  REFERENCES instructors(instructor_id)
);

-- ============================================================
-- TABLE 7: assessments
-- Defines assessment types per course (Quiz, Assignment, Exam)
-- ============================================================
CREATE TABLE assessments (
    assessment_id   INT AUTO_INCREMENT PRIMARY KEY,
    course_id       INT          NOT NULL,
    assessment_name VARCHAR(150) NOT NULL,
    assessment_type ENUM('Quiz', 'Assignment', 'Midterm', 'Final Exam', 'Project', 'Practical') NOT NULL,
    total_marks     INT          NOT NULL,
    weightage       DECIMAL(5,2) COMMENT 'Percentage weight in final grade',
    assessment_date DATE,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- ============================================================
-- TABLE 8: marks
-- Stores each student's marks for each assessment
-- ============================================================
CREATE TABLE marks (
    mark_id         INT AUTO_INCREMENT PRIMARY KEY,
    student_id      INT          NOT NULL,
    assessment_id   INT          NOT NULL,
    marks_obtained  DECIMAL(6,2) NOT NULL,
    submission_date DATE,
    remarks         VARCHAR(200),
    is_absent       BOOLEAN      DEFAULT FALSE,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uq_mark (student_id, assessment_id),
    FOREIGN KEY (student_id)    REFERENCES students(student_id),
    FOREIGN KEY (assessment_id) REFERENCES assessments(assessment_id)
);

-- ============================================================
-- TABLE 9: feedback
-- Student feedback on courses and instructors
-- ============================================================
CREATE TABLE feedback (
    feedback_id     INT AUTO_INCREMENT PRIMARY KEY,
    student_id      INT          NOT NULL,
    course_id       INT          NOT NULL,
    instructor_id   INT          NOT NULL,
    rating          INT          CHECK (rating BETWEEN 1 AND 5),
    teaching_quality INT         CHECK (teaching_quality BETWEEN 1 AND 5),
    course_content  INT          CHECK (course_content BETWEEN 1 AND 5),
    difficulty_level ENUM('Very Easy', 'Easy', 'Moderate', 'Hard', 'Very Hard'),
    comments        TEXT,
    feedback_date   DATE,
    is_anonymous    BOOLEAN      DEFAULT FALSE,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id)   REFERENCES students(student_id),
    FOREIGN KEY (course_id)    REFERENCES courses(course_id),
    FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id)
);

-- ============================================================
-- INDEXES — Improve query performance
-- ============================================================

-- Students: search by department and status often
CREATE INDEX idx_students_department ON students(department_id);
CREATE INDEX idx_students_status     ON students(status);
CREATE INDEX idx_students_year       ON students(enrollment_year);

-- Enrollments: frequent joins on student and course
CREATE INDEX idx_enrollments_student ON enrollments(student_id);
CREATE INDEX idx_enrollments_course  ON enrollments(course_id);
CREATE INDEX idx_enrollments_status  ON enrollments(completion_status);

-- Attendance: frequent date-range and student queries
CREATE INDEX idx_attendance_student  ON attendance(student_id);
CREATE INDEX idx_attendance_course   ON attendance(course_id);
CREATE INDEX idx_attendance_date     ON attendance(attendance_date);

-- Marks: frequent joins
CREATE INDEX idx_marks_student       ON marks(student_id);
CREATE INDEX idx_marks_assessment    ON marks(assessment_id);

-- Feedback: frequent joins
CREATE INDEX idx_feedback_course     ON feedback(course_id);
CREATE INDEX idx_feedback_instructor ON feedback(instructor_id);

-- Assessments: queries by course and type
CREATE INDEX idx_assessments_course  ON assessments(course_id);
CREATE INDEX idx_assessments_type    ON assessments(assessment_type);
