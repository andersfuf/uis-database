CREATE OR REPLACE FUNCTION ex941b(
  in_name VARCHAR
) RETURNS void 
-- usefull DDL: ROLLBACK;SET SEARCH_PATH TO movie; COMMIT;
AS
 $PLAN_AL_EX$
DECLARE
  cu_studio_adress CURSOR (in_name studio.name%TYPE) FOR
  SELECT name, address, presc
  FROM studio
  WHERE name = in_name
  ;

  rec_studio record;
BEGIN
  RAISE NOTICE 'ex941b-START : %', in_name;
  RAISE NOTICE 'Given the name of a movie studio (%), produce the address of its president.', in_name;

  --Find the address of the president

  FOR rec_studio IN cu_studio_adress( in_name)
  LOOP
    RAISE NOTICE 'LOOP-record : %', in_name;
    RAISE NOTICE 'studio : % address : % president : % '
    , rec_studio.name, rec_studio.address, rec_studio.presc
    ;
  END LOOP;
  RAISE NOTICE 'END-LOOP-CU : %', in_name;

  RAISE NOTICE 'ex941b-END : %', in_name;
END
$PLAN_AL_EX$
LANGUAGE plpgsql
;
  