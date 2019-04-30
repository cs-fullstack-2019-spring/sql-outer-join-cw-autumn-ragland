CREATE TABLE IF NOT EXISTS departments (
                                           department_id serial PRIMARY KEY,
                                           department_name VARCHAR (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS employees (
                                         employee_id serial PRIMARY KEY,
                                         employee_name VARCHAR (255),
                                         laptop_type VARCHAR(50),
                                         department_id INTEGER
);


INSERT INTO departments (department_name)
VALUES
('Sales'),
('Marketing'),
('HR'),
('IT'),
('Production');

INSERT INTO employees (
    employee_name,
    laptop_type,
    department_id
)
VALUES
('Bette Nicholson',NULL, 1),
('Christian Gable', 'ASUS', 1),
('Joe Swank',NULL, 2),
('Fred Costner','LENOVA', 3),
('Sandra Kilmer','HP', 4),
('Julia Mcqueen', NULL, NULL);

-- Create a Join that lists all Employees and their departments
select employee_name,department_name
from employees
left join departments
on departments.department_id = employees.department_id;

-- Create a Join that lists ONLY Employees assigned to a department
select employee_name, department_name
from employees
left join departments
on departments.department_id = employees.employee_id
where department_name notnull;

-- Create a Join that lists all Departments and the Employees
select department_name,employee_name
from employees
right join departments
on departments.department_id = employees.department_id;

-- Create a Join that lists ONLY Departments that have Employees
select department_name, employee_name
from employees
right join departments
on departments.department_id = employees.employee_id
where department_name notnull;

-- Create a Join that lists the number of employees per department
select department_name, count(employee_name) as "Number of Employees"
from employees
right join departments
on departments.department_id = employees.employee_id
where department_name notnull
group by department_name;

-- Create a join that only lists employees assigned to an department who also have a company laptop assigned
select employee_name, laptop_type, department_name
from employees
left join departments
on employees.department_id = departments.department_id
where laptop_type notnull and department_name notnull;