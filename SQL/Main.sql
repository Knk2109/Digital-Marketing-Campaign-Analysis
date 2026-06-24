#DIMENSION TABLES
create table dim_channel (
	channel_id INT PRIMARY KEY AUTO_INCREMENT,
    channel_name VARCHAR(100) UNIQUE
);

create table dim_country (
	country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(100) UNIQUE
);

create table dim_gender (
	gender_id INT PRIMARY KEY AUTO_INCREMENT,
    gender_name VARCHAR(100) UNIQUE
);

create table age (
	age_id INT PRIMARY KEY AUTO_INCREMENT,
    age_group VARCHAR(100) UNIQUE
);

create table interest (
	interest_id INT PRIMARY KEY AUTO_INCREMENT,
    interest_name VARCHAR(255) UNIQUE
);

create table dim_date (
	date_id INT PRIMARY KEY AUTO_INCREMENT,
    full_date DATE,
    year INT,
    quarter INT,
    month INT,
    month_name VARCHAR(20)
);

CREATE TABLE dim_event (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    event_name VARCHAR(100) UNIQUE
);

CREATE TABLE dim_landing_page (
    landing_page_id INT PRIMARY KEY AUTO_INCREMENT,
    landing_page_url VARCHAR(255) UNIQUE
);

#FACT Tables

CREATE TABLE fact_user_acquisition (
    acquisition_id INT PRIMARY KEY AUTO_INCREMENT,
    channel_id INT,
    users INT,
    new_users INT,
    engaged_sessions INT,
    engagement_rate DECIMAL(5,2),
    total_revenue DECIMAL(12,2),

    FOREIGN KEY (channel_id)
        REFERENCES dim_channel(channel_id)
);

CREATE TABLE fact_traffic_acquisition (
    traffic_id INT PRIMARY KEY AUTO_INCREMENT,
    channel_id INT,
    sessions INT,
    engaged_sessions INT,
    engagement_rate DECIMAL(5,2),
    revenue DECIMAL(12,2),

    FOREIGN KEY (channel_id)
        REFERENCES dim_channel(channel_id)
);

CREATE TABLE fact_audience (
    audience_id INT PRIMARY KEY AUTO_INCREMENT,

    gender_id INT,
    age_id INT,
    interest_id INT,

    users INT,
    sessions INT,
    revenue DECIMAL(12,2),

    FOREIGN KEY (gender_id)
        REFERENCES dim_gender(gender_id),

    FOREIGN KEY (age_id)
        REFERENCES dim_age(age_id),

    FOREIGN KEY (interest_id)
        REFERENCES dim_interest(interest_id)
);

RENAME TABLE age to dim_age;
RENAME TABLE interest to dim_interest;

CREATE TABLE fact_country_performance (
    performance_id INT PRIMARY KEY AUTO_INCREMENT,
    country_id INT,
    users INT,
    revenue DECIMAL(12,2),

    FOREIGN KEY (country_id)
        REFERENCES dim_country(country_id)
);

CREATE TABLE fact_landing_page (
    landing_page_fact_id INT PRIMARY KEY AUTO_INCREMENT,
    date_id INT,
    channel_id INT,
    landing_page_id INT,
    sessions INT,
    users INT,
    new_users INT,
    avg_engagement_time DECIMAL(10,2),
    key_events INT,
    revenue DECIMAL(12,2),

    FOREIGN KEY (date_id)
        REFERENCES dim_date(date_id),

    FOREIGN KEY (channel_id)
        REFERENCES dim_channel(channel_id),

    FOREIGN KEY (landing_page_id)
        REFERENCES dim_landing_page(landing_page_id)
);

CREATE TABLE fact_events (
    event_fact_id INT PRIMARY KEY AUTO_INCREMENT,
    date_id INT,
    event_id INT,
    total_users INT,
    event_count INT,
    event_count_per_user DECIMAL(10,2),
    revenue DECIMAL(12,2),

    FOREIGN KEY (date_id)
        REFERENCES dim_date(date_id),

    FOREIGN KEY (event_id)
        REFERENCES dim_event(event_id)
);

SHOW CREATE TABLE fact_user_acquisition;
SHOW CREATE TABLE fact_traffic_acquisition;
SHOW CREATE TABLE fact_landing_page;
SHOW CREATE TABLE fact_events;
SHOW CREATE TABLE fact_audience;

ALTER TABLE fact_landing_page
DROP FOREIGN KEY fact_landing_page_ibfk_1;

ALTER TABLE fact_landing_page
DROP COLUMN date_id;

ALTER TABLE fact_events
DROP FOREIGN KEY fact_events_ibfk_1;

ALTER TABLE fact_events
DROP COLUMN date_id;

DESCRIBE fact_user_acquisition;
DESCRIBE fact_traffic_acquisition;
DESCRIBE fact_landing_page;
DESCRIBE fact_events;
DESCRIBE fact_country_performance;
DESCRIBE fact_audience;

DROP TABLE dim_date;

DESCRIBE useracquisition;

ALTER TABLE useracquisition
RENAME COLUMN MyUnknownColumn TO channel_id;

ALTER TABLE useracquisition
RENAME COLUMN `First user primary channel group (Default Channel Group)`
TO channel_name;

ALTER TABLE useracquisition
RENAME COLUMN `Total revenue`
TO total_revenue;

ALTER TABLE useracquisition
RENAME COLUMN `Engagement rate`
TO engagement_rate;

ALTER TABLE trafficacquisition
RENAME COLUMN `Session primary channel group`
TO channel_name;

ALTER TABLE trafficacquisition
RENAME COLUMN MyUnknownColumn TO channel_id;

ALTER TABLE events
RENAME COLUMN `Event name` TO event_name;

ALTER TABLE events
RENAME COLUMN `Event count per user`
TO event_count_per_user;

SELECT *
FROM events;

ALTER TABLE events
DROP COLUMN MyUnknownColumn,
DROP COLUMN `MyUnknownColumn_[0]`,
DROP COLUMN `MyUnknownColumn_[1]`,
DROP COLUMN `MyUnknownColumn_[2]`,
DROP COLUMN `MyUnknownColumn_[3]`,
DROP COLUMN `MyUnknownColumn_[4]`,
DROP COLUMN `MyUnknownColumn_[5]`,
DROP COLUMN `MyUnknownColumn_[6]`,
DROP COLUMN `MyUnknownColumn_[7]`,
DROP COLUMN `MyUnknownColumn_[8]`,
DROP COLUMN `MyUnknownColumn_[9]`,
DROP COLUMN `MyUnknownColumn_[10]`,
DROP COLUMN `MyUnknownColumn_[11]`,
DROP COLUMN `MyUnknownColumn_[12]`,
DROP COLUMN `MyUnknownColumn_[13]`,
DROP COLUMN `MyUnknownColumn_[14]`,
DROP COLUMN `MyUnknownColumn_[15]`,
DROP COLUMN `MyUnknownColumn_[16]`,
DROP COLUMN `MyUnknownColumn_[17]`,
DROP COLUMN `MyUnknownColumn_[18]`,
DROP COLUMN `MyUnknownColumn_[19]`;

ALTER TABLE landingpage
RENAME COLUMN `Landing page`
TO landing_page;

DESCRIBE demographic_gender;
SELECT *
FROM demographic_gender;

ALTER TABLE demographic_gender
DROP COLUMN MyUnknownColumn,
DROP COLUMN `MyUnknownColumn_[0]`,
DROP COLUMN `MyUnknownColumn_[1]`,
DROP COLUMN `MyUnknownColumn_[2]`,
DROP COLUMN `MyUnknownColumn_[3]`,
DROP COLUMN `MyUnknownColumn_[4]`,
DROP COLUMN `MyUnknownColumn_[5]`,
DROP COLUMN `MyUnknownColumn_[6]`,
DROP COLUMN `MyUnknownColumn_[7]`,
DROP COLUMN `MyUnknownColumn_[8]`,
DROP COLUMN `MyUnknownColumn_[9]`,
DROP COLUMN `MyUnknownColumn_[10]`,
DROP COLUMN `MyUnknownColumn_[11]`,
DROP COLUMN `MyUnknownColumn_[12]`,
DROP COLUMN `MyUnknownColumn_[13]`,
DROP COLUMN `MyUnknownColumn_[14]`;

SELECT *
FROM demographic_age;

ALTER TABLE demographic_age
DROP COLUMN MyUnknownColumn,
DROP COLUMN `MyUnknownColumn_[0]`,
DROP COLUMN `MyUnknownColumn_[1]`,
DROP COLUMN `MyUnknownColumn_[2]`,
DROP COLUMN `MyUnknownColumn_[3]`,
DROP COLUMN `MyUnknownColumn_[4]`,
DROP COLUMN `MyUnknownColumn_[5]`,
DROP COLUMN `MyUnknownColumn_[6]`,
DROP COLUMN `MyUnknownColumn_[7]`,
DROP COLUMN `MyUnknownColumn_[8]`,
DROP COLUMN `MyUnknownColumn_[9]`,
DROP COLUMN `MyUnknownColumn_[10]`,
DROP COLUMN `MyUnknownColumn_[11]`,
DROP COLUMN `MyUnknownColumn_[12]`,
DROP COLUMN `MyUnknownColumn_[13]`,
DROP COLUMN `MyUnknownColumn_[14]`;

SELECT *
FROM demographic_country;

ALTER TABLE demographic_country
DROP COLUMN MyUnknownColumn,
DROP COLUMN `MyUnknownColumn_[0]`,
DROP COLUMN `MyUnknownColumn_[1]`,
DROP COLUMN `MyUnknownColumn_[2]`,
DROP COLUMN `MyUnknownColumn_[3]`,
DROP COLUMN `MyUnknownColumn_[4]`,
DROP COLUMN `MyUnknownColumn_[5]`,
DROP COLUMN `MyUnknownColumn_[6]`,
DROP COLUMN `MyUnknownColumn_[7]`,
DROP COLUMN `MyUnknownColumn_[8]`,
DROP COLUMN `MyUnknownColumn_[9]`,
DROP COLUMN `MyUnknownColumn_[10]`,
DROP COLUMN `MyUnknownColumn_[11]`,
DROP COLUMN `MyUnknownColumn_[12]`,
DROP COLUMN `MyUnknownColumn_[13]`,
DROP COLUMN `MyUnknownColumn_[14]`;

SELECT *
FROM demographic_interests;

ALTER TABLE demographic_interests
DROP COLUMN MyUnknownColumn,
DROP COLUMN `MyUnknownColumn_[0]`,
DROP COLUMN `MyUnknownColumn_[1]`,
DROP COLUMN `MyUnknownColumn_[2]`,
DROP COLUMN `MyUnknownColumn_[3]`,
DROP COLUMN `MyUnknownColumn_[4]`,
DROP COLUMN `MyUnknownColumn_[5]`,
DROP COLUMN `MyUnknownColumn_[6]`,
DROP COLUMN `MyUnknownColumn_[7]`,
DROP COLUMN `MyUnknownColumn_[8]`,
DROP COLUMN `MyUnknownColumn_[9]`,
DROP COLUMN `MyUnknownColumn_[10]`,
DROP COLUMN `MyUnknownColumn_[11]`,
DROP COLUMN `MyUnknownColumn_[12]`,
DROP COLUMN `MyUnknownColumn_[13]`,
DROP COLUMN `MyUnknownColumn_[14]`;

ALTER TABLE demographic_interests
RENAME COLUMN `Interests` TO interest_name;

ALTER TABLE demographic_age
RENAME COLUMN `Age` TO age_group;

ALTER TABLE demographic_gender
RENAME COLUMN `Gender`
TO gender;

DELETE FROM demographic_gender 
WHERE gender = 'Gender';

