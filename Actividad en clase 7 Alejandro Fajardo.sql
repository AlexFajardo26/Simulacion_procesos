

-- Pregunta 1
-- ¿Cuántas filas tiene la tabla?

SELECT count(*) 
from SimLVDF.dbo.FinancialStatement

-- Pregunta 2
-- Cuántas empresas aparecen?

SELECT COUNT(DISTINCT ticker)
FROM SimLVDF.dbo.FinancialStatement

-- Pregunta 3
-- Para cuántos años tienes datos?

SELECT COUNT(DISTINCT YEAR(fiscalDateEnding))
FROM SimLVDF.dbo.FinancialStatement

-- Pregunta 4
-- Calcula el Gross Profit promedio de AMD

SELECT AVG(grossProfit) AS promedio
FROM SimLVDF.dbo.FinancialStatement
WHERE ticker = 'AMD'

-- Pregunta 5
-- Obtén las 20 empresas con el mayor EBITDA en 2018

SELECT TOP 20 ticker, ebitda
FROM SimLVDF.dbo.FinancialStatement
WHERE YEAR(fiscalDateEnding) = 2018
ORDER BY ebitda DESC

-- Pregunta 6
-- Cuál fue el total Revenue por año de Microsoft entre 2015 y 2020?

SELECT YEAR(fiscalDateEnding) as year, SUM(totalRevenue) AS revenue
FROM SimLVDF.dbo.FinancialStatement
WHERE ticker = 'MSFT'
AND YEAR(fiscalDateEnding) BETWEEN 2015 AND 2020
GROUP BY YEAR(fiscalDateEnding)
ORDER BY year

-- Pregunta 7
-- Cuál fue el total Revenue (acumulado) de Microsoft entre 2015 y 2020?

SELECT SUM(totalRevenue) AS revenue
FROM SimLVDF.dbo.FinancialStatement
WHERE ticker = 'MSFT'
AND YEAR(fiscalDateEnding) BETWEEN 2015 AND 2020
