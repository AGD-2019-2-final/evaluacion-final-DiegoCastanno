-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
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

tb = FOREACH u GENERATE letter, SIZE(dicc), SIZE(par);
tb1 = ORDER tb BY $0, $1, $2 ASC;

STORE tb1 INTO 'output' USING PigStorage(',');

        
