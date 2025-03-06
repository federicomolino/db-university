1. Contare quanti iscritti ci sono stati ogni anno
	select enrolment_date, count(*)
	from students
	group by enrolment_date
2. Contare gli insegnanti che hanno ufficio nello stesso edificio
	select office_address as 'stesso edificio', count(*) as 'numero insegnanti'
	from teachers
	group by office_address;
3. Calcolare la media dei voti di ogni appello desame
	select exam_id, AVG (vote) as 'media voti'
	from exam_student
	group by exam_id;
4. Contare quanti corsi di laurea ci sono per ogni dipartimento
	select name, count(*) as 'numero corsi'
	from departments
	group by name;