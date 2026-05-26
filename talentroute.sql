CREATE DATABASE talentroute;
USE talentroute;

CREATE TABLE opportunities(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    description TEXT,
    location VARCHAR(255),
    university VARCHAR(255),
    requirements TEXT,
    application_link VARCHAR(255)
);

INSERT INTO opportunities( title, description, location, university, requirements, application_link) VALUES 
('Football Scholarship', 'A scholarship for talented football players to study and play at a top university.', 'Nairobi, Kenya', 'University of Nairobi', 'Must have played at a competitive level and have good academic standing.', 'http://example.com/apply/football-scholarship'),
('Basketball Tryouts', 'Tryouts for a basketball team looking for talented players to join their roster.', 'Mombasa, Kenya', NULL, 'Must have experience playing basketball and be in good physical condition.', 'http://example.com/apply/basketball-tryouts'),
('Athletics Training Program', 'A training program for talented athletes looking to improve their skills and compete at a higher level.', 'Kisumu, Kenya', NULL, 'Must have experience in athletics and be committed to training regularly.', 'http://example.com/apply/athletics-training');

CREATE TABLE talents(
    email VARCHAR(255) PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    sport VARCHAR(50),
    dob DATE,
    phone VARCHAR(20),
    highest_achievement TEXT,
    education_level VARCHAR(50)
);

INSERT INTO talents(email, full_name, sport, dob, phone, highest_achievement, education_level) VALUES
('z8c9z@example.com', 'John Doe', 'Football', '1990-01-01', '123-456-7890', 'Won a national championship', 'High School'),
('n5YzT@example.com', 'Jane Smith', 'Basketball', '1995-05-15', '987-654-3210', 'Participated in a local tournament', 'College'),
('f6s7t@example.com', 'Michael Johnson', 'Athletics', '1998-07-25', '555-555-5555', 'Set a personal record', 'University');

 CREATE TABLE wishlist(
    id INT AUTO_INCREMENT PRIMARY KEY,
    talent_email VARCHAR(255),
    opportunity_id INT,
    status ENUM('interested', 'applied', 'successful', 'rejected') DEFAULT 'interested',
    FOREIGN KEY (talent_email) REFERENCES talents(email),
    FOREIGN KEY (opportunity_id) REFERENCES opportunities(id)
 );

 INSERT INTO wishlist(talent_email, opportunity_id, status) VALUES
('z8c9z@example.com', 1, 'interested'),
('n5YzT@example.com', 2, 'applied'),    
('f6s7t@example.com', 3, 'successful');

 CREATE TABLE referrals(
    id INT AUTO_INCREMENT PRIMARY KEY,
    talent_email VARCHAR(255),
    referee_email VARCHAR(255),
    referee_name VARCHAR(255),
    referee_phone VARCHAR(20),
    relationship VARCHAR(255),
    description TEXT,
    attachment_url VARCHAR(255),
    FOREIGN KEY (talent_email) REFERENCES talents(email),
    FOREIGN KEY (referee_email) REFERENCES talents(email)
 );

INSERT INTO referrals(talent_email, referee_email, referee_name, referee_phone, relationship, description, attachment_url) VALUES
('z8c9z@example.com', 'n5YzT@example.com', 'Jane Smith', '987-654-3210', 'Friend', 'I met Jane through a mutual friend.', 'referral.pdf'),
('n5YzT@example.com', 'f6s7t@example.com', 'Michael Johnson', '555-555-5555', 'Colleague', 'Michael introduced me to the opportunity.', 'referral.docx'),
('f6s7t@example.com', 'z8c9z@example.com', 'John Doe', '123-456-7890', 'Family', 'John recommended me for the opportunity.', 'referral.txt');



