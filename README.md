# 🎓 Student Performance Database & Analytics Dashboard

> A production-ready SQL project simulating a real-world academic analytics system used by colleges, EdTech platforms, and training institutes to track student performance, attendance, assessments, and learning outcomes.

---

## 📋 Table of Contents
- [Project Overview](#project-overview)
- [Why This Project Matters](#why-this-project-matters)
- [Who Uses These Systems](#who-uses-these-systems)
- [Database Schema](#database-schema)
- [Table Descriptions](#table-descriptions)
- [Key Features & Queries](#key-features--queries)
- [SQL Concepts Demonstrated](#sql-concepts-demonstrated)
- [Project Structure](#project-structure)
- [Sample Insights](#sample-insights)
- [Tools Used](#tools-used)

---

## 🔍 Project Overview

This project builds a **complete relational database** for an educational institution, covering:

- **110 students** across 6 departments
- **12 instructors** with course assignments
- **12 courses** at beginner, intermediate, and advanced levels
- **240+ enrollments** linking students to courses
- **400+ attendance records** for session-level tracking
- **320+ marks records** across quizzes, assignments, midterms, and final exams
- **30+ feedback records** with multi-dimensional course ratings

The project goes beyond data storage — it includes **analytics queries** to extract actionable insights for academic decision-making.

---

## 🏫 Why This Project Matters

Student performance tracking is critical in modern education:

| Institution Type | How They Use It |
|---|---|
| **Schools & Colleges** | Track grades, attendance, identify at-risk students early |
| **EdTech Companies** | Monitor course completion rates, engagement, drop-offs |
| **Training Institutes** | Measure skill acquisition, certification pass rates |
| **Academic Departments** | Compare departmental performance, plan resources |
| **Management** | Generate reports for accreditation, governance, strategy |

Poor academic tracking leads to student dropout, failed courses, and institutional inefficiency. A well-designed database **prevents all of this**.

---

## 👔 Who Uses These Systems

This project directly applies to these job roles:

- **SQL Developer / Database Developer** — Schema design, query optimization
- **Data Analyst** — Academic KPI reporting, dashboards
- **Business Analyst** — Translating academic data into institutional decisions
- **Academic Analyst** — Performance trend analysis, intervention planning
- **EdTech Operations Analyst** — Course completion, engagement metrics
- **BI Developer** — Feeding data into Power BI / Tableau dashboards

---

## 🗂️ Database Schema

```
departments ──< instructors ──< courses >──< enrollments >── students
                                   │                              │
                               assessments                    attendance
                                   │                              
                                marks ──────────────────── students
                                   
feedback ─── students, courses, instructors
```

**Entity Relationship Summary:**
- One department has many instructors and many courses
- One instructor teaches many courses
- One course has many enrollments, assessments, and feedback entries
- One student has many enrollments, attendance records, and marks
- Each mark links one student to one assessment

---

## 📊 Table Descriptions

### `departments`
Stores department/faculty information.
| Column | Type | Description |
|---|---|---|
| department_id | INT PK | Unique identifier |
| department_name | VARCHAR(100) | Full department name |
| department_code | VARCHAR(10) | Short code (CS, IT, MBA) |
| head_name | VARCHAR(100) | Department head |
| established_year | YEAR | Year founded |

### `instructors`
All faculty members.
| Column | Type | Description |
|---|---|---|
| instructor_id | INT PK | Unique identifier |
| first_name, last_name | VARCHAR | Full name |
| email | VARCHAR UNIQUE | Work email |
| department_id | INT FK | Department reference |
| designation | VARCHAR | Professor / Lecturer etc. |
| experience_years | INT | Teaching experience |

### `students`
Student personal and academic data.
| Column | Type | Description |
|---|---|---|
| student_id | INT PK | Unique identifier |
| student_code | VARCHAR UNIQUE | Roll number (STU001...) |
| first_name, last_name | VARCHAR | Full name |
| department_id | INT FK | Department enrolled in |
| enrollment_year | YEAR | Batch year |
| status | ENUM | Active / Graduated / Dropped |

### `courses`
Course catalog with instructor and schedule details.
| Column | Type | Description |
|---|---|---|
| course_id | INT PK | Unique identifier |
| course_code | VARCHAR UNIQUE | CS301, MBA201 etc. |
| instructor_id | INT FK | Assigned instructor |
| course_level | ENUM | Beginner / Intermediate / Advanced |
| credits | INT | Academic credit hours |

### `enrollments`
Links students to courses (many-to-many bridge table).
| Column | Type | Description |
|---|---|---|
| enrollment_id | INT PK | Unique identifier |
| student_id | INT FK | Student reference |
| course_id | INT FK | Course reference |
| completion_status | ENUM | Enrolled / Completed / Dropped / Failed |
| grade | CHAR(2) | Final letter grade |

### `attendance`
Session-level presence tracking.
| Column | Type | Description |
|---|---|---|
| attendance_id | INT PK | Unique identifier |
| student_id | INT FK | Student reference |
| course_id | INT FK | Course reference |
| attendance_date | DATE | Class date |
| status | ENUM | Present / Absent / Late / Excused |

### `assessments`
Defines assessment components per course.
| Column | Type | Description |
|---|---|---|
| assessment_id | INT PK | Unique identifier |
| course_id | INT FK | Course reference |
| assessment_type | ENUM | Quiz / Assignment / Midterm / Final Exam / Project |
| total_marks | INT | Maximum marks |
| weightage | DECIMAL | Weight in final grade (%) |

### `marks`
Student scores per assessment.
| Column | Type | Description |
|---|---|---|
| mark_id | INT PK | Unique identifier |
| student_id | INT FK | Student reference |
| assessment_id | INT FK | Assessment reference |
| marks_obtained | DECIMAL | Score achieved |

### `feedback`
Student course and instructor ratings.
| Column | Type | Description |
|---|---|---|
| feedback_id | INT PK | Unique identifier |
| rating | INT (1-5) | Overall satisfaction |
| teaching_quality | INT (1-5) | Teaching effectiveness |
| course_content | INT (1-5) | Content quality |
| difficulty_level | ENUM | Very Easy → Very Hard |
| comments | TEXT | Open-ended feedback |

---

## ⚙️ Key Features & Queries

### 📌 Basic Reports
| Query | Description |
|---|---|
| All student records | Full student list with department |
| Course enrollment count | Students per course with occupancy % |
| Attendance summary | Present / Absent / Late per student per course |
| Marks summary | Total score and percentage per student per course |
| Instructor dashboard | Courses taught, student count, avg rating |
| Course completion tracking | Completed / Dropped / Failed breakdown |
| Feedback analysis | Teaching quality and course content ratings |

### 📊 Academic Insights
| Query | Description |
|---|---|
| Top-performing students | Highest scorers using RANK() per course |
| Low-performing students | Below 50% with intervention classification |
| Low-attendance students | Below 75% attendance flagged by severity |
| Course-wise average marks | Comparative performance across courses |
| Department-wise comparison | Best and worst performing departments |
| Pass/Fail analysis | Pass rate percentages per course |
| Performance bands | Outstanding / Excellent / Good / Average / Fail |

### 🔬 Advanced Analytics
| Query | Description |
|---|---|
| At-risk student identification | Low attendance + low marks combined filter |
| DENSE_RANK student ranking | Continuous rank without gaps |
| Assessment-wise analysis | Avg, max, min, std deviation per assessment type |
| Attendance vs marks pattern | Correlational view of both metrics |
| Instructor impact analysis | Instructor-wise student success rates |
| Overall distribution | Percentage of students in each performance band |

---

## 🧠 SQL Concepts Demonstrated

| Concept | Used Where |
|---|---|
| **JOINs** (INNER, LEFT) | All multi-table queries |
| **GROUP BY + HAVING** | Aggregated summaries with filters |
| **CASE statements** | Performance categories, risk flags |
| **CTEs (WITH clause)** | At-risk detection, ranking, distribution |
| **Window Functions** | RANK(), DENSE_RANK(), SUM() OVER() |
| **Aggregate Functions** | COUNT, SUM, AVG, MAX, MIN, STDDEV |
| **Subqueries** | Nested filtering |
| **Indexes** | Performance optimization on high-traffic columns |
| **ENUM & Constraints** | Data integrity and validation |
| **UNIQUE keys** | Prevent duplicate enrollments and marks |
| **Foreign Keys** | Referential integrity across 9 tables |
| **NULLIF / COALESCE** | Safe division and null handling |

---

## 📁 Project Structure

```
student-performance-db/
│
├── 01_schema.sql           ← Database creation + all 9 tables + indexes
├── 02_sample_data.sql      ← 110 students, 12 courses, 400+ records
├── 03_basic_queries.sql    ← 8 standard data retrieval queries
├── 04_analytics_queries.sql← 14 analytics and advanced queries
└── README.md               ← Project documentation (this file)

```


## 💡 Sample Insights

After running the analytics queries, you can expect outputs like:

- **Student STU009 (Kiran Nair)** scored **98%** in DBMS — ranked #1
- **Student STU008** had **only 55/100** in the final exam — flagged as at-risk
- **CS Department** has the highest average marks at **82.4%**
- **Machine Learning course** has **100% completion rate** but lowest avg score
- **3 students** have both attendance < 75% and marks < 50% — need counselling
- **Instructor Ravi Kumar** has an average student feedback rating of **4.3/5**

---

## 🛠️ Tools Used

| Tool | Purpose |
|---|---|
| **MySQL 8.0** | Primary database engine |
| **MySQL Workbench** | Schema design and query execution |
| **SQL** | DDL, DML, DQL, window functions, CTEs |

---


## 🏆 Real-World Applications

This database design can directly power:
- **College ERP systems** (student portals, grade sheets)
- **EdTech dashboards** (Coursera, BYJU's-style progress tracking)
- **Training institute reports** (Certification pass rates, instructor evaluation)
- **Academic department analytics** (Resource allocation, curriculum review)
- **Government education analytics** (State-level student outcome tracking)

---

## 📝 Author

**Debarati Pal**  
 

