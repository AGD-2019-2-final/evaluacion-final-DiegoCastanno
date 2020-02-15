-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

u = LOAD 'data.tsv' USING PigStorage('\t') 
    AS (letter:CHARARRAY, 
        date:CHARARRAY, 
        value:INT);

tabla = GROUP u BY letter;
tabla2 = FOREACH tabla GENERATE group as letter, COUNT(u) AS cuenta;
tabla3 = FOREACH tabla2 GENERATE letter, cuenta;

STORE tabla3 INTO 'output' USING PigStorage('\t');