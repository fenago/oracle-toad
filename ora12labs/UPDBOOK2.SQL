UPDATE  THE  (select required_reading
    from course_material
    WHERE department = 'CS' and course = 101)j
       SET catalog_number  = catalog_number + 10
/
