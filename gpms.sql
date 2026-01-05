-- Table 1: citizens
CREATE TABLE citizens (
    citizen_id INT PRIMARY KEY,
    name TEXT NOT NULL,
    gender TEXT NOT NULL,
    dob DATE NOT NULL,
    address TEXT NOT NULL,
    household_id INT NOT NULL,
    educational_qualification TEXT
    
);

-- Table 2: households
CREATE TABLE households (
    household_id INT PRIMARY KEY,
    address TEXT NOT NULL,
    income DECIMAL(10, 2) NOT NULL
);

-- Table 3: land_records
CREATE TABLE land_records (
    land_id INT PRIMARY KEY,
    citizen_id INT NOT NULL,
    area_acres DECIMAL(10, 2) NOT NULL,
    crop_type TEXT NOT NULL,
    FOREIGN KEY (citizen_id) REFERENCES citizens(citizen_id)
);

-- Table 4: panchayat_employees
CREATE TABLE panchayat_employees (
    employee_id INT PRIMARY KEY,
    citizen_id INT NOT NULL,
    role TEXT NOT NULL,
    FOREIGN KEY (citizen_id) REFERENCES citizens(citizen_id)
);

-- Table 5: assets
CREATE TABLE assets (
    asset_id INT PRIMARY KEY,
    type TEXT NOT NULL,
    location TEXT NOT NULL,
    installation_date DATE NOT NULL
);

-- Table 6: welfare_schemes
CREATE TABLE welfare_schemes (
    scheme_id INT PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT NOT NULL
);

-- Table 7: scheme_enrollments
CREATE TABLE scheme_enrollments (
    enrollment_id INT PRIMARY KEY,
    citizen_id INT NOT NULL,
    scheme_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (citizen_id) REFERENCES citizens(citizen_id),
    FOREIGN KEY (scheme_id) REFERENCES welfare_schemes(scheme_id)
);

-- Table 8: vaccinations
CREATE TABLE vaccinations (
    vaccination_id INT PRIMARY KEY,
    citizen_id INT NOT NULL,
    vaccine_type TEXT NOT NULL,
    date_administered DATE NOT NULL,
    FOREIGN KEY (citizen_id) REFERENCES citizens(citizen_id)
);

-- Table 9: census_data
CREATE TABLE census_data (
    household_id INT NOT NULL,
    event_date DATE NOT NULL,
    FOREIGN KEY (household_id) REFERENCES households(household_id)
);

-- Table 10: citizen_income
CREATE TABLE citizen_income (
    income_id INT PRIMARY KEY,
    citizen_id INT NOT NULL,
    income_amount DECIMAL(10, 2) NOT NULL,
    income_source TEXT NOT NULL,
    income_date DATE NOT NULL,
    FOREIGN KEY (citizen_id) REFERENCES citizens(citizen_id)
);

-- Table 11: citizen_taxes
CREATE TABLE citizen_taxes (
    tax_id INT PRIMARY KEY,
    income_id INT NOT NULL,
    tax_amount DECIMAL(10, 2) NOT NULL,
    tax_type TEXT NOT NULL,
    payment_date DATE NOT NULL,
    tax_status TEXT NOT NULL,
    FOREIGN KEY (income_id) REFERENCES citizen_income(income_id)
);



-- Table 12: citizen_services
CREATE TABLE citizen_services (
    service_id INT PRIMARY KEY,
    citizen_id INT NOT NULL,
    service_type TEXT NOT NULL,
    request_date DATE NOT NULL,
    status TEXT NOT NULL,
    FOREIGN KEY (citizen_id) REFERENCES citizens(citizen_id)
);

-- Table 13: agriculture_data
CREATE TABLE agriculture_data (
    data_id INT PRIMARY KEY,
    land_id INT NOT NULL,
    crop_type TEXT NOT NULL,
    area_acres DECIMAL(10, 2) NOT NULL,
    yield_quantity DECIMAL(10, 2),
    harvest_date DATE NOT NULL,
    FOREIGN KEY (land_id) REFERENCES land_records(land_id)
);

-- Table 14: environment_data
CREATE TABLE environment_data (
    data_id INT PRIMARY KEY,
    location TEXT NOT NULL,
    event_type TEXT NOT NULL,
    event_date DATE NOT NULL,
    impact TEXT NOT NULL
);


-- Table 15: panchayat_expenditure
CREATE TABLE panchayat_expenditure (
    expenditure_id INT PRIMARY KEY,
    panchayat_employee_id INT NOT NULL,
    expenditure_type TEXT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    expenditure_date DATE NOT NULL,
    FOREIGN KEY (panchayat_employee_id) REFERENCES panchayat_employees(employee_id)
);



-- Table 1: citizens
INSERT INTO citizens (citizen_id,household_id, name, gender, dob, address, educational_qualification) VALUES 
(1,1, 'Rajesh Kumar', 'Male', '1985-03-15', '123 Main Street', 'Graduate'),
(2,2, 'Sunita Sharma', 'Female', '1990-07-21', '456 Market Road', 'Post-Graduate'),
(3,3, 'Amit Singh', 'Male', '1978-11-10', '789 Park Avenue', '10th'),
(4,4, 'Priya Verma', 'Female', '1992-01-18', '12 Rose Lane', 'Graduate'),
(5,5, 'Ramesh Gupta', 'Male', '1965-06-30', '34 Oak Street', 'Illiterate'),
(6,6, 'Neha Joshi', 'Female', '2000-12-05', '123 Main Street', 'Graduate'),
(7,7, 'Arjun Das', 'Male', '1998-05-14', '78 Pine Drive', 'Graduate'),
(8,8, 'Pooja Mehta', 'Female', '1995-08-11', '90 Maple Lane', 'Post-Graduate'),
(9,7, 'Anil Yadav', 'Male', '2000-02-22', '456 Market Road', '10th'),
(10,6, 'Komal Tiwari', 'Female', '1987-03-09', '33 Cedar Way', 'Graduate'),
(11,5, 'Suresh Babu', 'Male', '1993-09-19', '11 Birch Street', 'Graduate'),
(12,4, 'Sneha Kapoor', 'Female', '1989-11-29', '22 Ash Drive', 'Post-Graduate'),
(13,3, 'Manoj Mishra', 'Male', '2024-04-12', '44 Cypress Lane', 'Illiterate'),
(14,1, 'Divya Jain', 'Female', '1991-07-25', '66 Spruce Way', 'Post-Graduate'),
(15,3, 'Vikram Singh', 'Male', '2024-10-15', '789 Park Avenue', 'Illiterate');


-- Table 2: households
INSERT INTO households (household_id, address, income) VALUES 
(1, '123 Main Street', 45000.00),
(2,  '456 Market Road', 60000.00),
(3,  '789 Park Avenue', 30000.00),
(4,  '12 Rose Lane', 80000.00),
(5,  '34 Oak Street', 25000.00),
(6,  '123 Main Street', 50000.00),
(7,  '78 Pine Drive', 70000.00),
(8,  '90 Maple Lane', 35000.00);


-- Table 3: land_records
INSERT INTO land_records (land_id, citizen_id, area_acres, crop_type) VALUES 
(1, 1, 1.5, 'Rice'),
(2, 2, 2.0, 'Wheat'),
(3, 3, 1.2, 'Sugarcane'),
(4, 4, 0.8, 'Corn'),
(5, 5, 1.8, 'Barley'),
(6, 6, 1.0, 'Soybean'),
(7, 7, 2.5, 'Rice'),
(8, 8, 3.0, 'Wheat'),
(9, 9, 0.7, 'Corn'),
(10, 10, 1.1, 'Rice'),
(11, 11, 1.6, 'Sugarcane'),
(12, 12, 2.2, 'Rice'),
(13, 13, 0.9, 'Corn'),
(14, 14, 1.3, 'Soybean'),
(15, 15, 1.7, 'Rice');

-- Table 4: panchayat_employees
INSERT INTO panchayat_employees (employee_id, citizen_id, role) VALUES 
(1, 3, 'Pradhan'),
(2, 6, 'Sarpanch'),
(3, 9, 'Panchayat Member'),
(4, 13, 'Panchayat Secretary'),
(5, 11, 'Panchayat Treasurer');

-- Table 5: assets
INSERT INTO assets (asset_id, type, location, installation_date) VALUES 
(1, 'Street Light', 'Phulera', '2024-06-15'),
(2, 'Water Pump', '456 Market Road', '2020-12-10'),
(3, 'Road', '789 Park Avenue', '2019-08-20'),
(4, 'Bridge', '12 Rose Lane', '2018-05-12'),
(5, 'Public Toilet', '34 Oak Street', '2022-01-18'),
(6, 'Community Center', '56 Palm Avenue', '2021-11-03'),
(7, 'Library', '78 Pine Drive', '2020-04-14'),
(8, 'Park', '90 Maple Lane', '2019-03-25'),
(9, 'Health Center', '21 Elm Road', '2021-09-10'),
(10, 'School', '33 Cedar Way', '2020-10-05'),
(11, 'Market Shed', '11 Birch Street', '2021-02-19'),
(12, 'Bus Stop', '22 Ash Drive', '2018-07-09'),
(13, 'Water Tank', '44 Cypress Lane', '2020-01-27'),
(14, 'Police Station', '66 Spruce Way', '2022-05-10'),
(15, 'Fire Station', '88 Redwood Avenue', '2021-03-13');

-- Table 6: welfare_schemes
INSERT INTO welfare_schemes (scheme_id, name, description) VALUES 
(1, 'Pension Scheme', 'Monthly pension for senior citizens'),
(2, 'Health Insurance', 'Affordable health insurance for all'),
(3, 'Education Grant', 'Grants for children education'),
(4, 'Farmer Subsidy', 'Subsidy for farmers on fertilizers'),
(5, 'Women Empowerment', 'Skill development programs for women'),
(6, 'Housing Scheme', 'Affordable housing for low-income families'),
(7, 'Unemployment Benefits', 'Financial aid for unemployed individuals'),
(8, 'Child Nutrition Program', 'Nutritional meals for children under 12'),
(9, 'Disaster Relief', 'Support for disaster-affected families'),
(10, 'Crop Insurance', 'Insurance for crop failures'),
(11, 'Startup Loans', 'Loans for new entrepreneurs'),
(12, 'Clean Water Initiative', 'Ensuring clean drinking water'),
(13, 'Sanitation Program', 'Improved sanitation facilities'),
(14, 'Elderly Care', 'Support for elderly citizens'),
(15, 'Skill Development', 'Training for employment opportunities');

-- Table 7: scheme_enrollments
INSERT INTO scheme_enrollments (enrollment_id, citizen_id, scheme_id, enrollment_date) VALUES 
(1, 1, 1, '2021-03-15'),
(2, 2, 2, '2020-07-10'),
(3, 3, 3, '2021-11-20'),
(4, 4, 4, '2021-05-18'),
(5, 5, 5, '2022-02-25'),
(6, 6, 6, '2020-12-15'),
(7, 7, 7, '2021-09-05'),
(8, 8, 8, '2019-06-30'),
(9, 9, 9, '2022-01-10'),
(10, 10, 10, '2021-07-15'),
(11, 11, 11, '2020-03-22'),
(12, 12, 12, '2019-05-25'),
(13, 13, 13, '2021-02-18'),
(14, 14, 14, '2022-06-10'),
(15, 15, 15, '2021-08-25');

-- Table 8: vaccinations
INSERT INTO vaccinations (vaccination_id, citizen_id, vaccine_type, date_administered) VALUES 
(1, 1, 'Covid-19', '2021-02-15'),
(2, 2, 'Polio', '2020-01-10'),
(3, 3, 'Hepatitis B', '2024-03-20'),
(4, 4, 'Covid-19', '2021-05-18'),
(5, 5, 'Typhoid', '2022-04-25'),
(6, 6, 'Dengue', '2020-11-30'),
(7, 7, 'Influenza', '2021-06-15'),
(8, 8, 'Covid-19', '2021-08-22'),
(9, 9, 'Measles', '2022-03-01'),
(10, 10, 'Tetanus', '2021-05-10'),
(11, 11, 'Hepatitis B', '2020-02-05'),
(12, 12, 'Typhoid', '2019-03-14'),
(13, 13, 'Covid-19', '2021-07-25'),
(14, 14, 'Dengue', '2022-01-15'),
(15, 15, 'Influenza', '2021-09-05');

-- Table 9: census_data
INSERT INTO census_data (household_id, event_date) VALUES 
(1, '2021-01-15'),
(2, '2021-02-10'),
(3, '2021-03-20'),
(4, '2021-04-18'),
(5, '2021-05-25'),
(6, '2021-06-15'),
(7, '2021-07-10'),
(8, '2021-08-20');

-- Table 10: citizen_income
INSERT INTO citizen_income (income_id, citizen_id, income_amount, income_source, income_date) VALUES 
(1, 1, 45000.00, 'Job', '2021-01-15'),
(2, 2, 60000.00, 'Business', '2021-02-10'),
(3, 3, 30000.00, 'Farming', '2021-03-20'),
(4, 4, 80000.00, 'Job', '2021-04-18'),
(5, 5, 25000.00, 'Farming', '2021-05-25'),
(6, 6, 50000.00, 'Job', '2021-06-15'),
(7, 7, 70000.00, 'Business', '2021-07-10'),
(8, 8, 35000.00, 'Farming', '2021-08-20'),
(9, 9, 40000.00, 'Job', '2021-09-05'),
(10, 10, 55000.00, 'Business', '2021-10-15'),
(11, 11, 65000.00, 'Job', '2021-11-25'),
(12, 12, 60000.00, 'Business', '2021-12-20'),
(13, 13, 35000.00, 'Farming', '2022-01-05'),
(14, 14, 72000.00, 'Job', '2022-02-15'),
(15, 15, 47000.00, 'Farming', '2022-03-10');

-- Table 11: citizen_taxes
INSERT INTO citizen_taxes (tax_id, income_id, tax_amount, tax_type, payment_date, tax_status) VALUES 
(1, 1, 4500.00, 'Income Tax', '2021-02-15', 'Paid'),
(2, 2, 6000.00, 'Income Tax', '2021-03-10', 'Paid'),
(3, 3, 3000.00, 'Income Tax', '2021-04-20', 'Paid'),
(4, 4, 8000.00, 'Income Tax', '2021-05-18', 'Paid'),
(5, 5, 2500.00, 'Income Tax', '2021-06-25', 'Paid'),
(6, 6, 5000.00, 'Income Tax', '2021-07-15', 'Paid'),
(7, 7, 7000.00, 'Income Tax', '2021-08-10', 'Paid'),
(8, 8, 3500.00, 'Income Tax', '2021-09-20', 'Paid'),
(9, 9, 4000.00, 'Income Tax', '2021-10-05', 'Paid'),
(10, 10, 5500.00, 'Income Tax', '2021-11-15', 'Paid'),
(11, 11, 6500.00, 'Income Tax', '2021-12-25', 'Paid'),
(12, 12, 6000.00, 'Income Tax', '2022-01-20', 'Paid'),
(13, 13, 3500.00, 'Income Tax', '2022-02-05', 'Paid'),
(14, 14, 7200.00, 'Income Tax', '2022-03-15', 'Paid'),
(15, 15, 4700.00, 'Income Tax', '2022-04-10', 'Paid');



-- Table 12: citizen_services
INSERT INTO citizen_services (service_id, citizen_id, service_type, request_date, status) VALUES 
(1, 1, 'Health Insurance', '2021-03-10', 'Approved'),
(2, 2, 'Pension Scheme', '2021-02-12', 'Pending'),
(3, 3, 'Education Grant', '2021-05-20', 'Approved'),
(4, 4, 'Farmer Subsidy', '2021-06-18', 'Approved'),
(5, 5, 'Birth Certificate', '2021-08-22', 'Pending'),
(6, 6, 'Housing Scheme', '2021-07-05', 'Approved'),
(7, 7, 'Marriage Certificate', '2021-09-30', 'Pending'),
(8, 8, 'Birth Certificate', '2021-10-12', 'Approved'),
(9, 9, 'Crop Insurance', '2021-11-15', 'Pending'),
(10, 10, 'Startup Loans', '2022-01-22', 'Approved'),
(11, 11, 'Divorce Certificate', '2021-06-10', 'Approved'),
(12, 12, 'Divorce Certificate', '2021-04-17', 'Pending'),
(13, 13, 'Elderly Care', '2021-12-01', 'Approved'),
(14, 14, 'Skill Development', '2022-02-05', 'Pending'),
(15, 15, 'Health Insurance', '2022-03-20', 'Approved');

-- Table 13: agriculture_data
INSERT INTO agriculture_data (data_id, land_id, crop_type, area_acres, yield_quantity, harvest_date) VALUES 
(1, 1, 'Wheat', 10.5, 120.0, '2021-06-15'),
(2, 2, 'Rice', 5.0, 80.0, '2021-07-10'),
(3, 3, 'Maize', 7.2, 95.5, '2021-08-05'),
(4, 4, 'Sugarcane', 12.0, 150.0, '2021-09-25'),
(5, 5, 'Cotton', 6.8, 60.0, '2021-10-20'),
(6, 6, 'Rice', 8.0, 100.0, '2021-11-15'),
(7, 7, 'Barley', 4.5, 55.0, '2021-12-10'),
(8, 8, 'Wheat', 9.0, 110.0, '2022-01-05'),
(9, 9, 'Maize', 10.0, 125.0, '2022-02-15'),
(10, 10, 'Sugarcane', 15.0, 180.0, '2022-03-25'),
(11, 11, 'Cotton', 7.0, 65.0, '2022-04-10'),
(12, 12, 'Rice', 5.5, 85.0, '2022-05-05'),
(13, 13, 'Barley', 6.0, 70.0, '2022-06-15'),
(14, 14, 'Wheat', 8.5, 100.0, '2022-07-10'),
(15, 15, 'Maize', 9.5, 115.0, '2022-08-20');

-- Table 14: environment_data
INSERT INTO environment_data (data_id, location, event_type, event_date, impact) VALUES 
(1, 'Lakeview', 'Flood', '2021-05-20', 'Severe crop damage'),
(2, 'Greenhill', 'Storm', '2021-06-25', 'Damaged infrastructure'),
(3, 'Sunnydale', 'Earthquake', '2021-07-10', 'Property destruction'),
(4, 'Riverside', 'Drought', '2021-08-15', 'Water shortage'),
(5, 'Westend', 'Flood', '2021-09-05', 'Soil erosion'),
(6, 'Mountainview', 'Storm', '2021-10-12', 'Fallen trees'),
(7, 'Lakeside', 'Heatwave', '2021-11-18', 'Health risks'),
(8, 'Parkland', 'Flood', '2022-01-15', 'Crop failure'),
(9, 'Clearwater', 'Earthquake', '2022-02-25', 'Loss of life'),
(10, 'Highland', 'Drought', '2022-03-30', 'Water scarcity'),
(11, 'Silverwood', 'Storm', '2022-04-05', 'Power outage'),
(12, 'Riverbend', 'Heatwave', '2022-05-10', 'Wildfires'),
(13, 'Sunnymeadow', 'Flood', '2022-06-18', 'Infrastructure damage'),
(14, 'Oaksview', 'Earthquake', '2022-07-22', 'Building collapse'),
(15, 'Redwood', 'Drought', '2022-08-02', 'Crop loss');

-- Table 15: panchayat_expenditure
INSERT INTO panchayat_expenditure (expenditure_id, panchayat_employee_id, expenditure_type, amount, expenditure_date) VALUES 
(1, 1, 'Infrastructure Development', 15000.00, '2021-06-10'),
(2, 2, 'Health Programs', 8000.00, '2021-07-05'),
(3, 3, 'Education Grants', 12000.00, '2021-08-20'),
(4, 4, 'Disaster Relief', 5000.00, '2021-09-25'),
(5, 5, 'Farm Subsidy', 10000.00, '2021-10-15'),
(6, 5, 'Public Welfare', 7000.00, '2021-11-30'),
(7, 4, 'Water Supply', 4000.00, '2021-12-20'),
(8, 3, 'Road Maintenance', 6000.00, '2022-01-10'),
(9, 2, 'Healthcare Services', 15000.00, '2022-02-05'),
(10, 3, 'Employment Programs', 8000.00, '2022-03-15'),
(11, 4, 'Clean Energy', 10000.00, '2022-04-25'),
(12, 5, 'Community Centers', 7000.00, '2022-05-05'),
(13, 1, 'Public Amenities', 5000.00, '2022-06-10'),
(14, 1, 'Security Programs', 12000.00, '2022-07-20'),
(15, 2, 'Agriculture Support', 9000.00, '2022-08-15');


SELECT c.name
FROM citizens c
JOIN land_records l ON c.citizen_id = l.citizen_id
WHERE l.area_acres > 1;

SELECT c.name
FROM citizens c
JOIN households h ON c.household_id = h.household_id
WHERE c.gender = 'Female' AND h.income < 100000;

SELECT SUM(l.area_acres) AS total_rice_land
FROM land_records l
WHERE l.crop_type = 'Rice';

SELECT COUNT(*) AS citizen_count
FROM citizens
WHERE dob > '2000-01-01' AND educational_qualification = '10th' ;

SELECT c.name
FROM panchayat_employees p
JOIN citizens c ON p.citizen_id = c.citizen_id
JOIN land_records l ON c.citizen_id = l.citizen_id
WHERE l.area_acres > 1;


SELECT c.name AS Pradhan_family
FROM citizens c
JOIN households h ON c.household_id = h.household_id
WHERE c.household_id = (
    SELECT c.household_id
    FROM citizens c
    JOIN panchayat_employees p ON c.citizen_id = p.citizen_id
    WHERE p.role = 'Pradhan'
);


SELECT COUNT(*) AS total_street_lights_in2024
FROM assets
WHERE type = 'Street Light' AND location = 'Phulera' AND EXTRACT(YEAR FROM installation_date) = 2024;

SELECT COUNT(*) AS total_vaccinations
FROM vaccinations v
JOIN citizens c ON v.citizen_id = c.citizen_id
WHERE c.educational_qualification = '10th' AND EXTRACT(YEAR FROM v.date_administered) = 2024;

SELECT COUNT(*) AS boy_births
FROM citizens
WHERE gender = 'Male' AND EXTRACT(YEAR FROM dob) = 2024;

SELECT COUNT(DISTINCT c.citizen_id) AS citizens_in_panchayat_households
FROM citizens c
JOIN households h ON c.household_id = h.household_id
WHERE h.household_id IN (
    SELECT DISTINCT c2.household_id
    FROM citizens c2
    JOIN panchayat_employees p ON c2.citizen_id = p.citizen_id
);








