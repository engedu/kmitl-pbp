delete from academic_kpi where faculty_code!="01";


select * from academic_kpi where faculty_code="01";
delete from academic_kpi where faculty_code="02";

select * from academic_kpi;
select max(academic_kpi_id) from academic_kpi;


// Clear all kpi remain only 2558

insert into academic_kpi (code,name,unit_code,academic_year,rule_code,description,mark,work_type_code,order_no,special_p1,special_p2,special_p3,special_p4,total_student_from,
total_student_to,from_reg,faculty_code)
select code,name,unit_code,academic_year,rule_code,description,mark,work_type_code,order_no,special_p1,special_p2,special_p3,special_p4,total_student_from,
total_student_to,from_reg,faculty_code
from academic_kpi
where 1=1;

insert into academic_kpi (code,name,unit_code,academic_year,rule_code,description,mark,work_type_code,order_no,special_p1,special_p2,special_p3,special_p4,total_student_from,
total_student_to,from_reg,faculty_code)
select code,name,unit_code,academic_year,rule_code,description,mark,work_type_code,order_no,special_p1,special_p2,special_p3,special_p4,total_student_from,
total_student_to,from_reg,"12"
from academic_kpi
where faculty_code="01";
