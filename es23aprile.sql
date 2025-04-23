-- Determinare il codice dei prodotti per i quali esiste una richiesta di esposizione a tutti e soli i negozi della provincia di Milano.

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
AND NOT EXISTS (
  SELECT *
  FROM richiestaEsposizione AS r3, negozio AS n2
  WHERE r3.codprodotto = r.codProdotto
  AND r3.nomeNegozio = n2.nomeNeg
  AND n2.provincia <> 'Milano'
)
