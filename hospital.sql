CREATE TABLE doctor(full_name VARCHAR(20), specialization VARCHAR(20), phone VARCHAR(12), email VARCHAR(50), doctor_id INT PRIMARY KEY);
CREATE TABLE patient(full_name VARCHAR(20), birth_date DATE, address VARCHAR(50), email VARCHAR(50), phone VARCHAR(12), national_id_number INT UNIQUE, patient_id INT PRIMARY KEY);
CREATE TABLE consultation(consultation_id VARCHAR(6), doctor_id INT, patient_id INT, date DATE, time TIME, PRIMARY KEY (consultation_id), FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id), FOREIGN KEY (patient_id) REFERENCES patient(patient_id));

INSERT INTO doctor(full_name, specialization, phone, email, doctor_id) VALUES ('Dr. Smith', 'Cardiology', '123-456-7890', 'Smith@gmail.com', '22244335');
INSERT INTO doctor(full_name, specialization, phone, email, doctor_id) VALUES ('Dr. Johnson', 'Neurology', '987-654-3210', 'Johnson@gmail.com' ,'33355446');

INSERT INTO patient(full_name, birth_date, address, email, phone, national_id_number, patient_id) VALUES ('Alice Brown', '1990-01-01', '123 Main St', 'alicebrown@gmail.com' ,'123-456-7890', 123456789, 1001);
INSERT INTO patient(full_name, birth_date, address, email, phone, national_id_number, patient_id) VALUES ('Bob Green', '1985-05-15', '456 Elm St', 'bobgreen@gmail.com' ,'987-654-3210', 987654321, 1002);

INSERT INTO consultation(consultation_id, doctor_id, patient_id, date, time) VALUES ('C001', '22244335', 1001, '2024-06-01', '10:00:00');
INSERT INTO consultation(consultation_id, doctor_id, patient_id, date, time) VALUES ('C002', '33355446', 1002, '2024-06-02', '14:00:00');