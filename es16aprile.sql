select nome, provincia
from negozi
where provincia in (
  select provincia
  from negozi
  group by provincia
  having count(provincia) > 1 
);

select nome
from negozi
where budget = (
  select max(budget)
  from negozi
)

-- select r1.codProdotto
-- from richiestaEsposizione r1,
-- where not exists (
--   select r1.codProdotto
--   from richiestaEsposizione r2, negozio n
--   where r
--   )

-- select distinct p.codProdotto 
-- from richiestaEsposizione
-- where codProdotto not in 


select distinct r.codProdotto
from richiestaEsposizione r
where not exists(
  select n2.nomeNegozio
  from negozio n2
  where n2.provincia = 'milano' and n2.nomeNegozio not in   (
    select r1.codProdotto, n1.nomeNegozio
    from richiestaEsposizione r1, negozio n1
    where r1.nomeNegozio = n1.nomeNegozio and n1.provincia = 'Milano' and r1.codProdotto = r.codProdotto
  )
)


--left join richiestaEsposizione
--where negozio.provincia = 'Milano' and not exists


SELECT DISTINCT r.codProdotto
FROM richiestaEsposizione AS r
WHERE NOT EXISTS(
  SELECT n2.nomeNeg
  FROM negozio AS n2
  WHERE n2.provincia = 'Milano' 
  AND n2.nomeNeg NOT IN (
    SELECT r1.nomeNegozio
    FROM richiestaEsposizione AS r1, negozio AS n1
    WHERE r1.nomeNegozio = n1.nomeNeg 
    AND n1.provincia = 'Milano'
    AND r1.codProdotto = r.codProdotto
  )
)