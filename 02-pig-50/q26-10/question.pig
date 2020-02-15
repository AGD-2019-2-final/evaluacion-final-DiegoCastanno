-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        firstname 
--    FROM 
--        u 
--    WHERE 
--        SUBSTRING(firstname, 0, 1) >= 'm';
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
tb = FOREACH u GENERATE firstname AS firstname;
tb1 = FILTER tb BY firstname MATCHES 'M.*' OR firstname MATCHES 'N.*' OR firstname MATCHES 'O.*' OR firstname MATCHES 'P.*' OR firstname MATCHES 'Q.*' OR firstname MATCHES 'R.*' OR firstname MATCHES 'S.*' OR firstname MATCHES 'T.*' OR firstname MATCHES 'U.*' OR firstname MATCHES 'V.*' OR firstname MATCHES 'W.*' OR firstname MATCHES 'X.*' OR firstname MATCHES 'Y.*' OR firstname MATCHES 'Z.*';

STORE tb1 INTO 'output' USING PigStorage(',');