-- Department Table
CREATE TABLE department (
    dname VARCHAR(50) PRIMARY KEY,
    dean VARCHAR(50)
);

-- Student Table
CREATE TABLE student (
    sno INT PRIMARY KEY,
    sname VARCHAR(50),
    eyear INT,
    dname VARCHAR(50),
    FOREIGN KEY (dname) REFERENCES department(dname)
);

-- Professor Table
CREATE TABLE professor (
    pno INT PRIMARY KEY,
    pname VARCHAR(50),
    salary INT,
    dname VARCHAR(50),
    FOREIGN KEY (dname) REFERENCES department(dname)
);

-- Course Table
CREATE TABLE course (
    cno INT PRIMARY KEY,
    cname VARCHAR(50),
    dname VARCHAR(50),
    FOREIGN KEY (dname) REFERENCES department(dname)
);

-- Take Course Table (Student Enrollment)
CREATE TABLE take_course (
    sno INT,
    cno INT,
    pno INT,
    PRIMARY KEY (sno, cno),
    FOREIGN KEY (sno) REFERENCES student(sno),
    FOREIGN KEY (cno) REFERENCES course(cno),
    FOREIGN KEY (pno) REFERENCES professor(pno)
);

-- Teach Course Table (Professor Assignments)
CREATE TABLE teach_course (
    pno INT,
    cno INT,
    dname VARCHAR(50),
    term INT,
    year INT,
    PRIMARY KEY (pno, cno, term, year),
    FOREIGN KEY (pno) REFERENCES professor(pno),
    FOREIGN KEY (cno) REFERENCES course(cno),
    FOREIGN KEY (dname) REFERENCES department(dname)
);


-- etc
INSERT INTO department (dname, dean) VALUES
('Medical', 'Lim'),
('CS', 'Cho'),
('Statistics', 'Hwang');

INSERT INTO student (sno, sname, eyear, dname) VALUES
(202010101, 'Park', 2020, 'CS'),
(201920202, 'Jung', 2019, 'CS'),
(201940404, 'Kang', 2019, 'Medical'),
(202030303, 'Baek', 2020, 'Medical'),
(202070707, 'Na', 2020, 'Statistics'),
(201960606, 'So', 2019, 'Statistics');

INSERT INTO professor (pno, pname, salary, dname) VALUES
(2312, 'Cho', 7000, 'CS'),
(2388, 'Na', 4800, 'CS'),
(5109, 'Lim', 7000, 'Medical'),
(5842, 'Won', 5300, 'Medical'),
(3412, 'Hwang', 5100, 'Statistics'),
(3567, 'Son', 3900, 'Statistics');

INSERT INTO course (cno, cname, dname) VALUES
(3311, 'Python', 'CS'),
(7799, 'Computational Math', 'CS'),
(3399, 'Data Structures', 'CS'),
(8866, 'Anatomy', 'Medical'),
(9944, 'Pharmaceutics', 'Medical'),
(7788, 'Probability', 'Statistics');

INSERT INTO take_course (sno, cno, pno) VALUES
(202010101, 7799, 3412),
(202010101, 3399, 2388),
(201920202, 3311, 2388),
(201940404, 8866, 5109),
(201940404, 9944, 5109),
(202030303, 8866, 5109),
(202070707, 7788, 3412),
(201960606, 7788, 3412);

INSERT INTO teach_course (pno, cno, dname, term, year) VALUES
(2388, 3311, 'CS', 1, 2019),
(2388, 3311, 'CS', 1, 2020),
(3412, 7799, 'CS', 2, 2020),
(2388, 3399, 'CS', 1, 2019),
(2312, 3399, 'CS', 1, 2020),
(5109, 8866, 'Medical', 1, 2019),
(5109, 8866, 'Medical', 1, 2020),
(5842, 9944, 'Medical', 1, 2009),
(3412, 7788, 'Statistics', 1, 2019),
(3412, 7788, 'Statistics', 1, 2020);

--select

SELECT * from department;


