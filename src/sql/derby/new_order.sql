-- ----------------------------------------------------------------------------
--  Apache Derby Table Creation
--
--  @author     Andrei I. Holub
--  @created    August 31, 2006
--  @version    $Id:$
-- ----------------------------------------------------------------------------

-- REQUIRES: new_product.sql
-- REQUIRES: new_project.sql
-- REQUIRES: new_quote.sql

-- Each order can have a status, which changes as the order is completed
-- Example: Pending, In Progress, Cancelled, Rejected, Completed
CREATE TABLE lookup_order_status (
  code INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  description VARCHAR(300) NOT NULL,
  default_item CHAR(1) DEFAULT '0',
  "level" INTEGER DEFAULT 0,
  enabled CHAR(1) DEFAULT '1'
);

-- Each order has a type which defines the flow of product to/from customer
-- Example: New, Change, Upgrade/Downgrade, Disconnect, Move, Refund, Suspend, Unsuspend, Re-Run
CREATE TABLE lookup_order_type (
  code INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  description VARCHAR(300) NOT NULL,
  default_item CHAR(1) DEFAULT '0',
  "level" INTEGER DEFAULT 0,
	enabled CHAR(1) DEFAULT '1'
);

-- Each order has terms in which the order was placed
CREATE TABLE lookup_order_terms (
  code INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  description VARCHAR(300) NOT NULL,
  default_item CHAR(1) DEFAULT '0',
	"level" INTEGER DEFAULT 0,
	enabled CHAR(1) DEFAULT '1'
);

-- Each order has a type of origination
-- Example: Online, Email, Incoming Phone Call, Outgoing Phone Call, Mail
CREATE TABLE lookup_order_source (
  code INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  description VARCHAR(300) NOT NULL,
  default_item CHAR(1) DEFAULT '0',
	"level" INTEGER DEFAULT 0,
	enabled CHAR(1) DEFAULT '1'
);

-- The details of an order are listed
CREATE TABLE order_entry (
  order_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  parent_id INT REFERENCES order_entry(order_id),
  org_id INTEGER NOT NULL REFERENCES organization(org_id),
  quote_id INTEGER REFERENCES quote_entry(quote_id),
  sales_id INTEGER REFERENCES "access"(user_id),
  orderedby INTEGER REFERENCES contact(contact_id),
  billing_contact_id INTEGER REFERENCES contact(contact_id),
  source_id INTEGER REFERENCES lookup_order_source(code),
  grand_total FLOAT,
  status_id INTEGER REFERENCES lookup_order_status(code),
  status_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  contract_date TIMESTAMP DEFAULT NULL,
  expiration_date TIMESTAMP DEFAULT NULL,
  order_terms_id INTEGER REFERENCES lookup_order_terms(code),
  order_type_id INTEGER REFERENCES lookup_order_type(code),
  description VARCHAR(2048),
  notes CLOB DEFAULT NULL,
  entered TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  enteredby INT NOT NULL REFERENCES "access"(user_id),
  modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modifiedby INT NOT NULL REFERENCES "access"(user_id),
  submitted TIMESTAMP,
  approx_ship_date TIMESTAMP DEFAULT NULL,
  approx_delivery_date TIMESTAMP DEFAULT NULL
);

-- Each order can contain multiple products
CREATE TABLE order_product (
  item_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  order_id INTEGER NOT NULL REFERENCES order_entry(order_id),
  product_id INTEGER NOT NULL REFERENCES product_catalog(product_id),
  quantity INTEGER NOT NULL DEFAULT 0,
  msrp_currency INTEGER REFERENCES lookup_currency(code),
  msrp_amount FLOAT NOT NULL DEFAULT 0,
  price_currency INTEGER REFERENCES lookup_currency(code),
  price_amount FLOAT NOT NULL DEFAULT 0,
  recurring_currency INTEGER REFERENCES lookup_currency(code),
  recurring_amount FLOAT NOT NULL DEFAULT 0,
  recurring_type INTEGER REFERENCES lookup_recurring_type(code),
  extended_price FLOAT NOT NULL DEFAULT 0,
  total_price FLOAT NOT NULL DEFAULT 0,
  status_id INTEGER REFERENCES lookup_order_status(code),
  status_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Each order_product has a status, as the status changes,
-- the previous status is stored here for reference and tracking
CREATE TABLE order_product_status (
  order_product_status_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  order_id INTEGER NOT NULL REFERENCES order_entry(order_id),
  item_id INTEGER NOT NULL REFERENCES order_product(item_id),
  status_id INTEGER REFERENCES lookup_order_status(code),
  entered TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  enteredby INT NOT NULL REFERENCES "access"(user_id),
  modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modifiedby INT NOT NULL REFERENCES "access"(user_id)
);

-- Each product can have configurable options
CREATE TABLE order_product_options (
  order_product_option_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  item_id INTEGER NOT NULL REFERENCES order_product(item_id),
  product_option_id INTEGER NOT NULL REFERENCES product_option_map(product_option_id),
  quantity INTEGER NOT NULL DEFAULT 0,
  price_currency INTEGER REFERENCES lookup_currency(code),
  price_amount FLOAT NOT NULL DEFAULT 0,
  recurring_currency INTEGER REFERENCES lookup_currency(code),
  recurring_amount FLOAT NOT NULL DEFAULT 0,
  recurring_type INTEGER REFERENCES lookup_recurring_type(code),
  extended_price FLOAT NOT NULL DEFAULT 0,
  total_price FLOAT NOT NULL DEFAULT 0,
  status_id INTEGER REFERENCES lookup_order_status(code)
);

CREATE TABLE order_product_option_boolean (
	order_product_option_id INTEGER REFERENCES order_product_options(order_product_option_id),
	"value" CHAR(1) NOT NULL
);

CREATE TABLE order_product_option_float (
	order_product_option_id INTEGER REFERENCES order_product_options(order_product_option_id),
	"value" FLOAT NOT NULL
);

CREATE TABLE order_product_option_timestamp (
	order_product_option_id INTEGER REFERENCES order_product_options(order_product_option_id),
	"value" TIMESTAMP NOT NULL
);

CREATE TABLE order_product_option_integer (
	order_product_option_id INTEGER REFERENCES order_product_options(order_product_option_id),
	"value" INTEGER NOT NULL
);

CREATE TABLE order_product_option_text (
	order_product_option_id INTEGER REFERENCES order_product_options(order_product_option_id),
	"value" CLOB NOT NULL
);

-- Example: Billing, Shipping
CREATE TABLE lookup_orderaddress_types (
	code INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  description VARCHAR(300) NOT NULL,
  default_item CHAR(1) DEFAULT '0',
  "level" INTEGER DEFAULT 0,
	enabled CHAR(1) DEFAULT '1'
);

CREATE TABLE order_address (
	address_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	order_id INT NOT NULL REFERENCES order_entry(order_id),
	address_type INT REFERENCES lookup_orderaddress_types(code),
	addrline1 VARCHAR(300),
	addrline2 VARCHAR(300),
	addrline3 VARCHAR(300),
	city VARCHAR(300),
	state VARCHAR(300),
	country VARCHAR(300),
	postalcode VARCHAR(40),
	entered TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	enteredby INT NOT NULL REFERENCES "access"(user_id),
  modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modifiedby INT NOT NULL REFERENCES "access"(user_id),
  addrline4 VARCHAR(300)
);
CREATE INDEX order_city_idx
  ON order_address(city);

-- The method in which a payment is made
-- Example: Credit Card, EFT, Cash, Check, Money Order, Purchase Order
CREATE TABLE lookup_payment_methods (
	code INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  description VARCHAR(300) NOT NULL,
  default_item CHAR(1) DEFAULT '0',
  "level" INTEGER DEFAULT 0,
	enabled CHAR(1) DEFAULT '1'
);

-- Example: Visa, Master Card, Discover, American Express

CREATE TABLE lookup_creditcard_types (
  code INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL PRIMARY KEY,
  description VARCHAR(300) NOT NULL,
  default_item CHAR(1) DEFAULT '0',
  "level" INTEGER DEFAULT 0,
	enabled CHAR(1) DEFAULT '1'
);

CREATE TABLE payment_creditcard (
	creditcard_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	card_type INT REFERENCES lookup_creditcard_types(code),
	card_number VARCHAR(300),
	card_security_code VARCHAR(300),
	expiration_month INT,
	expiration_year INT,
  name_on_card VARCHAR(300),
  company_name_on_card VARCHAR(300),
	entered TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	enteredby INT NOT NULL REFERENCES "access"(user_id),
  modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modifiedby INT NOT NULL REFERENCES "access"(user_id),
  order_id INTEGER REFERENCES order_entry(order_id)
);

CREATE TABLE payment_eft (
	bank_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	bank_name VARCHAR(300),
	routing_number VARCHAR(300),
	account_number VARCHAR(300),
	name_on_account VARCHAR(300),
  company_name_on_account VARCHAR(300),
	entered TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	enteredby INT NOT NULL REFERENCES "access"(user_id),
  modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modifiedby INT NOT NULL REFERENCES "access"(user_id),
  order_id INTEGER REFERENCES order_entry(order_id)
);

-- List of products created by the ordering of a product
CREATE TABLE customer_product (
  customer_product_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  org_id INTEGER NOT NULL REFERENCES organization(org_id),
  order_id INTEGER REFERENCES order_entry(order_id),
  order_item_id INTEGER REFERENCES order_product(item_id),
  description VARCHAR(2048),
  status_id INTEGER REFERENCES lookup_order_status(code),
  status_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  entered TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  enteredby INT NOT NULL REFERENCES "access"(user_id),
  modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
  modifiedby INT NOT NULL REFERENCES "access"(user_id),
  enabled CHAR(1) DEFAULT '1',
  contact_id INTEGER
);

-- Some products get returned or are finished being used
CREATE TABLE customer_product_history (
  history_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  customer_product_id INTEGER NOT NULL REFERENCES customer_product(customer_product_id),
  org_id INTEGER NOT NULL REFERENCES organization(org_id),
  order_id INTEGER NOT NULL REFERENCES order_entry(order_id),
  product_start_date TIMESTAMP,
  product_end_date TIMESTAMP,
  entered TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  enteredby INT NOT NULL REFERENCES "access"(user_id),
  modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
  modifiedby INT NOT NULL REFERENCES "access"(user_id),
  order_item_id INTEGER NOT NULL REFERENCES order_product(item_id),
  contact_id INTEGER
);

-- Each order_payment has an associated status
-- Example: Pending, In Progress, Approved, Declined
CREATE TABLE lookup_payment_status (
  code INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  description VARCHAR(300) NOT NULL,
  default_item CHAR(1) DEFAULT '0',
  "level" INTEGER DEFAULT 0,
	enabled CHAR(1) DEFAULT '1'
);

CREATE TABLE order_payment (
	payment_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	order_id INT NOT NULL REFERENCES order_entry(order_id),
  payment_method_id INT NOT NULL REFERENCES lookup_payment_methods(code),
	payment_amount FLOAT,
  authorization_ref_number VARCHAR(30),
  authorization_code VARCHAR(30),
  authorization_date TIMESTAMP,
	entered TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	enteredby INT NOT NULL REFERENCES "access"(user_id),
  modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modifiedby INT NOT NULL REFERENCES "access"(user_id),
  order_item_id INT REFERENCES order_product(item_id),
  history_id INT REFERENCES customer_product_history(history_id),
	date_to_process TIMESTAMP,
  creditcard_id INTEGER REFERENCES payment_creditcard(creditcard_id),
  bank_id INTEGER REFERENCES payment_eft(bank_id),
  status_id INTEGER REFERENCES lookup_payment_status(code)
);

-- Each order_payment has a status, as the status changes,
-- the previous status is stored here for reference and tracking
CREATE TABLE order_payment_status (
  payment_status_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  payment_id INTEGER NOT NULL REFERENCES order_payment(payment_id),
  status_id INTEGER REFERENCES lookup_payment_status(code),
  entered TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  enteredby INT NOT NULL REFERENCES "access"(user_id),
  modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modifiedby INT NOT NULL REFERENCES "access"(user_id)
);

CREATE TABLE credit_card (
  creditcard_id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  card_type INTEGER REFERENCES lookup_creditcard_types (code),
  card_number varchar(300),
  card_security_code varchar(300),
  expiration_month INTEGER,
  expiration_year INTEGER,
  name_on_card varchar(300),
  company_name_on_card varchar(300),
  entered timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  enteredby int NOT NULL REFERENCES "access" (user_id),
  modified timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modifiedby int NOT NULL REFERENCES "access" (user_id)
);

 CREATE TABLE lookup_payment_gateway (
  code INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  description varchar(50) NOT NULL,
  default_item CHAR(1) DEFAULT '0',
  "level" int DEFAULT 0,
  enabled CHAR(1) DEFAULT '1',
  constant_id int
);

CREATE TABLE merchant_payment_gateway (
  merchant_payment_gateway_id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  gateway_id int REFERENCES lookup_payment_gateway (code),
  merchant_id varchar(300),
  merchant_code varchar(1024),
  entered timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  enteredby int NOT NULL,
  modified timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modifiedby int NOT NULL
);
