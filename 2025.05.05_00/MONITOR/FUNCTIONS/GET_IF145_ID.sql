--liquibase formatted.sql
--changeset michael.cawayan:MONITOR.GET_IF145_ID contextFilter:PH endDelimiter:/ runOnChange:true

create or replace FUNCTION MONITOR.GET_IF145_ID
    RETURN NUMBER
    IS
        v_id NUMBER;
    BEGIN
        SELECT  IF145_ID_SEQ.NEXTVAL
                INTO v_id
          FROM  DUAL;
        RETURN v_id;
END;
/