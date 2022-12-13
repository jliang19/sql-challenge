CREATE TABLE departments(
    dept_no varchar(4) not null,
    dept_name varchar(30) not null,
    primary key(dept_no)
);

CREATE TABLE titles(
    title_id varchar(5) not null,
    title varchar(50) not null,
    primary key(title_id)
);

CREATE TABLE employees(
    emp_no varchar(6) not null,
    emp_title_id varchar(5) not null,
    birth_date DATE not null,
    first_name varchar(25) not null,
    last_name varchar(25) not null,
    sex varchar(1) not null,
    hire_date DATE not null,
    primary key (emp_no),
    foreign key (emp_title_id) references titles(title_id)
);

CREATE TABLE dept_manager(
    dept_no varchar(4) not null,
    emp_no varchar(6) not null,
    foreign key (dept_no) references departments(dept_no),
    foreign key (emp_no) references employees(emp_no)
);

CREATE TABLE salaries(
    emp_no varchar(6) not null,
    salary INT not null,
    foreign key(emp_no) references employees(emp_no)
);

CREATE TABLE dept_emp(
    emp_no varchar(6) not null,
    dept_no varchar(4),
    foreign key(emp_no) references employees(emp_no),
    foreign key(dept_no) references departments(dept_no)
)