-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
u = LOAD 'data.tsv' USING PigStorage('\t') 
    AS (letter:CHARARRAY, 
        dicc:BAG{t:(p:CHARARRAY)}, 
        par:MAP[]);

tb = FOREACH u GENERATE FLATTEN(dicc), FLATTEN(par);
tb1 = FOREACH tb GENERATE $0, $1;
tb2 = GROUP tb1 BY ($0,$1);
tb3 = FOREACH tb2 GENERATE $0, COUNT(tb1) AS cuenta;

STORE tb3 INTO 'output' USING PigStorage('\t');