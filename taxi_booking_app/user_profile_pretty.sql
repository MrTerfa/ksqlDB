---------------------------------------------------------------
-- This file will generate the user_profile_pretty presentation
---------------------------------------------------------------

--change scope default to earliest
SET 'auto.offset.reset' = 'earliest';

--Now generate
CREATE STREAM user_profile_pretty as
select concat_ws(' ', firstname, ucase(lastname), 'from', countrycode,'has','a','rating','of',cast(rating as varchar),'stars') as description,
  case
      when rating < 2.5 then 'Poor'
      when rating between 2.5 and 4.2 then 'Good'
      else 'Excellent'
  end as rating_description
from userprofile
EMIT CHANGES;
