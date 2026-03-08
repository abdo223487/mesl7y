BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "admins" (
    "id" bigserial PRIMARY KEY,
    "email" text NOT NULL,
    "passwordHash" text NOT NULL,
    "name" text,
    "createdAt" timestamp without time zone NOT NULL,
    "isActive" boolean NOT NULL DEFAULT true
);

-- Indexes
CREATE UNIQUE INDEX "admin_email_unique_idx" ON "admins" USING btree ("email");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "customers" (
    "id" bigserial PRIMARY KEY,
    "email" text NOT NULL,
    "passwordHash" text NOT NULL,
    "name" text,
    "createdAt" timestamp without time zone NOT NULL,
    "isActive" boolean NOT NULL DEFAULT true
);

-- Indexes
CREATE UNIQUE INDEX "customer_email_unique_idx" ON "customers" USING btree ("email");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "refresh_tokens" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "token" text NOT NULL,
    "isAdmin" boolean NOT NULL DEFAULT false,
    "expiresAt" timestamp without time zone NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "isRevoked" boolean NOT NULL DEFAULT false
);

-- Indexes
CREATE UNIQUE INDEX "refresh_token_idx" ON "refresh_tokens" USING btree ("token");
CREATE INDEX "refresh_token_user_idx" ON "refresh_tokens" USING btree ("userId");


--
-- MIGRATION VERSION FOR my_mesl7y_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('my_mesl7y_app', '20260308170237297', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260308170237297', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
