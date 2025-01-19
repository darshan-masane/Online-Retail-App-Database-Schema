create database onlien_retail_app;
use onlien_retail_app;
create table customer
(cust_id int primary key,
name varchar(50),
address varchar(50),
email varchar(50));

alter table customer
add password varchar(50),
add phone_number varchar(50) after email;

alter table customer
change name cust_name varchar(50); 

create table product
(prod_id int,prod_name varchar(50),
prod_desc varchar(50),
prod_price int ,
primary key(prod_id));

create table categorises
(cat_id int,
cat_name varchar(50),
cat_desc varchar(50),
prod_id int ,
constraint categories_prod_id_fk foreign key(prod_id) references product(prod_id)
);

rename table categorises to categories;

CREATE TABLE cart_details (
    cart_id INT PRIMARY KEY,
    cart_price INT,
    prod_quantity INT,
    prod_price INT,
    cust_id INT,
    prod_id INT,
    CONSTRAINT cart_details_prod_id_fk FOREIGN KEY (prod_id) REFERENCES product(prod_id),
    CONSTRAINT cart_details_cust_id_fk FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
);

CREATE TABLE invoice (
    invoice_id INT PRIMARY KEY,
    invoice_amt INT,
    mode_of_payment VARCHAR(50),
    cust_id INT,
    cart_id INT,
    CONSTRAINT invoice_cust_id_fk FOREIGN KEY (cust_id) REFERENCES customer(cust_id),
    CONSTRAINT invoice_cart_id_fk FOREIGN KEY (cart_id) REFERENCES cart_details(cart_id)
);

CREATE TABLE feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    comment VARCHAR(200),
    yyyy_mm_dd DATE,
    cust_id INT,
    prod_id INT,
    CONSTRAINT feedback_cust_id_fk FOREIGN KEY (cust_id) REFERENCES customer(cust_id),
    CONSTRAINT feedback_prod_id_fk FOREIGN KEY (prod_id) REFERENCES product(prod_id)
);

INSERT INTO customer (cust_id, name, address, email, password, phone_number)
VALUES 
(101, 'nitesh', 'koparkhairne', 'n@gmail.com', 'nitesh@123', '12345'),
(102, 'raj', 'vashi', 'raj@gmail.com', 'raj@123', '12345'),
(103, 'ram', 'turbhe', 'ram@gmail.com', 'ram@123', '123456'),
(104, 'sam', 'ghansoli', 'sam@gmail.com', 'sam@123', '1234'),
(105, 'john', 'sanpada', 'john@gmail.com', 'john@123', '01234'),
(106, 'joseph', 'rabale', 'joseph@gmail.com', 'joseph@123', '012345'),
(107, 'rajesh', 'airoli', 'rajesh@gmail.com', 'rajesh@123', '0123456'),
(108, 'gopal', 'thane', 'gopal@gmail.com', 'gopal@123', '5678'),
(109, 'sita', 'vashi', 'sita@gmail.com', 'sita@123', '56789'),
(110, 'sunita', 'koparkhairne', 'sunita@gmail.com', 'sunita@123', '45 6789'),
(111, 'gita', 'ghansoli', 'gita@gmail.com', 'gita@123', '23456'),
(112, 'rita', 'rabale', 'rita@gmail.com', 'rita@123', '234567'),
(113, 'priya', 'thane', 'priya@gmail.com', 'priya@123', '2345678'),
(114, 'pritam', 'sanpada', 'pritam@gmail.com', 'pritam@123', '23456 79'),
(115, 'priti', 'turbhe', 'priti@gmail.com', 'priti@123', '2345670');


INSERT INTO product (prod_id, prod_name, prod_desc, prod_price)
VALUES
(1001, 'Lenovo Legion Y540', 'High performance gaming laptop', 65000),
(1002, 'Lenovo Ideapad', 'High performance multitasking laptop', 55000),
(1003, 'Oneplus buds', 'Quality sound and bass', 5000),
(1004, 'JBL buds', 'Quality sound and bass', 4000),
(1005, 'Levis jeans', 'Hybrid cloth', 2999),
(1006, 'Spykar jeans', 'Pure 100% cotton cloth', 3999),
(1007, 'Noise Smartwatch', 'Smart watch with android', 13999),
(1008, 'Sundaram Notebooks', 'Pack of 1 dozen', 720),
(1009, 'Zebronics keyboard and mouse', 'Wireless keyboard and mouse combo', 1499),
(1010, 'Levis T-shirt', 'Hybrid cotton and linen t-shirt', 499),
(1011, 'Nike Trackpant', 'Made by recycled polyethene', 1499),
(1012, 'Tupperware water bottle', 'Leakage proof', 199),
(1013, 'Dark Fantasy Biscuit', 'Original choco fills chocolate biscuits', 30),
(1014, 'Nike shorts', 'Made by recycled polythene', 999),
(1015, 'Lexi 5 pen', '5 pcs of pack of 5', 120);



INSERT INTO categories (cat_id, cat_name, cat_desc, prod_id)
VALUES
(11, 'Laptop', 'Lenovo Laptop', 1001),
(11, 'Laptop', 'Lenovo Laptop', 1002),
(12, 'Earphone', 'Oneplus earphone', 1003),
(12, 'Earphone', 'JBL earphone', 1004),
(13, 'Mens jeans', 'Levis jeans', 1005),
(13, 'Mens jeans', 'Spykar jeans', 1006),
(14, 'Smartwatch', 'Android smart watch', 1007),
(17, 'Clothing', 'T-shirt', 1010),
(17, 'Clothing', 'Trackpants', 1011),
(17, 'Clothing', 'Shorts', 1014),
(18, 'Grocery', 'Water bottle', 1012),
(18, 'Grocery', 'Biscuits', 1013),
(19, 'Study material', 'Ball Pen', 1015),
(15, 'Notebook', 'Pack of Notebooks', 1008),
(16, 'Electronics', 'Keyboard and mouse combo', 1009);

INSERT INTO cart_details (cart_id, cart_price, prod_quantity,
 prod_price, cust_id, prod_id)
VALUES
(10001, 130000, 2, 65000, 101, 1001),
(10002, 4000, 1, 4000, 102, 1004),
(10003, 5000, 1, 5000, 103, 1003),
(10004, 1440, 2, 720, 102, 1008),
(10005, 2999, 1, 2999, 105, 1005),
(10006, 1440, 2, 720, 103, 1008),
(10007, 499, 1, 499, 111, 1010),
(10008, 13999, 1, 13999, 108, 1007),
(10009, 3999, 1, 3999, 114, 1006),
(10010, 1499, 1, 1499, 111, 1009),
(10011, 120, 1, 120, 113, 1015),
(10012, 300, 10, 30, 104, 1013),
(10013, 55000, 1, 55000, 104, 1002),
(10014, 13999, 1, 13999, 109, 1007),
(10015, 13999, 1, 13999, 106, 1007);


INSERT INTO invoice (invoice_id, invoice_amt, mode_of_payment, cust_id, cart_id)
VALUES
(100001, 134000, 'Cash', 101, 10001),
(100002, 13999, 'Net Banking', 108, 10008),
(100003, 5000, 'UPI', 103, 10003),
(100004, 1440, 'UPI', 103, 10006),
(100005, 2999, 'Cash', 105, 10005),
(100006, 3999, 'Cash', 114, 10009),
(100007, 1499, 'Cash', 111, 10010),
(100008, 13999, 'Cash', 106, 10015),
(100009, 13999, 'Net Banking', 109, 10014),
(100010, 300, 'Net Banking', 104, 10012);

INSERT INTO feedback (comment, yyyy_mm_dd, cust_id, prod_id)
VALUES
('Good laptop', '2022-10-11', 101, 1001),
('Good earphone', '2022-10-12', 103, 1003),
('Good jeans', '2022-10-12', 105, 1005);
INSERT INTO feedback (comment, yyyy_mm_dd, cust_id, prod_id)
VALUES('Bad jeans', '2022-10-12', 106, 1006);

# it fetches customers who have not made any purchase.
SELECT cust_name
FROM customer
WHERE cust_id NOT IN (SELECT cust_id FROM invoice);

#select product with heighest price:
select prod_name as Name ,max(prod_price)as price from product
group by prod_name
order by price desc
limit 1;

select prod_name as Name,max(prod_price) as price from product group by prod_name limit 1;

#select customer name who never purches any product

SELECT cust_name
FROM customer
WHERE cust_id NOT IN (SELECT cust_id FROM invoice);

#diaplay list of all books along with their category 

select p.prod_name Product ,c.cat_name Category
from product p
inner join categories c on p.prod_id=c.prod_id;

#display top 5 customer who have purchesed most product

select invoice.cust_id,cust_name,count(invoice.cust_id)products_purchesed
from invoice inner join customer on 
invoice.cust_id=customer.cust_id 
group by invoice.cust_id 
order by count(invoice.cust_id) desc
limit 5;

#display list of top 5 most purchased product 

select product.prod_id ,prod_name,sum(prod_quantity) Usints_Sold 
from cart_details inner join product on 
cart_details.prod_id=product.prod_id
group by prod_id 
order by sum(prod_quantity) desc limit 5;

#Display the names of customers along with the products they have purchased, including product details like price and quantity.
SELECT c.cust_name, p.prod_name, cd.prod_quantity, p.prod_price
FROM customer c
JOIN cart_details cd ON c.cust_id = cd.cust_id
JOIN product p ON cd.prod_id = p.prod_id;

#Display all customers who have purchased a product with a price greater than 5000.
SELECT customer.cust_name, product.prod_name, product.prod_price
FROM customer
INNER JOIN cart_details ON customer.cust_id = cart_details.cust_id
INNER JOIN product ON cart_details.prod_id = product.prod_id
WHERE product.prod_price > 5000;

#Get all customers who have given feedback for a product.

select c.cust_name ,p.prod_name,f.comment
from customer c
inner join feedback f on c.cust_id=f.cust_id
inner join product p on f.prod_id=p.prod_id;

#List all products that have been purchased along with the customer who purchased them.
#with their total price

select p.prod_name,c.cust_name,cd.prod_quantity,p.prod_price,p.prod_price*cd.prod_quantity as total_price
from cart_details cd
inner join product p on p.prod_id=cd.prod_id
inner join customer c on cd.cust_id=c.cust_id;

/** Get the total amount spent by each customer.**/

select c.cust_name,sum(i.invoice_amt) as total_spend
from invoice i
inner join customer c on c.cust_id=i.cust_id
group by c.cust_name;

/** Get the total amount spent by each customer. to 2 buyer**/
select c.cust_name,sum(i.invoice_amt) as total_spend
from invoice i
inner join customer c on c.cust_id=i.cust_id
group by c.cust_name
order by sum(i.invoice_amt) desc
limit 2;

#Show products along with their respective categories.
select p.prod_name,cat.cat_name
from categories cat
inner join product p on p.prod_id=cat.prod_id;

#Find all customers who have purchased products in the 'Laptop' category.

select c.cust_name
from customer c
inner join cart_details cd on c.cust_id=cd.cust_id
inner join product p on cd.prod_id=p.prod_id
inner join  categories cat on cat.prod_id=p.prod_id
where cat_name='laptop';

#Get all products that have been reviewed by customers.

SELECT DISTINCT product.prod_name
FROM product
INNER JOIN feedback ON product.prod_id = feedback.prod_id;

#Get the total quantity of each product sold.

select p.prod_name ,sum(cd.prod_quantity) as total_prod_sold
from cart_details cd 
inner join product p on cd.prod_id=p.prod_id
group by p.prod_name
having total_prod_sold>2
order by total_prod_sold desc ;

# the names of customers who have purchased 'JBL buds'
select c.cust_name,p.prod_name
from customer c
inner join cart_details cd on cd.cust_id=c.cust_id
inner join product p on p.prod_id=cd.prod_id
where p.prod_name='JBL buds';

#Find customers who have made payments using 'Net Banking'.

select c.cust_name,i.mode_of_payment
from customer c
inner join invoice i on i.cust_id=c.cust_id
where i.mode_of_payment='Net Banking';

/** Subqueries **/ 
#Get the names of customers who have made payments greater than 10000.

select cust_name
from customer
where cust_id in(select cust_id from invoice where invoice_amt>10000);

#List all products that have been purchased by customers in 'Vashi'.
select prod_name
from product
where prod_id in (select prod_id from cart_details where cust_id in (select cust_id from customer where address='vashi'));

#Find customers who have purchased the 'Lenovo Ideapad'.
select cust_id,cust_name
from customer
where cust_id in(select cust_id from cart_details where prod_id=(select prod_id from product where prod_name='Lenovo Ideapad'));

#Get the product with the highest price.
select prod_name,prod_price
from product
where prod_price=(select max(prod_price) from product );

#limit
SELECT prod_name, prod_price
FROM product
ORDER BY prod_price DESC
LIMIT 1;

##JOIN 

SELECT p.prod_name, p.prod_price, c.cust_name
FROM product p 
inner join cart_details cd on cd.prod_id=p.prod_id
inner join customer c on cd.cust_id=c.cust_id
ORDER BY p.prod_price DESC
LIMIT 1 ;


#for 2nd highest price
select prod_name,prod_price
from product
where prod_price=(select max(prod_price) from product where prod_price<(select max(prod_price) from product));

##JOIN 

SELECT p.prod_name, p.prod_price, c.cust_name
FROM product p 
inner join cart_details cd on cd.prod_id=p.prod_id
inner join customer c on cd.cust_id=c.cust_id
ORDER BY p.prod_price DESC
LIMIT 1 OFFSET 1; #OFFSET 1: Skips the first row (the highest price) and selects the second row (the second highest price)


#List the products that have been purchased by customers who spent more than 50000.

select prod_name
from product
where prod_id in(select prod_id from cart_details where cust_id in (select cust_id from invoice where invoice_amt>50000));

#same with ust_name
SELECT p.prod_name, 
       (SELECT c.cust_name 
        FROM customer c 
        WHERE c.cust_id IN (
            SELECT cd.cust_id 
            FROM cart_details cd 
            WHERE cd.prod_id = p.prod_id
        )
       ) AS cust_name
FROM product p
WHERE p.prod_id IN (
    SELECT cd.prod_id 
    FROM cart_details cd 
    WHERE cd.cust_id IN (
        SELECT i.cust_id 
        FROM invoice i 
        WHERE i.invoice_amt > 50000
    )
);


#Get the top-selling product by quantity.
select prod_name
from product 
where prod_id =(select prod_id from cart_details group by prod_id order by sum(prod_price) desc limit 1);

#Find customers who have bought products with a price greater than the average price.

select cust_name
from customer
where cust_id in(select cust_id from cart_details where prod_id in 
( select prod_id from product where prod_price>
( select avg(prod_price) from product)
)
);

#Find products that no customer has purchased.
SELECT prod_name
FROM product
WHERE prod_id NOT IN (SELECT prod_id FROM cart_details);

#List customers who have not made any purchase.
SELECT cust_name
FROM customer
WHERE cust_id NOT IN (SELECT cust_id FROM cart_details);

#Get the total amount spent by customers who have purchased more than 3 different products.

SELECT c.cust_name, SUM(i.invoice_amt) AS total_spent
FROM customer c
INNER JOIN invoice i ON c.cust_id = i.cust_id
WHERE c.cust_id IN (
    SELECT cust_id 
    FROM cart_details 
    GROUP BY cust_id 
    HAVING COUNT(DISTINCT prod_id) >=2
)
GROUP BY c.cust_name;

/*HAVING */
#Find products that have been purchased more than 5 times.
SELECT product.prod_name, SUM(cart_details.prod_quantity) AS total_quantity
FROM cart_details
INNER JOIN product ON cart_details.prod_id = product.prod_id
GROUP BY product.prod_name
HAVING total_quantity >5;

#Get customers who have purchased products with a total value greater than 10000.
select c.cust_name,sum(i.invoice_amt) as Total_spend
from invoice i 
inner join customer c on c.cust_id=i.cust_id
group by c.cust_name
having sum(i.invoice_amt)>10000;

#Show the categories with more than 2 products.
select c.cat_name,count(*) as total_prod
from categories c
group by c.cat_name
having total_prod>=2
order by total_prod desc;

#Find the products whose total quantity sold is greater than 10.
select p.prod_name,sum(cd.prod_quantity) as total_quantity
from cart_details cd
inner join product p on p.prod_id=cd.prod_id
group by prod_name
having total_quantity >=10;

#Get the customers who have purchased more than 3 different products.
SELECT customer.cust_name, COUNT(DISTINCT cart_details.prod_id) AS total_products
FROM cart_details
INNER JOIN customer ON cart_details.cust_id = customer.cust_id
GROUP BY customer.cust_name
HAVING total_products >=2;

#Get the top 3 most expensive products purchased by customers.
SELECT product.prod_name, MAX(product.prod_price) AS max_price
FROM product
INNER JOIN cart_details ON product.prod_id = cart_details.prod_id
GROUP BY product.prod_name
HAVING max_price > 1000
ORDER BY max_price DESC
LIMIT 3;

#Find customers who have spent more than 10000 on 'Laptop' products.
SELECT customer.cust_name, SUM(invoice.invoice_amt) AS total_spent
FROM invoice
INNER JOIN customer ON invoice.cust_id = customer.cust_id
INNER JOIN cart_details ON invoice.cart_id = cart_details.cart_id
INNER JOIN product ON cart_details.prod_id = product.prod_id
inner join categories on categories.prod_id=product.prod_id
WHERE categories.cat_name LIKE '%Laptop%'
GROUP BY customer.cust_name
HAVING SUM(invoice.invoice_amt) > 10000;

#Find the categories that have products with a total price greater than 50000.

SELECT categories.cat_name, SUM(product.prod_price) AS total_price
FROM categories
INNER JOIN product ON categories.prod_id = product.prod_id
GROUP BY categories.cat_name
HAVING total_price > 50000;

#Create a stored procedure to get the total sales of a specific product.
DELIMITER //
CREATE PROCEDURE TotalSalesByProduct(IN product_id INT)
BEGIN
    SELECT product.prod_name, SUM(cart_details.prod_quantity * cart_details.prod_price) AS total_sales
    FROM cart_details
    INNER JOIN product ON cart_details.prod_id = product.prod_id
    WHERE product.prod_id = product_id
    GROUP BY product.prod_name;
END //
DELIMITER ;
CALL TotalSalesByProduct(1002);
drop procedure if exists TotalSalesByProduct;



/**TABLES**/
select * from product;
select * from cart_details;
select * from invoice;
select * from customer;
select * from feedback;
select * from categories;

