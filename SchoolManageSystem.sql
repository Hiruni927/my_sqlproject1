# SCENARIO: SCHOOL MANAGEMENT SYSTEM
  
# Create Database
CREATE DATABASE School;
USE School;

# TABLE 1: departments
  
CREATE TABLE departments
(
    dept_id VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(40),
    headofdep_id VARCHAR(10),
    building_name VARCHAR(30),
    phone_no VARCHAR(15)
);


# TABLE 2: teachers
CREATE TABLE teachers
(
    teacher_id VARCHAR(10) PRIMARY KEY,
    teacher_name VARCHAR(40),
    designation VARCHAR(30),
    monthly_salary DECIMAL(10,2),
    dept_id VARCHAR(10),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);


# TABLE 3: students
CREATE TABLE students
(
    student_id varchar(10) PRIMARY KEY,
    student_name varchar(40),
    student_address varchar(50),
    admission_date date,
    dept_id varchar(10),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);


# TABLE 4: courses
CREATE TABLE courses
(
    course_code varchar(20) PRIMARY KEY,
    course_title varchar(80),
    category varchar(30),
    credits int,
    status ENUM('Active', 'Inactive'),
    teacher_id varchar(10),
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);    


# TABLE 5: enrollment 
CREATE TABLE enrollment
(
    enroll_id VARCHAR(10) PRIMARY KEY,
    student_id VARCHAR(10),
    course_code VARCHAR(20),
    enrollment_date DATE,
    grade VARCHAR(5),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_code) REFERENCES courses(course_code)
);


# TABLE 6: course_completion
CREATE TABLE course_completion
(
    completion_id VARCHAR(10) PRIMARY KEY,
    student_id VARCHAR(10),
    course_code VARCHAR(20),
    completion_date DATE,
    final_grade VARCHAR(5),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_code) REFERENCES courses(course_code)
);


SHOW TABLES;

# INSERT DATA INTO TABLES

INSERT INTO departmentsepartments VALUES
('D101', 'Computer Science', 'T2001', 'Block A', '9876543210'),
('D102', 'Mathematics', 'T2002', 'Block B', '9876543211'),
('D103', 'Physics', 'T2003', 'Block C', '9876543212'),
('D104', 'Chemistry', 'T2004', 'Block D', '9876543213'),
('D105', 'English Literature', 'T2005', 'Block E', '9876543214');

SELECT * FROM departments;


INSERT INTO teachers VALUES
('T2001', 'Dr. Robert Johnson', 'Professor', 85000.00, 'D101'),
('T2002', 'Dr. Maria Garcia', 'Professor', 82000.00, 'D102'),
('T2003', 'Prof. James Wilson', 'Associate Professor', 72000.00, 'D103'),
('T2004', 'Dr. Patricia Lee', 'Professor', 88000.00, 'D104'),
('T2005', 'Prof. Michael Brown', 'Senior Lecturer', 65000.00, 'D105'),
('T2006', 'Dr. Jennifer Martinez', 'Associate Professor', 75000.00, 'D101'),
('T2007', 'Prof. William Taylor', 'Lecturer', 55000.00, 'D102'),
('T2008', 'Dr. Elizabeth White', 'Professor', 90000.00, 'D103'),
('T2009', 'Prof. Thomas Anderson', 'Lecturer', 58000.00, 'D104'),
('T2010', 'Dr. Sarah Thomas', 'Associate Professor', 78000.00, 'D105');

SELECT * FROM teachers;


INSERT INTO students VALUES
('S001', 'Emma Watson', '12 Park Street', '2022-08-15', 'D101'),
('S002', 'Liam Rodriguez', '45 Lake View', '2022-08-16', 'D102'),
('S003', 'Sophia Chen', '78 Hill Road', '2022-08-17', 'D103'),
('S004', 'Noah Kim', '23 River Side', '2022-08-18', 'D104'),
('S005', 'Olivia Patel', '56 Forest Ave', '2022-08-19', 'D105'),
('S006', 'Mason Gupta', '90 Sunset Blvd', '2023-08-20', 'D101'),
('S007', 'Isabella Shah', '34 Mountain View', '2023-08-21', 'D102'),
('S008', 'Ethan Kapoor', '67 Garden Road', '2023-08-22', 'D103'),
('S009', 'Ava Reddy', '89 Ocean Drive', '2023-08-23', 'D104'),
('S010', 'Logan Singh', '123 Palm Street', '2023-08-24', 'D105');

SELECT * FROM students;


INSERT INTO courses VALUES
('CS101', 'Data Structures', 'Programming', 4, 'Active', 'T2001'),
('CS102', 'Database Systems', 'Programming', 3, 'Active', 'T2006'),
('MATH201', 'Calculus I', 'Mathematics', 4, 'Active', 'T2002'),
('MATH202', 'Linear Algebra', 'Mathematics', 3, 'Active', 'T2007'),
('PHY301', 'Quantum Mechanics', 'Science', 4, 'Active', 'T2003'),
('PHY302', 'Thermodynamics', 'Science', 3, 'Active', 'T2008'),
('CHEM401', 'Organic Chemistry', 'Science', 4, 'Active', 'T2004'),
('CHEM402', 'Inorganic Chemistry', 'Science', 3, 'Active', 'T2009'),
('ENG501', 'Shakespearean Literature', 'Humanities', 3, 'Active', 'T2005'),
('ENG502', 'Creative Writing', 'Humanities', 3, 'Active', 'T2010');

SELECT * FROM courses;


INSERT INTO enrollment VALUES
('EN001', 'S001', 'CS101', '2024-01-10', 'A'),
('EN002', 'S001', 'CS102', '2024-01-10', 'B+'),
('EN003', 'S002', 'MATH201', '2024-01-11', 'A-'),
('EN004', 'S003', 'PHY301', '2024-01-12', 'B'),
('EN005', 'S004', 'CHEM401', '2024-01-13', 'A'),
('EN006', 'S005', 'ENG501', '2024-01-14', 'B+'),
('EN007', 'S006', 'CS101', '2024-06-15', NULL),
('EN008', 'S007', 'MATH202', '2024-06-16', NULL),
('EN009', 'S008', 'PHY302', '2024-06-17', NULL),
('EN010', 'S009', 'CHEM402', '2024-06-18', NULL),
('EN011', 'S010', 'ENG502', '2024-06-19', NULL);

SELECT * FROM enrollment;


INSERT INTO course_completion VALUES
('CMP001', 'S001', 'CS101', '2024-05-10', 'A'),
('CMP002', 'S001', 'CS102', '2024-05-11', 'B+'),
('CMP003', 'S002', 'MATH201', '2024-05-12', 'A-'),
('CMP004', 'S003', 'PHY301', '2024-05-13', 'B'),
('CMP005', 'S005', 'ENG501', '2024-05-14', 'B+');


# Update some courses to Inactive
UPDATE courses SET status = 'Inactive'
WHERE course_code IN ('PHY302','CHEM402','ENG502');

# Retrieve course title, category, and credits of all ACTIVE courses
SELECT course_title, category, credits FROM courses WHERE Status = 'Active';

# List teacher names and their respective salaries in descending order
SELECT teacher_name, monthly_salary FROM teachers ORDER BY monthly_salary DESC;

# Display total count of courses in each category
SELECT category, COUNT(course_code) FROM courses GROUP BY category;

# Retrieve teacher names and designations for teachers with salary above 70,000
SELECT teacher_name, designation FROM teachers WHERE monthly_salary > 70000;

# Display department numbers and total count of teachers in each department
SELECT dept_id, COUNT(teacher_id) FROM teachers GROUP BY dept_id;

# Retrieve course titles containing 'Chemistry' from Courses table
SELECT course_title FROM courses WHERE category = 'Science' AND course_title LIKE '%Chemistry%';

# List students who haven't completed any course yet
SELECT student_name FROM students
WHERE student_id NOT IN (SELECT student_id FROM course_completion);

# Retrieve course titles and corresponding students enrolled in those courses
SELECT enrollment.course_code, courses.course_title, students.student_name 
FROM enrollment 
INNER JOIN students ON enrollment.student_id = students.student_id
INNER JOIN courses ON enrollment.course_code = courses.course_code;

# List students who registered before 2023-01-01 and have not enrolled in any courses yet
SELECT student_name FROM students 
WHERE admission_date < '2023-01-01' 
AND student_id NOT IN (SELECT student_id FROM enrollment);#this is not having any result

# Display names of students who enrolled in courses in June 2024
SELECT students.student_name 
FROM students 
INNER JOIN enrollment ON students.student_id = enrollment.student_id 
WHERE enrollment.enrollment_date >= '2024-06-01' 
AND enrollment.enrollment_date <= '2024-06-30';

# Retrieve department numbers along with count of teachers for departments having more than 2 teachers
SELECT dept_id, COUNT(teacher_id) 
FROM teachers 
GROUP BY dept_id 
HAVING COUNT(teacher_id) > 2;# this is not having any result

# Find students who have completed courses with grade 'A'
SELECT students.student_name, course_completion.course_code, course_completion.final_grade
FROM students 
INNER JOIN course_completion ON students.student_id = course_completion.student_id
WHERE course_completion.final_grade = 'A';

#  List all courses with their assigned teacher names
SELECT courses.course_title, teachers.teacher_name
FROM courses
INNER JOIN teachers ON courses.teacher_id = teachers.teacher_id;

# Show enrollment count per course
SELECT course_code, COUNT(student_id) AS enrolled_students
FROM enrollment
GROUP BY course_code;

#  List students who haven't completed any course yet
SELECT dept_id, MAX(monthly_salary) AS highest_salary
FROM teachers
GROUP BY dept_id;

# END




