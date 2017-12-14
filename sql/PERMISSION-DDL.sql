CREATE TABLE ACTIVITY
  (
    A_ID   INT,
    B_ID   INT,
    TV2_FN VARCHAR2(4000),
    A_ACTION VARCHAR2(4000),
    PRIMARY KEY(A_ID)
  );
/
CREATE TABLE ROLE_TYPE
  (
    RT_ID   INT,
    RT_NAME VARCHAR2(4000) UNIQUE,
    PRIMARY KEY(RT_ID)
  );
/
CREATE TABLE TV2_USER
  (
    TV2_ID       INT,
    TV2_FN       VARCHAR2(4000),
    TV2_LS       VARCHAR2(4000),
    TV2_USERNAME VARCHAR2(4000) UNIQUE NOT NULL,
    TV2_PASSWORD VARCHAR2(4000) NOT NULL,
    TV2_TEAM INT DEFAULT 0,
    RT_ID    INT DEFAULT 1 NOT NULL,
    TV2_EMAIL    VARCHAR2(4000),
    PRIMARY KEY(TV2_ID)
  );
/
CREATE TABLE JOIN_BOARD_REQUEST
  (
    JBR_ID INT,
    TV2_ID       INT,
    TV2_OWNER    INT,
    TV2_TEAM INT,
    S_STATUS INT,
    PRIMARY KEY(JBR_ID)
  );
/
CREATE TABLE STATUS
  (
    S_ID INT,
    S_NAME VARCHAR2(4000),
    PRIMARY KEY(S_ID)
  );
/
CREATE SEQUENCE role_type_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE activity_type_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE tv2_user_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE JOIN_BOARD_REQUEST_seq START WITH 1 INCREMENT BY 1;

/
CREATE OR REPLACE TRIGGER role_type_seq_trg BEFORE
  INSERT ON role_type FOR EACH ROW BEGIN IF :new.rt_id IS NULL THEN
  SELECT role_type_seq.NEXTVAL INTO :new.rt_id FROM dual;
END IF;
END;
/
CREATE OR REPLACE TRIGGER activity_type_seq_trg BEFORE
  INSERT ON activity FOR EACH ROW BEGIN IF :new.a_id IS NULL THEN
  SELECT activity_type_seq.NEXTVAL INTO :new.a_id FROM dual;
END IF;
END;
/
CREATE OR REPLACE TRIGGER activity_type_seq_trg2 BEFORE
  INSERT ON activity FOR EACH ROW BEGIN IF :new.a_id = 0 THEN
  SELECT activity_type_seq.NEXTVAL INTO :new.a_id FROM dual;
END IF;
END;
/
CREATE OR REPLACE TRIGGER user_seq_trg BEFORE
  INSERT ON TV2_USER FOR EACH ROW BEGIN IF :new.TV2_ID IS NULL THEN
  SELECT tv2_user_seq.NEXTVAL INTO :new.TV2_ID FROM dual;
END IF;
END;
/
create or replace TRIGGER user2_seq_trg BEFORE
  INSERT ON TV2_USER FOR EACH ROW BEGIN IF :new.TV2_ID = 0  THEN
  SELECT tv2_user_seq.NEXTVAL INTO :new.TV2_ID FROM dual;
END IF;
END;
/
CREATE OR REPLACE TRIGGER REQUEST_trg BEFORE
  INSERT ON JOIN_BOARD_REQUEST FOR EACH ROW BEGIN IF :new.JBR_ID IS NULL THEN
  SELECT JOIN_BOARD_REQUEST_seq.NEXTVAL INTO :new.JBR_ID FROM dual;
END IF;
END;
/
create or replace TRIGGER REQUEST2_trg BEFORE
  INSERT ON JOIN_BOARD_REQUEST FOR EACH ROW BEGIN IF :new.JBR_ID = 0  THEN
  SELECT JOIN_BOARD_REQUEST_seq.NEXTVAL INTO :new.JBR_ID FROM dual;
END IF;
END;
/
COMMIT;