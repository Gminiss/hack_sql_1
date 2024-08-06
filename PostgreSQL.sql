create table countries(
  id_country serial primary key,
  name varchar(50) not null  
);

create table users(
 id_users serial primary key,
 id_country integer not null,
 email varchar(100) not null,
 name varchar (50) not null,
 foreign key (id_country) references countries (id_country)   
);

insert into countries (name) values ('argentina') , ('colombia'),('chile');
select * from countries;

insert into users (id_country, email, name) 
  values (2, 'foo@foo.com', 'fooziman'), (3, 'bar@bar.com', 'barziman');
  select * from users;
  
  delete from users where email = 'bar@bar.com';
  
  update users set email = 'foo@foo.foo', name = 'fooz' where id_users = 1;
  select * from users;
  
  select * from users inner join  countries on users.id_country = countries.id_country;
  
  select u.id_users as id, u.email, u.name as fullname, c.name 
  from users u inner join  countries c on u.id_country = c.id_country;
 
 create table priorities ( 
   id_priority serial primary key, 
   type_name varchar(50) not null   
 ); 
 
 create table contact_request ( 
   id_email VARCHAR(50) PRIMARY KEY, 
   id_country integer not null, 
   id_priority integer not null, 
   name VARCHAR(50) not null, 
   detail VARCHAR(100) not null, 
   physical_address varchar (100) not null, 
   foreign key (id_country) references countries (id_country), 
   foreign key (id_priority) references priorities (id_priority) 
);

INSERT INTO countries (name) VALUES ('Venezuela'), ('Colombia'), ('Belgica'), ('Irlanda'), ('Austria'); 
select * from countries;

INSERT INTO priorities (type_name) VALUES ('Alta'), ('Media'), ('baja'); 
select * from priorities;

insert into contact_request (id_email, id_country,  id_priority, name, detail, physical_address) values ('geminis@gmail.com', 1, 1, 'Genesis', 'Detalle', 'Los cedros'); 

insert into contact_request (id_email, id_country,  id_priority, name, detail, physical_address) values ('Demonizer@gmail.com', 5, 2, 'Edwin', 'Detalle', 'Fraile 5'); 

insert into contact_request (id_email, id_country,  id_priority, name, detail, physical_address) values ('Andry@gmail.com', 3, 3, 'Anghel', 'Detalle', 'Liege'); 
select * from contact_request; 

 DELETE FROM contact_request WHERE id_priority = 3;
 
 UPDATE contact_request SET detail = 'Barquisimeto' WHERE id_email = 'geminis@gmail.com';
 
 CREATE TABLE roles (
   id_role serial PRIMARY KEY,
   name VARCHAR(50) not null
);

create table taxes(
  id_tax serial primary key,
  percentage integer not null
);

ALTER TABLE taxes add percentage integer not null;

CREATE TABLE offers (
  id_offer serial primary key,
  name VARCHAR(100) not null
);

ALTER TABLE offers add status integer not null;

CREATE TABLE discounts (
  id_discount serial primary key,
  status VARCHAR(50) not null,
  percentage DECIMAL(5,2)
);

create table payments( 
  id_payment serial primary key, 
  type varchar(50) not null   
); 

ALTER TABLE payments add type_payments integer not null;

CREATE TABLE customers (
  id_customer serial primary key,
  email VARCHAR(50) not null,
  id_country integer not null,
  id_role integer not null,
  name VARCHAR(50) not null,
  age VARCHAR (10) not null, 
  password varchar (50) not null, 
  physical_address varchar (100) not null, 
  FOREIGN KEY (id_country) REFERENCES countries(id_country)
);

CREATE TABLE invoice_status ( 
  id_invoice_status serial primary key, 
  status varchar(50) not null 
);

create table products(
  id_product serial primary key, 
  id_discount integer not null, 
  id_offer integer not null, 
  id_tax integer not null, 
  name varchar (50) not null,  
  minimum_stock varchar (50) not null, 
  maximun_stock varchar (100) not null, 
  current_stock varchar (100) not null, 
  price varchar (50) not null, 
  price_with_tax varchar (50) not null,
  foreign key (id_discount) references discounts (id_discount), 
  foreign key (id_offer) references offers (id_offer), 
  foreign key (id_tax) references taxes (id_tax)
);
ALTER TABLE products add details integer not null;
ALTER TABLE products add maximum_stock integer not null;
ALTER TABLE products ALTER COLUMN detail DROP NOT NULL;
ALTER TABLE products ALTER COLUMN maximum_stock DROP NOT NULL;
 
create table products_customers( 
  id_product integer not null, 
  id_customer integer not null, 
  foreign key (id_product) references products (id_product), 
  foreign key (id_customer) references customers (id_customer) 
); 

create table invoices( 
  id_invoice serial primary key, 
  id_customer integer not null, 
  id_payment integer not null, 
  id_invoice_status integer not null, 
  DATE varchar (50) not null, 
  total_to_pay varchar (50) not null, 
  foreign key (id_customer) references customers (id_customer), 
  foreign key (id_payment) references payments (id_payment), 
  foreign key (id_invoice_status) references invoice_status (id_invoice_status) 
); 

create table orders( 
  id_orders serial primary key, 
  id_invoice integer not null, 
  id_product integer not null, 
  detail varchar (50) not null, 
  amount integer not null, 
  price integer not null, 
  foreign key (id_invoice) references invoices (id_invoice), 
  foreign key (id_product) references products (id_product) 
); 

insert into roles (name) values ('viewer'), ('editor'), ('admin');
select * from roles;

insert into taxes (percentage) values ('10'), ('20'), ('30');
select * from taxes;

insert into offers (status) values ('active'), ('inactive'), ('discontinued');
select * from offers;

insert into discounts (status, percentage) values ('active', '50'), ('inactivo', '25'), ('discontinued', '0');
select * from discounts;

insert into payments (type_payments) values ('debito'), ('efectivo'), ('pago movil');
select * from payments;

INSERT INTO customers (email, id_country, id_role, name, age, password, physical_address) VALUES ('zuly@gmail.com', 1, 1, 'Zuly', 58, 0405, 'av Lara');
INSERT INTO customers (email, id_country, id_role, name, age, password, physical_address) VALUES ('Antonio@gmail.com', 1, 1, 'Antonio', 60, 0406, 'av del este');
INSERT INTO customers (email, id_country, id_role, name, age, password, physical_address) VALUES ('Fernando@gmail.com', 1, 1, 'Fernando', 28, 1211, 'av Lara');
SELECT * FROM customers;

insert into invoice_status (status) values ('paid'), ('in process'), ('denied');
SELECT * FROM invoice_status;

insert into products (id_discount, id_offer, id_tax, name, details, minimum_stock, maximum_stock, current_stock, price, price_with_tax) 
values (2,1,2,'Audifono', '0', '70', '800', '300', '100','112'),
(3,2,1,'Ipad', '0','70', '800', '704', '600','609'),
(1,3,3,'Teclado','0','70','800', '511','75', '80');
select * from products;

insert into products_customers (id_product, id_customer) values (2, 3),(3, 2),(1, 2);
select * from products_customers;

insert into invoices (id_customer, id_payment, id_invoice_status, total_to_pay)
values (2, 1, 1, '100'), (2, 2, 1, '200'), (3, 3, 1, '300');
select * from invoices;

insert into orders (id_order, id_invoice, id_product, details, amount, price) values (1,1,3, 'Razer', '1', '75'), 
(2,2,1, 'Corsair', '2', '200'), 
(3,3,2, 'Asus', '3', '150');
select * from orders;

delete from users where email = 'foo@foo.foo';
SELECT * from users;

update users set email = 'gema@gmail.com', name = 'Gema' where id_users = 5;
select * from users;

update taxes set percentage = '13' where percentage = '10';
update taxes set percentage = '16' where percentage = '20';
update taxes set percentage = '20' where percentage = '30';

update products set price = '125' where price = '100';
update products set price = '700' where price = '600';
update products set price = '100' where price = '75';
SELECT * from products;