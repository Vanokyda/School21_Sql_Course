-- Think about personal discounts for people from one side and pizza restaurants from the other.
-- Need to create a new relational table (please set a name person_discounts)

CREATE TABLE person_discounts
(id bigint primary key ,
 person_id bigint not null ,
 pizzeria_id bigint not null ,
 discount numeric,
 constraint fk_person_discounts_person_id foreign key  (person_id) references person(id),
 constraint fk_person_discounts_pizzeria_id foreign key  (pizzeria_id) references pizzeria(id)
 );

 