create database blood_donation;
use blood_donation;
create table Donor
(Id int,FName varchar(55),LName varchar(55),Gender varchar(55),Blood_Group varchar(55),Donor_id int not null,primary key(Donor_id));
insert into Donor
(Id,FName,LName,Gender,Blood_Group,Donor_id)
values(1,"Dinesh","Shiva","Male","O+",1101),
(2,"Rohith","Mahesh","Male","B+",1102),
(3,"Visaagan","Rajasekhar","Male","AB+",1103),
(4,"Ashok","Selvan","Male","A+",1104),
(5,"Kajol","Kumari","Female","A-",1105),
(6,"Dhanush","Ram","Male","AB+",1106),
(7,"Lavanya","Tripathi","Female","O-",1107),
(8,"Vijay","Kumar","Male","O+",1108);
create table donor_info
(Age int,blood_bp int,HIV_test varchar(55),alcohol_consumption varchar(55),admitted_date date,admitted_time time,Donor_id int,foreign key(Donor_id) references Donor(Donor_id));
insert into donor_info
(Age,blood_bp,HIV_test,alcohol_consumption,admitted_date,admitted_time,Donor_id)
values(20,100,"Negative","No","2022-05-10","10:00:00",1101),
(21,90,"Negative","No","2022-05-15","11:00:00",1102),
(19,110,"Negative","No","2022-06-16","11:15:11",1103),
(25,100,"Positive","No","2022-06-20","11:31:15",1104),
(28,110,"Negative","Yes","2022-06-28","10:10:17",1105),
(23,100,"Negative","No","2022-07-08","12:00:12",1106),
(22,105,"Negative","No","2022-07-17","12:17:36",1107),
(29,110,"Negative","No","2022-07-20","01:10:17",1108);
create table bloodbank
(Id int,available_blood varchar(55),available_quantity varchar(55),managed_by varchar(55),contact varchar(55));
insert into bloodbank
(Id,available_blood,available_quantity,managed_by,contact)
values(1,"A+","75 units","Karthik","999995555"),
(2,"B+","50 units","Raja","9999966666"),
(3,"AB+","40 units","Amar","9999977777"),
(4,"O+","100 units","Sanjay","9999988888"),
(5,"A-","35 units","Roshini","9999900000"),
(6,"B-","25 units","Vani","9999911111"),
(7,"AB-","45 units","JayaRam","9999922222"),
(8,"O-","20 units","David","9999933333");
create table hospitalinfo(id int not null auto_increment,primary key(id),hosp_id int,hosp_name varchar(55),hosp_phNo varchar(15),patient_name varchar(55),needed_Bgrp varchar(55),needed_qnty varchar(55));
insert into hospitalinfo(hosp_id,hosp_name,hosp_phNo,patient_name,needed_Bgrp,needed_qnty) 
values(1,"Cresent","9876543210","Ram","A+","5 units"),
(1,"Cresent","9876543210","Raghul","AB-","10 units"),
(2,"Avitis","4321678439","Ashwin","B+","6 units"),
(2,"Avitis","4321678439","Praveen","O+","7 units"),
(3,"Amrutha","1234567890","Arjun","A+","5 units"),
(3,"Amrutha","1234567890","Sathya","B-","8 units"),
(4,"Amala","1236547890","Lakshman","A+","3 units"),
(4,"Amala","1236547890","Divya","A-","4 units"),
(5,"Parkland","9874561230","Rithika","AB+","8 units"),
(6,"Pinecreek","9871234560","Lisa","O-","10 units"),
(7,"Jubili mission","9182736450","Jai","B-","5 units");
select * from  donor;
select * from  donor_info;
select * from  bloodbank;
select * from  hospitalinfo;
select * from donor
inner join donor_info on donor.donor_id=donor_info.donor_id;
select concat("My Name is"," ",FName," ",LName)from donor;
select*from donor left join donor_info on donor.donor_id=donor_info.donor_id
union
select*from donor right join donor_info on donor.donor_id=donor_info.donor_id;
select reverse(FName)from donor;
select replace(FName,"Rohith","Virat")from donor;
select upper(concat("My Name is"," ",FName," ",LName))from donor;
select lower(concat("My Name is"," ",FName," ",LName))from donor;
select char_length(concat(FName,LName))from donor;
select distinct(hosp_name)from hospitalinfo;
select age,blood_bp from donor_info order by blood_bp desc;
select hosp_name,patient_name,needed_Bgrp from hospitalinfo where needed_Bgrp like 'a+%';
select Donor_id,blood_bp from donor_info order by blood_bp desc limit 2;
select concat(FName," ",LName)as 'FULLNAME'from donor;
select age,blood_bp from donor_info where age<22;
select age,blood_bp from donor_info where age>=22;
select donor_id,age,alcohol_consumption from donor_info where alcohol_consumption="No";
select*from donor_info where HIV_test="Negative" and alcohol_consumption="No";
select donor_id,blood_bp from donor_info where blood_bp between 90 and 105;
select* from hospitalinfo where needed_Bgrp="A+" or "O+";
select max(age) from donor_info;
select min(age)from donor_info;
select count(*) from donor_info;
select avg(blood_bp) from donor_info;
select sum(age) from donor_info;
select needed_bgrp from hospitalinfo group by needed_bgrp;
