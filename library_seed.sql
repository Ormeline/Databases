DROP TABLE IF EXISTS "public"."recipes";
-- This script only contains the table creation statements and does not fully represent the table in the
-- database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS recipes_id_seq;

-- Table Definition
CREATE TABLE "public"."recipes"(
    id SERIAL PRIMARY KEY,
    name text,
    average_cooking_time numeric,
    rating numeric
);

INSERT INTO "public"."recipes"("id", "name", "average_cooking_time", "rating") VALUES
(1, 'Maggi special', 20, 3),
(2, 'Chicken fajita', 60, 4),
(3, 'spag bowl', 15, 2);
