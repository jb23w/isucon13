TRUNCATE TABLE themes;
TRUNCATE TABLE icons;
TRUNCATE TABLE reservation_slots;
TRUNCATE TABLE livestream_viewers_history;
TRUNCATE TABLE livecomment_reports;
TRUNCATE TABLE ng_words;
TRUNCATE TABLE reactions;
TRUNCATE TABLE tags;
TRUNCATE TABLE livestream_tags;
TRUNCATE TABLE livecomments;
TRUNCATE TABLE livestreams;
TRUNCATE TABLE users;

ALTER TABLE `themes` auto_increment = 1;
ALTER TABLE `icons` auto_increment = 1;
ALTER TABLE `reservation_slots` auto_increment = 1;
ALTER TABLE `livestream_tags` auto_increment = 1;
ALTER TABLE `livestream_viewers_history` auto_increment = 1;
ALTER TABLE `livecomment_reports` auto_increment = 1;
ALTER TABLE `ng_words` auto_increment = 1;
ALTER TABLE `reactions` auto_increment = 1;
ALTER TABLE `tags` auto_increment = 1;
ALTER TABLE `livecomments` auto_increment = 1;
ALTER TABLE `livestreams` auto_increment = 1;
ALTER TABLE `users` auto_increment = 1;

DROP PROCEDURE IF EXISTS DropIndexIfExists;
delimiter //
CREATE PROCEDURE `DropIndexIfExists`(
    IN i_table_name VARCHAR(128),
    IN i_index_name VARCHAR(128)
    )
    BEGIN

    SET @tableName = i_table_name;
    SET @indexName = i_index_name;
    SET @indexExists = 0;

    SELECT 
        1
    INTO @indexExists FROM
        INFORMATION_SCHEMA.STATISTICS
    WHERE
        TABLE_NAME = @tableName
            AND INDEX_NAME = @indexName;

    SET @query = CONCAT(
        'DROP INDEX ', @indexName, ' ON ', @tableName
    );
    IF @indexExists THEN
        PREPARE stmt FROM @query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;
    END//
delimiter ;

Call DropIndexIfExists('livestream_tags','livestrmtag_live');
CREATE INDEX livestrmtag_live ON livestream_tags (livestream_id);
Call DropIndexIfExists('users','users_name');
CREATE INDEX user_name ON users (`name`);
Call DropIndexIfExists('themes','themes_userid');
CREATE INDEX themes_userid ON themes (user_id);
Call DropIndexIfExists('reservation_slots','reservation_slots_start2end');
CREATE INDEX reservation_slots_start2end ON reservation_slots (start_at,end_at);
Call DropIndexIfExists('livestream_tags','livestream_tags_tagid');
CREATE INDEX livestream_tags_tagid ON livestream_tags (tag_id);
Call DropIndexIfExists('tags','tag_tagid');
CREATE INDEX tag_tagid ON tags (`name`);
Call DropIndexIfExists('icons','icons_user_id');
CREATE INDEX icons_user_id ON icons (user_id);



