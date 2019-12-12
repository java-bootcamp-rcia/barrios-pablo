create database high_school;
use high_school;

create table students(idstudent int primary key auto_increment,first_name varchar(50) not null,last_name varchar(50) not null,registration_number int not null, birthdate date not null);
	
create table teachers(idteacher int primary key auto_increment,first_name varchar(50) not null,last_name varchar(50) not null, birthdate date not null);	

-- alter table teacher change fisrt_name first_name varchar(50);

CREATE TABLE IF NOT EXISTS `high_school`.`week_days` (
  `idweek_days` INT NOT NULL AUTO_INCREMENT,
  `day` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idweek_days`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `high_school`.`schedule_time` (
  `idschedule_time` INT(11) NOT NULL AUTO_INCREMENT,
  `start_hour` TIME NOT NULL,
  `end_hour` TIME NOT NULL,
  `week_day` INT NOT NULL,
  PRIMARY KEY (`idschedule_time`, `week_day`),
  INDEX `fk_schedule_time_week_days1_idx` (`week_day` ASC) VISIBLE,
  CONSTRAINT `fk_schedule_time_week_days1`
    FOREIGN KEY (`week_day`)
    REFERENCES `high_school`.`week_days` (`idweek_days`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `high_school`.`courses` (
  `idcourses` INT NOT NULL AUTO_INCREMENT,
  `course_name` VARCHAR(45) NOT NULL,
  `hour_by_week` INT NOT NULL,
  `teacher_assigned` INT(11) NOT NULL,
  `schedule_time_idschedule_time` INT(11) NOT NULL,
  PRIMARY KEY (`idcourses`, `teacher_assigned`, `schedule_time_idschedule_time`),
  INDEX `fk_courses_teachers1_idx` (`teacher_assigned` ASC) VISIBLE,
  INDEX `fk_courses_schedule_time1_idx` (`schedule_time_idschedule_time` ASC) VISIBLE,
  CONSTRAINT `fk_courses_teachers1`
    FOREIGN KEY (`teacher_assigned`)
    REFERENCES `high_school`.`teachers` (`idteacher`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_courses_schedule_time1`
    FOREIGN KEY (`schedule_time_idschedule_time`)
    REFERENCES `high_school`.`schedule_time` (`idschedule_time`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `high_school`.`notes` (
  `idstudent` INT NOT NULL AUTO_INCREMENT,
  `partial_note_1` INT NOT NULL,
  `partial_note_2` INT NOT NULL,
  `partial_note_3` INT NOT NULL,
  `final_note` INT NOT NULL,
  `courses_idcourses` INT NOT NULL,
  `students_idstudent` INT NOT NULL,
  PRIMARY KEY (`idstudent`, `courses_idcourses`, `students_idstudent`),
  INDEX `fk_notes_courses1_idx` (`courses_idcourses` ASC) VISIBLE,
  INDEX `fk_notes_idstudent_idx` (`students_idstudent` ASC) VISIBLE,
  CONSTRAINT `fk_notes_courses1`
    FOREIGN KEY (`courses_idcourses`)
    REFERENCES `high_school`.`courses` (`idcourses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_notes_idstudent`
    FOREIGN KEY (`students_idstudent`)
    REFERENCES `high_school`.`students` (`idstudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

alter table notes change idstudent idnotes int AUTO_INCREMENT









insert into students (first_name,last_name,registration_number,birthdate) values ("Alumno1","Apellido1",1,"1996-04-11");
insert into students (first_name,last_name,registration_number,birthdate) values ("Alumno2","Apellido2",2,"1997-05-12");
insert into students (first_name,last_name,registration_number,birthdate) values ("Alumno3","Apellido3",3,"1998-06-01");
select * from students;


insert into teachers (first_name,last_name,birthdate) values ("Ricardo","Kaka","1982-04-22");
insert into teachers (first_name,last_name,birthdate) values ("Lionel","Messi","1987-06-24");
insert into teachers (first_name,last_name,birthdate) values ("Cristiano","Ronaldo","1985-02-05");
select * from teachers;

insert into week_days(day)values("Monday");
insert into week_days(day)values("Tuesday");
insert into week_days(day)values("Wednesday");
insert into week_days(day)values("Thursday");
insert into week_days(day)values("Friday");


select * from week_days;



-- 1 Monday, 2 Tuesday, 3 Wednesday, 4 Thursday, 5 Friday
insert into schedule_time(start_hour,end_hour,week_day) values("08:00:00","10:00:00",1);
insert into schedule_time(start_hour,end_hour,week_day) values("10:00:00","12:00:00",1);
insert into schedule_time(start_hour,end_hour,week_day) values("14:00:00","16:00:00",1);

select * from schedule_time;

alter table courses change hour_by_week hours_by_week int;

insert into courses(course_name,hours_by_week,teacher_assigned,schedule_time_idschedule_time) values ("JavaProgramming",2,2,4);
insert into courses(course_name,hours_by_week,teacher_assigned,schedule_time_idschedule_time) values ("PythonProgramming",2,1,5);
insert into courses(course_name,hours_by_week,teacher_assigned,schedule_time_idschedule_time) values ("C#Programming",2,3,6);
insert into courses(course_name,hours_by_week,teacher_assigned,schedule_time_idschedule_time) values ("MSPaint",2,2,6);

select * from courses;


insert into notes(partial_note_1,partial_note_2,partial_note_3,final_note,courses_idcourses,students_idstudent) values(5,6,7,6,1,1);
insert into notes(partial_note_1,partial_note_2,partial_note_3,final_note,courses_idcourses,students_idstudent) values(6,6,7,6,1,2);
insert into notes(partial_note_1,partial_note_2,partial_note_3,final_note,courses_idcourses,students_idstudent) values(8,8,7,8,1,3);

select * from notes;

-- select ss.*,nn.final,cc.nombrecurso from alumnos as ss
-- inner join notas as nn on ss.idAlumnos=nn.Alumnos_idAlumnos
-- inner join curso as cc on nn.curso_idcurso=cc.idcurso

-- course teacher and students
select cc.course_name,concat(tt.first_name, ' ',tt.last_name) as name from course as cc
inner join teacher as tt on cc.teacher_assigned=tt.idteacher
where cc.course_name="JavaProgramming";

select ss.first_name,cc.course_name from students as ss
inner join notes as nn on ss.idstudent=nn.students_idstudent
inner join courses as cc on nn.courses_idcourses=cc.idcourses;

-- query topic 3
select cc.course_name,concat(tt.first_name, ' ',tt.last_name) as teacherName,ss.first_name,ss.last_name from courses as cc
inner join teachers as tt on cc.teacher_assigned=tt.idteacher
inner join notes as nn on cc.idcourses=nn.courses_idcourses
inner join students as ss on nn.students_idstudent=ss.idstudent
order by ss.first_name;


-- query topic 5
select concat(tt.first_name, ' ',tt.last_name) as teacherName,wd.day,st.start_hour,st.end_hour,cc.course_name from teachers as tt
inner join courses as cc on tt.idteacher=cc.teacher_assigned
inner join schedule_time as st on cc.schedule_time_idschedule_time=st.idschedule_time
inner join week_days as wd on st.week_day=wd.idweek_days
where tt.idteacher =2
order by wd.idweek_days,st.start_hour
;
