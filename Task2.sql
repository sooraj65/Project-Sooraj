---database setup
create table student_table (
student_id int primary key,
stu_name text,
department text,
email_id text,
phone_no numeric,
address text,
date_of_birth date,
gender text,
Major text,
GPA Numeric,
Grade text check (Grade in ('A','B','C','D','E','F'))
);

---data entry 
insert into student_table (student_id,stu_name,department,email_id,phone_no,address,date_of_birth,
						  gender,Major,GPA,Grade) 
						  values (1,'Akhin','BSC','Akhin@gmail.com','79954363','Akhin house BLR',
								 '1997-05-04','Male','Biochemistry','9','A'),
								 (2,'Amal','BSC','Amal@gmail.com','78812451','Amal house TVM',
								 '1996-01-03','Male','Statistics','8','B'),
								 (3,'Sarath','BSC','Satath@gmail.com','72245451','Sarath house ERN',
								 '1994-02-01','Male','Zology','8.5','B'),
								 (4,'Adarsh','BA','Adarsh@gmail.com','70011451','Adarsh house TVM',
								 '1992-10-05','Male','English','7','C'),
								 (5,'Soorya','BSC','Soorya@gmail.com','77742451','Soorya house TVM',
								 '1997-08-10','Female','Physics','9','A'),
								 (6,'Revathy','MA','Revathy@gmail.com','70012451','Revathy house TVM',
								 '1993-10-09','Female','Malayalam','9.5','A'),
								 (7,'Akhila','BSC','Akhila@gmail.com','77700451','Akhila house TVM',
								 '1998-09-01','Female','Botany','6','D'),
								 (8,'Sambath','BSC','Sambath@gmail.com','77711451','Sambath house TVM',
								 '1997-11-01','Male','Chemistry','8','B'),
								 (9,'Sreerag','BA','Sreerag@gmail.com','76652451','Sreerag house TVM',
								 '1998-11-01','Male','History','7','C'),
								 (10,'Nandu','BSC','Nandu@gmail.com','79900451','Nandu house TVM',
								 '1999-10-01','Male','Physics','9','A');
---3 student information retrieval
select * from student_table
order by grade desc;

---4 Query of male student
select * from student_table
where gender='Male';

---5 gpa less than 5
select * from student_table
where gpa < 5;

---6 update student email and grade
update student_table
set email_id = 'Akku@gmail.com', grade = 'B'
WHERE student_id=1;

---7 grade with B
select stu_name,extract(year from age(current_date,date_of_birth)) as age
from student_table
where grade='B';

---8 grouping and calculation
select department,gender,avg(gpa)
from student_table
group by department,gender;

---9 table renaming
alter table student_table rename to student_info;

---10 highest GPA

select stu_name from student_info
order by gpa desc limit 1;

								 