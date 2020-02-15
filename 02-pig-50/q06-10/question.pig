-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
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
       
tb = FOREACH u GENERATE FLATTEN(par);
tb0 = FOREACH tb GENERATE $0;
tb1 = GROUP tb0 BY $0;
tb2 = FOREACH tb1 GENERATE $0, COUNT(tb0) AS cuenta;

STORE tb2 INTO 'output' USING PigStorage(',');