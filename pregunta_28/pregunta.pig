/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       birthday, 
       DATE_FORMAT(birthday, "yyyy"),
       DATE_FORMAT(birthday, "yy"),
   FROM 
       persons
   LIMIT
       5;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
persons = LOAD 'data.csv' USING PigStorage(',') AS (f1:int, f2:chararray, f3:chararray, f4:chararray, f5:chararray);
dates = FOREACH persons GENERATE ToDate(f4, 'yyyy-MM-dd') AS birthday;
dates_2 = FOREACH dates GENERATE GetYear(birthday), ToString(birthday, 'yy');
STORE dates_2 INTO 'output' USING PigStorage(',');