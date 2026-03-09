BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "chat_conversations" (
    "id" bigserial PRIMARY KEY,
    "customerId" bigint NOT NULL,
    "adminId" bigint,
    "status" text NOT NULL DEFAULT 'pending'::text,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "chat_conv_customer_idx" ON "chat_conversations" USING btree ("customerId");
CREATE INDEX "chat_conv_status_idx" ON "chat_conversations" USING btree ("status");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "chat_messages" (
    "id" bigserial PRIMARY KEY,
    "conversationId" bigint NOT NULL,
    "senderId" bigint NOT NULL,
    "senderRole" text NOT NULL,
    "message" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "chat_msg_conversation_idx" ON "chat_messages" USING btree ("conversationId");


--
-- MIGRATION VERSION FOR my_mesl7y_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('my_mesl7y_app', '20260309053738903', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260309053738903', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
