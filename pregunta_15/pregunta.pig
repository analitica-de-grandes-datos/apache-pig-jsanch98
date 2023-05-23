/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname,
       color
   FROM 
       u 
   WHERE color = 'blue' AND firstname LIKE 'Z%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/
lines = LOAD 'data.csv' USING PigStorage(',') AS (f1:int, f2:chararray, f3:chararray, f4:chararray, f5:chararray);
name_color = FILTER lines BY f5 == 'blue' AND STARTSWITH(f2, 'Z');
name_color_2 = FOREACH name_color GENERATE f2 AS firstname, f5 AS color;
name_color_3 = FOREACH name_color_2 GENERATE CONCAT(firstname, ' ', color);
STORE name_color_3 INTO 'output' USING PigStorage(',');