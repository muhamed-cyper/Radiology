create table  patient (
    patient_ssn   int  primary key  ,
    fname     varchar(32) not null ,
    lname     varchar(32) not null ,
    age       int         not null ,
    gender    char(1) check ( gender='f' or gender='m' or gender='M' or gender ='F' ) not null ,
    phone_number  int,
    address_city  varchar(96),
    address_street varchar(96),
    address_home_number varchar(32)-- many houses it is number include also characters
);

create table branch (
    branch_id  int primary key ,
    bname     varchar(96) not null

);

create table device (
    device_sn   int primary key ,
    device_name varchar(96) not null ,
    device_branch  int     ,
    d_data1     varchar(96),
    d_data2     varchar(96),
    d_data3     varchar(96),
    foreign key (device_branch) references branch(branch_id)
 );




create table technique(
 device_ssn              int ,
 device_technique varchar(96) not null ,
 foreign key (device_ssn) references device (device_sn)
);



create table register (
    patient_ssn int ,
    branch_id   int ,
    date        date not null ,
    modality    varchar(96) not null ,
    organ       varchar(96) not null ,
    payment     int,
    foreign key (patient_ssn) references patient (patient_ssn),
    foreign key (branch_id)   references branch  (branch_id)  ,
--     foreign key (modality)    references device  (device_name),
--     foreign key (organ)       references technique(device_technique),
    primary key (date,modality,branch_id)
);

create table employee (
    employee_id  int primary key , --also it is the user for the employee
    password     int not null ,
    job_title    varchar(96)
);


create table  radiologist_exam(
    re_id int primary key ,--radiologist exam id
    patient_ssn int ,
    verified    bool,
    modality    varchar(96),
    technique   varchar(96),
    scan        varchar(1024) unique ,
    report      varchar(1024) ,
    foreign key (patient_ssn)references patient(patient_ssn)
--     foreign key (modality)references device(device_name),
--     foreign key (technique)references technique(device_technique)

);


create table  works_at (
    employee_id int,
    branch_id   int,
    scans       varchar(1024),
    hours       int,
foreign key (employee_id) references employee(employee_id),
foreign key (branch_id)  references branch(branch_id),
foreign key (scans) references radiologist_exam(scan)

);

