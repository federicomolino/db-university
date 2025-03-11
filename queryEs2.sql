/*1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia*/

select s.*
from students s 
join degrees d on d.id = s.degree_id
where d.name = "Corso di Laurea in Economia"

/*2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze*/
select d.*
from degrees d 
join departments d2 on d2.id = d.department_id
where d.level = "magistrale"
and d2.name like '%Neuroscienze%';

/*3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)*/
select * 
from courses c 
join course_teacher ct on ct.course_id = c.id
where ct.teacher_id = 44;

/*4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui
sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e
nome*/

select s.*, d.name as degree_name, d2.name as department_name
from students s 
join degrees d on d.id = s.degree_id
join departments d2 on d2.id = d.department_id
order by s.surname, s.name;

/*5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti*/

select d.*, c.name as name_course, t.name as teacher_name
from degrees d 
join courses c on c.degree_id = d.id
join course_teacher ct on ct.course_id = c.id
join teachers t on t.id = ct.teacher_id;

/*6. Selezionare tutti i docenti che insegnano nel Dipartimento di
Matematica (54)*/
select distinct t.* 
from teachers t 
join course_teacher ct on ct.teacher_id = t.id
join courses c on c.id = ct.course_id
join degrees d on d.id = c.degree_id
join departments d2 on d2.id = d.department_id
where d2.name like '%Matematica%'

/*7. BONUS: Selezionare per ogni studente il numero di tentativi sostenuti
per ogni esame, stampando anche il voto massimo. Successivamente,
filtrare i tentativi con voto minimo 18.*/

select s.name, s.surname, e.course_id, count(es.exam_id) as "numero_tentativi", MAX(es.vote) as voto_massimo
from students s 
join exam_student es on es.exam_id = s.id
join exams e on e.id = es.exam_id
group by s.id, e.course_id

select s.name, s.surname, e.course_id, count(es.exam_id) as "numero_tentativi", MAX(es.vote) as voto_massimo
from students s 
join exam_student es on es.exam_id = s.id
join exams e on e.id = es.exam_id
where es.vote >= "18"
group by s.id, e.course_id