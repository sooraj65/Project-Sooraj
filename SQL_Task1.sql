use sql_assignment;

/* 1)Database creation */
create table studentinfo(
STU_ID INT auto_increment primary KEY,
STU_NAME varchar(500),
DOB date,
PHONE_NO varchar(12),
EMAIL_ID varchar(500),
ADDRESS text
);
create table courseinfo(
course_id INT primary KEY,
course_name varchar(500),
course_instructor_name varchar(500)
);
create table enrollmentinfo(
enrollment_id INT primary KEY,
STU_ID int,
course_id int,
enroll_status varchar(100),
foreign key (stu_id) references studentinfo(stu_id),
foreign key (course_id) references courseinfo(course_id)
);

/* 2)Data creation */
insert into studentinfo(STU_NAME,DOB,PHONE_NO,EMAIL_ID,ADDRESS)
values ('Sooraj','1996-01-06','796553733','sooraj@sample.com','5600 bangalore'),
       ('Sarath','1995-05-06','796453511','sarath@sample.com','5605 bangalore'),
       ('Sreerag','1993-09-06','791345511','sreerag@sample.com','5608 bangalore');
       
insert into courseinfo(course_id,course_name,course_instructor_name)
values ('101','Maths','John'),
       ('102','Physics','Jack'),
       ('103','Chemistry','Kevin');

insert into enrollmentinfo(enrollment_id,STU_ID,course_id,enroll_status)
values ('1','1','101','Enrolled'),
       ('2','1','102','Enrolled'),
       ('3','1','103','Enrolled'),
       ('4','2','101','Enrolled'),
       ('5','2','102','Enrolled'),
       ('6','2','103','Enrolled'),
       ('7','3','101','Enrolled'),
       ('8','3','102','Enrolled'),
       ('9','3','103','Enrolled');

/* 3)Retrieve student information */

select S.stu_name,S.PHONE_NO,S.EMAIL_ID,S.ADDRESS,E.enroll_status
from studentinfo S join enrollmentinfo E
on S.STU_ID = E.STU_ID;

select course_name from courseinfo c
inner join enrollmentinfo e
on c.course_id = e.course_id
where e.STU_ID = 1;

select course_name,course_instructor_name from courseinfo;

select course_name,course_instructor_name from courseinfo
where course_id = 101;

select course_name,course_instructor_name from courseinfo
where course_id in ('101','102','103');

select * from studentinfo;

select S.stu_name,S.DOB,S.phone_no,S.address,C.course_name
from studentinfo S
inner join enrollmentinfo E
ON S.STU_ID = E.STU_ID
inner join courseinfo C 
on E.course_id = C.course_id;

select S.stu_name,S.DOB,S.phone_no,S.address,C.course_name
from studentinfo S
inner join enrollmentinfo E
ON S.STU_ID = E.STU_ID
inner join courseinfo C 
on E.course_id = C.course_id
where S.stu_id = 1;

/* 4) Reporting and Analytics (Using joining queries)*/

 select * from courseinfo;
 select * from enrollmentinfo;
 select * from studentinfo;
 
 select count(stu_id) as total_student, C.course_name
 from courseinfo C 
 inner join enrollmentinfo E 
 on C.course_id = E.course_id
group by C.course_name;

select S.stu_name,C.course_name
from studentinfo S 
inner join enrollmentinfo E 
on S.stu_id = E.stu_id
inner join courseinfo C 
on E.course_id = C.course_id
where C.course_name = 'Maths';

select count(stu_id) as student_count, C.course_instructor_name
from courseinfo C 
inner join enrollmentinfo E
on C.course_id = E.course_id
group by C.course_instructor_name;

select S.stu_id,S.stu_name
from studentinfo S
inner join enrollmentinfo E 
on S.stu_id = E.stu_id
group by S.stu_id,S.stu_name
having count(E.course_id)>1;
       
select C.course_name, count(E.stu_id) as enrolled_students
from courseinfo C
left join enrollmentinfo E 
on C.course_id = E.course_id
where E.enroll_status= 'Enrolled'
group by C.course_name
order by enrolled_students Desc;
       

