DROP DATABASE IF EXISTS med_center;

CREATE DATABASE med_center;

\c med_center

CREATE TABLE "Diseases"(
  id integer NOT NULL,
  "Disease Name" text,
  "Patient_id" integer NOT NULL,
  CONSTRAINT "Diseases_pkey" PRIMARY KEY(id)
);

CREATE TABLE "Doctors"(
  id integer NOT NULL,
  "Name" text,
  "Patient Name" text,
  "Medical Center _id" integer NOT NULL,
  CONSTRAINT "Doctors_pkey" PRIMARY KEY(id)
);

CREATE TABLE "Medical Center "(
id integer NOT NULL, "Name" text,
  CONSTRAINT "Medical Center _pkey" PRIMARY KEY(id)
);

CREATE TABLE "Patient"(
  id integer NOT NULL,
  "Disease ID" integer,
  "Doctors_id" integer NOT NULL,
  "Name" text,
  CONSTRAINT "Patient_pkey" PRIMARY KEY(id)
);

ALTER TABLE "Doctors"
  ADD CONSTRAINT "Doctors_Medical Center _id_fkey"
    FOREIGN KEY ("Medical Center _id") REFERENCES "Medical Center " (id);

ALTER TABLE "Patient"
  ADD CONSTRAINT "Patient_Doctors_id_fkey"
    FOREIGN KEY ("Doctors_id") REFERENCES "Doctors" (id);

ALTER TABLE "Diseases"
  ADD CONSTRAINT "Diseases_Patient_id_fkey"
    FOREIGN KEY ("Patient_id") REFERENCES "Patient" (id);

ALTER TABLE "Patient"
  ADD CONSTRAINT "Patient_Disease ID_fkey"
    FOREIGN KEY ("Disease ID") REFERENCES "Diseases" (id);