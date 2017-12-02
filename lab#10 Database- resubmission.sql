--Question 1
CREATE OR REPLACE FUNCTION isprereqfor(integer,refcursor)
  RETURNS refcursor AS
$BODY$
DECLARE 
	input_one INT := $1;
	resultset REFCURSOR := $2;
BEGIN 
	OPEN resultset FOR 
	SELECT num, name, credits
	FROM courses c 
	WHERE c.num IN ( SELECT p.coursenum
			FROM prerequisites p
			WHERE prereqnum = input_one);
	RETURN resultset;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
  
--Question 2 
CREATE OR REPLACE FUNCTION prereqsfor(integer, refcursor)
  RETURNS refcursor AS
$BODY$
DECLARE 
	input_one INT := $1;
	resultset REFCURSOR := $2;
BEGIN 
	OPEN resultset FOR 
	SELECT num, name, credits
	FROM courses
	WHERE num IN ( SELECT prereqnum
			FROM prerequisites
			WHERE coursenum = input_one);
	RETURN resultset;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;