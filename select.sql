1. Selezionare tutti gli studenti nati nel 1990 (160)
	select * 
	from students
	where year(date_of_birth) = 1990;
2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
	select * from courses
	where cfu > 10;
3. Selezionare tutti gli studenti che hanno più di 30 anni
	select * 
	from students
	where date_of_birth < '1995-03-07';
4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di
laurea (286)
	select *
	from courses
	where period = 'I semestre'
	and year = 1;
5. Selezionare tutti gli appelli esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
	select * 
	from exams
	where date = '2020-06-20'
	and hour >= '14:00:00';
6. Selezionare tutti i corsi di laurea magistrale (38)
	select *
	from degrees
	where name like '%Magistrale%';
7. Da quanti dipartimenti è composta università? (12)
	select * from departments
8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50
	select * from teachers where phone is null;