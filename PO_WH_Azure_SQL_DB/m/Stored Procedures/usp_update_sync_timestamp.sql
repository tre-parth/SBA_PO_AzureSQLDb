CREATE   PROCEDURE m.usp_update_sync_timestamp @last_sync_timestamp datetime
AS

BEGIN
    INSERT INTO m.primary_to_secondary_container_sync_ver2 (last_sync_timestamp) values (@last_sync_timestamp);
END