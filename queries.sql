--1. List the following details of each employee: employee number, last name, first name, 
--sex, and salary.

select salaries.emp_no, employees.last_name, employees.first_name, sex, salaries.salary
from employees
inner join salaries
on salaries.emp_no = employees.emp_no;

--2.List first name, last name, and hire date for employees who were hired in 1986.

select emp_no, last_name, first_name, hire_date 
from employees 
where extract(year from hire_date) = 1986;

--3.List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name.

select distinct on (dept_manager.dept_no) dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from dept_manager 
inner join departments 
on dept_manager.dept_no= departments.dept_no
inner join employees 
on dept_manager.emp_no = employees.emp_no;

--4.List the department of each employee with the following information: employee number, 
--last name, first name, and department name.

select distinct on (employees.emp_no) employees.emp_no, employees.last_name, employees.first_name,departments.dept_name
from employees
left join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join departments
on dept_emp.dept_no = departments.dept_no

--5.List first name, last name, and sex for employees whose first name is "Hercules" and 
--last names begin with "B."

select employees.last_name, employees.first_name
from employees
where (employees.first_name = 'Hercules') and (lower(employees.last_name) like 'b%')
order by employees.last_name;

-- Create a table with most current departments for each employee for question #6 and #7 below:
select distinct on (emp_no) *
into current_dept_emp
from dept_emp;

--6.List all employees in the Sales department, including their employee number, last name, 
--first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join current_dept_emp
on employees.emp_no = current_dept_emp.emp_no
inner join departments
on current_dept_emp.dept_no = departments.dept_no
where lower(departments.dept_name) = 'sales';

--7.List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.

select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join current_dept_emp
on employees.emp_no = current_dept_emp.emp_no
inner join departments
on current_dept_emp.dept_no = departments.dept_no
where (lower(departments.dept_name) = 'sales') or (lower(departments.dept_name) = 'development');

--8.List the frequency count of employee last names (i.e., how many employees share each last 
--name) in descending order.

select last_name, count(last_name) as Frequency 
from employees 
group by last_name
order by frequency desc;