
CREATE DATABASE ecoguard;
USE ecoguard;


CREATE TABLE locations (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    location_name VARCHAR(100) NOT NULL,
    location_type VARCHAR(50),           
    area_sq_km DECIMAL(10,2),
    country VARCHAR(60),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE organizations (
    org_id INT PRIMARY KEY AUTO_INCREMENT,
    org_name VARCHAR(100) NOT NULL,
    org_type VARCHAR(50),                
    contact_email VARCHAR(100),
    contact_phone VARCHAR(20),
    website VARCHAR(150),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(150) NOT NULL,
    location_id INT,
    org_id INT,
    start_date DATE,
    end_date DATE,
    status ENUM('Planned', 'Ongoing', 'Completed', 'Suspended'),
    budget DECIMAL(15,2),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (location_id) REFERENCES locations(location_id),
    FOREIGN KEY (org_id) REFERENCES organizations(org_id)
);

CREATE TABLE volunteers (
    volunteer_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    date_of_birth DATE,
    skills TEXT,                         
    join_date DATE DEFAULT (CURRENT_DATE),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE donations (
    donation_id INT PRIMARY KEY AUTO_INCREMENT,
    donor_name VARCHAR(100),
    email VARCHAR(100),
    amount DECIMAL(12,2) NOT NULL,
    project_id INT,
    donation_date DATE DEFAULT (CURRENT_DATE),
    payment_method VARCHAR(50),          
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

INSERT INTO locations (location_name, location_type, area_sq_km, country, description) VALUES
('Maasai Mara National Reserve', 'National Park', 1510.00, 'Kenya', 'Famous for wildebeest migration and rich biodiversity'),
('Kakamega Forest', 'Forest', 238.00, 'Kenya', 'Last remaining tropical rainforest in Kenya'),
('Lake Nakuru', 'Wetland', 188.00, 'Kenya', 'Famous for flamingos and rhino sanctuary'),
('Aberdare National Park', 'National Park', 766.00, 'Kenya', 'Home to elephants, leopards and bongo antelope');

INSERT INTO organizations (org_name, org_type, contact_email, contact_phone, website) VALUES
('Wildlife Conservation Society', 'NGO', 'info@wcs.org', '+254712345678', 'https://wcs.org'),
('Kenya Wildlife Service', 'Government', 'info@kws.go.ke', '+254800123456', 'https://kws.go.ke'),
('Green Belt Movement', 'NGO', 'contact@greenbeltmovement.org', '+254722987654', 'https://greenbeltmovement.org'),
('African Wildlife Foundation', 'NGO', 'info@awf.org', '+254711234567', 'https://awf.org');


INSERT INTO projects (project_name, location_id, org_id, start_date, end_date, status, budget, description) VALUES
('Rhino Protection Program', 1, 2, '2025-01-15', '2027-12-31', 'Ongoing', 4500000.00, 'Protecting black and white rhinos in Maasai Mara'),
('Reforestation Initiative', 2, 3, '2024-06-01', '2026-05-31', 'Ongoing', 1250000.00, 'Planting indigenous trees in Kakamega Forest'),
('Flamingo Habitat Restoration', 3, 4, '2025-03-01', NULL, 'Ongoing', 2800000.00, 'Improving water quality and habitat for flamingos'),
('Community Wildlife Conservancy', 1, 1, '2024-09-01', '2026-08-31', 'Ongoing', 3750000.00, 'Working with local Maasai communities');


INSERT INTO volunteers (full_name, email, phone, date_of_birth, skills) VALUES
('John Kamau', 'john.kamau@email.com', '+254701234567', '1995-03-12', 'Wildlife monitoring, Data collection, First Aid'),
('Aisha Mwangi', 'aisha.mwangi@email.com', '+254722987654', '1998-07-25', 'Tree planting, Environmental education'),
('Michael Ochieng', 'michael.ochieng@email.com', '+254711456789', '1993-11-05', 'Photography, GIS mapping, Anti-poaching'),
('Fatima Njeri', 'fatima.njeri@email.com', '+254700112233', '2000-01-18', 'Community outreach, Social media awareness');


INSERT INTO donations (donor_name, email, amount, project_id, donation_date, payment_method) VALUES
('Equity Bank Foundation', 'foundation@equitybank.co.ke', 500000.00, 1, '2025-04-10', 'Bank Transfer'),
('Anonymous Donor', 'donor2025@gmail.com', 25000.00, 2, '2025-05-05', 'M-Pesa'),
('Sarah Wanjiku', 'sarah.wanjiku@email.com', 15000.00, 3, '2025-05-15', 'PayPal'),
('Tech For Nature Initiative', 'tech4nature@ngo.org', 120000.00, 1, '2025-05-20', 'Bank Transfer'),
('Peter Maina', 'maina.peter@email.com', 8000.00, 4, '2025-05-22', 'M-Pesa');