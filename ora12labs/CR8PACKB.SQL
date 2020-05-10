CREATE OR REPLACE PACKAGE BODY manage_zoo
as

FUNCTION get_total_weight
    return number is
        l_total_weight  integer;
   begin
        select sum(weight)  
           into l_total_weight
        from animal;

        return l_total_weight;
end get_total_weight;

FUNCTION get_cage
   (p_animal_id IN NUMBER)
   return number is
     l_cage_no   animal.cage_no%type;
   BEGIN
      select cage_no
      into     l_cage_no
      from animal
      where animal_id = p_animal_id;
 
      return l_cage_no;
end get_cage;

PROCEDURE load_summary is
       ani_rec     ani_rec_type;
       total_weight    animal.weight%type;
BEGIN
       total_weight := get_total_weight;
   
       open get_animals;
       LOOP
           fetch get_animals into ani_rec;
          EXIT WHEN get_animals%NOTFOUND;

          ani_rec.pct_weight := (ani_rec.weight/
                                             total_weight) * 100;
          INSERT INTO animal_summary (animal_name,
                 description,cage_name,weight,pct_weight)
           values ( ani_rec.animal_name,ani_rec.description,
                        ani_rec.cage_name,ani_rec.weight,ani_rec.pct_weight);
       END LOOP;
       CLOSE   get_animals;
       commit;
  EXCEPTION
     WHEN DUP_VAL_ON_INDEX THEN
         RAISE_APPLICATION_ERROR(dup_val,
             'Summary table not empty.');
  END load_summary;

END manage_zoo; 