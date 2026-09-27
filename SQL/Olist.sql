create database Olist

use Olist


ALTER TABLE customer ALTER COLUMN customer_id VARCHAR(50) NOT NULL;
ALTER TABLE customer

ADD CONSTRAINT PK_Customer PRIMARY KEY (customer_id);

ALTER TABLE sellers ALTER COLUMN seller_id VARCHAR(50) NOT NULL;
ALTER TABLE sellers ADD CONSTRAINT PK_Sellers PRIMARY KEY (seller_id);

ALTER TABLE products ALTER COLUMN product_id VARCHAR(50) NOT NULL;
ALTER TABLE products ADD CONSTRAINT PK_Products PRIMARY KEY (product_id);

ALTER TABLE orderData ALTER COLUMN order_id VARCHAR(50) NOT NULL;
ALTER TABLE orderData ALTER COLUMN customer_id VARCHAR(50) NULL;
ALTER TABLE orderData ADD CONSTRAINT PK_Orders PRIMARY KEY (order_id);

ALTER TABLE orderData ADD CONSTRAINT FK_Order_Customer 
FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

ALTER TABLE order_item ALTER COLUMN order_id VARCHAR(50) NOT NULL;
ALTER TABLE order_item ALTER COLUMN product_id VARCHAR(50) NULL;
ALTER TABLE order_item ALTER COLUMN seller_id VARCHAR(50) NULL;

ALTER TABLE order_item ADD CONSTRAINT FK_Item_Order 
FOREIGN KEY (order_id) REFERENCES orderData(order_id);

ALTER TABLE order_item ADD CONSTRAINT FK_Item_Product 
FOREIGN KEY (product_id) REFERENCES products(product_id);

ALTER TABLE order_item ADD CONSTRAINT FK_Item_Seller 
FOREIGN KEY (seller_id) REFERENCES sellers(seller_id);

ALTER TABLE payments ALTER COLUMN order_id VARCHAR(50) NOT NULL;
ALTER TABLE payments ADD CONSTRAINT FK_Payment_Order 
FOREIGN KEY (order_id) REFERENCES orderData(order_id);


ALTER TABLE reviews ALTER COLUMN review_id VARCHAR(50) NOT NULL;
ALTER TABLE reviews ALTER COLUMN order_id VARCHAR(50) NULL;
ALTER TABLE reviews ADD CONSTRAINT FK_Review_Order 
FOREIGN KEY (order_id) REFERENCES orderData(order_id);
