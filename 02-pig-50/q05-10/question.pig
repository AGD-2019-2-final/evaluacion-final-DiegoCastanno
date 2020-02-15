-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
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
       
tb = FOREACH u GENERATE FLATTEN(dicc);
tb0 = GROUP tb BY $0;
tb2 = FOREACH tb0 GENERATE $0, COUNT(tb) AS cuenta;

STORE tb2 INTO 'output' USING PigStorage('\t');



