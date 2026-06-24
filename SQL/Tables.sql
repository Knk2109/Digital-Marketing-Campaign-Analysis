
#DIMENSION TABLES
create table dim_channel (
	channel_id INT PRIMARY KEY AUTO_INCREMENT,
    channel_name VARCHAR(100) UNIQUE
);

alter table dim_channel
modify channel_name varchar(255);

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


#Load Dimension Table

INSERT INTO dim_channel (channel_name)
SELECT DISTINCT channel_name
FROM (
    SELECT channel_name FROM useracquisition
    UNION
    SELECT channel_name FROM trafficacquisition
 ) AS channels;

SELECT channel_name, LENGTH(channel_name) 
FROM landingpage 
ORDER BY LENGTH(channel_name) DESC 
LIMIT 5;

select *
from dim_landing_page;

INSERT INTO dim_landing_page (landing_page_url)
SELECT DISTINCT landing_page
FROM landingpage
WHERE landing_page IS NOT NULL;

ALTER TABLE dim_landing_page
DROP INDEX landing_page_url;

ALTER TABLE dim_landing_page 
MODIFY COLUMN landing_page_url VARCHAR(1000);

INSERT INTO dim_country (country_name)
SELECT DISTINCT country
FROM demographic_country
WHERE country IS NOT NULL;

INSERT INTO dim_gender (gender_name)
SELECT DISTINCT gender
FROM demographic_gender
WHERE gender IS NOT NULL;

INSERT INTO dim_age (age_group)
SELECT DISTINCT age_group
FROM demographic_age
WHERE age_group IS NOT NULL;

INSERT INTO dim_interest (interest_name)
SELECT DISTINCT interest_name
FROM demographic_interests
WHERE interest_name IS NOT NULL;

INSERT INTO dim_event (event_name)
SELECT DISTINCT event_name
FROM events
WHERE event_name IS NOT NULL;

#Load Fact_User_acquistion table

INSERT INTO fact_user_acquisition (
    channel_id,
    users,
    new_users,
    engaged_sessions,
    engagement_rate,
    total_revenue
)
SELECT
    dc.channel_id,
    ua.users,
    ua.new_users,
    ua.engaged_sessions,
    ua.engagement_rate,
    ua.total_revenue
FROM useracquisition ua
JOIN dim_channel dc
ON ua.channel_name = dc.channel_name;

select *
from fact_user_acquisition;

TRUNCATE TABLE fact_user_acquisition;

SELECT COUNT(*)
FROM fact_user_acquisition;

SELECT *
FROM fact_user_acquisition;

SELECT COUNT(*)
FROM useracquisition;

SELECT ua.channel_name
FROM useracquisition ua
LEFT JOIN dim_channel dc
ON ua.channel_name = dc.channel_name
WHERE dc.channel_id IS NULL;

#Load Fact_landing_page

INSERT INTO fact_landing_page (
    landing_page_id,
    sessions,
    users,
    new_users,
    avg_engagement_time,
    key_events,
    revenue
)
SELECT
    dlp.landing_page_id,
    rlp.sessions,
    rlp.users,
    rlp.new_users,
    rlp.average_engagement_time,
    rlp.key_events,
    rlp.total_revenue
FROM landingpage rlp
JOIN dim_landing_page dlp
ON rlp.landing_page = dlp.landing_page_url;

select *
from fact_landing_page;

select *
from dim_landing_page;

DESCRIBE landingpage;

SHOW CREATE TABLE fact_landing_page;

ALTER TABLE fact_landing_page
DROP FOREIGN KEY fact_landing_page_ibfk_2;

ALTER TABLE fact_landing_page
DROP COLUMN channel_id;

DESCRIBE fact_landing_page;


DESCRIBE useracquisition;

DESCRIBE trafficacquisition;

DESCRIBE landingpage;

DESCRIBE events;

DESCRIBE audience;

DESCRIBE demographic_age;

DESCRIBE demographic_country;

DESCRIBE demographic_gender;

DESCRIBE demographic_interests;

DESCRIBE fact_user_acquisition;

DESCRIBE dim_channel;

DESCRIBE fact_traffic_acquisition;

#Load Fact Traffic Acquistion table

INSERT INTO fact_traffic_acquisition (
    channel_id,
    sessions,
    engaged_sessions,
    engagement_rate,
    revenue
)
SELECT
    dc.channel_id,
    ta.sessions,
    ta.engaged_sessions,
    ta.engagement_rate,
    ta.total_revenue
FROM trafficacquisition ta
JOIN dim_channel dc
ON ta.channel_name = dc.channel_name;

SELECT COUNT(*)
FROM trafficacquisition;

select *
from fact_traffic_acquisition;

select *
from dim_channel;

SELECT ta.channel_name
FROM trafficacquisition ta
LEFT JOIN dim_channel dc
ON ta.channel_name = dc.channel_name
WHERE dc.channel_id IS NULL;

DESCRIBE fact_events;

DESCRIBE dim_event;

select *
from dim_event;

select count(*)
from events;

INSERT INTO dim_event (event_name)
SELECT DISTINCT event_name
FROM events
WHERE event_name IS NOT NULL;


#Load Fact Events table

INSERT INTO fact_events (
    event_id, 
    total_users, 
    event_count, 
    event_count_per_user, 
    revenue
)
SELECT 
    d.event_id,
    r.total_users,
    r.event_count,
    r.event_count_per_user,
    r.total_revenue -- maps your raw column 'total_revenue' to 'revenue'
FROM events r
JOIN dim_event d 
    ON r.event_name = d.event_name;
    
select *
from fact_events;

select *
from fact_audience;

describe fact_audience;

describe fact_country_performance;

drop table fact_audience;

CREATE TABLE fact_age (
    age_fact_id INT PRIMARY KEY AUTO_INCREMENT,
    age_id INT,
    users INT,
    new_users INT,
    engaged_sessions INT,
    engagement_rate DECIMAL(5,2),
    engaged_sessions_per_user DECIMAL(10,2),
    average_engagement_time INT,
    event_count INT,
    key_events INT,
    total_revenue DECIMAL(12,2),

    FOREIGN KEY (age_id)
        REFERENCES dim_age(age_id)
);

CREATE TABLE fact_gender (
    gender_fact_id INT PRIMARY KEY AUTO_INCREMENT,
    gender_id INT,
    users INT,
    new_users INT,
    engaged_sessions INT,
    engagement_rate DECIMAL(5,2),
    engaged_sessions_per_user DECIMAL(10,2),
    average_engagement_time INT,
    event_count INT,
    key_events INT,
    total_revenue DECIMAL(12,2),

    FOREIGN KEY (gender_id)
        REFERENCES dim_gender(gender_id)
);

CREATE TABLE fact_interest (
    interest_fact_id INT PRIMARY KEY AUTO_INCREMENT,
    interest_id INT,
    users INT,
    new_users INT,
    engaged_sessions INT,
    engagement_rate DECIMAL(5,2),
    engaged_sessions_per_user DECIMAL(10,2),
    average_engagement_time INT,
    event_count INT,
    key_events INT,
    total_revenue DECIMAL(12,2),

    FOREIGN KEY (interest_id)
        REFERENCES dim_interest(interest_id)
);

describe dim_country;

select *
from dim_age;

select *
from dim_country;

select *
from dim_gender;

select *
from dim_interest;

INSERT INTO fact_country_performance (
    country_id,
    users,
    revenue
)
SELECT
    dc.country_id,
    dcp.users,
    dcp.total_revenue
FROM demographic_country dcp
JOIN dim_country dc
ON dcp.country = dc.country_name;

SELECT COUNT(*) FROM demographic_country;
SELECT COUNT(*) FROM fact_country_performance;

INSERT INTO fact_age (
    age_id,
    users,
    new_users,
    engaged_sessions,
    engagement_rate,
    engaged_sessions_per_user,
    average_engagement_time,
    event_count,
    key_events,
    total_revenue
)
SELECT
    da.age_id,
    a.users,
    a.new_users,
    a.engaged_sessions,
    a.engagement_rate,
    a.engaged_sessions_per_user,
    a.average_engagement_time,
    a.event_count,
    a.key_events,
    a.total_revenue
FROM demographic_age a
JOIN dim_age da
ON a.age_group = da.age_group;

SELECT COUNT(*) FROM demographic_age;
SELECT COUNT(*) FROM fact_age;

INSERT INTO fact_gender (
    gender_id,
    users,
    new_users,
    engaged_sessions,
    engagement_rate,
    engaged_sessions_per_user,
    average_engagement_time,
    event_count,
    key_events,
    total_revenue
)
SELECT
    dg.gender_id,
    g.users,
    g.new_users,
    g.engaged_sessions,
    g.engagement_rate,
    g.engaged_sessions_per_user,
    g.average_engagement_time,
    g.event_count,
    g.key_events,
    g.total_revenue
FROM demographic_gender g
JOIN dim_gender dg
ON g.gender = dg.gender_name;

SELECT COUNT(*) FROM demographic_gender;
SELECT COUNT(*) FROM fact_gender;

INSERT INTO fact_interest (
    interest_id,
    users,
    new_users,
    engaged_sessions,
    engagement_rate,
    engaged_sessions_per_user,
    average_engagement_time,
    event_count,
    key_events,
    total_revenue
)
SELECT
    di.interest_id,
    i.users,
    i.new_users,
    i.engaged_sessions,
    i.engagement_rate,
    i.engaged_sessions_per_user,
    i.average_engagement_time,
    i.event_count,
    i.key_events,
    i.total_revenue
FROM demographic_interests i
JOIN dim_interest di
ON i.interest_name = di.interest_name;

SELECT COUNT(*) FROM demographic_interests;
SELECT COUNT(*) FROM fact_interest;

SELECT COUNT(*) FROM fact_user_acquisition;
SELECT COUNT(*) FROM fact_traffic_acquisition;
SELECT COUNT(*) FROM fact_landing_page;
SELECT COUNT(*) FROM fact_events;
SELECT COUNT(*) FROM fact_country_performance;
SELECT COUNT(*) FROM fact_age;
SELECT COUNT(*) FROM fact_gender;
SELECT COUNT(*) FROM fact_interest;

describe useracquisition;
describe fact_user_acquisition;

alter table fact_user_acquisition
add column cost decimal(10,2),
add column impressions int,
add column event_count int,
add column key_events int;

update fact_user_acquisition fua
join dim_channel dc
on fua.channel_id = dc.channel_id
join useracquisition ua
on dc.channel_name = ua.channel_name
set
	fua.cost = ua.cost,
    fua.impressions = ua.impressions,
    fua.event_count = ua.event_count,
    fua.key_events = ua.key_events;

select *
from fact_user_acquisition;

select *
from useracquisition;

SELECT *
FROM dim_channel;

SELECT
    fua.channel_id,
    dc.channel_name
FROM fact_user_acquisition fua
JOIN dim_channel dc
ON fua.channel_id = dc.channel_id;

SELECT
    SUM(cost) AS total_cost,
    SUM(impressions) AS total_impressions,
    SUM(key_events) AS total_conversions,
    SUM(total_revenue) AS total_revenue
FROM fact_user_acquisition;

SELECT
    channel_name,
    impressions,
    event_count,
    key_events
FROM useracquisition;