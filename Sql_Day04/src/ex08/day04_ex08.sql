-- After all our exercises, we have a couple of Virtual Tables and a Materialized View.
-- Let's drop them!

DROP VIEW v_generated_dates, v_persons_female, v_persons_male,
			v_price_with_discount, v_symmetric_union;
			
DROP MATERIALIZED VIEW mv_dmitriy_visits_and_eats;