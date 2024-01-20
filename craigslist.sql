DROP DATABASE IF EXISTS craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db

CREATE TABLE "Category"(
id integer NOT NULL, "Category_name" text,
  CONSTRAINT "Category_pkey" PRIMARY KEY(id)
);

CREATE TABLE "Posts"(
  id integer NOT NULL,
  "Title" text,
  "Text" text,
  "User_id" integer,
  "Region_id" integer,
  "Category_id" integer,
  CONSTRAINT "Posts_pkey" PRIMARY KEY(id),
  CONSTRAINT "Posts_key" UNIQUE("Category_id")
);

CREATE TABLE "Regions"(
id integer NOT NULL, "Region name" text,
  CONSTRAINT "Regions_pkey" PRIMARY KEY(id)
);

CREATE TABLE "Users"(
  id integer NOT NULL,
  "Preferred region" text,
  "Name" text,
  CONSTRAINT "Users_pkey" PRIMARY KEY(id),
  CONSTRAINT "Users_key" UNIQUE("Name")
);

ALTER TABLE "Users"
  ADD CONSTRAINT "Users_Preferred region_fkey"
    FOREIGN KEY ("Preferred region") REFERENCES "Regions" (id);

ALTER TABLE "Posts"
  ADD CONSTRAINT "Posts_id_fkey" FOREIGN KEY (id) REFERENCES "Users" ("Name");

ALTER TABLE "Posts"
  ADD CONSTRAINT "Posts_Region_id_fkey"
    FOREIGN KEY ("Region_id") REFERENCES "Regions" (id);

ALTER TABLE "Posts"
  ADD CONSTRAINT "Posts_User_id_fkey"
    FOREIGN KEY ("User_id") REFERENCES "Users" (id);

ALTER TABLE "Category"
  ADD CONSTRAINT "Category_id_fkey"
    FOREIGN KEY (id) REFERENCES "Posts" ("Category_id");
