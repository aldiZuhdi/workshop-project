use product_line;
create table productline
(
productline int NOT NULL,
textdescription varchar(50) NOT NULL,
htmldescription varchar(50) NOT NULL, 
image blob NOT NULL,
primary key (productline)
);

create table products
(
productcode int NOT null,
productname varchar(50) ,
productline int NOT null,
productscale int NOT null,
productvendor varchar(25) NOT null,
productdescription varchar(50) NOT null,
quantityinstock int,
buyprice int,
MSRP int ,
foreign key(productline) references productline(productline),
primary key(productcode)
);

create table offices
(
officecode int not null, 
city varchar(50) not null, 
phone int not null, 
addressline1 varchar(100),
addressline2 varchar(100),
state varchar(50), 
country varchar(50),
postalcode int not null, 
territory varchar(100), 
primary key(officecode)
);

create table employees
(
employeenumber int not null, 
lastname varchar(100) not null,
firstname varchar(100) not null, 
extension varchar(50) not null, 
email varchar(100) not null, 
officecode int not null, 
reportsto int,
jobtitle varchar(100),
primary key (employeenumber),
foreign key(officecode) references offices(officecode),
foreign key(reportsto) references employees(employeenumber)
);



create table customers
(
customernumber int not null, 
customername varchar(100) not null,
contactlastname varchar(50) not null,
contactfirstname varchar(50) not null,
phone int not null,
addressline1 varchar(100),
addressline2 varchar(100),
city varchar(50),
state varchar(50),
postalcode int not null,
country varchar(100),
salesrepnumber int not null, 
creditnumber int not null, 
foreign key(salesrepnumber) references employees(employeenumber),
primary key(customernumber)
);

create table payments
(
customernumber int not null, 
checknumber int not null, 
paymentdate date,
amount int,
primary key(customernumber, checknumber),
foreign key(customernumber) references customers(customernumber)
);
create table orders
(
ordernumber int not null, 
orderdate date not null,
requireddate date not null,
shippeddata date not null,
status_ varchar(25) not null,
commments varchar(200),
customernumber int not null, 
primary key(ordernumber),
foreign key(customernumber) references customers(customernumber)
);

create table orderdetails
(
quantityordered int,
priceeach       int, 
orderlinenumber int, 
productcode int, 
ordernumber int,
primary key(productcode, ordernumber),
foreign key(productcode) references products(productcode),
foreign key(ordernumber) references orders(ordernumber)
);

















