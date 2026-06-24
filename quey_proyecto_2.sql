CREATE VIEW satisfaction_table AS
WITH tabla_atencion as (
	SELECT 
		c.Ticket_ID,
		c.Customer_Name,
		c.Customer_Email,
		c.Customer_Age,
		c.Customer_Gender,
		c.Product_Purchased,
		CAST(Date_of_Purchase as DATE) as Date_of_Purchase,
		CAST(Ticket_Created_Date as DATETIME2) as Ticket_Created_Date,
		c.Ticket_Type,
		c.Ticket_Subject,
		c.Ticket_Description,
		c.Ticket_Status,
		c.Ticket_Proceeded,
		c.Resolution,
		c.Ticket_Priority,
		c.Ticket_Channel,
		c.Manager_ID,
		TRY_CAST(First_Response_Time as DATETIME2) as First_Response_Time,
		TRY_CAST(Time_to_Resolution as DATETIME2) as Time_to_Resolution,
		DATEDIFF(day,Ticket_Created_Date, Time_to_Resolution) as DIAS_RESOLUCION, --saber el tiempo de la atencion (DIAS TOTALES)
		DATEDIFF(hour,Ticket_Created_Date, First_Response_Time) as Horas_Respuesta,--saber el tiempo deL PRIMER CONTACTO (HORAS)
		c.Customer_Satisfaction_Rating,
		CASE --COMENTARIO PARA SABER SI EL TICKET PROCEDE O NO PROCEDE
			WHEN c.Ticket_Proceeded = '1' THEN 'Procede'
			WHEN c.Ticket_Proceeded = '0' THEN 'No Procede'
			ELSE NULL
		END AS COM_RESOLUTION,
		CASE -- HOMOLOGACION DE SATISFACCION DE ATENCION A CLIENTES
			WHEN Customer_Satisfaction_Rating IN ('4', '5') 
					THEN 'SATISFECHO'
			WHEN Customer_Satisfaction_Rating IN ('3') 
					THEN 'NEUTRAL'
			WHEN Customer_Satisfaction_Rating IN ('1', '2') 
					THEN 'INSATISFECHO'
			ELSE NULL
		END AS COMENTARIO_SATISFACTION,
		CASE -- SEGMENTACION DE EDADES
			WHEN CAST(Customer_Age as INT) <= 24
				THEN '18-24'
			WHEN CAST(Customer_Age as INT) <= 34
				THEN '25-34'
			WHEN CAST(Customer_Age as INT) <= 44
				THEN '35–44'
			WHEN CAST(Customer_Age as INT) <= 54
				THEN '45–54'
			WHEN CAST(Customer_Age as INT) <= 64
				THEN '55–64'
			ELSE '+65'
		END AS RANGO_EDAD,
		CASE --- DIAS RESOLUCION SEGUN LA PRIORIDAD DEL TICKET SLA
			WHEN Ticket_Priority = 'Critical' AND DATEDIFF(day,Ticket_Created_Date, Time_to_Resolution) <= 1 
				THEN 'Cumple'
			WHEN Ticket_Priority = 'High' AND DATEDIFF(day,Ticket_Created_Date, Time_to_Resolution) <= 2 
				THEN 'Cumple'
			WHEN Ticket_Priority = 'Medium' AND DATEDIFF(day,Ticket_Created_Date, Time_to_Resolution) <= 3 
				THEN 'Cumple'
			WHEN Ticket_Priority = 'Low' AND DATEDIFF(day,Ticket_Created_Date, Time_to_Resolution) <= 5 
				THEN 'Cumple'
			ELSE 'No cumple'
		END AS CUMPLIMIENTO_SLA_PRIORITY,
		CASE -- PARA FIRST_REPONSE_TIME MEDIR EN HORAS PARA SABER EL TIEMPO QUE ES LA PRIMERA COMU. CON CLIENTE
			WHEN Ticket_Priority = 'Critical' AND DATEDIFF(hour,Ticket_Created_Date, First_Response_Time) <= 2 
					THEN 'Cumple'
			WHEN Ticket_Priority = 'High' AND DATEDIFF(hour,Ticket_Created_Date, First_Response_Time) <= 4 
					THEN 'Cumple'
			WHEN Ticket_Priority = 'Medium' AND DATEDIFF(hour,Ticket_Created_Date, First_Response_Time) <= 8 
					THEN 'Cumple'
			WHEN Ticket_Priority = 'Low' AND DATEDIFF(hour,Ticket_Created_Date, First_Response_Time) <= 24 
					THEN 'Cumple'
			ELSE 'No cumple'
		END AS CUMPLIMIENTO_PRIMER_CONTACT_HORA
	FROM [dbo].[customer_support_tickets_improved] c
SELECT
	t.Ticket_ID,
	t.Customer_Name,
	t.Customer_Email,
	t.Customer_Age,
	t.Customer_Gender,
	t.Product_Purchased,
	t.Date_of_Purchase,
	t.Ticket_Created_Date,
	t.Ticket_Type,
	t.Ticket_Subject,
	t.Ticket_Description,
	t.Ticket_Status,
	t.Ticket_Proceeded,
	t.Resolution,
	t.Ticket_Priority,
	t.Ticket_Channel,
	t.Manager_ID,
	m.Manager_Name,
	t.First_Response_Time,
	t.Time_to_Resolution,
	t.DIAS_RESOLUCION,
	t.Horas_Respuesta,
	t.Customer_Satisfaction_Rating,
	t.COM_RESOLUTION,
	t.COMENTARIO_SATISFACTION,
	t.RANGO_EDAD,
	t.CUMPLIMIENTO_SLA_PRIORITY,
	t.CUMPLIMIENTO_PRIMER_CONTACT_HORA
FROM tabla_atencion t
LEFT JOIN (
    SELECT DISTINCT Manager_ID, Manager_Name 
    FROM [dbo].[ticket_product_lookup]
) m 
    ON t.Manager_ID = m.Manager_ID;
	
