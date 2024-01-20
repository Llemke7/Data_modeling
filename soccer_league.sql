DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE "Dates"(
  id integer NOT NULL,
  "Start_date" integer,
  "End_date" integer,
  CONSTRAINT "Dates_pkey" PRIMARY KEY(id)
);

CREATE TABLE "Goals"(
  id integer NOT NULL,
  "Num_of_goals" integer,
  CONSTRAINT "Goals_pkey" PRIMARY KEY(id),
  CONSTRAINT "Goals_key" UNIQUE("Num_of_goals")
);

CREATE TABLE "Matches"(
id integer NOT NULL, "Num_of_matches" integer,
  CONSTRAINT "Matches_pkey" PRIMARY KEY(id)
);

CREATE TABLE "Players"(
  id integer NOT NULL,
  player_name text,
  "Num_of_goals" integer,
  "Teams_id" integer NOT NULL,
  CONSTRAINT "Players_pkey" PRIMARY KEY(id)
);

CREATE TABLE "Referees"(
  id integer NOT NULL,
  ref_name text,
  "Matches_reffed" interval,
  "Dates_id" integer NOT NULL,
  CONSTRAINT "Referees_pkey" PRIMARY KEY(id),
  CONSTRAINT "Referees_key" UNIQUE("Matches_reffed")
);

CREATE TABLE "Standings"(
  id integer NOT NULL,
  "Team_name" text,
  "Standing" integer,
  "Dates_id" integer NOT NULL,
  CONSTRAINT "Standings_pkey" PRIMARY KEY(id)
);

CREATE TABLE "Teams"(
  id integer NOT NULL,
  "Team_name" text,
  CONSTRAINT "Teams_pkey" PRIMARY KEY(id),
  CONSTRAINT "Teams_key" UNIQUE("Team_name")
);

ALTER TABLE "Players"
  ADD CONSTRAINT "Players_Num_of_goals_fkey"
    FOREIGN KEY ("Num_of_goals") REFERENCES "Goals" ("Num_of_goals");

ALTER TABLE "Matches"
  ADD CONSTRAINT "Matches_Num_of_matches_fkey"
    FOREIGN KEY ("Num_of_matches") REFERENCES "Teams" ("Team_name");

ALTER TABLE "Matches"
  ADD CONSTRAINT "Matches_id_fkey"
    FOREIGN KEY (id) REFERENCES "Referees" ("Matches_reffed");

ALTER TABLE "Standings"
  ADD CONSTRAINT "Standings_Standing_fkey"
    FOREIGN KEY ("Standing") REFERENCES "Teams" ("Team_name");

ALTER TABLE "Standings"
  ADD CONSTRAINT "Standings_Team_name_fkey"
    FOREIGN KEY ("Team_name") REFERENCES "Teams" ("Team_name");

ALTER TABLE "Dates"
  ADD CONSTRAINT "Dates_Start_date_fkey"
    FOREIGN KEY ("Start_date") REFERENCES "Teams" (id);

ALTER TABLE "Dates"
  ADD CONSTRAINT "Dates_End_date_fkey"
    FOREIGN KEY ("End_date") REFERENCES "Teams" ("Team_name");

ALTER TABLE "Standings"
  ADD CONSTRAINT "Standings_Dates_id_fkey"
    FOREIGN KEY ("Dates_id") REFERENCES "Dates" (id);

ALTER TABLE "Referees"
  ADD CONSTRAINT "Referees_Dates_id_fkey"
    FOREIGN KEY ("Dates_id") REFERENCES "Dates" (id);

ALTER TABLE "Players"
  ADD CONSTRAINT "Players_Teams_id_fkey"
    FOREIGN KEY ("Teams_id") REFERENCES "Teams" (id);
