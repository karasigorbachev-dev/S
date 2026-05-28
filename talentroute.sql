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

 CREATE TABLE refferals(
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

INSERT INTO refferals(talent_email, referee_email, referee_name, referee_phone, relationship, description, attachment_url) VALUES
('z8c9z@example.com', 'n5YzT@example.com', 'Jane Smith', '987-654-3210', 'Friend', 'I met Jane through a mutual friend.', 'referral.pdf'),
('n5YzT@example.com', 'f6s7t@example.com', 'Michael Johnson', '555-555-5555', 'Colleague', 'Michael introduced me to the opportunity.', 'referral.docx'),
('f6s7t@example.com', 'z8c9z@example.com', 'John Doe', '123-456-7890', 'Family', 'John recommended me for the opportunity.', 'referral.txt');

INSERT INTO opportunities (title, description, location, university, requirements, application_link) VALUES 
('Football Scholarship', 'A scholarship for talented football players to study and play at a top university.', 'Nairobi, Kenya', 'University of Nairobi', 'Must have played at a competitive level and have good academic standing.', 'http://example.com/apply/football-scholarship'),
('Basketball Tryouts', 'Tryouts for a basketball team looking for talented players to join their roster.', 'Mombasa, Kenya', NULL, 'Must have experience playing basketball and be in good physical condition.', 'http://example.com/apply/basketball-tryouts'),
('Athletics Training Program', 'A training program for talented athletes looking to improve their skills and compete at a higher level.', 'Kisumu, Kenya', NULL, 'Must have experience in athletics and be committed to training regularly.', 'http://example.com/apply/athletics-training'),
('Rugby Sevens Scholarship', 'Full scholarship for promising rugby players.', 'Nakuru, Kenya', 'Egerton University', 'Strong rugby background, good fitness, and KCSE mean grade C+', 'http://example.com/apply/rugby-scholarship'),
('Volleyball Talent Hunt', 'National volleyball talent identification program.', 'Eldoret, Kenya', 'Moi University', 'Minimum 2 years experience in volleyball.', 'http://example.com/apply/volleyball-talent'),
('Football Academy Trial', 'Trials for U20 football academy team.', 'Nairobi, Kenya', NULL, 'Aged 16-20 with strong technical ability.', 'http://example.com/apply/football-academy'),
('Basketball League Recruitment', 'Recruitment for Kenya Basketball League teams.', 'Mombasa, Kenya', NULL, 'Must be over 18 and available for weekend games.', 'http://example.com/apply/basketball-league'),
('Track & Field Sponsorship', 'Sponsorship and training for upcoming sprinters and distance runners.', 'Eldoret, Kenya', 'University of Eldoret', 'Proven race times and strong work ethic.', 'http://example.com/apply/track-sponsorship'),
('Netball Championship Program', 'Elite netball training camp and team selection.', 'Kisumu, Kenya', NULL, 'Experience in netball at county or national level.', 'http://example.com/apply/netball-program'),
('Cricket Development Program', 'Youth cricket talent development with professional coaching.', 'Nairobi, Kenya', 'Strathmore University', 'Basic cricket skills and passion for the sport.', 'http://example.com/apply/cricket-development');

INSERT INTO talents (email, full_name, sport, dob, phone, highest_achievement, education_level) VALUES 
('z8c9z@example.com', 'John Doe', 'Football', '1990-01-01', '123-456-7890', 'Won a national championship', 'High School'),
('n5YzT@example.com', 'Jane Smith', 'Basketball', '1995-05-15', '987-654-3210', 'Participated in a local tournament', 'College'),
('f6s7t@example.com', 'Michael Johnson', 'Athletics', '1998-07-25', '555-555-5555', 'Set a personal record', 'University'),
('ak47m@example.com', 'Aisha Mwangi', 'Football', '2002-03-12', '0712-345-678', 'County team player', 'High School'),
('brianokoth@example.com', 'Brian Okoth', 'Rugby', '1999-11-05', '0723-456-789', 'Played in KRFU Division 1', 'College'),
('cynthiawanjiku@example.com', 'Cynthia Wanjiku', 'Volleyball', '2001-08-20', '0798-765-432', 'National youth team member', 'University'),
('davidkipchoge@example.com', 'David Kipchoge', 'Athletics', '1997-02-28', '0711-222-333', 'Won regional marathon', 'High School'),
('eunicechebet@example.com', 'Eunice Chebet', 'Netball', '2000-06-15', '0722-111-444', 'County champions captain', 'College'),
('franklinotieno@example.com', 'Franklin Otieno', 'Basketball', '1996-09-10', '0733-555-666', 'MVP in school league', 'University'),
('gracechepngeno@example.com', 'Grace Chepngeno', 'Cricket', '2003-04-18', '0714-777-888', 'U19 national squad', 'High School');

INSERT INTO wishlist (talent_email, opportunity_id, status) VALUES 
('z8c9z@example.com', 1, 'interested'),
('n5YzT@example.com', 2, 'applied'),
('f6s7t@example.com', 3, 'successful'),
('ak47m@example.com', 4, 'interested'),
('brianokoth@example.com', 1, 'applied'),
('cynthiawanjiku@example.com', 5, 'interested'),
('davidkipchoge@example.com', 8, 'applied'),
('eunicechebet@example.com', 9, 'successful'),
('franklinotieno@example.com', 7, 'interested'),
('gracechepngeno@example.com', 10, 'applied');

INSERT INTO refferals (talent_email, referee_email, referee_name, referee_phone, relationship, description, attachment_url) VALUES 
('z8c9z@example.com', 'n5YzT@example.com', 'Jane Smith', '987-654-3210', 'Friend', 'I met Jane through a mutual friend.', 'referral.pdf'),
('n5YzT@example.com', 'f6s7t@example.com', 'Michael Johnson', '555-555-5555', 'Colleague', 'Michael introduced me to the opportunity.', 'referral.docx'),
('f6s7t@example.com', 'z8c9z@example.com', 'John Doe', '123-456-7890', 'Family', 'John recommended me for the opportunity.', 'referral.txt'),
('ak47m@example.com', 'brianokoth@example.com', 'Brian Okoth', '0723-456-789', 'Teammate', 'We played together in county tournaments.', 'referral1.pdf'),
('brianokoth@example.com', 'cynthiawanjiku@example.com', 'Cynthia Wanjiku', '0798-765-432', 'Coach', 'She coached me during last season.', 'referral2.pdf'),
('cynthiawanjiku@example.com', 'davidkipchoge@example.com', 'David Kipchoge', '0711-222-333', 'Friend', 'Long-time training partner.', 'referral3.jpg'),
('davidkipchoge@example.com', 'eunicechebet@example.com', 'Eunice Chebet', '0722-111-444', 'Sister', 'Family recommendation.', 'referral4.pdf'),
('eunicechebet@example.com', 'franklinotieno@example.com', 'Franklin Otieno', '0733-555-666', 'Teammate', 'Played against each other many times.', 'referral5.docx'),
('franklinotieno@example.com', 'gracechepngeno@example.com', 'Grace Chepngeno', '0714-777-888', 'Schoolmate', 'We were in the same sports club.', 'referral6.pdf'),
('gracechepngeno@example.com', 'ak47m@example.com', 'Aisha Mwangi', '0712-345-678', 'Friend', 'Highly skilled and dedicated player.', 'referral7.pdf');


 select fullname, sport,phone from talents;

 select fullname, sport,phone from talents where sport = "hockey";

 select count(email) from talents;

 select count(email) from talents where sport = "rugby";


select * from opportunities where requirements like "%kcse%";


-- // count how many talets have appliet to opportunity number 1
select count(*) from wishlist where opportunity_id = 1 and status = "interested";


-- Which sports have the highest number of registered talents?
SELECT 
    sport, 
    COUNT(*) AS total_players 
FROM talents
GROUP BY sport
ORDER BY total_players DESC;

-- What is the success rate of applications for opportunities?
SELECT 
    status,
    COUNT(*) AS count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM wishlist WHERE status != 'interested'), 2) AS percentage
FROM wishlist
WHERE status != 'interested'
GROUP BY status;

-- Which universities or locations are generating the most interest?
SELECT 
    o.university,
    o.location,
    COUNT(w.id) AS total_saved_or_applied
FROM opportunities o
JOIN wishlist w ON o.id = w.opportunity_id
GROUP BY o.id, o.university, o.location
ORDER BY total_saved_or_applied DESC
LIMIT 5;

-- Who are the top players with verified referrals and active applications?

SELECT 
    t.fullname,
    t.sport,
    COUNT(DISTINCT r.id) AS total_referrals,
    COUNT(DISTINCT CASE WHEN w.status = 'applied' THEN w.id END) AS active_applications
FROM talents t
LEFT JOIN refferals r ON t.email = r.talent_email
LEFT JOIN wishlist w ON t.email = w.talent_email
GROUP BY t.email, t.fullname, t.sport
HAVING total_referrals > 0 AND active_applications > 0
ORDER BY active_applications DESC, total_referrals DESC;    

-- What is the current age distribution of the talent pool?

SELECT 
    CASE 
        WHEN TIMESTAMPDIFF(YEAR, dob, CURDATE()) < 18 THEN 'Under 18'
        WHEN TIMESTAMPDIFF(YEAR, dob, CURDATE()) BETWEEN 18 AND 21 THEN '18-21 Years'
        WHEN TIMESTAMPDIFF(YEAR, dob, CURDATE()) BETWEEN 22 AND 25 THEN '22-25 Years'
        ELSE 'Over 25'
    END AS age_group,
    COUNT(*) AS total_talents
FROM talents
GROUP BY age_group
ORDER BY age_group;


--



 