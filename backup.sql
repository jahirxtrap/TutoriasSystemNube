--
-- PostgreSQL database dump
--

-- Dumped from database version 12.15
-- Dumped by pg_dump version 12.15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: backend_adminhod; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backend_adminhod (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    admin_id integer NOT NULL
);


ALTER TABLE public.backend_adminhod OWNER TO postgres;

--
-- Name: backend_adminhod_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backend_adminhod_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backend_adminhod_id_seq OWNER TO postgres;

--
-- Name: backend_adminhod_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backend_adminhod_id_seq OWNED BY public.backend_adminhod.id;


--
-- Name: backend_attendance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backend_attendance (
    id integer NOT NULL,
    attendance_date date NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    session_year_id_id integer NOT NULL,
    subject_id_id integer NOT NULL
);


ALTER TABLE public.backend_attendance OWNER TO postgres;

--
-- Name: backend_attendance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backend_attendance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backend_attendance_id_seq OWNER TO postgres;

--
-- Name: backend_attendance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backend_attendance_id_seq OWNED BY public.backend_attendance.id;


--
-- Name: backend_attendancereport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backend_attendancereport (
    id integer NOT NULL,
    status boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    attendance_id_id integer NOT NULL,
    student_id_id integer NOT NULL
);


ALTER TABLE public.backend_attendancereport OWNER TO postgres;

--
-- Name: backend_attendancereport_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backend_attendancereport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backend_attendancereport_id_seq OWNER TO postgres;

--
-- Name: backend_attendancereport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backend_attendancereport_id_seq OWNED BY public.backend_attendancereport.id;


--
-- Name: backend_courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backend_courses (
    id integer NOT NULL,
    course_name character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.backend_courses OWNER TO postgres;

--
-- Name: backend_courses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backend_courses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backend_courses_id_seq OWNER TO postgres;

--
-- Name: backend_courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backend_courses_id_seq OWNED BY public.backend_courses.id;


--
-- Name: backend_customuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backend_customuser (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    user_type character varying(10) NOT NULL
);


ALTER TABLE public.backend_customuser OWNER TO postgres;

--
-- Name: backend_customuser_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backend_customuser_groups (
    id integer NOT NULL,
    customuser_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.backend_customuser_groups OWNER TO postgres;

--
-- Name: backend_customuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backend_customuser_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backend_customuser_groups_id_seq OWNER TO postgres;

--
-- Name: backend_customuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backend_customuser_groups_id_seq OWNED BY public.backend_customuser_groups.id;


--
-- Name: backend_customuser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backend_customuser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backend_customuser_id_seq OWNER TO postgres;

--
-- Name: backend_customuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backend_customuser_id_seq OWNED BY public.backend_customuser.id;


--
-- Name: backend_customuser_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backend_customuser_user_permissions (
    id integer NOT NULL,
    customuser_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.backend_customuser_user_permissions OWNER TO postgres;

--
-- Name: backend_customuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backend_customuser_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backend_customuser_user_permissions_id_seq OWNER TO postgres;

--
-- Name: backend_customuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backend_customuser_user_permissions_id_seq OWNED BY public.backend_customuser_user_permissions.id;


--
-- Name: backend_feedbackstaffs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backend_feedbackstaffs (
    id integer NOT NULL,
    feedback text NOT NULL,
    feedback_reply text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    staff_id_id integer NOT NULL
);


ALTER TABLE public.backend_feedbackstaffs OWNER TO postgres;

--
-- Name: backend_feedbackstaffs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backend_feedbackstaffs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backend_feedbackstaffs_id_seq OWNER TO postgres;

--
-- Name: backend_feedbackstaffs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backend_feedbackstaffs_id_seq OWNED BY public.backend_feedbackstaffs.id;


--
-- Name: backend_feedbackstudent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backend_feedbackstudent (
    id integer NOT NULL,
    feedback text NOT NULL,
    feedback_reply text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    student_id_id integer NOT NULL
);


ALTER TABLE public.backend_feedbackstudent OWNER TO postgres;

--
-- Name: backend_feedbackstudent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backend_feedbackstudent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backend_feedbackstudent_id_seq OWNER TO postgres;

--
-- Name: backend_feedbackstudent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backend_feedbackstudent_id_seq OWNED BY public.backend_feedbackstudent.id;


--
-- Name: backend_leavereportstaff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backend_leavereportstaff (
    id integer NOT NULL,
    leave_date character varying(255) NOT NULL,
    leave_message text NOT NULL,
    leave_status integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    staff_id_id integer NOT NULL
);


ALTER TABLE public.backend_leavereportstaff OWNER TO postgres;

--
-- Name: backend_leavereportstaff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backend_leavereportstaff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backend_leavereportstaff_id_seq OWNER TO postgres;

--
-- Name: backend_leavereportstaff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backend_leavereportstaff_id_seq OWNED BY public.backend_leavereportstaff.id;


--
-- Name: backend_leavereportstudent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backend_leavereportstudent (
    id integer NOT NULL,
    leave_date character varying(255) NOT NULL,
    leave_message text NOT NULL,
    leave_status integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    student_id_id integer NOT NULL
);


ALTER TABLE public.backend_leavereportstudent OWNER TO postgres;

--
-- Name: backend_leavereportstudent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backend_leavereportstudent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backend_leavereportstudent_id_seq OWNER TO postgres;

--
-- Name: backend_leavereportstudent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backend_leavereportstudent_id_seq OWNED BY public.backend_leavereportstudent.id;


--
-- Name: backend_notificationstaffs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backend_notificationstaffs (
    id integer NOT NULL,
    message text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    stafff_id_id integer NOT NULL
);


ALTER TABLE public.backend_notificationstaffs OWNER TO postgres;

--
-- Name: backend_notificationstaffs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backend_notificationstaffs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backend_notificationstaffs_id_seq OWNER TO postgres;

--
-- Name: backend_notificationstaffs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backend_notificationstaffs_id_seq OWNED BY public.backend_notificationstaffs.id;


--
-- Name: backend_notificationstudent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backend_notificationstudent (
    id integer NOT NULL,
    message text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    student_id_id integer NOT NULL
);


ALTER TABLE public.backend_notificationstudent OWNER TO postgres;

--
-- Name: backend_notificationstudent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backend_notificationstudent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backend_notificationstudent_id_seq OWNER TO postgres;

--
-- Name: backend_notificationstudent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backend_notificationstudent_id_seq OWNED BY public.backend_notificationstudent.id;


--
-- Name: backend_sessionyearmodel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backend_sessionyearmodel (
    id integer NOT NULL,
    session_start_year date NOT NULL,
    session_end_year date NOT NULL
);


ALTER TABLE public.backend_sessionyearmodel OWNER TO postgres;

--
-- Name: backend_sessionyearmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backend_sessionyearmodel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backend_sessionyearmodel_id_seq OWNER TO postgres;

--
-- Name: backend_sessionyearmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backend_sessionyearmodel_id_seq OWNED BY public.backend_sessionyearmodel.id;


--
-- Name: backend_staffs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backend_staffs (
    id integer NOT NULL,
    address text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    admin_id integer NOT NULL
);


ALTER TABLE public.backend_staffs OWNER TO postgres;

--
-- Name: backend_staffs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backend_staffs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backend_staffs_id_seq OWNER TO postgres;

--
-- Name: backend_staffs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backend_staffs_id_seq OWNED BY public.backend_staffs.id;


--
-- Name: backend_studentresult; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backend_studentresult (
    id integer NOT NULL,
    subject_exam_marks double precision NOT NULL,
    subject_assignment_marks double precision NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    student_id_id integer NOT NULL,
    subject_id_id integer NOT NULL
);


ALTER TABLE public.backend_studentresult OWNER TO postgres;

--
-- Name: backend_studentresult_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backend_studentresult_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backend_studentresult_id_seq OWNER TO postgres;

--
-- Name: backend_studentresult_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backend_studentresult_id_seq OWNED BY public.backend_studentresult.id;


--
-- Name: backend_students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backend_students (
    id integer NOT NULL,
    gender character varying(50) NOT NULL,
    profile_pic character varying(100) NOT NULL,
    address text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    admin_id integer NOT NULL,
    course_id_id integer NOT NULL,
    session_year_id_id integer NOT NULL
);


ALTER TABLE public.backend_students OWNER TO postgres;

--
-- Name: backend_students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backend_students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backend_students_id_seq OWNER TO postgres;

--
-- Name: backend_students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backend_students_id_seq OWNED BY public.backend_students.id;


--
-- Name: backend_subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backend_subjects (
    id integer NOT NULL,
    subject_name character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    course_id_id integer NOT NULL,
    staff_id_id integer NOT NULL
);


ALTER TABLE public.backend_subjects OWNER TO postgres;

--
-- Name: backend_subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backend_subjects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backend_subjects_id_seq OWNER TO postgres;

--
-- Name: backend_subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backend_subjects_id_seq OWNED BY public.backend_subjects.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: backend_adminhod id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_adminhod ALTER COLUMN id SET DEFAULT nextval('public.backend_adminhod_id_seq'::regclass);


--
-- Name: backend_attendance id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_attendance ALTER COLUMN id SET DEFAULT nextval('public.backend_attendance_id_seq'::regclass);


--
-- Name: backend_attendancereport id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_attendancereport ALTER COLUMN id SET DEFAULT nextval('public.backend_attendancereport_id_seq'::regclass);


--
-- Name: backend_courses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_courses ALTER COLUMN id SET DEFAULT nextval('public.backend_courses_id_seq'::regclass);


--
-- Name: backend_customuser id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_customuser ALTER COLUMN id SET DEFAULT nextval('public.backend_customuser_id_seq'::regclass);


--
-- Name: backend_customuser_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_customuser_groups ALTER COLUMN id SET DEFAULT nextval('public.backend_customuser_groups_id_seq'::regclass);


--
-- Name: backend_customuser_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_customuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.backend_customuser_user_permissions_id_seq'::regclass);


--
-- Name: backend_feedbackstaffs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_feedbackstaffs ALTER COLUMN id SET DEFAULT nextval('public.backend_feedbackstaffs_id_seq'::regclass);


--
-- Name: backend_feedbackstudent id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_feedbackstudent ALTER COLUMN id SET DEFAULT nextval('public.backend_feedbackstudent_id_seq'::regclass);


--
-- Name: backend_leavereportstaff id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_leavereportstaff ALTER COLUMN id SET DEFAULT nextval('public.backend_leavereportstaff_id_seq'::regclass);


--
-- Name: backend_leavereportstudent id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_leavereportstudent ALTER COLUMN id SET DEFAULT nextval('public.backend_leavereportstudent_id_seq'::regclass);


--
-- Name: backend_notificationstaffs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_notificationstaffs ALTER COLUMN id SET DEFAULT nextval('public.backend_notificationstaffs_id_seq'::regclass);


--
-- Name: backend_notificationstudent id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_notificationstudent ALTER COLUMN id SET DEFAULT nextval('public.backend_notificationstudent_id_seq'::regclass);


--
-- Name: backend_sessionyearmodel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_sessionyearmodel ALTER COLUMN id SET DEFAULT nextval('public.backend_sessionyearmodel_id_seq'::regclass);


--
-- Name: backend_staffs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_staffs ALTER COLUMN id SET DEFAULT nextval('public.backend_staffs_id_seq'::regclass);


--
-- Name: backend_studentresult id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_studentresult ALTER COLUMN id SET DEFAULT nextval('public.backend_studentresult_id_seq'::regclass);


--
-- Name: backend_students id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_students ALTER COLUMN id SET DEFAULT nextval('public.backend_students_id_seq'::regclass);


--
-- Name: backend_subjects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_subjects ALTER COLUMN id SET DEFAULT nextval('public.backend_subjects_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add session year model	6	add_sessionyearmodel
22	Can change session year model	6	change_sessionyearmodel
23	Can delete session year model	6	delete_sessionyearmodel
24	Can view session year model	6	view_sessionyearmodel
25	Can add user	7	add_customuser
26	Can change user	7	change_customuser
27	Can delete user	7	delete_customuser
28	Can view user	7	view_customuser
29	Can add admin hod	8	add_adminhod
30	Can change admin hod	8	change_adminhod
31	Can delete admin hod	8	delete_adminhod
32	Can view admin hod	8	view_adminhod
33	Can add staffs	9	add_staffs
34	Can change staffs	9	change_staffs
35	Can delete staffs	9	delete_staffs
36	Can view staffs	9	view_staffs
37	Can add courses	10	add_courses
38	Can change courses	10	change_courses
39	Can delete courses	10	delete_courses
40	Can view courses	10	view_courses
41	Can add subjects	11	add_subjects
42	Can change subjects	11	change_subjects
43	Can delete subjects	11	delete_subjects
44	Can view subjects	11	view_subjects
45	Can add students	12	add_students
46	Can change students	12	change_students
47	Can delete students	12	delete_students
48	Can view students	12	view_students
49	Can add attendance	13	add_attendance
50	Can change attendance	13	change_attendance
51	Can delete attendance	13	delete_attendance
52	Can view attendance	13	view_attendance
53	Can add attendance report	14	add_attendancereport
54	Can change attendance report	14	change_attendancereport
55	Can delete attendance report	14	delete_attendancereport
56	Can view attendance report	14	view_attendancereport
57	Can add leave report student	15	add_leavereportstudent
58	Can change leave report student	15	change_leavereportstudent
59	Can delete leave report student	15	delete_leavereportstudent
60	Can view leave report student	15	view_leavereportstudent
61	Can add leave report staff	16	add_leavereportstaff
62	Can change leave report staff	16	change_leavereportstaff
63	Can delete leave report staff	16	delete_leavereportstaff
64	Can view leave report staff	16	view_leavereportstaff
65	Can add feed back student	17	add_feedbackstudent
66	Can change feed back student	17	change_feedbackstudent
67	Can delete feed back student	17	delete_feedbackstudent
68	Can view feed back student	17	view_feedbackstudent
69	Can add feed back staffs	18	add_feedbackstaffs
70	Can change feed back staffs	18	change_feedbackstaffs
71	Can delete feed back staffs	18	delete_feedbackstaffs
72	Can view feed back staffs	18	view_feedbackstaffs
73	Can add notification student	19	add_notificationstudent
74	Can change notification student	19	change_notificationstudent
75	Can delete notification student	19	delete_notificationstudent
76	Can view notification student	19	view_notificationstudent
77	Can add notification staffs	20	add_notificationstaffs
78	Can change notification staffs	20	change_notificationstaffs
79	Can delete notification staffs	20	delete_notificationstaffs
80	Can view notification staffs	20	view_notificationstaffs
81	Can add student result	21	add_studentresult
82	Can change student result	21	change_studentresult
83	Can delete student result	21	delete_studentresult
84	Can view student result	21	view_studentresult
\.


--
-- Data for Name: backend_adminhod; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backend_adminhod (id, created_at, updated_at, admin_id) FROM stdin;
1	2023-08-08 13:16:48.215406-05	2023-08-08 13:16:48.218735-05	1
\.


--
-- Data for Name: backend_attendance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backend_attendance (id, attendance_date, created_at, updated_at, session_year_id_id, subject_id_id) FROM stdin;
\.


--
-- Data for Name: backend_attendancereport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backend_attendancereport (id, status, created_at, updated_at, attendance_id_id, student_id_id) FROM stdin;
\.


--
-- Data for Name: backend_courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backend_courses (id, course_name, created_at, updated_at) FROM stdin;
1	Sistemas Distribuidos	2023-08-08 13:18:11.798609-05	2023-08-08 13:18:11.798609-05
\.


--
-- Data for Name: backend_customuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backend_customuser (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, user_type) FROM stdin;
1	pbkdf2_sha256$180000$aL1gSh4kYb1K$oLw6R8M8EPZ1PJapmt0TpXUVKRJ67CzR5bPzDxDle5c=	2023-08-08 13:17:41.784309-05	t	admin			admin@gmail.com	t	t	2023-08-08 13:16:48.108159-05	1
\.


--
-- Data for Name: backend_customuser_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backend_customuser_groups (id, customuser_id, group_id) FROM stdin;
\.


--
-- Data for Name: backend_customuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backend_customuser_user_permissions (id, customuser_id, permission_id) FROM stdin;
\.


--
-- Data for Name: backend_feedbackstaffs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backend_feedbackstaffs (id, feedback, feedback_reply, created_at, updated_at, staff_id_id) FROM stdin;
\.


--
-- Data for Name: backend_feedbackstudent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backend_feedbackstudent (id, feedback, feedback_reply, created_at, updated_at, student_id_id) FROM stdin;
\.


--
-- Data for Name: backend_leavereportstaff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backend_leavereportstaff (id, leave_date, leave_message, leave_status, created_at, updated_at, staff_id_id) FROM stdin;
\.


--
-- Data for Name: backend_leavereportstudent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backend_leavereportstudent (id, leave_date, leave_message, leave_status, created_at, updated_at, student_id_id) FROM stdin;
\.


--
-- Data for Name: backend_notificationstaffs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backend_notificationstaffs (id, message, created_at, updated_at, stafff_id_id) FROM stdin;
\.


--
-- Data for Name: backend_notificationstudent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backend_notificationstudent (id, message, created_at, updated_at, student_id_id) FROM stdin;
\.


--
-- Data for Name: backend_sessionyearmodel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backend_sessionyearmodel (id, session_start_year, session_end_year) FROM stdin;
\.


--
-- Data for Name: backend_staffs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backend_staffs (id, address, created_at, updated_at, admin_id) FROM stdin;
\.


--
-- Data for Name: backend_studentresult; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backend_studentresult (id, subject_exam_marks, subject_assignment_marks, created_at, updated_at, student_id_id, subject_id_id) FROM stdin;
\.


--
-- Data for Name: backend_students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backend_students (id, gender, profile_pic, address, created_at, updated_at, admin_id, course_id_id, session_year_id_id) FROM stdin;
\.


--
-- Data for Name: backend_subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backend_subjects (id, subject_name, created_at, updated_at, course_id_id, staff_id_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	backend	sessionyearmodel
7	backend	customuser
8	backend	adminhod
9	backend	staffs
10	backend	courses
11	backend	subjects
12	backend	students
13	backend	attendance
14	backend	attendancereport
15	backend	leavereportstudent
16	backend	leavereportstaff
17	backend	feedbackstudent
18	backend	feedbackstaffs
19	backend	notificationstudent
20	backend	notificationstaffs
21	backend	studentresult
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-08-08 17:48:19.627675-05
2	contenttypes	0002_remove_content_type_name	2023-08-08 17:48:19.636191-05
3	auth	0001_initial	2023-08-08 17:48:19.662404-05
4	auth	0002_alter_permission_name_max_length	2023-08-08 17:48:19.697098-05
5	auth	0003_alter_user_email_max_length	2023-08-08 17:48:19.702239-05
6	auth	0004_alter_user_username_opts	2023-08-08 17:48:19.707243-05
7	auth	0005_alter_user_last_login_null	2023-08-08 17:48:19.711466-05
8	auth	0006_require_contenttypes_0002	2023-08-08 17:48:19.714359-05
9	auth	0007_alter_validators_add_error_messages	2023-08-08 17:48:19.719368-05
10	auth	0008_alter_user_username_max_length	2023-08-08 17:48:19.724886-05
11	auth	0009_alter_user_last_name_max_length	2023-08-08 17:48:19.728893-05
12	auth	0010_alter_group_name_max_length	2023-08-08 17:48:19.736397-05
13	auth	0011_update_proxy_permissions	2023-08-08 17:48:19.74273-05
14	backend	0001_initial	2023-08-08 17:48:19.968461-05
15	admin	0001_initial	2023-08-08 17:48:20.081835-05
16	admin	0002_logentry_remove_auto_add	2023-08-08 17:48:20.101384-05
17	admin	0003_logentry_add_action_flag_choices	2023-08-08 17:48:20.111478-05
18	sessions	0001_initial	2023-08-08 17:48:20.119485-05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
r9fdli0m3ygusho3r08z4e6vm9ce74c6	ODA0MjIyZGVlMjJiNDQ4MjY4OTU4MTZjN2JhYjg4M2UzMTkwMDY5MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYmFja2VuZC5FbWFpbEJhY2tFbmQuRW1haWxCYWNrRW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjQ1NzU4YmQ0MWFjNDc5NTllYmFlNjRlNjg5NmIxZTczMjVmN2ZhMyJ9	2023-08-22 13:17:41.78533-05
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 84, true);


--
-- Name: backend_adminhod_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backend_adminhod_id_seq', 1, true);


--
-- Name: backend_attendance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backend_attendance_id_seq', 1, false);


--
-- Name: backend_attendancereport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backend_attendancereport_id_seq', 1, false);


--
-- Name: backend_courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backend_courses_id_seq', 1, true);


--
-- Name: backend_customuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backend_customuser_groups_id_seq', 1, false);


--
-- Name: backend_customuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backend_customuser_id_seq', 1, true);


--
-- Name: backend_customuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backend_customuser_user_permissions_id_seq', 1, false);


--
-- Name: backend_feedbackstaffs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backend_feedbackstaffs_id_seq', 1, false);


--
-- Name: backend_feedbackstudent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backend_feedbackstudent_id_seq', 1, false);


--
-- Name: backend_leavereportstaff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backend_leavereportstaff_id_seq', 1, false);


--
-- Name: backend_leavereportstudent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backend_leavereportstudent_id_seq', 1, false);


--
-- Name: backend_notificationstaffs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backend_notificationstaffs_id_seq', 1, false);


--
-- Name: backend_notificationstudent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backend_notificationstudent_id_seq', 1, false);


--
-- Name: backend_sessionyearmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backend_sessionyearmodel_id_seq', 1, false);


--
-- Name: backend_staffs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backend_staffs_id_seq', 1, false);


--
-- Name: backend_studentresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backend_studentresult_id_seq', 1, false);


--
-- Name: backend_students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backend_students_id_seq', 1, false);


--
-- Name: backend_subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backend_subjects_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 21, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 18, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: backend_adminhod backend_adminhod_admin_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_adminhod
    ADD CONSTRAINT backend_adminhod_admin_id_key UNIQUE (admin_id);


--
-- Name: backend_adminhod backend_adminhod_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_adminhod
    ADD CONSTRAINT backend_adminhod_pkey PRIMARY KEY (id);


--
-- Name: backend_attendance backend_attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_attendance
    ADD CONSTRAINT backend_attendance_pkey PRIMARY KEY (id);


--
-- Name: backend_attendancereport backend_attendancereport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_attendancereport
    ADD CONSTRAINT backend_attendancereport_pkey PRIMARY KEY (id);


--
-- Name: backend_courses backend_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_courses
    ADD CONSTRAINT backend_courses_pkey PRIMARY KEY (id);


--
-- Name: backend_customuser_groups backend_customuser_groups_customuser_id_group_id_a4f8c55e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_customuser_groups
    ADD CONSTRAINT backend_customuser_groups_customuser_id_group_id_a4f8c55e_uniq UNIQUE (customuser_id, group_id);


--
-- Name: backend_customuser_groups backend_customuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_customuser_groups
    ADD CONSTRAINT backend_customuser_groups_pkey PRIMARY KEY (id);


--
-- Name: backend_customuser backend_customuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_customuser
    ADD CONSTRAINT backend_customuser_pkey PRIMARY KEY (id);


--
-- Name: backend_customuser_user_permissions backend_customuser_user__customuser_id_permission_ca2b53b6_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_customuser_user_permissions
    ADD CONSTRAINT backend_customuser_user__customuser_id_permission_ca2b53b6_uniq UNIQUE (customuser_id, permission_id);


--
-- Name: backend_customuser_user_permissions backend_customuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_customuser_user_permissions
    ADD CONSTRAINT backend_customuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: backend_customuser backend_customuser_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_customuser
    ADD CONSTRAINT backend_customuser_username_key UNIQUE (username);


--
-- Name: backend_feedbackstaffs backend_feedbackstaffs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_feedbackstaffs
    ADD CONSTRAINT backend_feedbackstaffs_pkey PRIMARY KEY (id);


--
-- Name: backend_feedbackstudent backend_feedbackstudent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_feedbackstudent
    ADD CONSTRAINT backend_feedbackstudent_pkey PRIMARY KEY (id);


--
-- Name: backend_leavereportstaff backend_leavereportstaff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_leavereportstaff
    ADD CONSTRAINT backend_leavereportstaff_pkey PRIMARY KEY (id);


--
-- Name: backend_leavereportstudent backend_leavereportstudent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_leavereportstudent
    ADD CONSTRAINT backend_leavereportstudent_pkey PRIMARY KEY (id);


--
-- Name: backend_notificationstaffs backend_notificationstaffs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_notificationstaffs
    ADD CONSTRAINT backend_notificationstaffs_pkey PRIMARY KEY (id);


--
-- Name: backend_notificationstudent backend_notificationstudent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_notificationstudent
    ADD CONSTRAINT backend_notificationstudent_pkey PRIMARY KEY (id);


--
-- Name: backend_sessionyearmodel backend_sessionyearmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_sessionyearmodel
    ADD CONSTRAINT backend_sessionyearmodel_pkey PRIMARY KEY (id);


--
-- Name: backend_staffs backend_staffs_admin_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_staffs
    ADD CONSTRAINT backend_staffs_admin_id_key UNIQUE (admin_id);


--
-- Name: backend_staffs backend_staffs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_staffs
    ADD CONSTRAINT backend_staffs_pkey PRIMARY KEY (id);


--
-- Name: backend_studentresult backend_studentresult_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_studentresult
    ADD CONSTRAINT backend_studentresult_pkey PRIMARY KEY (id);


--
-- Name: backend_students backend_students_admin_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_students
    ADD CONSTRAINT backend_students_admin_id_key UNIQUE (admin_id);


--
-- Name: backend_students backend_students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_students
    ADD CONSTRAINT backend_students_pkey PRIMARY KEY (id);


--
-- Name: backend_subjects backend_subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_subjects
    ADD CONSTRAINT backend_subjects_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: backend_attendance_session_year_id_id_e830024c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backend_attendance_session_year_id_id_e830024c ON public.backend_attendance USING btree (session_year_id_id);


--
-- Name: backend_attendance_subject_id_id_f66f08c5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backend_attendance_subject_id_id_f66f08c5 ON public.backend_attendance USING btree (subject_id_id);


--
-- Name: backend_attendancereport_attendance_id_id_5f0ef446; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backend_attendancereport_attendance_id_id_5f0ef446 ON public.backend_attendancereport USING btree (attendance_id_id);


--
-- Name: backend_attendancereport_student_id_id_7aa70cce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backend_attendancereport_student_id_id_7aa70cce ON public.backend_attendancereport USING btree (student_id_id);


--
-- Name: backend_customuser_groups_customuser_id_a9d2181c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backend_customuser_groups_customuser_id_a9d2181c ON public.backend_customuser_groups USING btree (customuser_id);


--
-- Name: backend_customuser_groups_group_id_5fab7100; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backend_customuser_groups_group_id_5fab7100 ON public.backend_customuser_groups USING btree (group_id);


--
-- Name: backend_customuser_user_permissions_customuser_id_44346a50; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backend_customuser_user_permissions_customuser_id_44346a50 ON public.backend_customuser_user_permissions USING btree (customuser_id);


--
-- Name: backend_customuser_user_permissions_permission_id_9e1b6f57; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backend_customuser_user_permissions_permission_id_9e1b6f57 ON public.backend_customuser_user_permissions USING btree (permission_id);


--
-- Name: backend_customuser_username_4213ec8b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backend_customuser_username_4213ec8b_like ON public.backend_customuser USING btree (username varchar_pattern_ops);


--
-- Name: backend_feedbackstaffs_staff_id_id_787b5617; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backend_feedbackstaffs_staff_id_id_787b5617 ON public.backend_feedbackstaffs USING btree (staff_id_id);


--
-- Name: backend_feedbackstudent_student_id_id_81e94de7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backend_feedbackstudent_student_id_id_81e94de7 ON public.backend_feedbackstudent USING btree (student_id_id);


--
-- Name: backend_leavereportstaff_staff_id_id_df67e894; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backend_leavereportstaff_staff_id_id_df67e894 ON public.backend_leavereportstaff USING btree (staff_id_id);


--
-- Name: backend_leavereportstudent_student_id_id_d05d99a2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backend_leavereportstudent_student_id_id_d05d99a2 ON public.backend_leavereportstudent USING btree (student_id_id);


--
-- Name: backend_notificationstaffs_stafff_id_id_6a44f600; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backend_notificationstaffs_stafff_id_id_6a44f600 ON public.backend_notificationstaffs USING btree (stafff_id_id);


--
-- Name: backend_notificationstudent_student_id_id_2bd7df98; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backend_notificationstudent_student_id_id_2bd7df98 ON public.backend_notificationstudent USING btree (student_id_id);


--
-- Name: backend_studentresult_student_id_id_d8dbf19a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backend_studentresult_student_id_id_d8dbf19a ON public.backend_studentresult USING btree (student_id_id);


--
-- Name: backend_studentresult_subject_id_id_986cada0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backend_studentresult_subject_id_id_986cada0 ON public.backend_studentresult USING btree (subject_id_id);


--
-- Name: backend_students_course_id_id_369387de; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backend_students_course_id_id_369387de ON public.backend_students USING btree (course_id_id);


--
-- Name: backend_students_session_year_id_id_bdfc477b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backend_students_session_year_id_id_bdfc477b ON public.backend_students USING btree (session_year_id_id);


--
-- Name: backend_subjects_course_id_id_b5095d86; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backend_subjects_course_id_id_b5095d86 ON public.backend_subjects USING btree (course_id_id);


--
-- Name: backend_subjects_staff_id_id_2e113ea5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backend_subjects_staff_id_id_2e113ea5 ON public.backend_subjects USING btree (staff_id_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backend_adminhod backend_adminhod_admin_id_048b52ea_fk_backend_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_adminhod
    ADD CONSTRAINT backend_adminhod_admin_id_048b52ea_fk_backend_customuser_id FOREIGN KEY (admin_id) REFERENCES public.backend_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backend_attendance backend_attendance_session_year_id_id_e830024c_fk_backend_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_attendance
    ADD CONSTRAINT backend_attendance_session_year_id_id_e830024c_fk_backend_s FOREIGN KEY (session_year_id_id) REFERENCES public.backend_sessionyearmodel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backend_attendance backend_attendance_subject_id_id_f66f08c5_fk_backend_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_attendance
    ADD CONSTRAINT backend_attendance_subject_id_id_f66f08c5_fk_backend_s FOREIGN KEY (subject_id_id) REFERENCES public.backend_subjects(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backend_attendancereport backend_attendancere_attendance_id_id_5f0ef446_fk_backend_a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_attendancereport
    ADD CONSTRAINT backend_attendancere_attendance_id_id_5f0ef446_fk_backend_a FOREIGN KEY (attendance_id_id) REFERENCES public.backend_attendance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backend_attendancereport backend_attendancere_student_id_id_7aa70cce_fk_backend_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_attendancereport
    ADD CONSTRAINT backend_attendancere_student_id_id_7aa70cce_fk_backend_s FOREIGN KEY (student_id_id) REFERENCES public.backend_students(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backend_customuser_groups backend_customuser_g_customuser_id_a9d2181c_fk_backend_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_customuser_groups
    ADD CONSTRAINT backend_customuser_g_customuser_id_a9d2181c_fk_backend_c FOREIGN KEY (customuser_id) REFERENCES public.backend_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backend_customuser_groups backend_customuser_groups_group_id_5fab7100_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_customuser_groups
    ADD CONSTRAINT backend_customuser_groups_group_id_5fab7100_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backend_customuser_user_permissions backend_customuser_u_customuser_id_44346a50_fk_backend_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_customuser_user_permissions
    ADD CONSTRAINT backend_customuser_u_customuser_id_44346a50_fk_backend_c FOREIGN KEY (customuser_id) REFERENCES public.backend_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backend_customuser_user_permissions backend_customuser_u_permission_id_9e1b6f57_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_customuser_user_permissions
    ADD CONSTRAINT backend_customuser_u_permission_id_9e1b6f57_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backend_feedbackstaffs backend_feedbackstaf_staff_id_id_787b5617_fk_backend_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_feedbackstaffs
    ADD CONSTRAINT backend_feedbackstaf_staff_id_id_787b5617_fk_backend_s FOREIGN KEY (staff_id_id) REFERENCES public.backend_staffs(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backend_feedbackstudent backend_feedbackstud_student_id_id_81e94de7_fk_backend_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_feedbackstudent
    ADD CONSTRAINT backend_feedbackstud_student_id_id_81e94de7_fk_backend_s FOREIGN KEY (student_id_id) REFERENCES public.backend_students(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backend_leavereportstaff backend_leavereports_staff_id_id_df67e894_fk_backend_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_leavereportstaff
    ADD CONSTRAINT backend_leavereports_staff_id_id_df67e894_fk_backend_s FOREIGN KEY (staff_id_id) REFERENCES public.backend_staffs(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backend_leavereportstudent backend_leavereports_student_id_id_d05d99a2_fk_backend_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_leavereportstudent
    ADD CONSTRAINT backend_leavereports_student_id_id_d05d99a2_fk_backend_s FOREIGN KEY (student_id_id) REFERENCES public.backend_students(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backend_notificationstaffs backend_notification_stafff_id_id_6a44f600_fk_backend_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_notificationstaffs
    ADD CONSTRAINT backend_notification_stafff_id_id_6a44f600_fk_backend_s FOREIGN KEY (stafff_id_id) REFERENCES public.backend_staffs(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backend_notificationstudent backend_notification_student_id_id_2bd7df98_fk_backend_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_notificationstudent
    ADD CONSTRAINT backend_notification_student_id_id_2bd7df98_fk_backend_s FOREIGN KEY (student_id_id) REFERENCES public.backend_students(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backend_staffs backend_staffs_admin_id_4f4e7d30_fk_backend_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_staffs
    ADD CONSTRAINT backend_staffs_admin_id_4f4e7d30_fk_backend_customuser_id FOREIGN KEY (admin_id) REFERENCES public.backend_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backend_studentresult backend_studentresul_student_id_id_d8dbf19a_fk_backend_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_studentresult
    ADD CONSTRAINT backend_studentresul_student_id_id_d8dbf19a_fk_backend_s FOREIGN KEY (student_id_id) REFERENCES public.backend_students(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backend_studentresult backend_studentresul_subject_id_id_986cada0_fk_backend_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_studentresult
    ADD CONSTRAINT backend_studentresul_subject_id_id_986cada0_fk_backend_s FOREIGN KEY (subject_id_id) REFERENCES public.backend_subjects(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backend_students backend_students_admin_id_2cbc8a54_fk_backend_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_students
    ADD CONSTRAINT backend_students_admin_id_2cbc8a54_fk_backend_customuser_id FOREIGN KEY (admin_id) REFERENCES public.backend_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backend_students backend_students_course_id_id_369387de_fk_backend_courses_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_students
    ADD CONSTRAINT backend_students_course_id_id_369387de_fk_backend_courses_id FOREIGN KEY (course_id_id) REFERENCES public.backend_courses(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backend_students backend_students_session_year_id_id_bdfc477b_fk_backend_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_students
    ADD CONSTRAINT backend_students_session_year_id_id_bdfc477b_fk_backend_s FOREIGN KEY (session_year_id_id) REFERENCES public.backend_sessionyearmodel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backend_subjects backend_subjects_course_id_id_b5095d86_fk_backend_courses_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_subjects
    ADD CONSTRAINT backend_subjects_course_id_id_b5095d86_fk_backend_courses_id FOREIGN KEY (course_id_id) REFERENCES public.backend_courses(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backend_subjects backend_subjects_staff_id_id_2e113ea5_fk_backend_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backend_subjects
    ADD CONSTRAINT backend_subjects_staff_id_id_2e113ea5_fk_backend_customuser_id FOREIGN KEY (staff_id_id) REFERENCES public.backend_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_backend_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_backend_customuser_id FOREIGN KEY (user_id) REFERENCES public.backend_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

