mysql> CREATE TABLE accounts(account_number INT,full_name VARCHAR(20), birth_date DATE,address VARCHAR(50),email VARCHAR(50),phone VARCHAR(12),national_id_number INT UNIQUE,PRIMARY KEY(account_number));

CREATE TABLE transactions(transaction_id VARCHAR(6), amount INT,account_number INT,type ENUM('debit','credit'),PRIMARY KEY (transaction_id),FOREIGN KEY (account_number) REFERENCES accounts(account_number));

INSERT INTO accounts(account_number,full_name,birth_date,address,email,phone,national_id_number) VALUES (1001,'John Doe','1990-01-01','123 Main St','TQ9xq@example.com','123-456-7890',123456789); INSERT INTO accounts(account_number,full_name,birth_date,address,email,phone,national_id_number) VALUES (1002,'Jane Smith','1985-05-15','456 Elm St','dE9o7@example.com','987-654-3210',987654321);

 INSERT INTO transactions(transaction_id,amount,account_number,type) VALUES ('T001',500,1001,'credit');
 INSERT INTO transactions(transaction_id,amount,account_number,type) VALUES ('T002',200,1001,'debit');
 INSERT INTO transactions(transaction_id,amount,account_number,type) VALUES ('T003',1000,1002,'credit');

 