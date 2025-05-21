--liquibase formatted.sql
--changeset michael.cawayan:MONITOR.RTDM_LOG_IF145_CONTRACT_MISTAKE contextFilter:PH endDelimiter:/ runOnChange:true

DECLARE    
exc_already_exists EXCEPTION;    
PRAGMA EXCEPTION_INIT(exc_already_exists, -0955);
BEGIN    
EXECUTE IMMEDIATE q'{
CREATE TABLE MONITOR.RTDM_LOG_IF145_CONTRACT_MISTAKE (
LOG_CONTRACT_MIS_ID  NUMBER
,CORRELATION_ID	VARCHAR2(128 CHAR)
,EVENT_NAME	VARCHAR2(128 CHAR)
,EVENT_TIMESTAMP	TIMESTAMP(6)
,STATUS  VARCHAR2(15 CHAR)
,STATUS_DESCRIPTION  VARCHAR2(1024 CHAR)
,RTDM_HOSTNAME	VARCHAR2(50 CHAR)
,STRATEGY_NAME	VARCHAR2(50 CHAR)
,LOG_SOURCE	VARCHAR2(10 CHAR)
,CUID  NUMBER
,tckAttachmentsComment                   	VARCHAR2(128 CHAR)
,tckAttachmentsExternalId               	VARCHAR2(128 CHAR)
,tckAttachmentsFileName                 	VARCHAR2(128 CHAR)
,tckCategoryCode                         	VARCHAR2(128 CHAR)
,tckCreatedByUid                         	VARCHAR2(128 CHAR)
,TCKCREATIONDATE                        DATE
,CREATED_DTTM                         	Date
,UPDATED_DTTM                           DATE
,tckDepartmentCode                       	VARCHAR2(128 CHAR)
,tckDepartmentFrontOfficeFlag           	Integer
,tckDescription                           	VARCHAR2(128 CHAR)
,tckId                                   	VARCHAR2(128 CHAR)
,tckModificationDate                     	Date
,tckModifiedBy                           	VARCHAR2(128 CHAR)
,tckPriorityCode                         	VARCHAR2(128 CHAR)
,tckRelatedSubjectsCode                 	VARCHAR2(128 CHAR)
,tckRelatedSubjectsType                 	VARCHAR2(128 CHAR)
,tckResolutionTime                       	INTEGER
,tckResponseTime                         	INTEGER
,tckStatusCode                           	VARCHAR2(128 CHAR)
,tckTransitionsAssignedTo               	VARCHAR2(128 CHAR)
,tckTransitionsComment                   	VARCHAR2(128 CHAR)
,tckTransitionsCreatedByUid             	VARCHAR2(128 CHAR)
,tckTransitionsDepartmentCode           	VARCHAR2(128 CHAR)
,tckTransitionsDeptFrontOfficeFlg	VARCHAR2(128 CHAR)
,tckTransitionsOriginatedByUid         	VARCHAR2(128 CHAR)
,tckTransitionsStatusCode               	VARCHAR2(128 CHAR)
,tckTypeCode                             	VARCHAR2(128 CHAR)
,tckTypeSpecCode                         	VARCHAR2(128 CHAR)
,tckTransitionsCreationDate             	DATE
,CONSTRAINT "RTDM_LOG_IF145_PK" PRIMARY KEY ("LOG_CONTRACT_MIS_ID") USING INDEX  ENABLE)  
PARTITION BY RANGE ("CREATED_DTTM") INTERVAL (NUMTODSINTERVAL(1, 'DAY'))  
(PARTITION "PINIT"  VALUES LESS THAN (TIMESTAMP' 2025-12-01 00:00:00') 
)
}';
EXCEPTION    
WHEN exc_already_exists 
THEN NULL;
END;
/
GRANT SELECT, INSERT, UPDATE, DELETE ON MONITOR.RTDM_LOG_IF145_CONTRACT_MISTAKE TO MA_TEMP
/
GRANT SELECT, INSERT, UPDATE, DELETE ON MONITOR.RTDM_LOG_IF145_CONTRACT_MISTAKE TO ESP_USER
/
GRANT SELECT ON MONITOR.RTDM_LOG_IF145_CONTRACT_MISTAKE TO HCI_RO_MONITOR
/