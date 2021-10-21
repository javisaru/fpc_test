-- PREGUNTA 1
SELECT A.Tienda, 
	Clientes_distintos = COUNT(DISTINCT B.Nombre)
FROM POS_TRX AS A
INNER JOIN POS_TRX_CLIENTE AS B ON
	A.ID_TRX = B.ID_TRX
WHERE A.Tipo_transaccion = 15
GROUP BY A.Tienda

-- PREGUNTA 2
SELECT A.Tienda, 
	Anio = YEAR(A.Fecha_transaccion),
	Ventas_anuales = SUM(B.Monto_pago)
FROM POS_TRX AS A
INNER JOIN POS_TRX_PAGO AS B ON
	A.ID_TRX = B.ID_TRX
GROUP BY A.Tienda, YEAR(A.Fecha_transaccion)
ORDER BY A.Tienda, SUM(B.Monto_pago) DESC

-- PREGUNTA 3
SELECT A.Tienda, 
	Anio = YEAR(A.Fecha_transaccion),
	Transaccion_promedio = AVG(B.Monto_pago)
FROM POS_TRX AS A
INNER JOIN POS_TRX_PAGO AS B ON
	A.ID_TRX = B.ID_TRX
GROUP BY A.Tienda, YEAR(A.Fecha_transaccion)
ORDER BY A.Tienda, AVG(B.Monto_pago)

-- PREGUNTA 4
SELECT B.Medio_de_pago,
	Transacciones_mpago = COUNT(A.ID_TRX)
FROM POS_TRX AS A
INNER JOIN POS_TRX_PAGO AS B ON
	A.ID_TRX = B.ID_TRX
GROUP BY B.Medio_de_pago
ORDER BY COUNT(A.ID_TRX) DESC