/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
lines = LOAD 'data.tsv' USING PigStorage('\t') AS (line:chararray, date:chararray, number:int);
select = FOREACH lines GENERATE number;
ordered_data = ORDER select BY number asc;
chunk = LIMIT ordered_data 5;
STORE chunk INTO 'output' USING PigStorage(',');