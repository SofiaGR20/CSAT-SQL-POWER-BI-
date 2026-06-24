# CSAT Dashboard | SQL Server + Power BI

Proyecto de análisis de satisfacción del cliente desarrollado con **SQL Server** y **Power BI**. El objetivo principal es analizar tickets de soporte, medir el cumplimiento de SLA, evaluar la satisfacción del cliente y visualizar indicadores clave mediante un dashboard interactivo.

## Descripción del proyecto

Este proyecto utiliza una vista creada en **SQL Server** para transformar y consolidar información de tickets de atención al cliente. Posteriormente, los datos son conectados a **Power BI** para construir un dashboard que permita analizar el desempeño del servicio al cliente desde diferentes perspectivas: estado del ticket, prioridad, canal de atención, tiempos de respuesta, cumplimiento SLA y nivel de satisfacción.

## Objetivos

* Analizar el volumen total de tickets de soporte.
* Identificar tickets abiertos y cerrados.
* Evaluar el nivel de satisfacción del cliente mediante CSAT.
* Medir el cumplimiento de SLA según la prioridad del ticket.
* Analizar los tiempos de primera respuesta y resolución.
* Comparar el desempeño por canal de atención.
* Visualizar tendencias mensuales de tickets.

## Herramientas utilizadas

* SQL Server
* Power BI
* Power Query
* DAX
* GitHub

## Proceso SQL

Se creó una vista llamada `satisfaction_table`, en la cual se realizaron transformaciones para preparar la información antes de cargarla en Power BI.

Principales procesos realizados:

* Conversión de fechas de compra, creación de ticket, primera respuesta y resolución.
* Cálculo de días de resolución del ticket.
* Cálculo de horas hasta la primera respuesta.
* Clasificación de tickets como procede o no procede.
* Clasificación de satisfacción del cliente:

  * Satisfecho
  * Neutral
  * Insatisfecho
* Segmentación de clientes por rango de edad.
* Evaluación del cumplimiento SLA por prioridad:

  * Critical
  * High
  * Medium
  * Low
* Evaluación del cumplimiento de primera respuesta en horas.
* Relación de tickets con la tabla de managers.

## Indicadores principales

* Total de tickets: 7,517
* Tickets cerrados: 4,419
* Tickets abiertos: 3,098
* CSAT promedio: 3.03
* Cumplimiento SLA: 50.94 %

## Dashboard

El dashboard permite analizar:

* Total de tickets.
* Tickets abiertos y cerrados.
* CSAT promedio.
* Cumplimiento SLA.
* Tickets por canal de atención.
* Tickets por prioridad.
* Tickets por estado.
* Tendencia mensual de tickets.
* CSAT promedio por canal.
* Cumplimiento SLA por prioridad.
* Filtros por fecha, canal, manager y prioridad.


## Archivos del proyecto

| Archivo                      | Descripción                                                    |
| ---------------------------- | -------------------------------------------------------------- |
| `quey_proyecto_2.sql`        | Script SQL utilizado para crear la vista `satisfaction_table`. |
| `CUSTOMER SATISFACTION.pbix` | Archivo de Power BI con el dashboard interactivo.              |
| `dashboard.png`              | Imagen de vista previa del dashboard.                          |
| `README.md`                  | Documentación del proyecto.                                    |

## Análisis realizado

El análisis se enfocó en evaluar la gestión de atención al cliente a partir de los tickets registrados. A través del dashboard se identifican patrones relacionados con los canales de atención, prioridades, tiempos de respuesta y niveles de satisfacción.

El proyecto permite responder preguntas como:

* ¿Cuántos tickets fueron abiertos y cerrados?
* ¿Cuál es el nivel promedio de satisfacción del cliente?
* ¿Qué canales concentran mayor cantidad de tickets?
* ¿Qué prioridades presentan mayor incumplimiento de SLA?
* ¿Cómo evoluciona la cantidad de tickets a lo largo del tiempo?
* ¿Qué tan eficiente es la primera respuesta al cliente?

## Conclusiones

El dashboard evidencia que existe una cantidad considerable de tickets gestionados, con una distribución relevante entre tickets abiertos y cerrados. El cumplimiento SLA se encuentra alrededor del 51 %, lo que muestra oportunidades de mejora en la atención y resolución de casos.

Asimismo, el CSAT promedio de 3.03 refleja una satisfacción moderada por parte de los clientes. Por ello, se recomienda reforzar el seguimiento de tickets críticos, optimizar los tiempos de primera respuesta y analizar los canales con mayor volumen de solicitudes para mejorar la experiencia del cliente.

## Autor

**Sofia German**
GitHub: https://github.com/SofiaGR20
