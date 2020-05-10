select pres_name from president
where pres_name =
(select pres_name from pres_marriage
group by pres_name
having count(*) > 1)
/
