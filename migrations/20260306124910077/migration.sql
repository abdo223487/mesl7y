BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "fatwa" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "content" text NOT NULL
);


--
-- MIGRATION VERSION FOR my_mesl7y_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('my_mesl7y_app', '20260306124910077', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260306124910077', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
