# Cleaning and Standardisation

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
RENAME COLUMN `Gender` TO gender;

DELETE FROM demographic_gender 
WHERE gender = 'Gender';

SELECT *
FROM demographic_gender;

SELECT * FROM demographic_gender 
WHERE gender = 'Gender' OR gender IS NULL OR gender = '';

DELETE FROM demographic_gender 
WHERE gender IS NULL OR gender = '';

ALTER TABLE demographic_country
RENAME COLUMN `Country`
TO country;

SELECT Country
FROM demographic_country;

SELECT *
FROM audience;

ALTER TABLE audience
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
DROP COLUMN `MyUnknownColumn_[17]`;

ALTER TABLE landingpage
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
DROP COLUMN `MyUnknownColumn_[17]`;

ALTER TABLE audience
RENAME COLUMN `Audience name` TO user_group;

SELECT *
FROM audience;

ALTER TABLE audience
RENAME COLUMN `Total revenue` TO total_revenue;

ALTER TABLE audience
RENAME COLUMN `New users` TO new_users;

ALTER TABLE audience
RENAME COLUMN `Views per session` TO views_per_session;

ALTER TABLE audience
RENAME COLUMN `Average session duration` TO average_session_duration;


ALTER TABLE demographic_country
RENAME COLUMN `New users` TO new_users;

ALTER TABLE demographic_country
RENAME COLUMN `Engaged sessions` TO engaged_sessions;

ALTER TABLE demographic_country
RENAME COLUMN `Engagement rate` TO engagement_rate;

ALTER TABLE demographic_country
RENAME COLUMN `Engaged sessions per user` TO engaged_sessions_per_user;

ALTER TABLE demographic_country
RENAME COLUMN `Average engagement time` TO average_engagement_time;

ALTER TABLE demographic_country
RENAME COLUMN `Event count` TO event_count;

ALTER TABLE demographic_country
RENAME COLUMN `Key events` TO key_events;

ALTER TABLE demographic_country
RENAME COLUMN `Total revenue` TO total_revenue;


ALTER TABLE demographic_gender
RENAME COLUMN `New users` TO new_users;

ALTER TABLE demographic_gender
RENAME COLUMN `Engaged sessions` TO engaged_sessions;

ALTER TABLE demographic_gender
RENAME COLUMN `Engagement rate` TO engagement_rate;

ALTER TABLE demographic_gender
RENAME COLUMN `Engaged sessions per user` TO engaged_sessions_per_user;

ALTER TABLE demographic_gender
RENAME COLUMN `Average engagement time` TO average_engagement_time;

ALTER TABLE demographic_gender
RENAME COLUMN `Event count` TO event_count;

ALTER TABLE demographic_gender
RENAME COLUMN `Key events` TO key_events;

ALTER TABLE demographic_gender
RENAME COLUMN `Total revenue` TO total_revenue;


ALTER TABLE demographic_interests
RENAME COLUMN `New users` TO new_users;

ALTER TABLE demographic_interests
RENAME COLUMN `Engaged sessions` TO engaged_sessions;

ALTER TABLE demographic_interests
RENAME COLUMN `Engagement rate` TO engagement_rate;

ALTER TABLE demographic_interests
RENAME COLUMN `Engaged sessions per user` TO engaged_sessions_per_user;

ALTER TABLE demographic_interests
RENAME COLUMN `Average engagement time` TO average_engagement_time;

ALTER TABLE demographic_interests
RENAME COLUMN `Event count` TO event_count;

ALTER TABLE demographic_interests
RENAME COLUMN `Key events` TO key_events;

ALTER TABLE demographic_interests
RENAME COLUMN `Total revenue` TO total_revenue;


ALTER TABLE events
RENAME COLUMN `Event count` TO event_count;

ALTER TABLE events
RENAME COLUMN `Total users` TO total_users;

ALTER TABLE events
RENAME COLUMN `Total revenue` TO total_revenue;

ALTER TABLE landingpage
RENAME COLUMN `Total revenue` TO total_revenue;

ALTER TABLE landingpage
RENAME COLUMN `landing_page` TO channel_name;

ALTER TABLE landingpage
RENAME COLUMN `Key eventsAll eventsAll eventsarrow_drop_down` TO key_events;

ALTER TABLE landingpage
RENAME COLUMN `Average engagement time per session` TO average_engagement_time;

ALTER TABLE landingpage
RENAME COLUMN `New users` TO new_users;


ALTER TABLE trafficacquisition
RENAME COLUMN `Engaged sessions` TO engaged_sessions;

ALTER TABLE trafficacquisition
RENAME COLUMN average_engagement_time_per_session TO average_engagement_time;

ALTER TABLE trafficacquisition
RENAME COLUMN `Engagement rate` TO engagement_rate;

ALTER TABLE trafficacquisition
RENAME COLUMN `Engaged sessions per user` TO engaged_sessions_per_user;

ALTER TABLE trafficacquisition
RENAME COLUMN `Events per session` TO events_per_session;

ALTER TABLE trafficacquisition
RENAME COLUMN `Event count` TO event_count;

ALTER TABLE trafficacquisition
RENAME COLUMN `Key events` TO key_events;

ALTER TABLE trafficacquisition
RENAME COLUMN `Total revenue` TO total_revenue;

ALTER TABLE useracquisition
RENAME COLUMN `New users` TO new_users;

ALTER TABLE useracquisition
RENAME COLUMN `Engaged sessions` TO engaged_sessions;

ALTER TABLE useracquisition
RENAME COLUMN `Engaged sessions per user` TO engaged_sessions_per_user;

ALTER TABLE useracquisition
RENAME COLUMN `Average engagement time` TO average_engagement_time;

ALTER TABLE useracquisition
RENAME COLUMN `Event count` TO event_count;

ALTER TABLE useracquisition
RENAME COLUMN `Key events` TO key_events;

ALTER TABLE useracquisition
RENAME COLUMN `Users`TO users;

UPDATE useracquisition
SET users = replace(users, ',', '');

UPDATE useracquisition
SET new_users = replace(new_users, ',', ''),
	engaged_sessions = replace(engaged_sessions, ',', ''),
    Impressions = replace(Impressions, ',', ''),
    event_count = replace(event_count, ',', ''),
    engagement_rate = replace(engagement_rate, '%', '')/100;
    
ALTER TABLE useracquisition 
MODIFY COLUMN engagement_rate DECIMAL(5,4);

SELECT *
FROM useracquisition;

ALTER TABLE useracquisition
rename column `Cost` to cost,
rename column `Impressions` to impressions;


UPDATE useracquisition 
SET average_engagement_time = REPLACE(average_engagement_time, 's', '');

ALTER TABLE useracquisition 
MODIFY COLUMN Cost DECIMAL(10,2),
MODIFY COLUMN Impressions INT,
MODIFY COLUMN average_engagement_time INT;

ALTER TABLE useracquisition 
MODIFY COLUMN channel_name varchar(100),
MODIFY COLUMN users INT,
modify column new_users INT,
MODIFY COLUMN engaged_sessions int,
MODIFY COLUMN event_count INT;

SELECT *
FROM trafficacquisition;

ALTER TABLE trafficacquisition
rename column `Users` to users,
rename column `Sessions` to sessions;

UPDATE trafficacquisition
SET Users = replace(Users, ',', ''),
	Sessions = replace(Sessions, ',', ''),
    engaged_sessions = replace(engaged_sessions, ',', ''),
    event_count = replace(event_count, ',', ''),
    key_events = replace(key_events, ',', ''),
    engagement_rate = replace(engagement_rate, '%', '')/100,
    average_engagement_time = REPLACE(average_engagement_time, 's', '');
    
ALTER TABLE trafficacquisition 
MODIFY COLUMN key_events decimal(10,2),
MODIFY COLUMN average_engagement_time INT,
MODIFY COLUMN channel_name varchar(100),
MODIFY COLUMN Users INT,
modify column Sessions INT,
MODIFY COLUMN engaged_sessions int,
MODIFY COLUMN event_count INT,
MODIFY COLUMN events_per_session decimal(10,2),
MODIFY COLUMN engagement_rate decimal(5,4),
MODIFY COLUMN engaged_sessions_per_user decimal(5,4);

SELECT *
FROM landingpage;

ALTER TABLE landingpage
rename column `Users` to users,
rename column `Sessions` to sessions;

UPDATE landingpage
SET Users = replace(Users, ',', ''),
	Sessions = replace(Sessions, ',', ''),
    new_users = replace(new_users, ',', ''),
    key_events = replace(key_events, ',', ''),
    average_engagement_time = REPLACE(average_engagement_time, 's', '');
    
ALTER TABLE landingpage 
MODIFY COLUMN key_events decimal(10,2),
MODIFY COLUMN average_engagement_time decimal(10,2),
MODIFY COLUMN new_users INT,
MODIFY COLUMN Users INT,
MODIFY COLUMN Sessions INT,
MODIFY COLUMN landing_page varchar(1000);

SELECT landing_page, LENGTH(landing_page) AS url_length
FROM landingpage
ORDER BY LENGTH(landing_page) DESC
LIMIT 5;

SELECT *
FROM events;

UPDATE events
SET total_users = replace(total_users, ',', ''),
	event_count = replace(event_count, ',', '');
    
ALTER TABLE events 
MODIFY COLUMN event_name varchar(100),
MODIFY COLUMN event_count INT,
MODIFY COLUMN total_users INT,
MODIFY COLUMN event_count_per_user decimal(10,2);

SELECT *
FROM demographic_interests;

ALTER TABLE demographic_interests
rename column `Users` to users;

UPDATE demographic_interests
SET Users = replace(Users, ',', ''),
	new_users = replace(new_users, ',', ''),
    engaged_sessions = replace(engaged_sessions, ',', ''),
    engagement_rate = replace(engagement_rate, '%', '')/100,
    average_engagement_time = REPLACE(average_engagement_time, 's', '');
    
ALTER TABLE demographic_interests 
MODIFY COLUMN interest_name varchar(500),
MODIFY COLUMN average_engagement_time int,
MODIFY COLUMN new_users INT,
MODIFY COLUMN Users INT,
MODIFY COLUMN engaged_sessions INT,
MODIFY COLUMN engaged_sessions_per_user decimal(10,2),
MODIFY COLUMN engagement_rate decimal(5,4);

SELECT *
FROM demographic_gender;

ALTER TABLE demographic_gender
rename column `Users` to users;

UPDATE demographic_gender
SET Users = replace(Users, ',', ''),
	new_users = replace(new_users, ',', ''),
    engaged_sessions = replace(engaged_sessions, ',', ''),
    event_count = replace(event_count, ',', ''),
    engagement_rate = replace(engagement_rate, '%', '')/100,
    average_engagement_time = REPLACE(average_engagement_time, 's', '');
    
ALTER TABLE demographic_gender 
MODIFY COLUMN gender varchar(100),
MODIFY COLUMN average_engagement_time int,
MODIFY COLUMN new_users INT,
MODIFY COLUMN Users INT,
MODIFY COLUMN engaged_sessions INT,
MODIFY COLUMN engaged_sessions_per_user decimal(10,2),
MODIFY COLUMN engagement_rate decimal(5,4),
MODIFY COLUMN event_count INT,
MODIFY COLUMN key_events INT,
MODIFY COLUMN total_revenue INT;

SELECT *
FROM demographic_country;

ALTER TABLE demographic_country
rename column `Users` to users;

UPDATE demographic_country
SET Users = replace(Users, ',', ''),
	new_users = replace(new_users, ',', ''),
    engaged_sessions = replace(engaged_sessions, ',', ''),
    event_count = replace(event_count, ',', ''),
    engagement_rate = replace(engagement_rate, '%', '')/100,
    average_engagement_time = REPLACE(average_engagement_time, 's', '');
    
ALTER TABLE demographic_country 
MODIFY COLUMN country varchar(100),
MODIFY COLUMN average_engagement_time int,
MODIFY COLUMN new_users INT,
MODIFY COLUMN Users INT,
MODIFY COLUMN engaged_sessions INT,
MODIFY COLUMN engaged_sessions_per_user decimal(10,2),
MODIFY COLUMN engagement_rate decimal(5,4),
MODIFY COLUMN event_count INT;

SELECT average_engagement_time FROM demographic_country 
WHERE average_engagement_time LIKE '%m%';

UPDATE audience
SET average_session_duration = CASE 
    -- If the value contains an 'm', calculate total seconds
    WHEN average_session_duration LIKE '%m%' THEN 
        (SUBSTRING_INDEX(average_engagement_time, 'm', 1) * 60) + 
        TRIM(SUBSTRING_INDEX(average_engagement_time, 'm', -1))
    -- If it's already just a plain number, keep it as is
    ELSE average_engagement_time 
END;

SELECT *
FROM demographic_age;



UPDATE demographic_age
SET users = replace(Users, ',', ''),
	new_users = replace(new_users, ',', ''),
    engaged_sessions = replace(engaged_sessions, ',', ''),
    event_count = replace(event_count, ',', ''),
    engagement_rate = replace(engagement_rate, '%', '')/100,
    average_engagement_time = REPLACE(average_engagement_time, 's', '');
    
ALTER TABLE demographic_age
rename column `Users` to users,
rename column `New users` to new_users,
rename column `Engaged sessions` to engaged_sessions,
rename column `Engagement rate` to engagement_rate,
rename column `Engaged sessions per user` to engaged_sessions_per_user,
rename column `Average engagement time` to average_engagement_time,
rename column `Event count` to event_count,
rename column `Key events` to key_events,
rename column `Total revenue` to total_revenue;

ALTER TABLE demographic_age 
MODIFY COLUMN age_group varchar(100),
MODIFY COLUMN average_engagement_time int,
MODIFY COLUMN new_users INT,
MODIFY COLUMN users INT,
MODIFY COLUMN engaged_sessions INT,
MODIFY COLUMN engaged_sessions_per_user decimal(10,2),
MODIFY COLUMN engagement_rate decimal(5,4),
MODIFY COLUMN event_count INT;

SELECT *
FROM audience;

ALTER TABLE audience
rename column `Users` to users,
rename column `Sessions` to sessions;

UPDATE audience
SET average_session_duration = 
	(SUBSTRING_INDEX(average_session_duration, 'm', 1) * 60) + 
    TRIM(REPLACE(SUBSTRING_INDEX(average_session_duration, 'm', -1), 's', ''));
    
UPDATE audience
SET users = replace(Users, ',', ''),
	new_users = replace(new_users, ',', ''),
    sessions = replace(sessions, ',', '');
    
ALTER TABLE audience 
MODIFY COLUMN user_group varchar(100),
MODIFY COLUMN sessions int,
MODIFY COLUMN views_per_session decimal(10,2),
MODIFY COLUMN new_users INT,
MODIFY COLUMN users INT,
MODIFY COLUMN average_session_duration int;

ALTER TABLE landingpage
RENAME COLUMN channel_name
TO landing_page;