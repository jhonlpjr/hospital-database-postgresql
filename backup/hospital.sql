CREATE TABLE public."Patients" (
    "Patient_ID" integer NOT NULL,
    "ID" character varying(20),
    "First_name" character varying(255),
    "Last_name" character varying(255),
    "Email" character varying(255),
    "Phone" character varying(20),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Patients" OWNER TO admin;

CREATE SEQUENCE public."Patients_Patient_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Patients_Patient_ID_seq" OWNER TO admin;

ALTER SEQUENCE public."Patients_Patient_ID_seq" OWNED BY public."Patients"."Patient_ID";

ALTER TABLE ONLY public."Patients" ALTER COLUMN "Patient_ID" SET DEFAULT nextval('public."Patients_Patient_ID_seq"'::regclass);

SELECT pg_catalog.setval('public."Patients_Patient_ID_seq"', 16, true);

ALTER TABLE ONLY public."Patients"
    ADD CONSTRAINT patients_un UNIQUE ("ID");

ALTER TABLE public."Patients" ADD CONSTRAINT patients_pk PRIMARY KEY ("Patient_ID");

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;