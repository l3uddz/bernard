PRAGMA foreign_keys=ON;

CREATE TABLE IF NOT EXISTS file (
    "id" text NOT NULL,
    "drive" text NOT NULL,
    "name" text NOT NULL,
    "parent" text NOT NULL,
    "size" integer NOT NULL,
    "md5" text NOT NULL,
    "trashed" boolean NOT NULL,
    PRIMARY KEY(id, drive),
    FOREIGN KEY(parent, drive) REFERENCES folder(id, drive) DEFERRABLE INITIALLY IMMEDIATE
);

CREATE TABLE IF NOT EXISTS folder (
    "id" text NOT NULL,
    "drive" text NOT NULL,
    "name" text NOT NULL,
    "trashed" boolean NOT NULL,
    "parent" text,
    PRIMARY KEY(id, drive),
    FOREIGN KEY(parent, drive) REFERENCES folder(id, drive) DEFERRABLE INITIALLY IMMEDIATE
);

CREATE TABLE IF NOT EXISTS drive (
    "id" text NOT NULL,
    "pageToken" text NOT NULL,
    PRIMARY KEY(id)
);