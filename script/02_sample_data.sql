-- ============================================================
-- PROJECT: Student Performance Database & Analytics Dashboard
-- FILE: 02_sample_data.sql
-- DESCRIPTION: Realistic sample data — departments, instructors,
--              courses, 100+ students, enrollments, attendance,
--              assessments, marks, and feedback
-- ============================================================

USE student_performance_db;

-- ============================================================
-- DEPARTMENTS (6 departments)
-- ============================================================
INSERT INTO departments (department_name, department_code, head_name, established_year) VALUES
('Computer Science',        'CS',   'Dr. Ramesh Gupta',      2005),
('Information Technology',  'IT',   'Dr. Sunita Sharma',     2007),
('Electronics Engineering', 'EC',   'Dr. Prakash Mehta',     2003),
('Business Administration', 'MBA',  'Dr. Neha Verma',        2010),
('Data Science',            'DS',   'Dr. Arjun Patel',       2018),
('Mathematics',             'MATH', 'Dr. Kavita Joshi',      2001);

-- ============================================================
-- INSTRUCTORS (12 instructors)
-- ============================================================
INSERT INTO instructors (first_name, last_name, email, phone, department_id, designation, qualification, experience_years, joining_date) VALUES
('Ravi',       'Kumar',    'ravi.kumar@institute.edu',    '9876543210', 1, 'Associate Professor', 'M.Tech, PhD',  12, '2012-07-15'),
('Priya',      'Sharma',   'priya.sharma@institute.edu',  '9876543211', 1, 'Assistant Professor', 'M.Tech',       7,  '2017-08-01'),
('Anand',      'Verma',    'anand.verma@institute.edu',   '9876543212', 2, 'Associate Professor', 'MCA, PhD',     10, '2014-07-20'),
('Sneha',      'Patil',    'sneha.patil@institute.edu',   '9876543213', 2, 'Assistant Professor', 'MCA',          5,  '2019-07-15'),
('Rajesh',     'Singh',    'rajesh.singh@institute.edu',  '9876543214', 3, 'Professor',           'M.Tech, PhD',  18, '2006-08-01'),
('Meera',      'Joshi',    'meera.joshi@institute.edu',   '9876543215', 4, 'Associate Professor', 'MBA, PhD',     9,  '2015-07-10'),
('Deepak',     'Nair',     'deepak.nair@institute.edu',   '9876543216', 4, 'Assistant Professor', 'MBA',          4,  '2020-08-01'),
('Sunita',     'Rao',      'sunita.rao@institute.edu',    '9876543217', 5, 'Assistant Professor', 'M.Sc DS, PhD', 6,  '2018-07-15'),
('Vikram',     'Mishra',   'vikram.mishra@institute.edu', '9876543218', 5, 'Lecturer',            'M.Sc DS',      3,  '2021-08-01'),
('Kavya',      'Agarwal',  'kavya.agarwal@institute.edu', '9876543219', 6, 'Associate Professor', 'M.Sc, PhD',    11, '2013-07-20'),
('Rohit',      'Bansal',   'rohit.bansal@institute.edu',  '9876543220', 1, 'Assistant Professor', 'M.Tech',       4,  '2020-07-15'),
('Lalitha',    'Reddy',    'lalitha.reddy@institute.edu', '9876543221', 3, 'Lecturer',            'M.Tech',       2,  '2022-08-01');

-- ============================================================
-- COURSES (12 courses)
-- ============================================================
INSERT INTO courses (course_name, course_code, department_id, instructor_id, credits, duration_weeks, max_students, course_level, start_date, end_date, status) VALUES
('Database Management Systems',    'CS301', 1, 1,  4, 16, 60, 'Intermediate', '2024-01-15', '2024-05-15', 'Completed'),
('Python Programming',             'CS201', 1, 2,  3, 12, 60, 'Beginner',     '2024-01-15', '2024-04-15', 'Completed'),
('Web Development with React',     'IT401', 2, 3,  4, 16, 55, 'Advanced',     '2024-01-15', '2024-05-15', 'Completed'),
('Network Security Fundamentals',  'IT301', 2, 4,  3, 14, 50, 'Intermediate', '2024-01-15', '2024-04-30', 'Completed'),
('Digital Signal Processing',      'EC401', 3, 5,  4, 16, 45, 'Advanced',     '2024-01-15', '2024-05-15', 'Completed'),
('Business Analytics',             'MBA301',4, 6,  3, 12, 65, 'Intermediate', '2024-01-15', '2024-04-15', 'Completed'),
('Marketing Management',           'MBA201',4, 7,  3, 12, 65, 'Beginner',     '2024-01-15', '2024-04-15', 'Completed'),
('Machine Learning Fundamentals',  'DS301', 5, 8,  4, 16, 50, 'Intermediate', '2024-01-15', '2024-05-15', 'Completed'),
('Data Visualization with Python', 'DS201', 5, 9,  3, 12, 50, 'Beginner',     '2024-01-15', '2024-04-15', 'Completed'),
('Calculus and Linear Algebra',    'MATH201',6,10, 4, 16, 70, 'Beginner',     '2024-01-15', '2024-05-15', 'Completed'),
('Advanced SQL & Query Optimization','CS401',1,11, 3, 12, 55, 'Advanced',     '2024-01-15', '2024-04-15', 'Completed'),
('Embedded Systems',               'EC301', 3, 12, 3, 14, 40, 'Intermediate', '2024-01-15', '2024-04-30', 'Completed');

-- ============================================================
-- STUDENTS (110 students)
-- ============================================================
INSERT INTO students (student_code, first_name, last_name, email, phone, date_of_birth, gender, department_id, enrollment_year, current_semester, guardian_name) VALUES
('STU001','Aarav','Sharma','aarav.sharma@student.edu','9810000001','2003-04-15','Male',1,2022,5,'Ramesh Sharma'),
('STU002','Priya','Patel','priya.patel@student.edu','9810000002','2003-07-22','Female',1,2022,5,'Suresh Patel'),
('STU003','Rahul','Singh','rahul.singh@student.edu','9810000003','2002-11-10','Male',1,2022,5,'Mahesh Singh'),
('STU004','Anjali','Verma','anjali.verma@student.edu','9810000004','2003-03-18','Female',1,2022,5,'Dinesh Verma'),
('STU005','Vikram','Kumar','vikram.kumar@student.edu','9810000005','2002-09-05','Male',1,2022,5,'Anil Kumar'),
('STU006','Neha','Gupta','neha.gupta@student.edu','9810000006','2003-01-28','Female',1,2022,5,'Vikas Gupta'),
('STU007','Arjun','Mishra','arjun.mishra@student.edu','9810000007','2002-12-14','Male',1,2022,5,'Sunil Mishra'),
('STU008','Pooja','Joshi','pooja.joshi@student.edu','9810000008','2003-06-09','Female',1,2022,5,'Rajesh Joshi'),
('STU009','Kiran','Nair','kiran.nair@student.edu','9810000009','2002-08-25','Male',1,2022,5,'Krishnan Nair'),
('STU010','Ritu','Agarwal','ritu.agarwal@student.edu','9810000010','2003-02-17','Female',1,2022,5,'Mohan Agarwal'),
('STU011','Siddharth','Rao','siddharth.rao@student.edu','9810000011','2003-05-30','Male',2,2022,5,'Venkat Rao'),
('STU012','Divya','Reddy','divya.reddy@student.edu','9810000012','2002-10-11','Female',2,2022,5,'Ramu Reddy'),
('STU013','Aditya','Bansal','aditya.bansal@student.edu','9810000013','2003-08-19','Male',2,2022,5,'Mohan Bansal'),
('STU014','Kavya','Desai','kavya.desai@student.edu','9810000014','2003-01-07','Female',2,2022,5,'Nilesh Desai'),
('STU015','Rohan','Shah','rohan.shah@student.edu','9810000015','2002-07-23','Male',2,2022,5,'Bharat Shah'),
('STU016','Sneha','Mehta','sneha.mehta@student.edu','9810000016','2003-04-04','Female',2,2022,5,'Ketan Mehta'),
('STU017','Ankit','Thakur','ankit.thakur@student.edu','9810000017','2002-11-29','Male',2,2022,5,'Ramesh Thakur'),
('STU018','Swati','Chaudhary','swati.chaudhary@student.edu','9810000018','2003-09-16','Female',2,2022,5,'Vinod Chaudhary'),
('STU019','Pranav','Dubey','pranav.dubey@student.edu','9810000019','2002-06-01','Male',2,2022,5,'Ashok Dubey'),
('STU020','Tanya','Pandey','tanya.pandey@student.edu','9810000020','2003-03-13','Female',2,2022,5,'Ajay Pandey'),
('STU021','Harsh','Srivastava','harsh.sri@student.edu','9810000021','2001-12-20','Male',3,2021,7,'Rakesh Srivastava'),
('STU022','Priyanka','Iyer','priyanka.iyer@student.edu','9810000022','2001-07-08','Female',3,2021,7,'Venkatesh Iyer'),
('STU023','Sumit','Pillai','sumit.pillai@student.edu','9810000023','2001-05-15','Male',3,2021,7,'Suresh Pillai'),
('STU024','Ankita','Bose','ankita.bose@student.edu','9810000024','2001-10-22','Female',3,2021,7,'Subhash Bose'),
('STU025','Gaurav','Chauhan','gaurav.chauhan@student.edu','9810000025','2001-03-09','Male',3,2021,7,'Rajkumar Chauhan'),
('STU026','Preeti','Aggarwal','preeti.aggarwal@student.edu','9810000026','2001-08-27','Female',3,2021,7,'Ramesh Aggarwal'),
('STU027','Nikhil','Tiwari','nikhil.tiwari@student.edu','9810000027','2001-11-14','Male',3,2021,7,'Shyam Tiwari'),
('STU028','Komal','Saxena','komal.saxena@student.edu','9810000028','2001-06-03','Female',3,2021,7,'Arun Saxena'),
('STU029','Manish','Yadav','manish.yadav@student.edu','9810000029','2001-02-18','Male',3,2021,7,'Ramprasad Yadav'),
('STU030','Lata','Shukla','lata.shukla@student.edu','9810000030','2001-09-11','Female',3,2021,7,'Mahendra Shukla'),
('STU031','Deepak','Kapoor','deepak.kapoor@student.edu','9810000031','2002-04-26','Male',4,2022,5,'Satish Kapoor'),
('STU032','Nisha','Malhotra','nisha.malhotra@student.edu','9810000032','2002-01-13','Female',4,2022,5,'Dinesh Malhotra'),
('STU033','Vivek','Mathur','vivek.mathur@student.edu','9810000033','2003-07-07','Male',4,2022,5,'Pradeep Mathur'),
('STU034','Asha','Naik','asha.naik@student.edu','9810000034','2002-12-24','Female',4,2022,5,'Ganesh Naik'),
('STU035','Rajat','Tyagi','rajat.tyagi@student.edu','9810000035','2003-05-11','Male',4,2022,5,'Mohit Tyagi'),
('STU036','Shweta','Rastogi','shweta.rastogi@student.edu','9810000036','2002-02-28','Female',4,2022,5,'Avinash Rastogi'),
('STU037','Mayank','Sinha','mayank.sinha@student.edu','9810000037','2003-10-05','Male',4,2022,5,'Sudhir Sinha'),
('STU038','Pallavi','Arora','pallavi.arora@student.edu','9810000038','2002-08-18','Female',4,2022,5,'Vijay Arora'),
('STU039','Tarun','Khanna','tarun.khanna@student.edu','9810000039','2003-04-02','Male',4,2022,5,'Ashwini Khanna'),
('STU040','Usha','Bajaj','usha.bajaj@student.edu','9810000040','2002-11-15','Female',4,2022,5,'Sharad Bajaj'),
('STU041','Akash','Trivedi','akash.trivedi@student.edu','9810000041','2002-03-21','Male',5,2022,5,'Suresh Trivedi'),
('STU042','Bhavna','Kulkarni','bhavna.kulkarni@student.edu','9810000042','2002-06-08','Female',5,2022,5,'Dattatray Kulkarni'),
('STU043','Chetan','Goyal','chetan.goyal@student.edu','9810000043','2003-01-25','Male',5,2022,5,'Kishore Goyal'),
('STU044','Deepika','Pawar','deepika.pawar@student.edu','9810000044','2002-09-12','Female',5,2022,5,'Balasaheb Pawar'),
('STU045','Eshan','Ghosh','eshan.ghosh@student.edu','9810000045','2003-11-29','Male',5,2022,5,'Pranab Ghosh'),
('STU046','Falguni','Chatterjee','falguni.chat@student.edu','9810000046','2002-07-16','Female',5,2022,5,'Tapas Chatterjee'),
('STU047','Gaurav','Das','gaurav.das@student.edu','9810000047','2003-04-03','Male',5,2022,5,'Prasanta Das'),
('STU048','Hema','Sen','hema.sen@student.edu','9810000048','2002-12-20','Female',5,2022,5,'Bimal Sen'),
('STU049','Ishan','Roy','ishan.roy@student.edu','9810000049','2003-08-07','Male',5,2022,5,'Ashim Roy'),
('STU050','Jyoti','Mukherjee','jyoti.mukherjee@student.edu','9810000050','2002-05-24','Female',5,2022,5,'Siddharth Mukherjee'),
('STU051','Kartik','Mehrotra','kartik.mehrotra@student.edu','9810000051','2003-02-10','Male',6,2022,5,'Arun Mehrotra'),
('STU052','Lavanya','Krishnan','lavanya.krishnan@student.edu','9810000052','2002-10-27','Female',6,2022,5,'Subramaniam Krishnan'),
('STU053','Mohit','Bhatia','mohit.bhatia@student.edu','9810000053','2003-06-14','Male',6,2022,5,'Rajinder Bhatia'),
('STU054','Nandini','Choudhury','nandini.choud@student.edu','9810000054','2002-03-01','Female',6,2022,5,'Brajesh Choudhury'),
('STU055','Omkar','Dalvi','omkar.dalvi@student.edu','9810000055','2003-09-18','Male',6,2022,5,'Shashikant Dalvi'),
('STU056','Pallak','Sethi','pallak.sethi@student.edu','9810000056','2002-01-05','Female',6,2022,5,'Harish Sethi'),
('STU057','Qasim','Ali','qasim.ali@student.edu','9810000057','2003-07-22','Male',1,2023,3,'Irfan Ali'),
('STU058','Rina','Das','rina.das@student.edu','9810000058','2003-12-09','Female',1,2023,3,'Tapan Das'),
('STU059','Suman','Biswas','suman.biswas@student.edu','9810000059','2003-05-26','Male',1,2023,3,'Samir Biswas'),
('STU060','Trishna','Paul','trishna.paul@student.edu','9810000060','2004-02-13','Female',1,2023,3,'Dipak Paul'),
('STU061','Utkarsh','Soni','utkarsh.soni@student.edu','9810000061','2003-10-01','Male',2,2023,3,'Hemant Soni'),
('STU062','Vandana','Puri','vandana.puri@student.edu','9810000062','2004-07-18','Female',2,2023,3,'Pawan Puri'),
('STU063','Waqar','Sheikh','waqar.sheikh@student.edu','9810000063','2003-04-05','Male',2,2023,3,'Imtiaz Sheikh'),
('STU064','Xena','Thomas','xena.thomas@student.edu','9810000064','2004-11-22','Female',2,2023,3,'Johnson Thomas'),
('STU065','Yash','Mittal','yash.mittal@student.edu','9810000065','2003-08-09','Male',2,2023,3,'Pankaj Mittal'),
('STU066','Zara','Qureshi','zara.qureshi@student.edu','9810000066','2004-01-26','Female',3,2023,3,'Salim Qureshi'),
('STU067','Amaan','Farooqui','amaan.farooqui@student.edu','9810000067','2003-06-13','Male',3,2023,3,'Shaikh Farooqui'),
('STU068','Bindu','Gowda','bindu.gowda@student.edu','9810000068','2004-03-30','Female',3,2023,3,'Siddeshwar Gowda'),
('STU069','Chandra','Prasad','chandra.prasad@student.edu','9810000069','2003-11-16','Male',3,2023,3,'Nagendra Prasad'),
('STU070','Dhwani','Shah','dhwani.shah@student.edu','9810000070','2004-08-03','Female',3,2023,3,'Chirag Shah'),
('STU071','Eswari','Nandakumar','eswari.nanda@student.edu','9810000071','2003-05-21','Female',4,2023,3,'Nandakumar A'),
('STU072','Farhan','Ansari','farhan.ansari@student.edu','9810000072','2003-02-07','Male',4,2023,3,'Iqbal Ansari'),
('STU073','Gopika','Menon','gopika.menon@student.edu','9810000073','2004-09-24','Female',4,2023,3,'Gopalakrishnan Menon'),
('STU074','Hemant','Tripathi','hemant.tripathi@student.edu','9810000074','2003-07-11','Male',4,2023,3,'Rajendra Tripathi'),
('STU075','Iqra','Siddiqui','iqra.siddiqui@student.edu','9810000075','2004-04-28','Female',4,2023,3,'Akhtar Siddiqui'),
('STU076','Jaideep','Rawat','jaideep.rawat@student.edu','9810000076','2003-12-15','Male',5,2023,3,'Virendra Rawat'),
('STU077','Kritika','Anand','kritika.anand@student.edu','9810000077','2004-06-02','Female',5,2023,3,'Vipin Anand'),
('STU078','Lalit','Solanki','lalit.solanki@student.edu','9810000078','2003-03-20','Male',5,2023,3,'Bhagwat Solanki'),
('STU079','Mamta','Bisht','mamta.bisht@student.edu','9810000079','2004-10-07','Female',5,2023,3,'Pradip Bisht'),
('STU080','Naveen','Chandra','naveen.chandra@student.edu','9810000080','2003-08-24','Male',5,2023,3,'Satya Chandra'),
('STU081','Ojasvi','Jain','ojasvi.jain@student.edu','9810000081','2004-05-12','Female',6,2023,3,'Sanjiv Jain'),
('STU082','Parth','Vyas','parth.vyas@student.edu','9810000082','2003-01-29','Male',6,2023,3,'Dilip Vyas'),
('STU083','Queenie','D''souza','queenie.dsouza@student.edu','9810000083','2004-07-16','Female',6,2023,3,'Raymond DSouza'),
('STU084','Rishabh','Jain','rishabh.jain@student.edu','9810000084','2003-11-03','Male',6,2023,3,'Pramod Jain'),
('STU085','Sanya','Khare','sanya.khare@student.edu','9810000085','2004-04-20','Female',6,2023,3,'Umesh Khare'),
('STU086','Tarun','Dev','tarun.dev@student.edu','9810000086','2002-09-07','Male',1,2021,7,'Ramdev T'),
('STU087','Uma','Shankar','uma.shankar@student.edu','9810000087','2001-12-24','Female',1,2021,7,'Mahesh Shankar'),
('STU088','Varun','Tewari','varun.tewari@student.edu','9810000088','2002-05-11','Male',1,2021,7,'Arvind Tewari'),
('STU089','Wasim','Akram','wasim.akram@student.edu','9810000089','2001-08-28','Male',2,2021,7,'Mohammad Akram'),
('STU090','Yogita','Misra','yogita.misra@student.edu','9810000090','2002-02-14','Female',2,2021,7,'Anupam Misra'),
('STU091','Abhijeet','Wagh','abhijeet.wagh@student.edu','9810000091','2002-07-01','Male',2,2021,7,'Dattatray Wagh'),
('STU092','Bhumi','Panchal','bhumi.panchal@student.edu','9810000092','2001-10-18','Female',2,2021,7,'Ashok Panchal'),
('STU093','Chandan','Sinha','chandan.sinha@student.edu','9810000093','2002-04-05','Male',3,2021,7,'Ajit Sinha'),
('STU094','Disha','Kapila','disha.kapila@student.edu','9810000094','2001-06-22','Female',3,2021,7,'Naresh Kapila'),
('STU095','Eklavya','Roy','eklavya.roy@student.edu','9810000095','2002-11-09','Male',3,2021,7,'Biplab Roy'),
('STU096','Farida','Momin','farida.momin@student.edu','9810000096','2001-03-26','Female',4,2021,7,'Aminbhai Momin'),
('STU097','Govind','Pande','govind.pande@student.edu','9810000097','2002-08-13','Male',4,2021,7,'Shriram Pande'),
('STU098','Hiral','Darji','hiral.darji@student.edu','9810000098','2001-12-31','Female',4,2021,7,'Kanji Darji'),
('STU099','Ilavarasan','Raj','ilavarasan.raj@student.edu','9810000099','2002-06-17','Male',5,2021,7,'Kannan Raj'),
('STU100','Jalpa','Trivedi','jalpa.trivedi@student.edu','9810000100','2001-09-04','Female',5,2021,7,'Hasmukh Trivedi'),
('STU101','Kamal','Hassan','kamal.hassan@student.edu','9810000101','2002-01-22','Male',5,2021,7,'Hassan K'),
('STU102','Lisha','Bhandari','lisha.bhandari@student.edu','9810000102','2001-07-09','Female',5,2021,7,'Mohan Bhandari'),
('STU103','Mehul','Vora','mehul.vora@student.edu','9810000103','2002-04-26','Male',6,2021,7,'Suresh Vora'),
('STU104','Nidhi','Sachdev','nidhi.sachdev@student.edu','9810000104','2001-11-13','Female',6,2021,7,'Brij Sachdev'),
('STU105','Onkar','Salunkhe','onkar.salunkhe@student.edu','9810000105','2002-02-01','Male',6,2021,7,'Bhimrao Salunkhe'),
('STU106','Parisa','Irani','parisa.irani@student.edu','9810000106','2001-05-18','Female',6,2021,7,'Feroze Irani'),
('STU107','Qaisar','Mirza','qaisar.mirza@student.edu','9810000107','2002-09-05','Male',1,2023,3,'Sher Mirza'),
('STU108','Reema','Kapoor','reema.kapoor@student.edu','9810000108','2003-12-22','Female',1,2023,3,'Vinay Kapoor'),
('STU109','Suresh','Pillai','suresh.pillai@student.edu','9810000109','2002-07-08','Male',2,2023,3,'Rajan Pillai'),
('STU110','Tejaswi','Naidu','tejaswi.naidu@student.edu','9810000110','2003-04-25','Female',2,2023,3,'Chandrababu Naidu');

-- ============================================================
-- ASSESSMENTS (for key courses — 3–4 per course)
-- ============================================================
INSERT INTO assessments (course_id, assessment_name, assessment_type, total_marks, weightage, assessment_date) VALUES
-- CS301 - DBMS
(1, 'DBMS Quiz 1',           'Quiz',       20, 10.00, '2024-02-15'),
(1, 'DBMS Assignment 1',     'Assignment',  30, 15.00, '2024-03-01'),
(1, 'DBMS Midterm Exam',     'Midterm',     50, 25.00, '2024-03-15'),
(1, 'DBMS Final Exam',       'Final Exam', 100, 50.00, '2024-05-10'),
-- CS201 - Python
(2, 'Python Quiz 1',         'Quiz',        20, 10.00, '2024-02-10'),
(2, 'Python Assignment 1',   'Assignment',  30, 15.00, '2024-02-28'),
(2, 'Python Midterm',        'Midterm',     50, 25.00, '2024-03-12'),
(2, 'Python Final Exam',     'Final Exam', 100, 50.00, '2024-04-10'),
-- IT401 - Web Dev
(3, 'React Quiz 1',          'Quiz',        20, 10.00, '2024-02-18'),
(3, 'React Project',         'Project',     50, 25.00, '2024-04-01'),
(3, 'React Midterm',         'Midterm',     50, 25.00, '2024-03-20'),
(3, 'React Final Exam',      'Final Exam', 100, 40.00, '2024-05-12'),
-- MBA301 - Business Analytics
(6, 'BA Quiz 1',             'Quiz',        20, 10.00, '2024-02-12'),
(6, 'BA Case Study',         'Assignment',  40, 20.00, '2024-03-05'),
(6, 'BA Midterm',            'Midterm',     50, 20.00, '2024-03-18'),
(6, 'BA Final Exam',         'Final Exam', 100, 50.00, '2024-04-12'),
-- DS301 - Machine Learning
(8, 'ML Quiz 1',             'Quiz',        20, 10.00, '2024-02-20'),
(8, 'ML Assignment 1',       'Assignment',  30, 15.00, '2024-03-08'),
(8, 'ML Midterm',            'Midterm',     50, 25.00, '2024-03-22'),
(8, 'ML Final Exam',         'Final Exam', 100, 50.00, '2024-05-14');

-- ============================================================
-- ENROLLMENTS (~240 records — students enrolled in courses)
-- ============================================================
-- Course 1 (CS301 - DBMS): Students 1-30 + select others
INSERT INTO enrollments (student_id, course_id, enrollment_date, completion_status, grade) VALUES
(1,1,'2024-01-15','Completed','A'),(2,1,'2024-01-15','Completed','A'),
(3,1,'2024-01-15','Completed','B'),(4,1,'2024-01-15','Completed','A'),
(5,1,'2024-01-15','Completed','B'),(6,1,'2024-01-15','Completed','A'),
(7,1,'2024-01-15','Completed','B'),(8,1,'2024-01-15','Completed','C'),
(9,1,'2024-01-15','Completed','A'),(10,1,'2024-01-15','Completed','B'),
(11,1,'2024-01-15','Completed','A'),(12,1,'2024-01-15','Completed','B'),
(13,1,'2024-01-15','Completed','C'),(14,1,'2024-01-15','Completed','A'),
(15,1,'2024-01-15','Completed','B'),(86,1,'2024-01-15','Completed','A'),
(87,1,'2024-01-15','Completed','A'),(88,1,'2024-01-15','Completed','B'),
(107,1,'2024-01-15','Completed','B'),(108,1,'2024-01-15','Completed','A'),
-- Course 2 (CS201 - Python): Students 1-20 + new batch
(1,2,'2024-01-15','Completed','A'),(2,2,'2024-01-15','Completed','B'),
(3,2,'2024-01-15','Completed','A'),(4,2,'2024-01-15','Completed','A'),
(5,2,'2024-01-15','Completed','C'),(6,2,'2024-01-15','Completed','B'),
(57,2,'2024-01-15','Completed','A'),(58,2,'2024-01-15','Completed','B'),
(59,2,'2024-01-15','Completed','A'),(60,2,'2024-01-15','Completed','C'),
(107,2,'2024-01-15','Completed','B'),(108,2,'2024-01-15','Completed','A'),
(109,2,'2024-01-15','Completed','B'),(110,2,'2024-01-15','Completed','A'),
-- Course 3 (IT401 - Web Dev): Students 11-30
(11,3,'2024-01-15','Completed','B'),(12,3,'2024-01-15','Completed','A'),
(13,3,'2024-01-15','Completed','A'),(14,3,'2024-01-15','Completed','B'),
(15,3,'2024-01-15','Completed','C'),(16,3,'2024-01-15','Completed','A'),
(17,3,'2024-01-15','Completed','B'),(18,3,'2024-01-15','Completed','A'),
(19,3,'2024-01-15','Completed','B'),(20,3,'2024-01-15','Completed','A'),
(61,3,'2024-01-15','Completed','B'),(62,3,'2024-01-15','Completed','A'),
(63,3,'2024-01-15','Completed','C'),(64,3,'2024-01-15','Completed','B'),
(65,3,'2024-01-15','Completed','A'),
-- Course 6 (MBA301 - Business Analytics): Students 31-50
(31,6,'2024-01-15','Completed','A'),(32,6,'2024-01-15','Completed','B'),
(33,6,'2024-01-15','Completed','A'),(34,6,'2024-01-15','Completed','C'),
(35,6,'2024-01-15','Completed','B'),(36,6,'2024-01-15','Completed','A'),
(37,6,'2024-01-15','Completed','B'),(38,6,'2024-01-15','Completed','A'),
(39,6,'2024-01-15','Completed','C'),(40,6,'2024-01-15','Completed','A'),
(71,6,'2024-01-15','Completed','B'),(72,6,'2024-01-15','Completed','A'),
(73,6,'2024-01-15','Completed','A'),(74,6,'2024-01-15','Completed','B'),
(75,6,'2024-01-15','Completed','C'),
-- Course 8 (DS301 - Machine Learning): Students 41-60
(41,8,'2024-01-15','Completed','A'),(42,8,'2024-01-15','Completed','B'),
(43,8,'2024-01-15','Completed','A'),(44,8,'2024-01-15','Completed','A'),
(45,8,'2024-01-15','Completed','B'),(46,8,'2024-01-15','Completed','C'),
(47,8,'2024-01-15','Completed','A'),(48,8,'2024-01-15','Completed','B'),
(49,8,'2024-01-15','Completed','A'),(50,8,'2024-01-15','Completed','B'),
(76,8,'2024-01-15','Completed','A'),(77,8,'2024-01-15','Completed','A'),
(78,8,'2024-01-15','Completed','B'),(79,8,'2024-01-15','Completed','C'),
(80,8,'2024-01-15','Completed','B'),(99,8,'2024-01-15','Completed','A'),
(100,8,'2024-01-15','Completed','B'),(101,8,'2024-01-15','Completed','A'),
(102,8,'2024-01-15','Completed','A'),(103,8,'2024-01-15','Completed','B');

-- ============================================================
-- MARKS — for assessments in 5 key courses (batch insert)
-- ============================================================
-- CS301 DBMS marks (assessment_ids 1-4)
-- Assessment 1: Quiz (max 20)
INSERT INTO marks (student_id, assessment_id, marks_obtained, submission_date) VALUES
(1,1,18,'2024-02-15'),(2,1,17,'2024-02-15'),(3,1,15,'2024-02-15'),
(4,1,19,'2024-02-15'),(5,1,14,'2024-02-15'),(6,1,18,'2024-02-15'),
(7,1,13,'2024-02-15'),(8,1,12,'2024-02-15'),(9,1,20,'2024-02-15'),
(10,1,16,'2024-02-15'),(11,1,17,'2024-02-15'),(12,1,15,'2024-02-15'),
(13,1,11,'2024-02-15'),(14,1,19,'2024-02-15'),(15,1,16,'2024-02-15'),
(86,1,18,'2024-02-15'),(87,1,20,'2024-02-15'),(88,1,17,'2024-02-15'),
(107,1,14,'2024-02-15'),(108,1,19,'2024-02-15');
-- Assessment 2: Assignment (max 30)
INSERT INTO marks (student_id, assessment_id, marks_obtained, submission_date) VALUES
(1,2,27,'2024-03-01'),(2,2,25,'2024-03-01'),(3,2,22,'2024-03-01'),
(4,2,29,'2024-03-01'),(5,2,20,'2024-03-01'),(6,2,26,'2024-03-01'),
(7,2,19,'2024-03-01'),(8,2,18,'2024-03-01'),(9,2,30,'2024-03-01'),
(10,2,23,'2024-03-01'),(11,2,26,'2024-03-01'),(12,2,24,'2024-03-01'),
(13,2,16,'2024-03-01'),(14,2,28,'2024-03-01'),(15,2,25,'2024-03-01'),
(86,2,28,'2024-03-01'),(87,2,29,'2024-03-01'),(88,2,24,'2024-03-01'),
(107,2,21,'2024-03-01'),(108,2,27,'2024-03-01');
-- Assessment 3: Midterm (max 50)
INSERT INTO marks (student_id, assessment_id, marks_obtained, submission_date) VALUES
(1,3,45,'2024-03-15'),(2,3,42,'2024-03-15'),(3,3,37,'2024-03-15'),
(4,3,48,'2024-03-15'),(5,3,34,'2024-03-15'),(6,3,44,'2024-03-15'),
(7,3,32,'2024-03-15'),(8,3,28,'2024-03-15'),(9,3,50,'2024-03-15'),
(10,3,39,'2024-03-15'),(11,3,43,'2024-03-15'),(12,3,36,'2024-03-15'),
(13,3,25,'2024-03-15'),(14,3,47,'2024-03-15'),(15,3,41,'2024-03-15'),
(86,3,46,'2024-03-15'),(87,3,49,'2024-03-15'),(88,3,38,'2024-03-15'),
(107,3,33,'2024-03-15'),(108,3,44,'2024-03-15');
-- Assessment 4: Final Exam (max 100)
INSERT INTO marks (student_id, assessment_id, marks_obtained, submission_date) VALUES
(1,4,88,'2024-05-10'),(2,4,82,'2024-05-10'),(3,4,71,'2024-05-10'),
(4,4,94,'2024-05-10'),(5,4,65,'2024-05-10'),(6,4,85,'2024-05-10'),
(7,4,60,'2024-05-10'),(8,4,55,'2024-05-10'),(9,4,98,'2024-05-10'),
(10,4,75,'2024-05-10'),(11,4,83,'2024-05-10'),(12,4,70,'2024-05-10'),
(13,4,48,'2024-05-10'),(14,4,92,'2024-05-10'),(15,4,78,'2024-05-10'),
(86,4,89,'2024-05-10'),(87,4,96,'2024-05-10'),(88,4,73,'2024-05-10'),
(107,4,62,'2024-05-10'),(108,4,86,'2024-05-10');

-- CS201 Python marks (assessment_ids 5-8)
INSERT INTO marks (student_id, assessment_id, marks_obtained, submission_date) VALUES
(1,5,17,'2024-02-10'),(2,5,16,'2024-02-10'),(3,5,18,'2024-02-10'),
(4,5,20,'2024-02-10'),(5,5,13,'2024-02-10'),(6,5,15,'2024-02-10'),
(57,5,19,'2024-02-10'),(58,5,14,'2024-02-10'),(59,5,17,'2024-02-10'),
(60,5,12,'2024-02-10'),(107,5,16,'2024-02-10'),(108,5,18,'2024-02-10'),
(109,5,15,'2024-02-10'),(110,5,19,'2024-02-10');
INSERT INTO marks (student_id, assessment_id, marks_obtained, submission_date) VALUES
(1,6,26,'2024-02-28'),(2,6,24,'2024-02-28'),(3,6,28,'2024-02-28'),
(4,6,29,'2024-02-28'),(5,6,18,'2024-02-28'),(6,6,22,'2024-02-28'),
(57,6,27,'2024-02-28'),(58,6,20,'2024-02-28'),(59,6,25,'2024-02-28'),
(60,6,17,'2024-02-28'),(107,6,23,'2024-02-28'),(108,6,28,'2024-02-28'),
(109,6,24,'2024-02-28'),(110,6,29,'2024-02-28');
INSERT INTO marks (student_id, assessment_id, marks_obtained, submission_date) VALUES
(1,7,43,'2024-03-12'),(2,7,40,'2024-03-12'),(3,7,46,'2024-03-12'),
(4,7,48,'2024-03-12'),(5,7,32,'2024-03-12'),(6,7,38,'2024-03-12'),
(57,7,45,'2024-03-12'),(58,7,35,'2024-03-12'),(59,7,42,'2024-03-12'),
(60,7,28,'2024-03-12'),(107,7,39,'2024-03-12'),(108,7,47,'2024-03-12'),
(109,7,41,'2024-03-12'),(110,7,49,'2024-03-12');
INSERT INTO marks (student_id, assessment_id, marks_obtained, submission_date) VALUES
(1,8,85,'2024-04-10'),(2,8,79,'2024-04-10'),(3,8,90,'2024-04-10'),
(4,8,95,'2024-04-10'),(5,8,60,'2024-04-10'),(6,8,72,'2024-04-10'),
(57,8,88,'2024-04-10'),(58,8,68,'2024-04-10'),(59,8,83,'2024-04-10'),
(60,8,54,'2024-04-10'),(107,8,76,'2024-04-10'),(108,8,92,'2024-04-10'),
(109,8,80,'2024-04-10'),(110,8,97,'2024-04-10');

-- ML Course marks (assessment_ids 17-20)
INSERT INTO marks (student_id, assessment_id, marks_obtained, submission_date) VALUES
(41,17,16,'2024-02-20'),(42,17,14,'2024-02-20'),(43,17,18,'2024-02-20'),
(44,17,20,'2024-02-20'),(45,17,15,'2024-02-20'),(46,17,11,'2024-02-20'),
(47,17,19,'2024-02-20'),(48,17,13,'2024-02-20'),(49,17,17,'2024-02-20'),
(50,17,16,'2024-02-20'),(76,17,18,'2024-02-20'),(77,17,20,'2024-02-20'),
(78,17,15,'2024-02-20'),(79,17,12,'2024-02-20'),(80,17,14,'2024-02-20'),
(99,17,17,'2024-02-20'),(100,17,16,'2024-02-20'),(101,17,19,'2024-02-20'),
(102,17,18,'2024-02-20'),(103,17,15,'2024-02-20');
INSERT INTO marks (student_id, assessment_id, marks_obtained, submission_date) VALUES
(41,18,24,'2024-03-08'),(42,18,22,'2024-03-08'),(43,18,27,'2024-03-08'),
(44,18,29,'2024-03-08'),(45,18,21,'2024-03-08'),(46,18,16,'2024-03-08'),
(47,18,28,'2024-03-08'),(48,18,19,'2024-03-08'),(49,18,25,'2024-03-08'),
(50,18,23,'2024-03-08'),(76,18,26,'2024-03-08'),(77,18,30,'2024-03-08'),
(78,18,22,'2024-03-08'),(79,18,17,'2024-03-08'),(80,18,20,'2024-03-08'),
(99,18,25,'2024-03-08'),(100,18,24,'2024-03-08'),(101,18,28,'2024-03-08'),
(102,18,27,'2024-03-08'),(103,18,23,'2024-03-08');
INSERT INTO marks (student_id, assessment_id, marks_obtained, submission_date) VALUES
(41,19,42,'2024-03-22'),(42,19,38,'2024-03-22'),(43,19,45,'2024-03-22'),
(44,19,49,'2024-03-22'),(45,19,36,'2024-03-22'),(46,19,27,'2024-03-22'),
(47,19,47,'2024-03-22'),(48,19,31,'2024-03-22'),(49,19,43,'2024-03-22'),
(50,19,40,'2024-03-22'),(76,19,44,'2024-03-22'),(77,19,50,'2024-03-22'),
(78,19,37,'2024-03-22'),(79,19,29,'2024-03-22'),(80,19,34,'2024-03-22'),
(99,19,43,'2024-03-22'),(100,19,41,'2024-03-22'),(101,19,46,'2024-03-22'),
(102,19,45,'2024-03-22'),(103,19,39,'2024-03-22');
INSERT INTO marks (student_id, assessment_id, marks_obtained, submission_date) VALUES
(41,20,84,'2024-05-14'),(42,20,76,'2024-05-14'),(43,20,89,'2024-05-14'),
(44,20,96,'2024-05-14'),(45,20,70,'2024-05-14'),(46,20,52,'2024-05-14'),
(47,20,92,'2024-05-14'),(48,20,64,'2024-05-14'),(49,20,86,'2024-05-14'),
(50,20,80,'2024-05-14'),(76,20,88,'2024-05-14'),(77,20,99,'2024-05-14'),
(78,20,74,'2024-05-14'),(79,20,58,'2024-05-14'),(80,20,67,'2024-05-14'),
(99,20,85,'2024-05-14'),(100,20,82,'2024-05-14'),(101,20,91,'2024-05-14'),
(102,20,90,'2024-05-14'),(103,20,78,'2024-05-14');

-- ============================================================
-- ATTENDANCE (sample records across courses)
-- Using a helper approach — repeated dates for all enrolled students
-- ============================================================
INSERT INTO attendance (student_id, course_id, attendance_date, status, marked_by) VALUES
-- CS301 DBMS attendance (instructor 1) — multiple dates
(1,1,'2024-01-22','Present',1),(2,1,'2024-01-22','Present',1),(3,1,'2024-01-22','Absent',1),
(4,1,'2024-01-22','Present',1),(5,1,'2024-01-22','Late',1),(6,1,'2024-01-22','Present',1),
(7,1,'2024-01-22','Present',1),(8,1,'2024-01-22','Absent',1),(9,1,'2024-01-22','Present',1),
(10,1,'2024-01-22','Present',1),(1,1,'2024-01-29','Present',1),(2,1,'2024-01-29','Present',1),
(3,1,'2024-01-29','Present',1),(4,1,'2024-01-29','Present',1),(5,1,'2024-01-29','Absent',1),
(6,1,'2024-01-29','Present',1),(7,1,'2024-01-29','Late',1),(8,1,'2024-01-29','Present',1),
(9,1,'2024-01-29','Present',1),(10,1,'2024-01-29','Absent',1),(1,1,'2024-02-05','Present',1),
(2,1,'2024-02-05','Absent',1),(3,1,'2024-02-05','Present',1),(4,1,'2024-02-05','Present',1),
(5,1,'2024-02-05','Present',1),(6,1,'2024-02-05','Present',1),(7,1,'2024-02-05','Absent',1),
(8,1,'2024-02-05','Late',1),(9,1,'2024-02-05','Present',1),(10,1,'2024-02-05','Present',1),
(11,1,'2024-01-22','Present',1),(12,1,'2024-01-22','Present',1),(13,1,'2024-01-22','Absent',1),
(14,1,'2024-01-22','Present',1),(15,1,'2024-01-22','Present',1),(86,1,'2024-01-22','Present',1),
(87,1,'2024-01-22','Present',1),(88,1,'2024-01-22','Late',1),(107,1,'2024-01-22','Present',1),
(108,1,'2024-01-22','Present',1),(11,1,'2024-01-29','Present',1),(12,1,'2024-01-29','Absent',1),
(13,1,'2024-01-29','Present',1),(14,1,'2024-01-29','Present',1),(15,1,'2024-01-29','Absent',1),
(86,1,'2024-01-29','Present',1),(87,1,'2024-01-29','Present',1),(88,1,'2024-01-29','Present',1),
(107,1,'2024-01-29','Absent',1),(108,1,'2024-01-29','Present',1),
-- CS201 Python attendance (instructor 2)
(1,2,'2024-01-22','Present',2),(2,2,'2024-01-22','Present',2),(3,2,'2024-01-22','Present',2),
(4,2,'2024-01-22','Present',2),(5,2,'2024-01-22','Absent',2),(6,2,'2024-01-22','Present',2),
(57,2,'2024-01-22','Present',2),(58,2,'2024-01-22','Late',2),(59,2,'2024-01-22','Present',2),
(60,2,'2024-01-22','Absent',2),(107,2,'2024-01-22','Present',2),(108,2,'2024-01-22','Present',2),
(109,2,'2024-01-22','Present',2),(110,2,'2024-01-22','Present',2),(1,2,'2024-01-29','Present',2),
(2,2,'2024-01-29','Present',2),(3,2,'2024-01-29','Absent',2),(4,2,'2024-01-29','Present',2),
(5,2,'2024-01-29','Present',2),(6,2,'2024-01-29','Present',2),(57,2,'2024-01-29','Present',2),
(58,2,'2024-01-29','Present',2),(59,2,'2024-01-29','Absent',2),(60,2,'2024-01-29','Late',2),
-- ML course attendance (instructor 8)
(41,8,'2024-01-22','Present',8),(42,8,'2024-01-22','Present',8),(43,8,'2024-01-22','Present',8),
(44,8,'2024-01-22','Present',8),(45,8,'2024-01-22','Late',8),(46,8,'2024-01-22','Absent',8),
(47,8,'2024-01-22','Present',8),(48,8,'2024-01-22','Present',8),(49,8,'2024-01-22','Present',8),
(50,8,'2024-01-22','Absent',8),(76,8,'2024-01-22','Present',8),(77,8,'2024-01-22','Present',8),
(78,8,'2024-01-22','Present',8),(79,8,'2024-01-22','Late',8),(80,8,'2024-01-22','Present',8),
(41,8,'2024-01-29','Present',8),(42,8,'2024-01-29','Absent',8),(43,8,'2024-01-29','Present',8),
(44,8,'2024-01-29','Present',8),(45,8,'2024-01-29','Present',8),(46,8,'2024-01-29','Absent',8),
(47,8,'2024-01-29','Present',8),(48,8,'2024-01-29','Late',8),(49,8,'2024-01-29','Present',8),
(50,8,'2024-01-29','Present',8),(76,8,'2024-01-29','Present',8),(77,8,'2024-01-29','Present',8),
(78,8,'2024-01-29','Absent',8),(79,8,'2024-01-29','Present',8),(80,8,'2024-01-29','Absent',8),
(41,8,'2024-02-05','Present',8),(42,8,'2024-02-05','Present',8),(43,8,'2024-02-05','Present',8),
(44,8,'2024-02-05','Present',8),(45,8,'2024-02-05','Absent',8),(46,8,'2024-02-05','Present',8),
(47,8,'2024-02-05','Present',8),(48,8,'2024-02-05','Present',8),(49,8,'2024-02-05','Present',8),
(50,8,'2024-02-05','Absent',8);

-- ============================================================
-- FEEDBACK (sample records)
-- ============================================================
INSERT INTO feedback (student_id, course_id, instructor_id, rating, teaching_quality, course_content, difficulty_level, comments, feedback_date) VALUES
(1,1,1,5,5,5,'Moderate','Excellent teaching! Concepts explained very clearly.','2024-05-15'),
(2,1,1,4,4,5,'Moderate','Good course, enjoyed the lab sessions.','2024-05-15'),
(3,1,1,4,5,4,'Hard','Challenging but rewarding. Instructor was helpful.','2024-05-15'),
(4,1,1,5,5,5,'Moderate','Best SQL course I have taken!','2024-05-15'),
(5,1,1,3,3,4,'Hard','A bit fast-paced but content was good.','2024-05-15'),
(6,1,1,5,5,5,'Easy','Loved the practical approach.','2024-05-15'),
(7,1,1,3,4,3,'Hard','Could improve on assignment feedback timing.','2024-05-15'),
(8,1,1,2,3,3,'Very Hard','Too difficult, needed more support.','2024-05-15'),
(9,1,1,5,5,5,'Moderate','Outstanding! Learned so much.','2024-05-15'),
(10,1,1,4,4,4,'Moderate','Solid course with great examples.','2024-05-15'),
(1,2,2,5,5,4,'Easy','Python made easy! Great instructor.','2024-04-15'),
(2,2,2,4,4,4,'Easy','Enjoyed the projects.','2024-04-15'),
(3,2,2,5,5,5,'Easy','Very well structured course.','2024-04-15'),
(4,2,2,5,5,5,'Moderate','Excellent! Got job interview calls after this course.','2024-04-15'),
(5,2,2,3,3,3,'Moderate','Average, could be more hands-on.','2024-04-15'),
(57,2,2,4,4,5,'Easy','Great content and delivery.','2024-04-15'),
(58,2,2,4,5,4,'Easy','Instructor is very patient and knowledgeable.','2024-04-15'),
(41,8,8,5,5,5,'Hard','Mind-blowing! ML concepts explained brilliantly.','2024-05-14'),
(42,8,8,4,4,5,'Hard','Great course, assignments were challenging.','2024-05-14'),
(43,8,8,5,5,5,'Hard','Best course in the entire semester!','2024-05-14'),
(44,8,8,5,5,5,'Very Hard','Worth every effort. Got internship!','2024-05-14'),
(45,8,8,4,4,4,'Hard','Good content. Would love advanced version.','2024-05-14'),
(46,8,8,2,3,3,'Very Hard','Too advanced for me initially.','2024-05-14'),
(47,8,8,5,5,5,'Hard','Superb! Ravi ma''am explains everything step by step.','2024-05-14'),
(31,6,6,4,4,4,'Moderate','Practical business cases were very helpful.','2024-04-15'),
(32,6,6,5,5,5,'Moderate','Excellent course for MBA students.','2024-04-15'),
(33,6,6,4,5,4,'Easy','Great real-world examples.','2024-04-15'),
(34,6,6,3,3,4,'Hard','Complex topics but well explained.','2024-04-15'),
(35,6,6,4,4,5,'Moderate','Very relevant to industry needs.','2024-04-15');
