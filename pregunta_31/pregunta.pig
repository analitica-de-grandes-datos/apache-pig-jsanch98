/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
people = LOAD 'data.csv' USING PigStorage(',') AS (f1:int, f2:chararray, f3:chararray, f4:chararray, f5:chararray);
dates = FOREACH people GENERATE ToDate(f4, 'yyyy-MM-dd') AS birthday;
dates_2 = FOREACH dates GENERATE ToString(birthday, 'yyyy') AS year;
dates_3 = GROUP dates_2 BY year;
dates_4 = FOREACH dates_3 GENERATE group, COUNT(dates_2);
STORE dates_4 INTO 'output' USING PigStorage(',');