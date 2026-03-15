BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "azkar_items" (
    "id" bigserial PRIMARY KEY,
    "category" text NOT NULL,
    "arabicText" text NOT NULL,
    "repeat" bigint NOT NULL,
    "orderIndex" bigint NOT NULL
);

-- Indexes
CREATE INDEX "azkar_category_idx" ON "azkar_items" USING btree ("category");


--
-- MIGRATION VERSION FOR my_mesl7y_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('my_mesl7y_app', '20260315001704447', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260315001704447', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
