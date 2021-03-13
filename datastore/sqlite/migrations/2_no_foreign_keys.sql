CREATE TABLE IF NOT EXISTS file_new (
    "id" text NOT NULL,
    "drive" text NOT NULL,
    "name" text NOT NULL,
    "parent" text NOT NULL,
    "size" integer NOT NULL,
    "md5" text NOT NULL,
    "trashed" boolean NOT NULL,
    PRIMARY KEY(id, drive)
);

CREATE TABLE IF NOT EXISTS folder_new (
    "id" text NOT NULL,
    "drive" text NOT NULL,
    "name" text NOT NULL,
    "trashed" boolean NOT NULL,
    "parent" text,
    PRIMARY KEY(id, drive)
);

INSERT INTO file_new SELECT * FROM file;
INSERT INTO folder_new SELECT * FROM folder;

DROP TABLE file;
DROP TABLE folder;

ALTER TABLE file_new RENAME TO file;
ALTER TABLE folder_new RENAME TO folder;
