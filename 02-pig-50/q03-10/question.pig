-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
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

tabla = ORDER u BY value ASC;
tabla1 = FOREACH tabla GENERATE $2;
tabla2 = LIMIT tabla1 5;

STORE tabla2 INTO 'output' USING PigStorage('\t');