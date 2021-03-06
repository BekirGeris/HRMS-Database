-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE public."Users"
(
    "Id" integer,
    "E-posta" character varying(50),
    "Password" character varying(15),
    PRIMARY KEY ("Id")
)
WITH (
    OIDS = FALSE
);

CREATE TABLE public." Employers"
(
    "UserId" integer,
    "CompanyName" character varying(30),
    "WebSitesi" character varying(100),
    "Telefon" character varying(11),
    PRIMARY KEY ("UserId")
)
WITH (
    OIDS = FALSE
);

CREATE TABLE public."Jop_Seekers"
(
    "UserId" integer,
    "FirstName" character varying(30),
    "LastName" character varying(30),
    " IdentificationNumber" character varying(11),
    " DateOfBirth" date,
    PRIMARY KEY ("UserId")
)
WITH (
    OIDS = FALSE
);

CREATE TABLE public." System_Personnel"
(
    "UserId" integer,
    "FirstName" character varying(30),
    "LastName" character varying(30),
    " Is_it_active" boolean,
    "PositionId" integer,
    PRIMARY KEY ("UserId")
)
WITH (
    OIDS = FALSE
);

CREATE TABLE public."Employer_Activations"
(
    "Id" integer,
    "UserId" integer,
    "ActivationConfirmation" character varying(100),
    " Is_it_active" boolean,
    PRIMARY KEY ("Id")
)
WITH (
    OIDS = FALSE
);

CREATE TABLE public."Jop_Positions"
(
    "Id" integer,
    "JobName" character varying(50),
    "PositionId" integer,
    PRIMARY KEY ("Id")
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public."Users"
    ADD FOREIGN KEY ("Id")
    REFERENCES public." Employers" ("UserId")
    NOT VALID;


ALTER TABLE public."Users"
    ADD FOREIGN KEY ("Id")
    REFERENCES public."Job_Seekers" ("UserId")
    NOT VALID;


ALTER TABLE public."Users"
    ADD FOREIGN KEY ("Id")
    REFERENCES public." System_Personnel" ("UserId")
    NOT VALID;


ALTER TABLE public."Employer_Activations"
    ADD FOREIGN KEY ("UserId")
    REFERENCES public."Users" ("Id")
    NOT VALID;

END;
