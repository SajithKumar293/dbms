CREATE TABLE student (student_id varchar(20) NOT NULL, student_name varchar(30) NOT NULL, dept_name varchar(20) NOT NULL, total_creds int(4), father_name varchar(30), mother_name varchar(30), mobile varchar(40), email varchar(50), semester int(1), address varchar(255), image varchar(20), dob varchar(255), year_of_joining int(11), degree varchar(30), PRIMARY KEY (student_id));
CREATE TABLE courses (course_id varchar(25) NOT NULL, dept_name varchar(20) NOT NULL, course_title varchar(50), credits int(11), course_type varchar(10), PRIMARY KEY (course_id));
CREATE TABLE section (course_id varchar(25) NOT NULL, sec_id varchar(20) NOT NULL, semester int(1) NOT NULL, year year NOT NULL, building varchar(30) NOT NULL, room_no int(11) NOT NULL, PRIMARY KEY (course_id, sec_id, semester, year));
CREATE TABLE takes (student_id varchar(20) NOT NULL, course_id varchar(25) NOT NULL, sec_id varchar(20) NOT NULL, semester int(1) NOT NULL, year year NOT NULL, attendance int(3), PRIMARY KEY (student_id, course_id, sec_id, semester, year));
CREATE TABLE class_room (building varchar(30) NOT NULL, room_no int(11) NOT NULL, capacity int(4), PRIMARY KEY (building, room_no));
CREATE TABLE instructor (instructor_id varchar(20) NOT NULL, instructor_name varchar(30), dept_name varchar(20) NOT NULL, salary int(10), address varchar(255), mobile varchar(40), email varchar(40), PRIMARY KEY (instructor_id));
CREATE TABLE time_slot (time_slot_id varchar(20) NOT NULL, day varchar(20) NOT NULL, start_time varchar(20), end_time varchar(20), course_id varchar(25) NOT NULL, sec_id varchar(20) NOT NULL, semester int(1) NOT NULL, year year NOT NULL, PRIMARY KEY (time_slot_id, day, course_id, sec_id, semester, year));
CREATE TABLE department (dept_name varchar(20) NOT NULL, building varchar(20), budget int(10), PRIMARY KEY (dept_name));
CREATE TABLE teaches (instructor_id varchar(20) NOT NULL, sec_id varchar(20) NOT NULL, course_id varchar(25) NOT NULL, semester int(1) NOT NULL, year year NOT NULL, PRIMARY KEY (instructor_id, sec_id, course_id, semester, year));
CREATE TABLE prereq (course_id varchar(25) NOT NULL, prereq_id varchar(20) NOT NULL, PRIMARY KEY (course_id, prereq_id));
CREATE TABLE test (student_id varchar(20) NOT NULL, course_id varchar(25) NOT NULL, sec_id varchar(20) NOT NULL, semester int(1) NOT NULL, year year NOT NULL, test1 int(11), test2 int(11), class_tests int(11), endsem int(11), grade char(1), PRIMARY KEY (student_id, course_id, sec_id, semester, year));
CREATE TABLE project (instructor_id varchar(20) NOT NULL, student_id varchar(20) NOT NULL, project_id varchar(10), project_name varchar(100), description text, status varchar(20), PRIMARY KEY (instructor_id, student_id));
CREATE TABLE users (user_id varchar(20) NOT NULL, username varchar(20), password varchar(20), type varchar(20), PRIMARY KEY (user_id));
CREATE TABLE eligible_courses (instructor_id varchar(20) NOT NULL, dept_name varchar(20) NOT NULL, semester int(1), year year);
CREATE TABLE staff (name varchar(20), staff_id varchar(20) NOT NULL, position varchar(30), salary int(10), PRIMARY KEY (staff_id));
CREATE TABLE announcement (announcement_id int(10) NOT NULL AUTO_INCREMENT, subject varchar(50), description text, `date` varchar(40), PRIMARY KEY (announcement_id));
CREATE TABLE calendar (`date` varchar(40) NOT NULL, event varchar(30), holiday varchar(10), PRIMARY KEY (`date`));
CREATE TABLE advises (instructor_id varchar(20) NOT NULL, student_id varchar(20) NOT NULL, PRIMARY KEY (instructor_id, student_id));
ALTER TABLE takes ADD CONSTRAINT FKtakes104146 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE takes ADD CONSTRAINT FKtakes241332 FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES section (course_id, sec_id, semester, year);
ALTER TABLE section ADD CONSTRAINT FKsection394883 FOREIGN KEY (building, room_no) REFERENCES class_room (building, room_no);
ALTER TABLE section ADD CONSTRAINT FKsection891191 FOREIGN KEY (course_id) REFERENCES courses (course_id);
ALTER TABLE teaches ADD CONSTRAINT FKteaches447686 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE teaches ADD CONSTRAINT FKteaches461570 FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES section (course_id, sec_id, semester, year);
ALTER TABLE instructor ADD CONSTRAINT FKinstructor688593 FOREIGN KEY (dept_name) REFERENCES department (dept_name);
ALTER TABLE prereq ADD CONSTRAINT FKprereq452312 FOREIGN KEY (course_id) REFERENCES courses (course_id);
ALTER TABLE test ADD CONSTRAINT FKtest536301 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE test ADD CONSTRAINT FKtest673487 FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES section (course_id, sec_id, semester, year);
ALTER TABLE project ADD CONSTRAINT FKproject819865 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE project ADD CONSTRAINT FKproject668795 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE student ADD CONSTRAINT FKstudent310828 FOREIGN KEY (dept_name) REFERENCES department (dept_name);
ALTER TABLE eligible_courses ADD CONSTRAINT FKeligible_c324497 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE eligible_courses ADD CONSTRAINT FKeligible_c319331 FOREIGN KEY (dept_name) REFERENCES department (dept_name);
ALTER TABLE courses ADD CONSTRAINT FKcourses436855 FOREIGN KEY (dept_name) REFERENCES department (dept_name);
ALTER TABLE time_slot ADD CONSTRAINT FKtime_slot753742 FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES section (course_id, sec_id, semester, year);
ALTER TABLE advises ADD CONSTRAINT FKadvises194026 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE advises ADD CONSTRAINT FKadvises345096 FOREIGN KEY (student_id) REFERENCES student (student_id);
INSERT INTO department(dept_name, building, budget) VALUES ('computer science', 'manogatha', 1000000);
INSERT INTO department(dept_name, building, budget) VALUES ('electrical', 'samgatha', 566777);
INSERT INTO department(dept_name, building, budget) VALUES ('mechanical', 'samgatha', 422434);
INSERT INTO department(dept_name, building, budget) VALUES ('civil', 'samgatha', 343545);
INSERT INTO department(dept_name, building, budget) VALUES ('HUMANITY', 'manogatha', 255555);
INSERT INTO department(dept_name, building, budget) VALUES ('physics', 'manogatha', 315000);
INSERT INTO department(dept_name, building, budget) VALUES ('chemistry', 'manogatha', 295555);
INSERT INTO department(dept_name, building, budget) VALUES ('maths', 'manogatha', 284677);
INSERT INTO courses(course_id, dept_name, course_title, credits, course_type) VALUES ('1212', 'computer science', 'dbms', 3, 'core');
INSERT INTO courses(course_id, dept_name, course_title, credits, course_type) VALUES ('1213', 'electrical', 'signals', 3, 'PME');
INSERT INTO courses(course_id, dept_name, course_title, credits, course_type) VALUES ('1312', 'civil', 'GEOTECH', 4, 'PME');
INSERT INTO courses(course_id, dept_name, course_title, credits, course_type) VALUES ('1123', 'HUMANITY', 'media', 2, 'GCE');
INSERT INTO courses(course_id, dept_name, course_title, credits, course_type) VALUES ('1024', 'mechanical', 'power systems', 4, 'core');
INSERT INTO courses(course_id, dept_name, course_title, credits, course_type) VALUES ('1233', 'computer science', 'combinatorics', 3, 'PME');
INSERT INTO courses(course_id, dept_name, course_title, credits, course_type) VALUES ('1133', 'HUMANITY', 'linguistics', 3, 'GCE');
INSERT INTO courses(course_id, dept_name, course_title, credits, course_type) VALUES ('1566', 'computer science', 'ML', 3, 'PME');
INSERT INTO courses(course_id, dept_name, course_title, credits, course_type) VALUES ('1855', 'mechanical', 'motors', 3, 'core');
INSERT INTO courses(course_id, dept_name, course_title, credits, course_type) VALUES ('1302', 'physics', 'physics', 3, 'core');
INSERT INTO courses(course_id, dept_name, course_title, credits, course_type) VALUES ('1406', 'chemistry', 'chemistry', 3, 'core');
INSERT INTO courses(course_id, dept_name, course_title, credits, course_type) VALUES ('1702', 'maths', 'algebra', 3, 'core');
INSERT INTO courses(course_id, dept_name, course_title, credits, course_type) VALUES ('1401', 'maths', 'probability stochastics', 3, 'core');
INSERT INTO courses(course_id, dept_name, course_title, credits, course_type) VALUES ('1305', 'HUMANITY', 'philosophy', 3, 'GCE');
INSERT INTO courses(course_id, dept_name, course_title, credits, course_type) VALUES ('1602', 'civil', 'structural analysis', 3, 'core');
INSERT INTO courses(course_id, dept_name, course_title, credits, course_type) VALUES ('1660', 'civil', 'engineering maechanics', 3, 'core');
INSERT INTO class_room(building, room_no, capacity) VALUES ('manogatha', 301, 30);
INSERT INTO class_room(building, room_no, capacity) VALUES ('manogatha', 302, 35);
INSERT INTO class_room(building, room_no, capacity) VALUES ('manogatha', 303, 30);
INSERT INTO class_room(building, room_no, capacity) VALUES ('manogatha	', 304, 50);
INSERT INTO class_room(building, room_no, capacity) VALUES ('manogatha', 305, 35);
INSERT INTO class_room(building, room_no, capacity) VALUES ('manogatha', 205, 80);
INSERT INTO class_room(building, room_no, capacity) VALUES ('manogatha', 204, 30);
INSERT INTO class_room(building, room_no, capacity) VALUES ('samgatha', 201, 35);
INSERT INTO class_room(building, room_no, capacity) VALUES ('samgatha', 202, 40);
INSERT INTO class_room(building, room_no, capacity) VALUES ('samgatha', 102, 20);
INSERT INTO class_room(building, room_no, capacity) VALUES ('samgatha', 101, 30);
INSERT INTO section(course_id, sec_id, semester, year, building, room_no) VALUES ('1212', '12', 7, '2019', 'manogatha', 301);
INSERT INTO section(course_id, sec_id, semester, year, building, room_no) VALUES ('1024', '13', 8, '2016', 'manogatha', 302);
INSERT INTO section(course_id, sec_id, semester, year, building, room_no) VALUES ('1123', '15', 6, '2018', 'manogatha', 301);
INSERT INTO section(course_id, sec_id, semester, year, building, room_no) VALUES ('1312', '10', 6, '2019', 'manogatha', 303);
INSERT INTO section(course_id, sec_id, semester, year, building, room_no) VALUES ('1213', '11', 5, '2017', 'samgatha', 201);
INSERT INTO section(course_id, sec_id, semester, year, building, room_no) VALUES ('1024', '16', 6, '2019', 'samgatha', 202);
INSERT INTO section(course_id, sec_id, semester, year, building, room_no) VALUES ('1602', '19', 5, '2018', 'samgatha', 101);
INSERT INTO student(student_id, student_name, dept_name, total_creds, father_name, mother_name, mobile, email, semester, address, image, dob, year_of_joining, degree) VALUES ('111701010', 'sravankumar', 'computer science', 168, 'sravan', 'kumar', '9182297666', 'sravandasari111@gmail.com', 5, 'srikakulm,andhra', '', '', 2017, 'btech');
INSERT INTO student(student_id, student_name, dept_name, total_creds, father_name, mother_name, mobile, email, semester, address, image, dob, year_of_joining, degree) VALUES ('111701012', 'sajith', 'computer science', 168, 'sajith', 'erasani', '9676402685', 'sajith_erasani', 6, 'eluru', '', '', 2017, 'btech');
INSERT INTO student(student_id, student_name, dept_name, total_creds, father_name, mother_name, mobile, email, semester, address, image, dob, year_of_joining, degree) VALUES ('1117013', 'santosh', 'electrical', 187, 'sanotsh', 'dsssd', '969594939', 'sanod@fdsf.com', 5, 'hyderabad', null, '', 2015, 'btech');
INSERT INTO student(student_id, student_name, dept_name, total_creds, father_name, mother_name, mobile, email, semester, address, image, dob, year_of_joining, degree) VALUES ('121701027', 'anil kumar', 'electrical', 172, 'anil', 'kumar', '99647852135', 'anil@hmail.com', 6, 'guntur', null, null, 2017, 'btech');
INSERT INTO student(student_id, student_name, dept_name, total_creds, father_name, mother_name, mobile, email, semester, address, image, dob, year_of_joining, degree) VALUES ('151801022', 'nitheesh chandra', 'civil', 76, 'nitheeesh', 'chandra', '96545233', 'chandra@gmail.com', 4, 'nellore', null, null, 2019, 'mtech');
INSERT INTO instructor(instructor_id, instructor_name, dept_name, salary, address, mobile, email) VALUES ('1', 'mrinal', 'computer science', 100000, 'sfddfgf', '8080808080', 'mrinal@gmail.com');
INSERT INTO instructor(instructor_id, instructor_name, dept_name, salary, address, mobile, email) VALUES ('2', 'deepak', 'computer science', 100000, 'ffrdgfg', '9191919191', 'deepak@gmail.com');
INSERT INTO instructor(instructor_id, instructor_name, dept_name, salary, address, mobile, email) VALUES ('3', 'sandeep', 'computer science', 100000, 'efrege', '9999999', 'sandeep@gmai.com');
INSERT INTO instructor(instructor_id, instructor_name, dept_name, salary, address, mobile, email) VALUES ('4', 'sahely', 'computer science', 100000, 'yegfyuu', '96521684568', 'sahely@gmail.com');
INSERT INTO instructor(instructor_id, instructor_name, dept_name, salary, address, mobile, email) VALUES ('5', 'piyush', 'computer science', 90000, 'sjkddycgo', '9845236845', 'piyush@gmail.com');
INSERT INTO instructor(instructor_id, instructor_name, dept_name, salary, address, mobile, email) VALUES ('6', 'sukumol', 'electrical', 95000, 'jhblisyc', '9876523675', 'sukumol@gmail.com');
INSERT INTO instructor(instructor_id, instructor_name, dept_name, salary, address, mobile, email) VALUES ('7', 'swaroop', 'electrical', 90000, 'uhscbuy', '9563147862', 'swaroop@gmail.com');
INSERT INTO instructor(instructor_id, instructor_name, dept_name, salary, address, mobile, email) VALUES ('8', 'manas kumar', 'electrical', 85000, 'jskcljcb', '9844623547', 'manas@gmail.com');
INSERT INTO instructor(instructor_id, instructor_name, dept_name, salary, address, mobile, email) VALUES ('9', 'anirudh', 'electrical', 80000, 'ifbilsi', '9563256315', 'anirudh@gmail.com');
INSERT INTO instructor(instructor_id, instructor_name, dept_name, salary, address, mobile, email) VALUES ('10', 'vinod', 'electrical', 80000, 'kuyygcb', '9658714135', 'vinod@gmail.com');
INSERT INTO instructor(instructor_id, instructor_name, dept_name, salary, address, mobile, email) VALUES ('11', 'mathews', 'civil', 110000, 'libc.kjb', '98423685', 'mathews@gmail.com');
INSERT INTO instructor(instructor_id, instructor_name, dept_name, salary, address, mobile, email) VALUES ('12', 'senthil', 'civil', 80000, 'liuukj', '9652147852', 'senthil@gmail.com');
INSERT INTO instructor(instructor_id, instructor_name, dept_name, salary, address, mobile, email) VALUES ('13', 'anil', 'civil', 90000, ';nwfe;o', '6584325', 'anil@gmail.com');
INSERT INTO instructor(instructor_id, instructor_name, dept_name, salary, address, mobile, email) VALUES ('14', 'madhukarthik', 'civil', 85000, 'ljbbf', '785641235', 'madhu@gmail.com');
INSERT INTO instructor(instructor_id, instructor_name, dept_name, salary, address, mobile, email) VALUES ('15', 'bavathrathan', 'civil', 95000, 'eyfulu', '96587452', 'bavath@gmail.com');
INSERT INTO instructor(instructor_id, instructor_name, dept_name, salary, address, mobile, email) VALUES ('16', 'mehta', 'mechanical', 110000, ';OIEIF', '856246985', 'mehta@gmail.com');
INSERT INTO instructor(instructor_id, instructor_name, dept_name, salary, address, mobile, email) VALUES ('17', 'seshagiri', 'mechanical', 95000, 'klsbkjb', '7562368456', 'krishna@gmail.com');
INSERT INTO instructor(instructor_id, instructor_name, dept_name, salary, address, mobile, email) VALUES ('18', 'chakravarthi', 'mechanical', 75000, 'liusubv', '9586235897', 'chakri@gmail.com');
INSERT INTO instructor(instructor_id, instructor_name, dept_name, salary, address, mobile, email) VALUES ('19', 'sujatha', 'HUMANITY', 60000, 'jljliufbi', '9845236845', 'sujatha@gmail.com');
INSERT INTO instructor(instructor_id, instructor_name, dept_name, salary, address, mobile, email) VALUES ('20', 'anoop', 'HUMANITY', 80000, 'libfibiu', '96658466265', 'anoop@gmail.com');
INSERT INTO instructor(instructor_id, instructor_name, dept_name, salary, address, mobile, email) VALUES ('21', 'amrita', 'HUMANITY', 60000, 'ljrflkk', '8546236587', 'amrita@gmail.com');
INSERT INTO instructor(instructor_id, instructor_name, dept_name, salary, address, mobile, email) VALUES ('22', 'balakumar', 'maths', 70000, 'liaiuuhi', '996584524', 'bala@gmail.com');
INSERT INTO instructor(instructor_id, instructor_name, dept_name, salary, address, mobile, email) VALUES ('23', 'lakshmi shankar', 'maths', 80000, 'jehwhfbu', '9651422368', 'lakshmi@gmail.com');
INSERT INTO instructor(instructor_id, instructor_name, dept_name, salary, address, mobile, email) VALUES ('24', 'uma', 'physics', 80000, 'ailbfo', '944521554', 'uma@gmIL.com');
INSERT INTO instructor(instructor_id, instructor_name, dept_name, salary, address, mobile, email) VALUES ('25', 'debarti', 'chemistry', 75000, 'iaugfpi', '9652326', 'debarti@gmail.com');
INSERT INTO time_slot(time_slot_id, day, start_time, end_time, course_id, sec_id, semester, year) VALUES ('1', 'monday', '10.20', '10.50', '1123', '15', 6, '2018');
INSERT INTO time_slot(time_slot_id, day, start_time, end_time, course_id, sec_id, semester, year) VALUES ('2', 'tuesday', '13.10', '2.00', '1123', '15', 6, '2018');
INSERT INTO time_slot(time_slot_id, day, start_time, end_time, course_id, sec_id, semester, year) VALUES ('3', 'wednesday', '3.00', '4.00', '1123', '15', 6, '2018');
INSERT INTO takes(student_id, course_id, sec_id, semester, year, attendance) VALUES ('111701010', '1123', '15', 6, '2018', 45);
INSERT INTO takes(student_id, course_id, sec_id, semester, year, attendance) VALUES ('1117013', '1312', '10', 6, '2019', 23);
INSERT INTO takes(student_id, course_id, sec_id, semester, year, attendance) VALUES ('111701010', '1212', '12', 7, '2019', 76);
INSERT INTO takes(student_id, course_id, sec_id, semester, year, attendance) VALUES ('111701012', '1024', '13', 8, '2016', 56);
INSERT INTO takes(student_id, course_id, sec_id, semester, year, attendance) VALUES ('111701012', '1123', '15', 6, '2018', 89);
INSERT INTO teaches(instructor_id, sec_id, course_id, semester, year) VALUES ('2', '1024', '13', 8, '2016');
INSERT INTO teaches(instructor_id, sec_id, course_id, semester, year) VALUES ('2', '1123', '15', 6, '2018');
INSERT INTO teaches(instructor_id, sec_id, course_id, semester, year) VALUES ('2', '1312', '10', 6, '2019');
INSERT INTO teaches(instructor_id, sec_id, course_id, semester, year) VALUES ('1', '1212', '12', 7, '2019');
INSERT INTO teaches(instructor_id, sec_id, course_id, semester, year) VALUES ('3', '1024', '13', 8, '2016');
INSERT INTO teaches(instructor_id, sec_id, course_id, semester, year) VALUES ('1', '1123', '15', 6, '2018');
INSERT INTO prereq(course_id, prereq_id) VALUES ('1213', '1214');
INSERT INTO prereq(course_id, prereq_id) VALUES ('1312', '1213');
INSERT INTO prereq(course_id, prereq_id) VALUES ('1566', '1702');
INSERT INTO prereq(course_id, prereq_id) VALUES ('1566', '1401');
INSERT INTO prereq(course_id, prereq_id) VALUES ('1602', '1660');
INSERT INTO test(student_id, course_id, sec_id, semester, year, test1, test2, class_tests, endsem, grade) VALUES ('111701010', '1024', '13', 8, '2016', 13, 23, 5, 43, 'A');
INSERT INTO test(student_id, course_id, sec_id, semester, year, test1, test2, class_tests, endsem, grade) VALUES ('1117013', '1312', '10', 6, '2019', 12, 23, 5, 41, 'B');
INSERT INTO test(student_id, course_id, sec_id, semester, year, test1, test2, class_tests, endsem, grade) VALUES ('1117013', '1123', '15', 6, '2018', 31, 23, 65, 12, 'A');
INSERT INTO project(instructor_id, student_id, project_id, project_name, description, status) VALUES ('2', '111701010', '1', 'toy', 'make a toy', 'finished');
INSERT INTO project(instructor_id, student_id, project_id, project_name, description, status) VALUES ('2', '1117013', '2', 'dbms', 'create database', 'pending');
INSERT INTO project(instructor_id, student_id, project_id, project_name, description, status) VALUES ('3', '1117013', '3', 'compilers', 'create a compiler', 'finsished');
INSERT INTO users(user_id, username, password, type) VALUES ('111701010', 'sravan', 'sravan', 'student');
INSERT INTO users(user_id, username, password, type) VALUES ('111701012', 'sajith', 'sajith123', 'student');
INSERT INTO users(user_id, username, password, type) VALUES ('12345', 'admin', 'admin123', 'admin');
INSERT INTO eligible_courses(instructor_id, dept_name, semester, year) VALUES ('2', 'electrical', 5, '2019');
INSERT INTO eligible_courses(instructor_id, dept_name, semester, year) VALUES ('3', 'electrical', 2, '2020');
INSERT INTO staff(name, staff_id, position, salary) VALUES ('biju', '1', 'labadmin', 122000);
INSERT INTO staff(name, staff_id, position, salary) VALUES ('unni', '2', 'transport management', 123122);
INSERT INTO announcement(announcement_id, subject, description, `date`) VALUES (1, 'fee portal', 'fee portal opened', '20/12/2020');
INSERT INTO calendar(`date`, event, holiday) VALUES ('2/3/2019', null, 'false');
INSERT INTO calendar(`date`, event, holiday) VALUES ('3/3/2020', 'good friday', 'true');
INSERT INTO advises(instructor_id, student_id) VALUES ('3', '1117013');
INSERT INTO advises(instructor_id, student_id) VALUES ('2', '111701012');
INSERT INTO advises(instructor_id, student_id) VALUES ('1', '111701010');
