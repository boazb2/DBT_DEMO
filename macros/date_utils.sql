{%macro get_season(x)%}

case when month(to_timestamp({{ x }})) in (12,1,2) then 'Winter'
      when month(to_timestamp({{ x }})) in (3,4,5) then 'Spring'
      when month(to_timestamp({{ x }})) in (6,7,8) then 'Summer'
      else 'Autom' end 
{%endmacro%}

{%macro day_type(x)%}

case when dayname(to_timestamp({{x}})) in ('Sat','Fri') then 'Weekend' 
 else 'Business day' end

{%endmacro%}