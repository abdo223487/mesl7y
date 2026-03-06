BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "hadith" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "text" text NOT NULL,
    "narrator" text,
    "source" text,
    "category" text
);


--
-- MIGRATION VERSION FOR my_mesl7y_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('my_mesl7y_app', '20260306042011229', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260306042011229', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
