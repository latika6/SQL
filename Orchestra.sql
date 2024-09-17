-- The orchestras table stores all orchestras. The columns are id, name, rating, city_origin, country_origin, and year in which the orchestra was founded.
-- The concerts table contains all concerts played by the orchestras. The columns are id, city, country, year, rating, and orchestra_id (references the orchestras table).
-- The members table stores the members of (i.e. musicians playing in) each orchestra. The columns are id, name, position (i.e. the instrument played), wage, experience, and orchestra_id (references the orchestras table).

-- 
