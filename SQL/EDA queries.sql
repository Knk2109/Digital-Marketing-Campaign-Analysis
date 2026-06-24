# 1. Top Revenue Channels

SELECT
    dc.channel_name,
    SUM(f.total_revenue) revenue
FROM fact_user_acquisition f
JOIN dim_channel dc
ON f.channel_id = dc.channel_id
GROUP BY dc.channel_name
ORDER BY revenue DESC;

# 2. Top Countries by Revenue

SELECT
    dc.country_name,
    SUM(f.revenue) revenue
FROM fact_country_performance f
JOIN dim_country dc
ON f.country_id = dc.country_id
GROUP BY dc.country_name
ORDER BY revenue DESC;

# 3. Revenue by Gender

SELECT
    dg.gender_name,
    SUM(f.total_revenue) revenue
FROM fact_gender f
JOIN dim_gender dg
ON f.gender_id = dg.gender_id
GROUP BY dg.gender_name
ORDER BY revenue DESC;

# 4. Top 10 Revenue by Interests

SELECT
    di.interest_name,
    SUM(f.total_revenue) revenue
FROM fact_interest f
JOIN dim_interest di
ON f.interest_id = di.interest_id
GROUP BY di.interest_name
ORDER BY revenue DESC
limit 10;

# 5. High Traffic Low Revenue landing Pages

SELECT
    dlp.landing_page_url,
    flp.sessions,
    flp.revenue
FROM fact_landing_page flp
JOIN dim_landing_page dlp
ON flp.landing_page_id = dlp.landing_page_id
ORDER BY flp.sessions DESC;

# 6. Revenue per USER (Channel Efficiency)

SELECT
    dc.channel_name,
    fua.users,
    fua.total_revenue,
    ROUND(fua.total_revenue / NULLIF(fua.users,0), 2) AS revenue_per_user
FROM fact_user_acquisition fua
JOIN dim_channel dc
ON fua.channel_id = dc.channel_id
ORDER BY revenue_per_user DESC;

# 7. Revenue per session

SELECT
    dc.channel_name,
    fta.sessions,
    fta.revenue,
    ROUND(fta.revenue / NULLIF(fta.sessions,0),2) AS revenue_per_session
FROM fact_traffic_acquisition fta
JOIN dim_channel dc
ON fta.channel_id = dc.channel_id
ORDER BY revenue_per_session DESC;

# 8. Engagement Vs Revenue Analysis

SELECT
    dc.channel_name,
    fta.engagement_rate,
    fta.revenue
FROM fact_traffic_acquisition fta
JOIN dim_channel dc
ON fta.channel_id = dc.channel_id
ORDER BY fta.engagement_rate DESC;

#9. Revenue Concentration by Channel

SELECT
    dc.channel_name,
    fua.total_revenue,
    ROUND(
        fua.total_revenue * 100 /
        (SELECT SUM(total_revenue)
         FROM fact_user_acquisition),
    2) AS revenue_share_pct
FROM fact_user_acquisition fua
JOIN dim_channel dc
ON fua.channel_id = dc.channel_id
ORDER BY revenue_share_pct DESC;

#10. Revenue Concentration by Country

SELECT
    dc.country_name,
    fcp.revenue,
    ROUND(
        fcp.revenue * 100 /
        (SELECT SUM(revenue)
         FROM fact_country_performance),
    2) AS revenue_share_pct
FROM fact_country_performance fcp
JOIN dim_country dc
ON fcp.country_id = dc.country_id
ORDER BY revenue_share_pct DESC;

#11. Revenue by Age Group

SELECT
    da.age_group,
    fa.users,
    fa.total_revenue,
    ROUND(fa.total_revenue / NULLIF(fa.users,0),2)
        AS revenue_per_user
FROM fact_age fa
JOIN dim_age da
ON fa.age_id = da.age_id
ORDER BY fa.total_revenue DESC;

#12. Revenue by Gender Efficiency

SELECT
    dg.gender_name,
    fg.users,
    fg.total_revenue,
    ROUND(
        fg.total_revenue /
        NULLIF(fg.users,0),
    2) AS revenue_per_user
FROM fact_gender fg
JOIN dim_gender dg
ON fg.gender_id = dg.gender_id
ORDER BY revenue_per_user DESC;

#13. Interest Segment Efficiency

SELECT
    di.interest_name,
    fi.users,
    fi.total_revenue,
    ROUND(
        fi.total_revenue /
        NULLIF(fi.users,0),
    2) AS revenue_per_user
FROM fact_interest fi
JOIN dim_interest di
ON fi.interest_id = di.interest_id
ORDER BY revenue_per_user DESC
LIMIT 15;

#14. Landing Page Conversion Opportunity

SELECT
    dlp.landing_page_url,
    flp.sessions,
    flp.revenue,
    ROUND(
        flp.revenue /
        NULLIF(flp.sessions,0),
    4) AS revenue_per_session
FROM fact_landing_page flp
JOIN dim_landing_page dlp
ON flp.landing_page_id = dlp.landing_page_id
ORDER BY flp.sessions DESC;

#15. Revenue Vs Engagement by Age

SELECT
    da.age_group,
    fa.engagement_rate,
    fa.total_revenue
FROM fact_age fa
JOIN dim_age da
ON fa.age_id = da.age_id
ORDER BY fa.engagement_rate DESC;

#16 Revenue Vs Engagement by Interests

SELECT
    di.interest_name,
    fi.engagement_rate,
    fi.total_revenue
FROM fact_interest fi
JOIN dim_interest di
ON fi.interest_id = di.interest_id
ORDER BY fi.engagement_rate DESC;

# Executive Summary

#Top Channel

SELECT
    dc.channel_name,
    fua.total_revenue
FROM fact_user_acquisition fua
JOIN dim_channel dc
ON fua.channel_id = dc.channel_id
ORDER BY total_revenue DESC
LIMIT 1;

#Top Country

SELECT
    dc.country_name,
    fcp.revenue
FROM fact_country_performance fcp
JOIN dim_country dc
ON fcp.country_id = dc.country_id
ORDER BY revenue DESC
LIMIT 1;

#Top Interest

SELECT
    di.interest_name,
    fi.total_revenue
FROM fact_interest fi
JOIN dim_interest di
ON fi.interest_id = di.interest_id
ORDER BY total_revenue DESC
LIMIT 1;