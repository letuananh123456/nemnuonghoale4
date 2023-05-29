--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases
--





--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md5d56138d78cededb5d94790ccc6aeffe4';






--
-- Database creation
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Debian 10.12-2.pgdg90+1)
-- Dumped by pg_dump version 10.12 (Debian 10.12-2.pgdg90+1)

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: article_article; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.article_article (
    id integer NOT NULL,
    title text NOT NULL,
    slug text,
    link_video text,
    sub_title text,
    content text NOT NULL,
    images_gioi_thieu text,
    sub_content text NOT NULL,
    tac_gia character varying(200) NOT NULL,
    loai_tin_tuc integer NOT NULL,
    seo_key_word text,
    status integer NOT NULL,
    created_time timestamp with time zone
);


ALTER TABLE public.article_article OWNER TO postgres;

--
-- Name: article_article_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.article_article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.article_article_id_seq OWNER TO postgres;

--
-- Name: article_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.article_article_id_seq OWNED BY public.article_article.id;


--
-- Name: article_gioithieuloaihinhbh; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.article_gioithieuloaihinhbh (
    id integer NOT NULL,
    content text NOT NULL,
    link_video character varying(255),
    loai_hinh_bao_hiem integer NOT NULL,
    created_time timestamp with time zone,
    status integer NOT NULL
);


ALTER TABLE public.article_gioithieuloaihinhbh OWNER TO postgres;

--
-- Name: article_gioithieuloaihinhbh_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.article_gioithieuloaihinhbh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.article_gioithieuloaihinhbh_id_seq OWNER TO postgres;

--
-- Name: article_gioithieuloaihinhbh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.article_gioithieuloaihinhbh_id_seq OWNED BY public.article_gioithieuloaihinhbh.id;


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
-- Name: claim_yeucaubaolanhvienphi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.claim_yeucaubaolanhvienphi (
    id integer NOT NULL,
    ho_ten_nguoi_khai_bao character varying(255) NOT NULL,
    so_hop_dong character varying(255) NOT NULL,
    so_the_bao_hiem character varying(255) NOT NULL,
    so_dien_thoai character varying(255) NOT NULL,
    chon_phuong_thuc integer NOT NULL,
    co_so_y_te_bao_lanh integer NOT NULL,
    ngay_nhap_vien timestamp with time zone,
    quyen_loi_chinh integer NOT NULL,
    quyen_loi_chi_tiet integer NOT NULL,
    anh_chung_tu_benh text,
    anh_chung_tu_thuoc text
);


ALTER TABLE public.claim_yeucaubaolanhvienphi OWNER TO postgres;

--
-- Name: claim_yeucaubaolanhvienphi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.claim_yeucaubaolanhvienphi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.claim_yeucaubaolanhvienphi_id_seq OWNER TO postgres;

--
-- Name: claim_yeucaubaolanhvienphi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.claim_yeucaubaolanhvienphi_id_seq OWNED BY public.claim_yeucaubaolanhvienphi.id;


--
-- Name: claim_yeucauchung; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.claim_yeucauchung (
    id integer NOT NULL,
    chon_phuong_thuc_nhan_tien integer NOT NULL,
    so_giay_chung_nhan_bao_hiem character varying(255) NOT NULL,
    nguoi_khai_bao character varying(255) NOT NULL,
    so_dien_thoai character varying(255) NOT NULL,
    chi_tiet_xay_ra text
);


ALTER TABLE public.claim_yeucauchung OWNER TO postgres;

--
-- Name: claim_yeucauchung_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.claim_yeucauchung_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.claim_yeucauchung_id_seq OWNER TO postgres;

--
-- Name: claim_yeucauchung_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.claim_yeucauchung_id_seq OWNED BY public.claim_yeucauchung.id;


--
-- Name: claim_yeucaunhatunhan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.claim_yeucaunhatunhan (
    id integer NOT NULL,
    ho_ten_nguoi_khai_bao character varying(255) NOT NULL,
    so_dien_thoai character varying(255) NOT NULL,
    dia_chi character varying(255) NOT NULL,
    chon_phuong_thuc_nhan_tien character varying(255) NOT NULL,
    so_hop_dong character varying(255) NOT NULL,
    ngay_xay_ra timestamp with time zone,
    dia_chi_ton_that character varying(255) NOT NULL,
    loai_ton_that integer NOT NULL,
    nguyen_nhan text,
    anh_hien_truong text,
    anh_xac_nhan text
);


ALTER TABLE public.claim_yeucaunhatunhan OWNER TO postgres;

--
-- Name: claim_yeucaunhatunhan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.claim_yeucaunhatunhan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.claim_yeucaunhatunhan_id_seq OWNER TO postgres;

--
-- Name: claim_yeucaunhatunhan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.claim_yeucaunhatunhan_id_seq OWNED BY public.claim_yeucaunhatunhan.id;


--
-- Name: claim_yeucauoto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.claim_yeucauoto (
    id integer NOT NULL,
    ho_ten_nguoi_khai_bao character varying(255) NOT NULL,
    so_hop_dong character varying(255) NOT NULL,
    so_dien_thoai character varying(255) NOT NULL,
    ngay_ton_that timestamp with time zone,
    dia_chi_tinh_thanh_pho character varying(200),
    dia_chi_quan_huyen character varying(200),
    nhom_nguyen_nhan integer NOT NULL,
    nguyen_nhan_ton_that_chi_tiet character varying(200),
    hau_qua_ton_that_chi_tiet character varying(200),
    dia_chi character varying(255) NOT NULL,
    chon_phuong_thuc integer NOT NULL,
    chon_garage_sua_chua integer NOT NULL,
    anh_ton_that text,
    anh_xac_nhan_co_quan text
);


ALTER TABLE public.claim_yeucauoto OWNER TO postgres;

--
-- Name: claim_yeucauoto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.claim_yeucauoto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.claim_yeucauoto_id_seq OWNER TO postgres;

--
-- Name: claim_yeucauoto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.claim_yeucauoto_id_seq OWNED BY public.claim_yeucauoto.id;


--
-- Name: claim_yeucausuckhoe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.claim_yeucausuckhoe (
    id integer NOT NULL,
    ho_ten_nguoi_khai_bao character varying(255) NOT NULL,
    so_hop_dong character varying(255) NOT NULL,
    so_the_bao_hiem character varying(255) NOT NULL,
    so_dien_thoai character varying(255) NOT NULL,
    chon_phuong_thuc integer NOT NULL,
    co_so_y_te_bao_lanh integer NOT NULL,
    ngay_nhap_vien timestamp with time zone,
    quyen_loi_chinh integer NOT NULL,
    quyen_loi_chi_tiet integer NOT NULL,
    anh_chung_tu_benh text,
    anh_chung_tu_thuoc text
);


ALTER TABLE public.claim_yeucausuckhoe OWNER TO postgres;

--
-- Name: claim_yeucausuckhoe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.claim_yeucausuckhoe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.claim_yeucausuckhoe_id_seq OWNER TO postgres;

--
-- Name: claim_yeucausuckhoe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.claim_yeucausuckhoe_id_seq OWNED BY public.claim_yeucausuckhoe.id;


--
-- Name: claim_yeucautainancanhan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.claim_yeucautainancanhan (
    id integer NOT NULL,
    ho_ten_nguoi_khai_bao character varying(255) NOT NULL,
    so_hop_dong character varying(255) NOT NULL,
    so_the_bao_hiem character varying(255) NOT NULL,
    so_dien_thoai character varying(255) NOT NULL,
    chon_phuong_thuc integer NOT NULL,
    co_so_y_te_bao_lanh integer NOT NULL,
    ngay_nhap_vien timestamp with time zone,
    thuong_tat_chinh integer NOT NULL,
    quyen_loi_chi_tiet integer NOT NULL,
    anh_thuong_tat text,
    anh_giay_chung_tu text
);


ALTER TABLE public.claim_yeucautainancanhan OWNER TO postgres;

--
-- Name: claim_yeucautainancanhan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.claim_yeucautainancanhan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.claim_yeucautainancanhan_id_seq OWNER TO postgres;

--
-- Name: claim_yeucautainancanhan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.claim_yeucautainancanhan_id_seq OWNED BY public.claim_yeucautainancanhan.id;


--
-- Name: claim_yeucautuky; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.claim_yeucautuky (
    id integer NOT NULL,
    ho_ten_nguoi_khai_bao character varying(255) NOT NULL,
    so_dien_thoai character varying(255) NOT NULL,
    dia_chi character varying(255) NOT NULL,
    chon_phuong_thuc_nhan_tien integer NOT NULL,
    so_hop_dong character varying(255) NOT NULL,
    ngay_chet timestamp with time zone,
    nguyen_nhan text,
    anh_thuong_tat text,
    anh_giay_chung_tu text
);


ALTER TABLE public.claim_yeucautuky OWNER TO postgres;

--
-- Name: claim_yeucautuky_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.claim_yeucautuky_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.claim_yeucautuky_id_seq OWNER TO postgres;

--
-- Name: claim_yeucautuky_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.claim_yeucautuky_id_seq OWNED BY public.claim_yeucautuky.id;


--
-- Name: confirm_email_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.confirm_email_token (
    token character varying(128) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.confirm_email_token OWNER TO postgres;

--
-- Name: core_chitietcongviec; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_chitietcongviec (
    id integer NOT NULL,
    chitiet character varying(200),
    code_chitiet integer NOT NULL,
    code_linhvuc integer NOT NULL
);


ALTER TABLE public.core_chitietcongviec OWNER TO postgres;

--
-- Name: core_chitietcongviec_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_chitietcongviec_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_chitietcongviec_id_seq OWNER TO postgres;

--
-- Name: core_chitietcongviec_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_chitietcongviec_id_seq OWNED BY public.core_chitietcongviec.id;


--
-- Name: core_company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_company (
    id integer NOT NULL,
    logo text,
    ten_cong_ty character varying(255),
    id_ten_cong_ty integer NOT NULL,
    bai_gioi_thieu_cong_ty text NOT NULL,
    nam_thanh_lap character varying(200),
    bien_thanh_toan double precision NOT NULL,
    so_chi_nhanh integer NOT NULL
);


ALTER TABLE public.core_company OWNER TO postgres;

--
-- Name: core_company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_company_id_seq OWNER TO postgres;

--
-- Name: core_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_company_id_seq OWNED BY public.core_company.id;


--
-- Name: core_district; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_district (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    parent_code integer NOT NULL,
    longitude double precision NOT NULL,
    latitude double precision NOT NULL
);


ALTER TABLE public.core_district OWNER TO postgres;

--
-- Name: core_district_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_district_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_district_id_seq OWNER TO postgres;

--
-- Name: core_district_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_district_id_seq OWNED BY public.core_district.id;


--
-- Name: core_googlevision; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_googlevision (
    id integer NOT NULL,
    access_token character varying(200),
    expires_in timestamp with time zone,
    refresh_token character varying(200),
    scope character varying(200),
    token_type character varying(100)
);


ALTER TABLE public.core_googlevision OWNER TO postgres;

--
-- Name: core_googlevision_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_googlevision_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_googlevision_id_seq OWNER TO postgres;

--
-- Name: core_googlevision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_googlevision_id_seq OWNED BY public.core_googlevision.id;


--
-- Name: core_linhvunghenghiep; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_linhvunghenghiep (
    id integer NOT NULL,
    linhvuc character varying(200),
    code_linhvuc integer NOT NULL
);


ALTER TABLE public.core_linhvunghenghiep OWNER TO postgres;

--
-- Name: core_linhvunghenghiep_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_linhvunghenghiep_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_linhvunghenghiep_id_seq OWNER TO postgres;

--
-- Name: core_linhvunghenghiep_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_linhvunghenghiep_id_seq OWNED BY public.core_linhvunghenghiep.id;


--
-- Name: core_nguoimuabaohiem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_nguoimuabaohiem (
    id integer NOT NULL,
    username character varying(200),
    fullname character varying(200),
    birth_day integer NOT NULL,
    birth_month integer NOT NULL,
    birth_year integer NOT NULL,
    gioi_tinh integer NOT NULL,
    email character varying(200),
    dia_chi_tinh_thanh_pho character varying(200),
    dia_chi_quan_huyen character varying(200),
    dia_chi_chi_tiet character varying(200),
    so_cmnd character varying(200),
    images_cmt_mattruoc text,
    images_cmt_matsau text,
    cmt_ngay_cap date,
    cmt_noi_cap character varying(200),
    ngay_hieu_luc timestamp with time zone,
    ngay_ket_thuc timestamp with time zone,
    ho_ten_nhan character varying(200),
    email_nhan character varying(200),
    so_dien_thoai_nhan character varying(200),
    dia_chi_tinh_thanh_pho_nhan character varying(200),
    dia_chi_quan_huyen_nhan character varying(200),
    dia_chi_chi_tiet_nhan character varying(200),
    status_marriage integer NOT NULL,
    job integer NOT NULL,
    weight integer NOT NULL,
    height integer NOT NULL,
    nationality integer NOT NULL,
    nationality_paper integer NOT NULL,
    created_at timestamp with time zone
);


ALTER TABLE public.core_nguoimuabaohiem OWNER TO postgres;

--
-- Name: core_nguoimuabaohiem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_nguoimuabaohiem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_nguoimuabaohiem_id_seq OWNER TO postgres;

--
-- Name: core_nguoimuabaohiem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_nguoimuabaohiem_id_seq OWNED BY public.core_nguoimuabaohiem.id;


--
-- Name: core_nguoimuabaohiemtam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_nguoimuabaohiemtam (
    id integer NOT NULL,
    username character varying(200),
    fullname character varying(200),
    birth_day integer NOT NULL,
    birth_month integer NOT NULL,
    birth_year integer NOT NULL,
    gioi_tinh integer NOT NULL,
    email character varying(200),
    dia_chi_tinh_thanh_pho character varying(200),
    dia_chi_quan_huyen character varying(200),
    dia_chi_chi_tiet character varying(200),
    so_cmnd character varying(200),
    images_cmt_mattruoc text,
    images_cmt_matsau text,
    cmt_ngay_cap date,
    cmt_noi_cap character varying(200),
    ngay_hieu_luc timestamp with time zone,
    ngay_ket_thuc timestamp with time zone,
    ho_ten_nhan character varying(200),
    email_nhan character varying(200),
    so_dien_thoai_nhan character varying(200),
    dia_chi_tinh_thanh_pho_nhan character varying(200),
    dia_chi_quan_huyen_nhan character varying(200),
    dia_chi_chi_tiet_nhan character varying(200),
    status_marriage integer NOT NULL,
    job integer NOT NULL,
    weight integer NOT NULL,
    height integer NOT NULL,
    nationality integer NOT NULL,
    nationality_paper integer NOT NULL,
    created_at timestamp with time zone
);


ALTER TABLE public.core_nguoimuabaohiemtam OWNER TO postgres;

--
-- Name: core_nguoimuabaohiemtam_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_nguoimuabaohiemtam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_nguoimuabaohiemtam_id_seq OWNER TO postgres;

--
-- Name: core_nguoimuabaohiemtam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_nguoimuabaohiemtam_id_seq OWNED BY public.core_nguoimuabaohiemtam.id;


--
-- Name: core_noidungnghenghiep; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_noidungnghenghiep (
    id integer NOT NULL,
    noidungcongviec text,
    code_chitiet integer NOT NULL,
    capnghenghiep integer NOT NULL,
    hanchetichluy bigint NOT NULL
);


ALTER TABLE public.core_noidungnghenghiep OWNER TO postgres;

--
-- Name: core_noidungnghenghiep_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_noidungnghenghiep_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_noidungnghenghiep_id_seq OWNER TO postgres;

--
-- Name: core_noidungnghenghiep_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_noidungnghenghiep_id_seq OWNED BY public.core_noidungnghenghiep.id;


--
-- Name: core_provincial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_provincial (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    code integer NOT NULL,
    "group" integer NOT NULL,
    longitude double precision NOT NULL,
    latitude double precision NOT NULL
);


ALTER TABLE public.core_provincial OWNER TO postgres;

--
-- Name: core_provincial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_provincial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_provincial_id_seq OWNER TO postgres;

--
-- Name: core_provincial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_provincial_id_seq OWNED BY public.core_provincial.id;


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
-- Name: homeinsurance_goisanphamchinh; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.homeinsurance_goisanphamchinh (
    id integer NOT NULL,
    ten_loai_hinh_bao_hiem character varying(255),
    id_loai_hinh_bao_hiem integer NOT NULL,
    ten_goi_san_pham_chinh character varying(255),
    id_goi_san_pham_chinh integer NOT NULL,
    so_phi_chinh double precision NOT NULL,
    company_id integer NOT NULL
);


ALTER TABLE public.homeinsurance_goisanphamchinh OWNER TO postgres;

--
-- Name: homeinsurance_goisanphamchinh_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.homeinsurance_goisanphamchinh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.homeinsurance_goisanphamchinh_id_seq OWNER TO postgres;

--
-- Name: homeinsurance_goisanphamchinh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.homeinsurance_goisanphamchinh_id_seq OWNED BY public.homeinsurance_goisanphamchinh.id;


--
-- Name: homeinsurance_goisanphamphu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.homeinsurance_goisanphamphu (
    id integer NOT NULL,
    ten_loai_hinh_bao_hiem character varying(255),
    id_loai_hinh_bao_hiem integer NOT NULL,
    ten_goi_san_pham_chinh character varying(255),
    id_goi_san_pham_chinh integer NOT NULL,
    ten_goi_san_pham_phu character varying(255),
    id_goi_san_pham_phu integer NOT NULL,
    so_phi_phu double precision NOT NULL,
    company_id integer NOT NULL
);


ALTER TABLE public.homeinsurance_goisanphamphu OWNER TO postgres;

--
-- Name: homeinsurance_goisanphamphu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.homeinsurance_goisanphamphu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.homeinsurance_goisanphamphu_id_seq OWNER TO postgres;

--
-- Name: homeinsurance_goisanphamphu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.homeinsurance_goisanphamphu_id_seq OWNED BY public.homeinsurance_goisanphamphu.id;


--
-- Name: homeinsurance_nguoiduocbaohiem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.homeinsurance_nguoiduocbaohiem (
    id integer NOT NULL,
    ma_don_hang_bihama character varying(255) NOT NULL,
    loai_nha integer NOT NULL,
    muc_dich_nha integer NOT NULL,
    tuoi_tho_ngoi_nha integer NOT NULL,
    dia_chi_tinh_thanh_pho character varying(255),
    dia_chi_quan_huyen character varying(255),
    dia_chi_chi_tiet character varying(255),
    gia_tri_can_nha bigint NOT NULL,
    gia_tri_tai_san_ben_trong bigint NOT NULL,
    so_tien_bh bigint NOT NULL,
    ngay_hieu_luc timestamp with time zone,
    ngay_ket_thuc timestamp with time zone,
    relationship integer NOT NULL,
    is_fire integer NOT NULL,
    created_at timestamp with time zone,
    nguoimuabaohiem_id integer NOT NULL
);


ALTER TABLE public.homeinsurance_nguoiduocbaohiem OWNER TO postgres;

--
-- Name: homeinsurance_nguoiduocbaohiem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.homeinsurance_nguoiduocbaohiem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.homeinsurance_nguoiduocbaohiem_id_seq OWNER TO postgres;

--
-- Name: homeinsurance_nguoiduocbaohiem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.homeinsurance_nguoiduocbaohiem_id_seq OWNED BY public.homeinsurance_nguoiduocbaohiem.id;


--
-- Name: homeinsurance_nguoiduocbaohiemtam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.homeinsurance_nguoiduocbaohiemtam (
    id integer NOT NULL,
    loai_nha integer NOT NULL,
    muc_dich_nha integer NOT NULL,
    tuoi_tho_ngoi_nha integer NOT NULL,
    dia_chi_tinh_thanh_pho character varying(255),
    dia_chi_quan_huyen character varying(255),
    dia_chi_chi_tiet character varying(255),
    gia_tri_can_nha bigint NOT NULL,
    gia_tri_tai_san_ben_trong bigint NOT NULL,
    so_tien_bh bigint NOT NULL,
    ngay_hieu_luc timestamp with time zone,
    ngay_ket_thuc timestamp with time zone,
    relationship integer NOT NULL,
    is_fire integer NOT NULL,
    created_at timestamp with time zone,
    nguoimuabaohiemtam_id integer NOT NULL
);


ALTER TABLE public.homeinsurance_nguoiduocbaohiemtam OWNER TO postgres;

--
-- Name: homeinsurance_nguoiduocbaohiemtam_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.homeinsurance_nguoiduocbaohiemtam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.homeinsurance_nguoiduocbaohiemtam_id_seq OWNER TO postgres;

--
-- Name: homeinsurance_nguoiduocbaohiemtam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.homeinsurance_nguoiduocbaohiemtam_id_seq OWNED BY public.homeinsurance_nguoiduocbaohiemtam.id;


--
-- Name: homeinsurance_nguoithuhuong; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.homeinsurance_nguoithuhuong (
    id integer NOT NULL,
    fullname character varying(200),
    birth_day integer NOT NULL,
    birth_month integer NOT NULL,
    birth_year integer NOT NULL,
    gioi_tinh integer NOT NULL,
    so_cmnd character varying(255),
    nguoiduocbaohiem_id integer NOT NULL
);


ALTER TABLE public.homeinsurance_nguoithuhuong OWNER TO postgres;

--
-- Name: homeinsurance_nguoithuhuong_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.homeinsurance_nguoithuhuong_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.homeinsurance_nguoithuhuong_id_seq OWNER TO postgres;

--
-- Name: homeinsurance_nguoithuhuong_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.homeinsurance_nguoithuhuong_id_seq OWNED BY public.homeinsurance_nguoithuhuong.id;


--
-- Name: insurancecompany_insurancecompany; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insurancecompany_insurancecompany (
    id integer NOT NULL,
    id_cpn integer NOT NULL,
    name_cpn character varying(200) NOT NULL,
    slug character varying(200),
    sub_title text NOT NULL,
    title character varying(200),
    link_cpn character varying(200),
    content text NOT NULL,
    tac_gia character varying(200) NOT NULL,
    seo_key_word character varying(200),
    images text,
    created_time timestamp with time zone
);


ALTER TABLE public.insurancecompany_insurancecompany OWNER TO postgres;

--
-- Name: insurancecompany_insurancecompany_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.insurancecompany_insurancecompany_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.insurancecompany_insurancecompany_id_seq OWNER TO postgres;

--
-- Name: insurancecompany_insurancecompany_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.insurancecompany_insurancecompany_id_seq OWNED BY public.insurancecompany_insurancecompany.id;


--
-- Name: investment_giatridautu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.investment_giatridautu (
    id integer NOT NULL,
    phantram double precision NOT NULL,
    nam integer NOT NULL
);


ALTER TABLE public.investment_giatridautu OWNER TO postgres;

--
-- Name: investment_giatridautu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.investment_giatridautu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.investment_giatridautu_id_seq OWNER TO postgres;

--
-- Name: investment_giatridautu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.investment_giatridautu_id_seq OWNED BY public.investment_giatridautu.id;


--
-- Name: investment_goisanphamchinh; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.investment_goisanphamchinh (
    id integer NOT NULL,
    ten_loai_hinh_bao_hiem character varying(255),
    id_loai_hinh_bao_hiem integer NOT NULL,
    gioi_tinh integer NOT NULL,
    tuoi integer NOT NULL,
    phi_quan_ly_hop_dong double precision NOT NULL,
    phi_ban_dau_co_ban double precision NOT NULL,
    phi_ban_dau_dong_them double precision NOT NULL,
    phi_cham_dut_co_ban double precision NOT NULL,
    phi_cham_dut_dong_them double precision NOT NULL,
    ten_goi_san_pham_chinh character varying(255),
    id_goi_san_pham_chinh integer NOT NULL,
    so_phi_chinh_hang_nam double precision NOT NULL,
    ty_le_phi_rui_ro_hang_nam double precision NOT NULL,
    company_id integer NOT NULL
);


ALTER TABLE public.investment_goisanphamchinh OWNER TO postgres;

--
-- Name: investment_goisanphamchinh_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.investment_goisanphamchinh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.investment_goisanphamchinh_id_seq OWNER TO postgres;

--
-- Name: investment_goisanphamchinh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.investment_goisanphamchinh_id_seq OWNED BY public.investment_goisanphamchinh.id;


--
-- Name: investment_goisanphamphu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.investment_goisanphamphu (
    id integer NOT NULL,
    ten_loai_hinh_bao_hiem character varying(255),
    id_loai_hinh_bao_hiem integer NOT NULL,
    ten_goi_san_pham_chinh character varying(255),
    id_goi_san_pham_chinh integer NOT NULL,
    ten_goi_san_pham_phu character varying(255),
    id_goi_san_pham_phu integer NOT NULL,
    loai_nghe_nghiep integer NOT NULL,
    so_tien_bao_hiem bigint NOT NULL,
    so_phi_phu_nam double precision NOT NULL,
    company_id integer NOT NULL
);


ALTER TABLE public.investment_goisanphamphu OWNER TO postgres;

--
-- Name: investment_goisanphamphu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.investment_goisanphamphu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.investment_goisanphamphu_id_seq OWNER TO postgres;

--
-- Name: investment_goisanphamphu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.investment_goisanphamphu_id_seq OWNED BY public.investment_goisanphamphu.id;


--
-- Name: investment_laisuatthitruong; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.investment_laisuatthitruong (
    id integer NOT NULL,
    phantram double precision NOT NULL,
    nam integer NOT NULL
);


ALTER TABLE public.investment_laisuatthitruong OWNER TO postgres;

--
-- Name: investment_laisuatthitruong_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.investment_laisuatthitruong_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.investment_laisuatthitruong_id_seq OWNER TO postgres;

--
-- Name: investment_laisuatthitruong_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.investment_laisuatthitruong_id_seq OWNED BY public.investment_laisuatthitruong.id;


--
-- Name: investment_nguoiduocbaohiem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.investment_nguoiduocbaohiem (
    id integer NOT NULL,
    ma_don_hang_bihama character varying(255) NOT NULL,
    username character varying(200),
    fullname character varying(200),
    birth_day integer NOT NULL,
    birth_month integer NOT NULL,
    birth_year integer NOT NULL,
    gioi_tinh integer NOT NULL,
    email character varying(255),
    dia_chi_tinh_thanh_pho character varying(255),
    dia_chi_quan_huyen character varying(255),
    dia_chi_chi_tiet character varying(255),
    so_cmnd character varying(255),
    images_cmt_mattruoc text,
    images_cmt_matsau text,
    cmt_ngay_cap date,
    cmt_noi_cap character varying(255),
    ngay_hieu_luc timestamp with time zone,
    ngay_ket_thuc timestamp with time zone,
    cau_hoi_suc_khoe_1 text,
    cau_hoi_suc_khoe_2 text,
    cau_hoi_suc_khoe_3 text,
    cau_hoi_suc_khoe_4 text,
    cau_hoi_suc_khoe_5 text,
    cau_hoi_suc_khoe_6 text,
    cau_hoi_suc_khoe_7 text,
    cau_hoi_suc_khoe_8 text,
    status_marriage integer NOT NULL,
    so_tien_bao_hiem bigint NOT NULL,
    so_nam_hop_dong integer NOT NULL,
    so_nam_dong_phi integer NOT NULL,
    cach_tra_phi integer NOT NULL,
    dinh_ky_dong_phi integer NOT NULL,
    job integer NOT NULL,
    weight integer NOT NULL,
    height integer NOT NULL,
    nationality integer NOT NULL,
    nationality_paper integer NOT NULL,
    is_smoke integer NOT NULL,
    relationship character varying(255),
    created_at timestamp with time zone,
    nguoimuabaohiem_id integer NOT NULL
);


ALTER TABLE public.investment_nguoiduocbaohiem OWNER TO postgres;

--
-- Name: investment_nguoiduocbaohiem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.investment_nguoiduocbaohiem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.investment_nguoiduocbaohiem_id_seq OWNER TO postgres;

--
-- Name: investment_nguoiduocbaohiem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.investment_nguoiduocbaohiem_id_seq OWNED BY public.investment_nguoiduocbaohiem.id;


--
-- Name: investment_nguoiduocbaohiemtam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.investment_nguoiduocbaohiemtam (
    id integer NOT NULL,
    username character varying(200),
    fullname character varying(200),
    birth_day integer NOT NULL,
    birth_month integer NOT NULL,
    birth_year integer NOT NULL,
    gioi_tinh integer NOT NULL,
    email character varying(255),
    dia_chi_tinh_thanh_pho character varying(255),
    dia_chi_quan_huyen character varying(255),
    dia_chi_chi_tiet character varying(255),
    so_cmnd character varying(255),
    images_cmt_mattruoc text,
    images_cmt_matsau text,
    cmt_ngay_cap date,
    cmt_noi_cap character varying(255),
    ngay_hieu_luc timestamp with time zone,
    ngay_ket_thuc timestamp with time zone,
    cau_hoi_suc_khoe_1 text,
    cau_hoi_suc_khoe_2 text,
    cau_hoi_suc_khoe_3 text,
    cau_hoi_suc_khoe_4 text,
    cau_hoi_suc_khoe_5 text,
    cau_hoi_suc_khoe_6 text,
    cau_hoi_suc_khoe_7 text,
    cau_hoi_suc_khoe_8 text,
    status_marriage integer NOT NULL,
    so_tien_bao_hiem bigint NOT NULL,
    so_nam_hop_dong integer NOT NULL,
    so_nam_dong_phi integer NOT NULL,
    cach_tra_phi integer NOT NULL,
    dinh_ky_dong_phi integer NOT NULL,
    job integer NOT NULL,
    weight integer NOT NULL,
    height integer NOT NULL,
    nationality integer NOT NULL,
    nationality_paper integer NOT NULL,
    is_smoke integer NOT NULL,
    relationship character varying(255),
    created_at timestamp with time zone,
    nguoimuabaohiemtam_id integer NOT NULL
);


ALTER TABLE public.investment_nguoiduocbaohiemtam OWNER TO postgres;

--
-- Name: investment_nguoiduocbaohiemtam_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.investment_nguoiduocbaohiemtam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.investment_nguoiduocbaohiemtam_id_seq OWNER TO postgres;

--
-- Name: investment_nguoiduocbaohiemtam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.investment_nguoiduocbaohiemtam_id_seq OWNED BY public.investment_nguoiduocbaohiemtam.id;


--
-- Name: investment_nguoithuhuong; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.investment_nguoithuhuong (
    id integer NOT NULL,
    fullname character varying(200),
    birth_day integer NOT NULL,
    birth_month integer NOT NULL,
    birth_year integer NOT NULL,
    gioi_tinh integer NOT NULL,
    so_cmnd character varying(255),
    images_cmt_mattruoc text,
    images_cmt_matsau text,
    cmt_ngay_cap date,
    cmt_noi_cap character varying(255),
    relationship character varying(255),
    ty_le_thu_huong double precision NOT NULL,
    nguoiduocbaohiem_id integer NOT NULL
);


ALTER TABLE public.investment_nguoithuhuong OWNER TO postgres;

--
-- Name: investment_nguoithuhuong_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.investment_nguoithuhuong_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.investment_nguoithuhuong_id_seq OWNER TO postgres;

--
-- Name: investment_nguoithuhuong_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.investment_nguoithuhuong_id_seq OWNED BY public.investment_nguoithuhuong.id;


--
-- Name: investment_nguoithuhuongtam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.investment_nguoithuhuongtam (
    id integer NOT NULL,
    fullname character varying(200),
    birth_day integer NOT NULL,
    birth_month integer NOT NULL,
    birth_year integer NOT NULL,
    gioi_tinh integer NOT NULL,
    so_cmnd character varying(255),
    images_cmt_mattruoc text,
    images_cmt_matsau text,
    cmt_ngay_cap date,
    cmt_noi_cap character varying(255),
    relationship character varying(255),
    ty_le_thu_huong double precision NOT NULL,
    nguoiduocbaohiemtam_id integer NOT NULL
);


ALTER TABLE public.investment_nguoithuhuongtam OWNER TO postgres;

--
-- Name: investment_nguoithuhuongtam_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.investment_nguoithuhuongtam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.investment_nguoithuhuongtam_id_seq OWNER TO postgres;

--
-- Name: investment_nguoithuhuongtam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.investment_nguoithuhuongtam_id_seq OWNED BY public.investment_nguoithuhuongtam.id;


--
-- Name: kienthuc_kienthuccategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kienthuc_kienthuccategory (
    id integer NOT NULL,
    name_category character varying(255) NOT NULL,
    slug character varying(255) NOT NULL
);


ALTER TABLE public.kienthuc_kienthuccategory OWNER TO postgres;

--
-- Name: kienthuc_kienthuccategory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kienthuc_kienthuccategory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kienthuc_kienthuccategory_id_seq OWNER TO postgres;

--
-- Name: kienthuc_kienthuccategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kienthuc_kienthuccategory_id_seq OWNED BY public.kienthuc_kienthuccategory.id;


--
-- Name: kienthuc_kienthucmodel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kienthuc_kienthucmodel (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    sub_title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    content text NOT NULL,
    link_video character varying(255) NOT NULL,
    created_time timestamp with time zone,
    images text,
    status integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.kienthuc_kienthucmodel OWNER TO postgres;

--
-- Name: kienthuc_kienthucmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kienthuc_kienthucmodel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kienthuc_kienthucmodel_id_seq OWNER TO postgres;

--
-- Name: kienthuc_kienthucmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kienthuc_kienthucmodel_id_seq OWNED BY public.kienthuc_kienthucmodel.id;


--
-- Name: notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notification (
    id integer NOT NULL,
    title text NOT NULL,
    body text NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.notification OWNER TO postgres;

--
-- Name: notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notification_id_seq OWNER TO postgres;

--
-- Name: notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notification_id_seq OWNED BY public.notification.id;


--
-- Name: payment_dondathang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_dondathang (
    id integer NOT NULL,
    loai_hinh_bao_hiem integer NOT NULL,
    cong_ty integer NOT NULL,
    goi_san_pham_chinh integer NOT NULL,
    goi_san_pham_phu text,
    so_phi_chinh bigint NOT NULL,
    tong_so_phi_phu bigint NOT NULL,
    "so_phi_VAT" bigint NOT NULL,
    tong_phi_thanh_toan bigint NOT NULL,
    tong_phi_thanh_toan_sau_giam_gia bigint NOT NULL,
    created_at timestamp with time zone,
    loai_hop_dong integer NOT NULL,
    ngay_phat_hanh_hop_dong_hoac_ack timestamp with time zone,
    loai_thanh_toan integer NOT NULL,
    ma_don_hang_bihama character varying(255) NOT NULL,
    tinh_trang_don_dat_hang integer NOT NULL,
    ma_giao_dich_cong_thanh_toan character varying(255),
    tinh_trang_thanh_toan_cong_thanh_toan integer NOT NULL,
    code_ma_giam_gia character varying(255),
    ma_hop_dong character varying(255),
    link_giay_chung_nhan text,
    is_da_gui_manager boolean NOT NULL,
    is_da_gui_cong_thanh_toan boolean NOT NULL,
    is_tai_tuc integer NOT NULL,
    nguoimuabaohiem_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.payment_dondathang OWNER TO postgres;

--
-- Name: payment_dondathang_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_dondathang_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_dondathang_id_seq OWNER TO postgres;

--
-- Name: payment_dondathang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_dondathang_id_seq OWNED BY public.payment_dondathang.id;


--
-- Name: payment_magiamgia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_magiamgia (
    id integer NOT NULL,
    loai_hinh_bao_hiem integer NOT NULL,
    cong_ty integer NOT NULL,
    goi_san_pham integer NOT NULL,
    ngay_hieu_luc date NOT NULL,
    ngay_ket_thuc date NOT NULL,
    chi_tieu character varying(255) NOT NULL,
    ten_chien_luoc character varying(255) NOT NULL,
    discount double precision NOT NULL,
    code_ma_giam_gia character varying(255) NOT NULL,
    is_su_dung integer NOT NULL,
    created_at timestamp with time zone
);


ALTER TABLE public.payment_magiamgia OWNER TO postgres;

--
-- Name: payment_magiamgia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_magiamgia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_magiamgia_id_seq OWNER TO postgres;

--
-- Name: payment_magiamgia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_magiamgia_id_seq OWNED BY public.payment_magiamgia.id;


--
-- Name: payment_taituc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_taituc (
    id integer NOT NULL,
    ma_tai_tuc_bihama character varying(255) NOT NULL,
    cach_tra_phi integer NOT NULL,
    dinh_ky_dong_phi integer NOT NULL,
    ky_dong_phi integer NOT NULL,
    so_tien bigint NOT NULL,
    created_at timestamp with time zone,
    dondathang_id integer NOT NULL
);


ALTER TABLE public.payment_taituc OWNER TO postgres;

--
-- Name: payment_taituc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_taituc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_taituc_id_seq OWNER TO postgres;

--
-- Name: payment_taituc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_taituc_id_seq OWNED BY public.payment_taituc.id;


--
-- Name: personalhealth_goisanphamchinh; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personalhealth_goisanphamchinh (
    id integer NOT NULL,
    ten_loai_hinh_bao_hiem character varying(255),
    id_loai_hinh_bao_hiem integer NOT NULL,
    gioi_tinh integer NOT NULL,
    tuoi integer NOT NULL,
    ten_goi_san_pham_chinh character varying(255),
    id_goi_san_pham_chinh integer NOT NULL,
    so_phi_chinh double precision NOT NULL,
    company_id integer NOT NULL
);


ALTER TABLE public.personalhealth_goisanphamchinh OWNER TO postgres;

--
-- Name: personalhealth_goisanphamchinh_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personalhealth_goisanphamchinh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personalhealth_goisanphamchinh_id_seq OWNER TO postgres;

--
-- Name: personalhealth_goisanphamchinh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personalhealth_goisanphamchinh_id_seq OWNED BY public.personalhealth_goisanphamchinh.id;


--
-- Name: personalhealth_goisanphamphu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personalhealth_goisanphamphu (
    id integer NOT NULL,
    ten_loai_hinh_bao_hiem character varying(255),
    id_loai_hinh_bao_hiem integer NOT NULL,
    gioi_tinh integer NOT NULL,
    tuoi integer NOT NULL,
    ten_goi_san_pham_chinh character varying(255),
    id_goi_san_pham_chinh integer NOT NULL,
    ten_goi_san_pham_phu character varying(255),
    id_goi_san_pham_phu integer NOT NULL,
    so_phi_phu double precision NOT NULL,
    company_id integer NOT NULL
);


ALTER TABLE public.personalhealth_goisanphamphu OWNER TO postgres;

--
-- Name: personalhealth_goisanphamphu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personalhealth_goisanphamphu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personalhealth_goisanphamphu_id_seq OWNER TO postgres;

--
-- Name: personalhealth_goisanphamphu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personalhealth_goisanphamphu_id_seq OWNED BY public.personalhealth_goisanphamphu.id;


--
-- Name: personalhealth_nguoiduocbaohiem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personalhealth_nguoiduocbaohiem (
    id integer NOT NULL,
    ma_don_hang_bihama character varying(255) NOT NULL,
    username character varying(200),
    fullname character varying(200),
    birth_day integer NOT NULL,
    birth_month integer NOT NULL,
    birth_year integer NOT NULL,
    gioi_tinh integer NOT NULL,
    email character varying(255),
    dia_chi_tinh_thanh_pho character varying(255),
    dia_chi_quan_huyen character varying(255),
    dia_chi_chi_tiet character varying(255),
    so_cmnd character varying(255),
    images_cmt_mattruoc text,
    images_cmt_matsau text,
    cmt_ngay_cap date,
    cmt_noi_cap character varying(255),
    ngay_hieu_luc timestamp with time zone,
    ngay_ket_thuc timestamp with time zone,
    cau_hoi_suc_khoe_1 integer NOT NULL,
    cau_hoi_suc_khoe_2 integer NOT NULL,
    chi_tiet_benh_tat text,
    relationship character varying(255),
    created_at timestamp with time zone,
    nguoimuabaohiem_id integer NOT NULL
);


ALTER TABLE public.personalhealth_nguoiduocbaohiem OWNER TO postgres;

--
-- Name: personalhealth_nguoiduocbaohiem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personalhealth_nguoiduocbaohiem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personalhealth_nguoiduocbaohiem_id_seq OWNER TO postgres;

--
-- Name: personalhealth_nguoiduocbaohiem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personalhealth_nguoiduocbaohiem_id_seq OWNED BY public.personalhealth_nguoiduocbaohiem.id;


--
-- Name: personalhealth_nguoiduocbaohiemtam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personalhealth_nguoiduocbaohiemtam (
    id integer NOT NULL,
    username character varying(200),
    fullname character varying(200),
    birth_day integer NOT NULL,
    birth_month integer NOT NULL,
    birth_year integer NOT NULL,
    gioi_tinh integer NOT NULL,
    email character varying(255),
    dia_chi_tinh_thanh_pho character varying(255),
    dia_chi_quan_huyen character varying(255),
    dia_chi_chi_tiet character varying(255),
    so_cmnd character varying(255),
    images_cmt_mattruoc text,
    images_cmt_matsau text,
    cmt_ngay_cap date,
    cmt_noi_cap character varying(255),
    ngay_hieu_luc timestamp with time zone,
    ngay_ket_thuc timestamp with time zone,
    cau_hoi_suc_khoe_1 integer NOT NULL,
    cau_hoi_suc_khoe_2 integer NOT NULL,
    chi_tiet_benh_tat text,
    relationship character varying(255),
    created_at timestamp with time zone,
    nguoimuabaohiemtam_id integer NOT NULL
);


ALTER TABLE public.personalhealth_nguoiduocbaohiemtam OWNER TO postgres;

--
-- Name: personalhealth_nguoiduocbaohiemtam_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personalhealth_nguoiduocbaohiemtam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personalhealth_nguoiduocbaohiemtam_id_seq OWNER TO postgres;

--
-- Name: personalhealth_nguoiduocbaohiemtam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personalhealth_nguoiduocbaohiemtam_id_seq OWNED BY public.personalhealth_nguoiduocbaohiemtam.id;


--
-- Name: reset_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reset_token (
    reset_token character varying(10) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.reset_token OWNER TO postgres;

--
-- Name: robot_robot1dautu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.robot_robot1dautu (
    id integer NOT NULL,
    "user" character varying(255),
    ma_don_hang_bihama character varying(255) NOT NULL,
    cong_ty integer NOT NULL,
    loai_hinh_bao_hiem integer NOT NULL,
    goi_san_pham_chinh integer NOT NULL,
    goi_san_pham_phu text,
    so_phi_chinh bigint NOT NULL,
    tong_so_phi_phu bigint NOT NULL,
    tong_phi_thanh_toan bigint NOT NULL,
    gender integer NOT NULL,
    tuoi integer NOT NULL,
    thu_nhap_hang_nam integer NOT NULL,
    khi_dau_tu_ban_quan_tam_gi_nhat integer NOT NULL,
    co_hoi_nhan_thuong_chuong_trinh_truyen_hinh integer NOT NULL,
    y_tuong_rui_ro_trong_dau_tu integer NOT NULL,
    du_bao_gia_vang integer NOT NULL,
    tim_quy_dau_tu integer NOT NULL
);


ALTER TABLE public.robot_robot1dautu OWNER TO postgres;

--
-- Name: robot_robot1dautu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.robot_robot1dautu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.robot_robot1dautu_id_seq OWNER TO postgres;

--
-- Name: robot_robot1dautu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.robot_robot1dautu_id_seq OWNED BY public.robot_robot1dautu.id;


--
-- Name: robot_robotchung; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.robot_robotchung (
    id integer NOT NULL,
    "user" character varying(255),
    ma_don_hang_bihama character varying(255) NOT NULL,
    cong_ty integer NOT NULL,
    loai_hinh_bao_hiem integer NOT NULL,
    goi_san_pham_chinh integer NOT NULL,
    goi_san_pham_phu text,
    so_phi_chinh bigint NOT NULL,
    tong_so_phi_phu bigint NOT NULL,
    tong_phi_thanh_toan bigint NOT NULL,
    gender integer NOT NULL,
    tuoi integer NOT NULL,
    tham_gia_bao_hiem_xa_hoi integer NOT NULL,
    tham_gia_bao_hiem_y_te integer NOT NULL,
    thu_nhap_hang_nam integer NOT NULL,
    muc_dich_tham_gia_bao_hiem integer NOT NULL,
    tinh_trang_hon_nhan integer NOT NULL,
    ban_dang_la integer NOT NULL
);


ALTER TABLE public.robot_robotchung OWNER TO postgres;

--
-- Name: robot_robotchung_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.robot_robotchung_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.robot_robotchung_id_seq OWNER TO postgres;

--
-- Name: robot_robotchung_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.robot_robotchung_id_seq OWNED BY public.robot_robotchung.id;


--
-- Name: termlife_goisanphamchinh; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.termlife_goisanphamchinh (
    id integer NOT NULL,
    ten_loai_hinh_bao_hiem character varying(255),
    id_loai_hinh_bao_hiem integer NOT NULL,
    gioi_tinh integer NOT NULL,
    tuoi integer NOT NULL,
    so_nam_hop_dong integer NOT NULL,
    so_nam_dong_phi integer NOT NULL,
    cach_tra_phi integer NOT NULL,
    ten_goi_san_pham_chinh character varying(255),
    id_goi_san_pham_chinh integer NOT NULL,
    so_phi_chinh_hang_nam double precision NOT NULL,
    so_phi_chinh_hang_nua_nam double precision NOT NULL,
    so_phi_chinh_hang_quy double precision NOT NULL,
    so_phi_chinh_hang_thang double precision NOT NULL,
    company_id integer NOT NULL
);


ALTER TABLE public.termlife_goisanphamchinh OWNER TO postgres;

--
-- Name: termlife_goisanphamchinh_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.termlife_goisanphamchinh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.termlife_goisanphamchinh_id_seq OWNER TO postgres;

--
-- Name: termlife_goisanphamchinh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.termlife_goisanphamchinh_id_seq OWNED BY public.termlife_goisanphamchinh.id;


--
-- Name: termlife_goisanphamphu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.termlife_goisanphamphu (
    id integer NOT NULL,
    ten_loai_hinh_bao_hiem character varying(255),
    id_loai_hinh_bao_hiem integer NOT NULL,
    gioi_tinh integer NOT NULL,
    tuoi integer NOT NULL,
    so_nam_hop_dong integer NOT NULL,
    so_nam_dong_phi integer NOT NULL,
    cach_tra_phi integer NOT NULL,
    ten_goi_san_pham_chinh character varying(255),
    id_goi_san_pham_chinh integer NOT NULL,
    ten_goi_san_pham_phu character varying(255),
    id_goi_san_pham_phu integer NOT NULL,
    so_tien_bao_hiem bigint NOT NULL,
    so_phi_phu_nam double precision NOT NULL,
    company_id integer NOT NULL
);


ALTER TABLE public.termlife_goisanphamphu OWNER TO postgres;

--
-- Name: termlife_goisanphamphu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.termlife_goisanphamphu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.termlife_goisanphamphu_id_seq OWNER TO postgres;

--
-- Name: termlife_goisanphamphu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.termlife_goisanphamphu_id_seq OWNED BY public.termlife_goisanphamphu.id;


--
-- Name: termlife_nguoiduocbaohiem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.termlife_nguoiduocbaohiem (
    id integer NOT NULL,
    ma_don_hang_bihama character varying(255) NOT NULL,
    username character varying(200),
    fullname character varying(200),
    birth_day integer NOT NULL,
    birth_month integer NOT NULL,
    birth_year integer NOT NULL,
    gioi_tinh integer NOT NULL,
    email character varying(255),
    dia_chi_tinh_thanh_pho character varying(255),
    dia_chi_quan_huyen character varying(255),
    dia_chi_chi_tiet character varying(255),
    so_cmnd character varying(255),
    images_cmt_mattruoc text,
    images_cmt_matsau text,
    cmt_ngay_cap date,
    cmt_noi_cap character varying(255),
    ngay_hieu_luc timestamp with time zone,
    ngay_ket_thuc timestamp with time zone,
    cau_hoi_suc_khoe_1 text,
    cau_hoi_suc_khoe_2 text,
    cau_hoi_suc_khoe_3 text,
    cau_hoi_suc_khoe_4 text,
    cau_hoi_suc_khoe_5 text,
    cau_hoi_suc_khoe_6 text,
    cau_hoi_suc_khoe_7 text,
    cau_hoi_suc_khoe_8 text,
    status_marriage integer NOT NULL,
    so_tien_bao_hiem bigint NOT NULL,
    so_nam_hop_dong integer NOT NULL,
    so_nam_dong_phi integer NOT NULL,
    cach_tra_phi integer NOT NULL,
    dinh_ky_dong_phi integer NOT NULL,
    job integer NOT NULL,
    weight integer NOT NULL,
    height integer NOT NULL,
    nationality integer NOT NULL,
    nationality_paper integer NOT NULL,
    is_smoke integer NOT NULL,
    relationship character varying(255),
    created_at timestamp with time zone,
    nguoimuabaohiem_id integer NOT NULL
);


ALTER TABLE public.termlife_nguoiduocbaohiem OWNER TO postgres;

--
-- Name: termlife_nguoiduocbaohiem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.termlife_nguoiduocbaohiem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.termlife_nguoiduocbaohiem_id_seq OWNER TO postgres;

--
-- Name: termlife_nguoiduocbaohiem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.termlife_nguoiduocbaohiem_id_seq OWNED BY public.termlife_nguoiduocbaohiem.id;


--
-- Name: termlife_nguoiduocbaohiemtam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.termlife_nguoiduocbaohiemtam (
    id integer NOT NULL,
    username character varying(200),
    fullname character varying(200),
    birth_day integer NOT NULL,
    birth_month integer NOT NULL,
    birth_year integer NOT NULL,
    gioi_tinh integer NOT NULL,
    email character varying(255),
    dia_chi_tinh_thanh_pho character varying(255),
    dia_chi_quan_huyen character varying(255),
    dia_chi_chi_tiet character varying(255),
    so_cmnd character varying(255),
    images_cmt_mattruoc text,
    images_cmt_matsau text,
    cmt_ngay_cap date,
    cmt_noi_cap character varying(255),
    ngay_hieu_luc timestamp with time zone,
    ngay_ket_thuc timestamp with time zone,
    cau_hoi_suc_khoe_1 text,
    cau_hoi_suc_khoe_2 text,
    cau_hoi_suc_khoe_3 text,
    cau_hoi_suc_khoe_4 text,
    cau_hoi_suc_khoe_5 text,
    cau_hoi_suc_khoe_6 text,
    cau_hoi_suc_khoe_7 text,
    cau_hoi_suc_khoe_8 text,
    status_marriage integer NOT NULL,
    so_tien_bao_hiem bigint NOT NULL,
    so_nam_hop_dong integer NOT NULL,
    so_nam_dong_phi integer NOT NULL,
    cach_tra_phi integer NOT NULL,
    dinh_ky_dong_phi integer NOT NULL,
    job integer NOT NULL,
    weight integer NOT NULL,
    height integer NOT NULL,
    nationality integer NOT NULL,
    nationality_paper integer NOT NULL,
    is_smoke integer NOT NULL,
    relationship character varying(255),
    created_at timestamp with time zone,
    nguoimuabaohiemtam_id integer NOT NULL
);


ALTER TABLE public.termlife_nguoiduocbaohiemtam OWNER TO postgres;

--
-- Name: termlife_nguoiduocbaohiemtam_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.termlife_nguoiduocbaohiemtam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.termlife_nguoiduocbaohiemtam_id_seq OWNER TO postgres;

--
-- Name: termlife_nguoiduocbaohiemtam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.termlife_nguoiduocbaohiemtam_id_seq OWNED BY public.termlife_nguoiduocbaohiemtam.id;


--
-- Name: termlife_nguoithuhuong; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.termlife_nguoithuhuong (
    id integer NOT NULL,
    fullname character varying(200),
    birth_day integer NOT NULL,
    birth_month integer NOT NULL,
    birth_year integer NOT NULL,
    gioi_tinh integer NOT NULL,
    so_cmnd character varying(255),
    images_cmt_mattruoc text,
    images_cmt_matsau text,
    cmt_ngay_cap date,
    cmt_noi_cap character varying(255),
    relationship character varying(255),
    ty_le_thu_huong double precision NOT NULL,
    nguoiduocbaohiem_id integer NOT NULL
);


ALTER TABLE public.termlife_nguoithuhuong OWNER TO postgres;

--
-- Name: termlife_nguoithuhuong_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.termlife_nguoithuhuong_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.termlife_nguoithuhuong_id_seq OWNER TO postgres;

--
-- Name: termlife_nguoithuhuong_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.termlife_nguoithuhuong_id_seq OWNED BY public.termlife_nguoithuhuong.id;


--
-- Name: termlife_nguoithuhuongtam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.termlife_nguoithuhuongtam (
    id integer NOT NULL,
    fullname character varying(200),
    birth_day integer NOT NULL,
    birth_month integer NOT NULL,
    birth_year integer NOT NULL,
    gioi_tinh integer NOT NULL,
    so_cmnd character varying(255),
    images_cmt_mattruoc text,
    images_cmt_matsau text,
    cmt_ngay_cap date,
    cmt_noi_cap character varying(255),
    relationship character varying(255),
    ty_le_thu_huong double precision NOT NULL,
    nguoiduocbaohiemtam_id integer NOT NULL
);


ALTER TABLE public.termlife_nguoithuhuongtam OWNER TO postgres;

--
-- Name: termlife_nguoithuhuongtam_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.termlife_nguoithuhuongtam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.termlife_nguoithuhuongtam_id_seq OWNER TO postgres;

--
-- Name: termlife_nguoithuhuongtam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.termlife_nguoithuhuongtam_id_seq OWNED BY public.termlife_nguoithuhuongtam.id;


--
-- Name: tndsoto_goisanphamchinh; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tndsoto_goisanphamchinh (
    id integer NOT NULL,
    ten_loai_hinh_bao_hiem character varying(255),
    id_loai_hinh_bao_hiem integer NOT NULL,
    ten_trong_tai character varying(255),
    id_trong_tai integer NOT NULL,
    so_phi_chinh double precision NOT NULL,
    company_id integer NOT NULL
);


ALTER TABLE public.tndsoto_goisanphamchinh OWNER TO postgres;

--
-- Name: tndsoto_goisanphamchinh_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tndsoto_goisanphamchinh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tndsoto_goisanphamchinh_id_seq OWNER TO postgres;

--
-- Name: tndsoto_goisanphamchinh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tndsoto_goisanphamchinh_id_seq OWNED BY public.tndsoto_goisanphamchinh.id;


--
-- Name: tndsoto_goisanphamphu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tndsoto_goisanphamphu (
    id integer NOT NULL,
    ten_loai_hinh_bao_hiem character varying(255),
    id_loai_hinh_bao_hiem integer NOT NULL,
    ten_goi_san_pham_phu character varying(255),
    id_goi_san_pham_phu integer NOT NULL,
    so_phi_phu double precision NOT NULL,
    company_id integer NOT NULL
);


ALTER TABLE public.tndsoto_goisanphamphu OWNER TO postgres;

--
-- Name: tndsoto_goisanphamphu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tndsoto_goisanphamphu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tndsoto_goisanphamphu_id_seq OWNER TO postgres;

--
-- Name: tndsoto_goisanphamphu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tndsoto_goisanphamphu_id_seq OWNED BY public.tndsoto_goisanphamphu.id;


--
-- Name: tndsoto_nguoiduocbaohiem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tndsoto_nguoiduocbaohiem (
    id integer NOT NULL,
    ma_don_hang_bihama character varying(255) NOT NULL,
    bien_so_xe character varying(255),
    loai_nguoi_mua integer NOT NULL,
    muc_dich_su_dung integer NOT NULL,
    trong_tai integer NOT NULL,
    so_tien_bao_hiem_tnds_tu_nguyen integer NOT NULL,
    images_dangky_mattruoc text,
    images_dangky_matsau text,
    ngay_hieu_luc timestamp with time zone,
    ngay_ket_thuc timestamp with time zone,
    created_at timestamp with time zone,
    nguoimuabaohiem_id integer NOT NULL
);


ALTER TABLE public.tndsoto_nguoiduocbaohiem OWNER TO postgres;

--
-- Name: tndsoto_nguoiduocbaohiem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tndsoto_nguoiduocbaohiem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tndsoto_nguoiduocbaohiem_id_seq OWNER TO postgres;

--
-- Name: tndsoto_nguoiduocbaohiem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tndsoto_nguoiduocbaohiem_id_seq OWNED BY public.tndsoto_nguoiduocbaohiem.id;


--
-- Name: tndsoto_nguoiduocbaohiemtam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tndsoto_nguoiduocbaohiemtam (
    id integer NOT NULL,
    bien_so_xe character varying(255),
    loai_nguoi_mua integer NOT NULL,
    muc_dich_su_dung integer NOT NULL,
    trong_tai integer NOT NULL,
    so_tien_bao_hiem_tnds_tu_nguyen integer NOT NULL,
    images_dangky_mattruoc text,
    images_dangky_matsau text,
    ngay_hieu_luc timestamp with time zone,
    ngay_ket_thuc timestamp with time zone,
    created_at timestamp with time zone,
    nguoimuabaohiemtam_id integer NOT NULL
);


ALTER TABLE public.tndsoto_nguoiduocbaohiemtam OWNER TO postgres;

--
-- Name: tndsoto_nguoiduocbaohiemtam_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tndsoto_nguoiduocbaohiemtam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tndsoto_nguoiduocbaohiemtam_id_seq OWNER TO postgres;

--
-- Name: tndsoto_nguoiduocbaohiemtam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tndsoto_nguoiduocbaohiemtam_id_seq OWNED BY public.tndsoto_nguoiduocbaohiemtam.id;


--
-- Name: tndsxemay_goisanphamchinh; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tndsxemay_goisanphamchinh (
    id integer NOT NULL,
    ten_loai_hinh_bao_hiem character varying(255),
    id_loai_hinh_bao_hiem integer NOT NULL,
    ten_loai_xe character varying(255),
    id_loai_xe integer NOT NULL,
    so_phi_chinh double precision NOT NULL,
    company_id integer NOT NULL
);


ALTER TABLE public.tndsxemay_goisanphamchinh OWNER TO postgres;

--
-- Name: tndsxemay_goisanphamchinh_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tndsxemay_goisanphamchinh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tndsxemay_goisanphamchinh_id_seq OWNER TO postgres;

--
-- Name: tndsxemay_goisanphamchinh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tndsxemay_goisanphamchinh_id_seq OWNED BY public.tndsxemay_goisanphamchinh.id;


--
-- Name: tndsxemay_goisanphamphu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tndsxemay_goisanphamphu (
    id integer NOT NULL,
    ten_loai_hinh_bao_hiem character varying(255),
    id_loai_hinh_bao_hiem integer NOT NULL,
    ten_goi_san_pham_phu character varying(255),
    id_goi_san_pham_phu integer NOT NULL,
    so_phi_phu double precision NOT NULL,
    company_id integer NOT NULL
);


ALTER TABLE public.tndsxemay_goisanphamphu OWNER TO postgres;

--
-- Name: tndsxemay_goisanphamphu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tndsxemay_goisanphamphu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tndsxemay_goisanphamphu_id_seq OWNER TO postgres;

--
-- Name: tndsxemay_goisanphamphu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tndsxemay_goisanphamphu_id_seq OWNED BY public.tndsxemay_goisanphamphu.id;


--
-- Name: tndsxemay_nguoiduocbaohiem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tndsxemay_nguoiduocbaohiem (
    id integer NOT NULL,
    ma_don_hang_bihama character varying(255) NOT NULL,
    bien_so_xe character varying(255),
    loai_xe integer NOT NULL,
    so_tien_bao_hiem_tnds_tu_nguyen integer NOT NULL,
    so_cho_tai_nan_nguoi_tren_xe integer NOT NULL,
    so_tien_bao_hiem_tai_nan_nguoi_tren_xe bigint NOT NULL,
    so_tien_bao_hiem_chay_no bigint NOT NULL,
    images_dangky_mattruoc text,
    images_dangky_matsau text,
    ngay_hieu_luc timestamp with time zone,
    ngay_ket_thuc timestamp with time zone,
    created_at timestamp with time zone,
    nguoimuabaohiem_id integer NOT NULL
);


ALTER TABLE public.tndsxemay_nguoiduocbaohiem OWNER TO postgres;

--
-- Name: tndsxemay_nguoiduocbaohiem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tndsxemay_nguoiduocbaohiem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tndsxemay_nguoiduocbaohiem_id_seq OWNER TO postgres;

--
-- Name: tndsxemay_nguoiduocbaohiem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tndsxemay_nguoiduocbaohiem_id_seq OWNED BY public.tndsxemay_nguoiduocbaohiem.id;


--
-- Name: tndsxemay_nguoiduocbaohiemtam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tndsxemay_nguoiduocbaohiemtam (
    id integer NOT NULL,
    bien_so_xe character varying(255),
    loai_xe integer NOT NULL,
    so_tien_bao_hiem_tnds_tu_nguyen integer NOT NULL,
    so_cho_tai_nan_nguoi_tren_xe integer NOT NULL,
    so_tien_bao_hiem_tai_nan_nguoi_tren_xe bigint NOT NULL,
    so_tien_bao_hiem_chay_no bigint NOT NULL,
    images_dangky_mattruoc text,
    images_dangky_matsau text,
    ngay_hieu_luc timestamp with time zone,
    ngay_ket_thuc timestamp with time zone,
    created_at timestamp with time zone,
    nguoimuabaohiemtam_id integer NOT NULL
);


ALTER TABLE public.tndsxemay_nguoiduocbaohiemtam OWNER TO postgres;

--
-- Name: tndsxemay_nguoiduocbaohiemtam_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tndsxemay_nguoiduocbaohiemtam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tndsxemay_nguoiduocbaohiemtam_id_seq OWNER TO postgres;

--
-- Name: tndsxemay_nguoiduocbaohiemtam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tndsxemay_nguoiduocbaohiemtam_id_seq OWNED BY public.tndsxemay_nguoiduocbaohiemtam.id;


--
-- Name: token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.token (
    key character varying(128) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.token OWNER TO postgres;

--
-- Name: user_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_notification (
    id integer NOT NULL,
    is_read boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    notification_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.user_notification OWNER TO postgres;

--
-- Name: user_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_notification_id_seq OWNER TO postgres;

--
-- Name: user_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_notification_id_seq OWNED BY public.user_notification.id;


--
-- Name: users_bankaccount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_bankaccount (
    id integer NOT NULL,
    bank_name character varying(200) NOT NULL,
    fullname character varying(200) NOT NULL,
    bank_number character varying(225) NOT NULL,
    branch character varying(200) NOT NULL,
    created_at timestamp with time zone,
    ctv_id integer NOT NULL
);


ALTER TABLE public.users_bankaccount OWNER TO postgres;

--
-- Name: users_bankaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_bankaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_bankaccount_id_seq OWNER TO postgres;

--
-- Name: users_bankaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_bankaccount_id_seq OWNED BY public.users_bankaccount.id;


--
-- Name: users_countotp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_countotp (
    id integer NOT NULL,
    ip_client character varying(255) NOT NULL,
    count_otp integer NOT NULL,
    phone_otp character varying(255) NOT NULL,
    create_at time without time zone NOT NULL
);


ALTER TABLE public.users_countotp OWNER TO postgres;

--
-- Name: users_countotp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_countotp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_countotp_id_seq OWNER TO postgres;

--
-- Name: users_countotp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_countotp_id_seq OWNED BY public.users_countotp.id;


--
-- Name: users_forgotpassword; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_forgotpassword (
    id integer NOT NULL,
    forgot_pass integer NOT NULL,
    ngay_thay_doi timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_forgotpassword OWNER TO postgres;

--
-- Name: users_forgotpassword_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_forgotpassword_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_forgotpassword_id_seq OWNER TO postgres;

--
-- Name: users_forgotpassword_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_forgotpassword_id_seq OWNED BY public.users_forgotpassword.id;


--
-- Name: users_lenhruttien; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_lenhruttien (
    id integer NOT NULL,
    amount_withdraw bigint NOT NULL,
    is_da_gui_mana boolean NOT NULL,
    is_da_gui_ctv boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    status integer NOT NULL,
    bank_account_id integer NOT NULL
);


ALTER TABLE public.users_lenhruttien OWNER TO postgres;

--
-- Name: users_lenhruttien_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_lenhruttien_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_lenhruttien_id_seq OWNER TO postgres;

--
-- Name: users_lenhruttien_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_lenhruttien_id_seq OWNED BY public.users_lenhruttien.id;


--
-- Name: users_loginhistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_loginhistory (
    id integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    num_date integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_loginhistory OWNER TO postgres;

--
-- Name: users_loginhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_loginhistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_loginhistory_id_seq OWNER TO postgres;

--
-- Name: users_loginhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_loginhistory_id_seq OWNED BY public.users_loginhistory.id;


--
-- Name: users_odertutorial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_odertutorial (
    id integer NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    people_post character varying(255) NOT NULL,
    total_view integer NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.users_odertutorial OWNER TO postgres;

--
-- Name: users_odertutorial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_odertutorial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_odertutorial_id_seq OWNER TO postgres;

--
-- Name: users_odertutorial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_odertutorial_id_seq OWNED BY public.users_odertutorial.id;


--
-- Name: users_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user (
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
    fullname character varying(200),
    images_user text,
    gender integer NOT NULL,
    birth_day integer NOT NULL,
    birth_month integer NOT NULL,
    birth_year integer NOT NULL,
    link_info character varying(255),
    code_invite character varying(255),
    register_ctv boolean NOT NULL,
    loai_hinh_muon_hop_tac integer NOT NULL,
    dia_chi_tinh_thanh_pho character varying(200),
    dia_chi_quan_huyen character varying(200),
    dia_chi_chi_tiet character varying(200),
    chung_chi_dai_ly boolean NOT NULL,
    so_chung_chi character varying(200),
    loai_hinh_bao_hiem_cua_chung_chi integer NOT NULL,
    is_gui_register boolean NOT NULL,
    created_at timestamp with time zone
);


ALTER TABLE public.users_user OWNER TO postgres;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO postgres;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_groups_id_seq OWNER TO postgres;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO postgres;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- Name: article_article id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_article ALTER COLUMN id SET DEFAULT nextval('public.article_article_id_seq'::regclass);


--
-- Name: article_gioithieuloaihinhbh id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_gioithieuloaihinhbh ALTER COLUMN id SET DEFAULT nextval('public.article_gioithieuloaihinhbh_id_seq'::regclass);


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
-- Name: claim_yeucaubaolanhvienphi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucaubaolanhvienphi ALTER COLUMN id SET DEFAULT nextval('public.claim_yeucaubaolanhvienphi_id_seq'::regclass);


--
-- Name: claim_yeucauchung id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucauchung ALTER COLUMN id SET DEFAULT nextval('public.claim_yeucauchung_id_seq'::regclass);


--
-- Name: claim_yeucaunhatunhan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucaunhatunhan ALTER COLUMN id SET DEFAULT nextval('public.claim_yeucaunhatunhan_id_seq'::regclass);


--
-- Name: claim_yeucauoto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucauoto ALTER COLUMN id SET DEFAULT nextval('public.claim_yeucauoto_id_seq'::regclass);


--
-- Name: claim_yeucausuckhoe id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucausuckhoe ALTER COLUMN id SET DEFAULT nextval('public.claim_yeucausuckhoe_id_seq'::regclass);


--
-- Name: claim_yeucautainancanhan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucautainancanhan ALTER COLUMN id SET DEFAULT nextval('public.claim_yeucautainancanhan_id_seq'::regclass);


--
-- Name: claim_yeucautuky id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucautuky ALTER COLUMN id SET DEFAULT nextval('public.claim_yeucautuky_id_seq'::regclass);


--
-- Name: core_chitietcongviec id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_chitietcongviec ALTER COLUMN id SET DEFAULT nextval('public.core_chitietcongviec_id_seq'::regclass);


--
-- Name: core_company id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_company ALTER COLUMN id SET DEFAULT nextval('public.core_company_id_seq'::regclass);


--
-- Name: core_district id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_district ALTER COLUMN id SET DEFAULT nextval('public.core_district_id_seq'::regclass);


--
-- Name: core_googlevision id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_googlevision ALTER COLUMN id SET DEFAULT nextval('public.core_googlevision_id_seq'::regclass);


--
-- Name: core_linhvunghenghiep id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_linhvunghenghiep ALTER COLUMN id SET DEFAULT nextval('public.core_linhvunghenghiep_id_seq'::regclass);


--
-- Name: core_nguoimuabaohiem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_nguoimuabaohiem ALTER COLUMN id SET DEFAULT nextval('public.core_nguoimuabaohiem_id_seq'::regclass);


--
-- Name: core_nguoimuabaohiemtam id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_nguoimuabaohiemtam ALTER COLUMN id SET DEFAULT nextval('public.core_nguoimuabaohiemtam_id_seq'::regclass);


--
-- Name: core_noidungnghenghiep id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_noidungnghenghiep ALTER COLUMN id SET DEFAULT nextval('public.core_noidungnghenghiep_id_seq'::regclass);


--
-- Name: core_provincial id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_provincial ALTER COLUMN id SET DEFAULT nextval('public.core_provincial_id_seq'::regclass);


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
-- Name: homeinsurance_goisanphamchinh id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homeinsurance_goisanphamchinh ALTER COLUMN id SET DEFAULT nextval('public.homeinsurance_goisanphamchinh_id_seq'::regclass);


--
-- Name: homeinsurance_goisanphamphu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homeinsurance_goisanphamphu ALTER COLUMN id SET DEFAULT nextval('public.homeinsurance_goisanphamphu_id_seq'::regclass);


--
-- Name: homeinsurance_nguoiduocbaohiem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homeinsurance_nguoiduocbaohiem ALTER COLUMN id SET DEFAULT nextval('public.homeinsurance_nguoiduocbaohiem_id_seq'::regclass);


--
-- Name: homeinsurance_nguoiduocbaohiemtam id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homeinsurance_nguoiduocbaohiemtam ALTER COLUMN id SET DEFAULT nextval('public.homeinsurance_nguoiduocbaohiemtam_id_seq'::regclass);


--
-- Name: homeinsurance_nguoithuhuong id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homeinsurance_nguoithuhuong ALTER COLUMN id SET DEFAULT nextval('public.homeinsurance_nguoithuhuong_id_seq'::regclass);


--
-- Name: insurancecompany_insurancecompany id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insurancecompany_insurancecompany ALTER COLUMN id SET DEFAULT nextval('public.insurancecompany_insurancecompany_id_seq'::regclass);


--
-- Name: investment_giatridautu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investment_giatridautu ALTER COLUMN id SET DEFAULT nextval('public.investment_giatridautu_id_seq'::regclass);


--
-- Name: investment_goisanphamchinh id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investment_goisanphamchinh ALTER COLUMN id SET DEFAULT nextval('public.investment_goisanphamchinh_id_seq'::regclass);


--
-- Name: investment_goisanphamphu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investment_goisanphamphu ALTER COLUMN id SET DEFAULT nextval('public.investment_goisanphamphu_id_seq'::regclass);


--
-- Name: investment_laisuatthitruong id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investment_laisuatthitruong ALTER COLUMN id SET DEFAULT nextval('public.investment_laisuatthitruong_id_seq'::regclass);


--
-- Name: investment_nguoiduocbaohiem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investment_nguoiduocbaohiem ALTER COLUMN id SET DEFAULT nextval('public.investment_nguoiduocbaohiem_id_seq'::regclass);


--
-- Name: investment_nguoiduocbaohiemtam id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investment_nguoiduocbaohiemtam ALTER COLUMN id SET DEFAULT nextval('public.investment_nguoiduocbaohiemtam_id_seq'::regclass);


--
-- Name: investment_nguoithuhuong id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investment_nguoithuhuong ALTER COLUMN id SET DEFAULT nextval('public.investment_nguoithuhuong_id_seq'::regclass);


--
-- Name: investment_nguoithuhuongtam id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investment_nguoithuhuongtam ALTER COLUMN id SET DEFAULT nextval('public.investment_nguoithuhuongtam_id_seq'::regclass);


--
-- Name: kienthuc_kienthuccategory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kienthuc_kienthuccategory ALTER COLUMN id SET DEFAULT nextval('public.kienthuc_kienthuccategory_id_seq'::regclass);


--
-- Name: kienthuc_kienthucmodel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kienthuc_kienthucmodel ALTER COLUMN id SET DEFAULT nextval('public.kienthuc_kienthucmodel_id_seq'::regclass);


--
-- Name: notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification ALTER COLUMN id SET DEFAULT nextval('public.notification_id_seq'::regclass);


--
-- Name: payment_dondathang id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_dondathang ALTER COLUMN id SET DEFAULT nextval('public.payment_dondathang_id_seq'::regclass);


--
-- Name: payment_magiamgia id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_magiamgia ALTER COLUMN id SET DEFAULT nextval('public.payment_magiamgia_id_seq'::regclass);


--
-- Name: payment_taituc id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_taituc ALTER COLUMN id SET DEFAULT nextval('public.payment_taituc_id_seq'::regclass);


--
-- Name: personalhealth_goisanphamchinh id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personalhealth_goisanphamchinh ALTER COLUMN id SET DEFAULT nextval('public.personalhealth_goisanphamchinh_id_seq'::regclass);


--
-- Name: personalhealth_goisanphamphu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personalhealth_goisanphamphu ALTER COLUMN id SET DEFAULT nextval('public.personalhealth_goisanphamphu_id_seq'::regclass);


--
-- Name: personalhealth_nguoiduocbaohiem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personalhealth_nguoiduocbaohiem ALTER COLUMN id SET DEFAULT nextval('public.personalhealth_nguoiduocbaohiem_id_seq'::regclass);


--
-- Name: personalhealth_nguoiduocbaohiemtam id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personalhealth_nguoiduocbaohiemtam ALTER COLUMN id SET DEFAULT nextval('public.personalhealth_nguoiduocbaohiemtam_id_seq'::regclass);


--
-- Name: robot_robot1dautu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.robot_robot1dautu ALTER COLUMN id SET DEFAULT nextval('public.robot_robot1dautu_id_seq'::regclass);


--
-- Name: robot_robotchung id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.robot_robotchung ALTER COLUMN id SET DEFAULT nextval('public.robot_robotchung_id_seq'::regclass);


--
-- Name: termlife_goisanphamchinh id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termlife_goisanphamchinh ALTER COLUMN id SET DEFAULT nextval('public.termlife_goisanphamchinh_id_seq'::regclass);


--
-- Name: termlife_goisanphamphu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termlife_goisanphamphu ALTER COLUMN id SET DEFAULT nextval('public.termlife_goisanphamphu_id_seq'::regclass);


--
-- Name: termlife_nguoiduocbaohiem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termlife_nguoiduocbaohiem ALTER COLUMN id SET DEFAULT nextval('public.termlife_nguoiduocbaohiem_id_seq'::regclass);


--
-- Name: termlife_nguoiduocbaohiemtam id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termlife_nguoiduocbaohiemtam ALTER COLUMN id SET DEFAULT nextval('public.termlife_nguoiduocbaohiemtam_id_seq'::regclass);


--
-- Name: termlife_nguoithuhuong id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termlife_nguoithuhuong ALTER COLUMN id SET DEFAULT nextval('public.termlife_nguoithuhuong_id_seq'::regclass);


--
-- Name: termlife_nguoithuhuongtam id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termlife_nguoithuhuongtam ALTER COLUMN id SET DEFAULT nextval('public.termlife_nguoithuhuongtam_id_seq'::regclass);


--
-- Name: tndsoto_goisanphamchinh id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tndsoto_goisanphamchinh ALTER COLUMN id SET DEFAULT nextval('public.tndsoto_goisanphamchinh_id_seq'::regclass);


--
-- Name: tndsoto_goisanphamphu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tndsoto_goisanphamphu ALTER COLUMN id SET DEFAULT nextval('public.tndsoto_goisanphamphu_id_seq'::regclass);


--
-- Name: tndsoto_nguoiduocbaohiem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tndsoto_nguoiduocbaohiem ALTER COLUMN id SET DEFAULT nextval('public.tndsoto_nguoiduocbaohiem_id_seq'::regclass);


--
-- Name: tndsoto_nguoiduocbaohiemtam id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tndsoto_nguoiduocbaohiemtam ALTER COLUMN id SET DEFAULT nextval('public.tndsoto_nguoiduocbaohiemtam_id_seq'::regclass);


--
-- Name: tndsxemay_goisanphamchinh id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tndsxemay_goisanphamchinh ALTER COLUMN id SET DEFAULT nextval('public.tndsxemay_goisanphamchinh_id_seq'::regclass);


--
-- Name: tndsxemay_goisanphamphu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tndsxemay_goisanphamphu ALTER COLUMN id SET DEFAULT nextval('public.tndsxemay_goisanphamphu_id_seq'::regclass);


--
-- Name: tndsxemay_nguoiduocbaohiem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tndsxemay_nguoiduocbaohiem ALTER COLUMN id SET DEFAULT nextval('public.tndsxemay_nguoiduocbaohiem_id_seq'::regclass);


--
-- Name: tndsxemay_nguoiduocbaohiemtam id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tndsxemay_nguoiduocbaohiemtam ALTER COLUMN id SET DEFAULT nextval('public.tndsxemay_nguoiduocbaohiemtam_id_seq'::regclass);


--
-- Name: user_notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_notification ALTER COLUMN id SET DEFAULT nextval('public.user_notification_id_seq'::regclass);


--
-- Name: users_bankaccount id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_bankaccount ALTER COLUMN id SET DEFAULT nextval('public.users_bankaccount_id_seq'::regclass);


--
-- Name: users_countotp id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_countotp ALTER COLUMN id SET DEFAULT nextval('public.users_countotp_id_seq'::regclass);


--
-- Name: users_forgotpassword id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_forgotpassword ALTER COLUMN id SET DEFAULT nextval('public.users_forgotpassword_id_seq'::regclass);


--
-- Name: users_lenhruttien id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_lenhruttien ALTER COLUMN id SET DEFAULT nextval('public.users_lenhruttien_id_seq'::regclass);


--
-- Name: users_loginhistory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_loginhistory ALTER COLUMN id SET DEFAULT nextval('public.users_loginhistory_id_seq'::regclass);


--
-- Name: users_odertutorial id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_odertutorial ALTER COLUMN id SET DEFAULT nextval('public.users_odertutorial_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: article_article; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.article_article (id, title, slug, link_video, sub_title, content, images_gioi_thieu, sub_content, tac_gia, loai_tin_tuc, seo_key_word, status, created_time) FROM stdin;
1	Làm sao để Bảo Hiểm tạo ra sự “an sinh” cho mọi thành viên trong xã hội ?	Lam-sao-de-bao-hiem-tao-ra-su-an-sinh-cho-moi-thanh-vien-trong-xa-hoi	\N	Các chủ thể chính là xương sống để đánh giá sự phát triển một quốc gia gồm 3 yếu tố: Chứng khoán, Ngân hàng và Bảo hiểm		/static/article/images/image1.jpg			1	Bảo hiểm,Ngân hàng,Chứng khoán,sương sống quốc gia,bảo hiểm thương mại,thị trường,tin tức bảo hiểm,an sinh xã hội	0	2020-08-11 08:42:29.476794+00
2	Hiểu đúng về Insurtech – Bảo hiểm số	hieu-dung-ve-insurtech-bao-hiem-so	\N	Khái niệm về “Insurtech” là “Công nghệ bảo hiểm” hay “Bảo hiểm số” là thuật ngữ hiện tại đang khá mới tại Việt Nam khi thị trường bảo hiểm của chúng ta mới xây dựng và phát triển được trong 20 năm gần đây		/static/article/images/image2.jpg			1	Công nghệ,bảo hiểm số,Insurtech,yêu cầu bảo hiểm,nhận diện,bảo hiểm nhân thọ,có bán online nhân thọ không,doah số,giản pháp bảo hiểm nhân thọ	0	2020-08-11 08:42:29.611057+00
3	Tại sao Cơm Trưa Văn Phòng bán online là cần thiết?	Tai-sao-bao-hiem-nhan-tho-ban-online-la-can-thiet	\N	Cơm Trưa Văn Phòng phát triển cùng với lúc đất nước bước vào công cuộc đổi mới kinh tế, bán bảo hiểm qua kênh đại lý truyền thống luôn là kênh chủ lực trong những năm qua, mang lại doanh thu phí lớn nhất cho các công ty bảo hiểm.		/static/article/images/image3.jpg			1	Cơm Trưa Văn Phòng trên sàn bihama,tại sao nên mua online bảo hiểm trên sàn bihama,nên mua bảo hiểm online,mua bảo hiểm ở đâu tốt nhất,mua bảo hiểm online ở đâu uy tín,mua bao hiem truc tuyen o dau tot	0	2020-08-11 08:42:29.635639+00
4	Trí tuệ nhân tạo áp dụng vào bảo hiểm như thế nào?	Tri-tue-nhan-tao-ap-dung-vao-bao-hiem-nhu-the-nao	\N	Khi chúng ta bắt đầu đề cập tới trí tuệ nhân tạo, các công ty bảo hiểm tại Việt Nam đã bắt đầu nhận ra rằng đó sẽ là xu thế phát triển mới trong kỷ nguyên của kỹ thuật số		/static/article/images/image4.jpg			1	Trí tuệ nhân tạo,kỹ thuật số,nhận diện giọng nói,sản phẩm công nghệ,tư vấn sản phẩm,Thông báo,thương hiệu bihama	0	2020-08-11 08:42:29.666238+00
5	Bihama – bảo hiểm cho mọi nhà – thương hiệu Insurtech Việt Nam	Bihama-bao-hiem-cho-moi-nha-thuong-hieu-insurtech-viet-nam	\N	Thương hiệu bảo hiểm Bihama được công ty Cổ Phần FinPlus nghiên cứu và phát triển từ năm 2018 với mong muốn tạo ra một sản phẩm công nghệ số mang thương hiệu Việt.		/static/article/images/mokuplap.png			1	bảo hiểm cho mọi nhà,bihama sàn thương mại điện tử lớn nhất,mua bảo hiểm rẻ nhất ở đâu,mua online bảo hiểm ở đâu,mua online bảo hiểm xe máy trên sàn bihama,mua online ở đâu tốt nhất	0	2020-08-11 08:42:29.686714+00
6	Bảo hiểm có dành cho người nghèo?	bao-hiem-co-danh-cho-nguoi-ngheo	\N	Bảo hiểm là một hình thức ra đời dựa trên quy luật lấy số đông bù số ít. Có 2 chế độ bảo hiểm chính của một quốc gia là bảo hiểm xã hội và bảo hiểm thương mại.		/static/article/images/7.png			1	Người nghèo có mua được bảo hiểm không,bảo hiểm thương mại,bảo hiểm cho người thu nhập thấp,vay xóa đói giảm nghèo,đào tạo nghề,	0	2020-08-11 08:42:29.711189+00
7	Ký kết hợp tác chiến lược giữa FinPLus va OPES	Ky-ket-hop-tac-chien-luoc-giua-FinPlus-va-opes	\N	Ngày 30-07-2020, tại Hà Nội, Công Ty Cổ Phần Bảo Hiểm OPES và Công ty Cổ Phần FinPlus đã ký kết thỏa thuận hợp tác cung cấp trực tiếp các sản phẩm nhà tư nhân, bảo hiểm bệnh hiểm nghèo, Tnds xe ô tô, Tnds xe máy trên sàn thương mại điện tử bảo hiểm https://bihama.vn/		/static/article/images/image8.png			2	FinPLus và opes kí hợp tác khi nào,ngày 30-07-2020 opes đã kí hợp tác với FinPLus,Bảo Hiểm OPES,FinPLus cung cấp trực tiếp sản phẩm cho opes,nhà tư nhân,trách nhiệm dân sự xe máy,trách nhiệm dân sự oto,kĩ thuật số 4.0 opes,opes kí hợp tác với ai	0	2020-08-11 08:42:29.736271+00
8	FinPLus ra mắt sàn thương mại điện tử Bihama	FinPLus-ra-mat-san-thuong-mai-dien-tu-bihama	\N	Ngày 30 – 7 – 2020 tại Hà Nội, Công ty Cổ Phần FinPlus chính thức cho ra mắt sàn thương mại điện tử bảo hiểm Bihama		/static/about/images/tuana.jpg			2	30-07-2020 FinPlus ra mắt sàn thương mại điện tử bihama,khi nào ra mắt sàn thương mại điện tử bihama.vn,bihama ra mắt khi nào,sàn bihama,bảo hiểm bihama,sàn bihama có tính năng gì,robot tư vấn,nhận diện hình ảnh,tái tục,tự động đóng thêm,Bihama 1.0,Bihama 2.0,sàn tương mại điện tử lơn nhất,mua online bảo hiểm thì mua ở đâu,	0	2020-08-11 08:42:29.768927+00
9	Bảo hiểm số áp dụng vào Bảo hiểm ô tô như thế nào?	Bao-hiem-so-ap-dung-vao-bao-hiem-o-to-nhu-the-nao	\N	Bảo hiểm ô tô là một sản phẩm tiềm năng và là sản phẩm chính của các công ty bảo hiểm phi nhân thọ những năm vừa qua. Bảo hiểm ô tô bao gồm : bảo hiểm vật chất xe, bảo hiểm TNDS bắt buộc, bảo hiểm TNDS tự nguyện		/static/article/images/10.png			2	bảo hiểm ô tô rẻ,mua bảo hiểm oto ở đâu rẻ,nên mua bảo hiểm oto ở đâu,bảo hiểm vật chất xe,bảo hiểm trách nhiệm dân sự xe oto,bồi thường trên sàn bihama,bảo hiểm số bihama,giám định bồi thường ở đâu,giám định bồi thường bằng trí tuệ nhân tạo,bảo hiểm oto trên bihama,	0	2020-08-11 08:42:29.791663+00
10	Bảo hiểm số áp dụng vào Cơm Trưa Văn Phòng như thế nào?	Bao-hiem-so-ap-dung-vao-bao-hiem-nhan-tho-nhu-the-nao	\N	Một số doanh nghiệp chú trọng số hóa toàn bộ quy trình, giao dịch không dùng giấy tờ từ khi yêu cầu bảo hiểm đến cấp hợp đồng và chăm sóc khách hàng, giải quyết bồi thường.		/static/article/images/11.1.png			2	bảo hiểm nhân thọ,Cơm Trưa Văn Phòng như thế nào,Cơm Trưa Văn Phòng trong công nghệ số,Cơm Trưa Văn Phòng bihama,bihama giúp cải thiện tốc độ khiếu nại	0	2020-08-11 08:42:29.820611+00
11	Bảo hiểm số áp dụng vào bảo hiểm Chăm sóc sức khoẻ như thế nào?	Bao-hiem-so-ap-dung-vao-bao-hiem-cham-soc-suc-khoe-nhu-the-nao	\N	Sản phẩm bảo hiểm được quan tâm nhiều nhất trong những năm vừa qua và là sản phẩm chính của các công ty bảo hiểm phi nhân thọ chính là sản phẩm bảo hiểm sức khoẻ.		/static/article/images/12.1.jpg			2	bảo hiểm chăm sóc sưc khỏe,mua bảo hiểm sức khỏe ở đâu tốt,mua online bảo hiểm sức khỏe ở đâu uy tín,mua bảo hiểm sức khỏe kiểu gì,bảo hiểm sức khỏe có lợi ích gì,bảo hiểm số,sản phẩm bảo hiểm tốt nhất,sản phẩm bảo hiểm được quan tâm nhất năm,sản phẩm chăm sóc sức khỏe tại hà nội,	0	2020-08-11 08:42:29.844131+00
12	Cộng tác cùng Bihama	Cong-tac-cung-bihama	\N	Để mở rộng quy mô kinh doanh, Bihama cần tuyển các đại lý và cộng tác viên làm việc tự do từ xa với mô tả công việc và quyền lợi được hưởng cụ thể dưới đây.		/static/article/images/13.1.jpg			1	cộng tác cùng bihama,làm cộng tác viên với bihama có lợi ích gì,muốn làm cộng tác viên của bihama cần những gì,làm sao để trở thành cộng tác của bihama,lợi ích khi làm cộng tác viên của bihama,ai có thể trở thành công tác viên của bihama,điều kiện để trở thành cộng tác của bihama,bihama tuyển cộng tác viên,bihama tuyển đại lý bảo hiểm,hưởng hoa hồng cao khi làm cộng tác với bihama,hoa hồng là bao nhiêu khi làm cộng tác của bihama,cộng tác viên hưởng 40% hoa hồng trên sàn bihama,có được đào tạo khi là cộng tác của bihama không	0	2020-08-11 08:42:29.871989+00
13	Bảo hiểm số tác động tới đại lý bảo hiểm như thế nào?	Bao-hiem-so-tac-dong-toi-dai-ly-bao-hiem-nhu-the-nao	\N	Khi doanh nghiệp bảo hiểm tự phát triển bảo hiểm số sẽ phải đối mặt với xung đột quyền lợi trong chính hệ thống của mình		/static/article/images/14.1.jpg			1	tác động của bảo hiểm số với đại lý bảo hiểm,đại lí bảo hiểm là gì,đại lí bảo hiểm trao đảo khi công nghệ số xuất hiện,bảo hiêm số trong thời đại công nghệ số,	0	2020-08-11 08:42:29.900053+00
14	Bảo hiểm số áp dụng vào bảo hiểm đầu tư như thế nào?	Bao-hiem-so-ap-dung-vao-bao-hiem-dau-tu-nhu-the-nao	\N	Các sản phẩm đầu tư gồm sản phẩm liên kết đơn vị, sản phẩm liên kết chung đang là các sản phẩm chủ lực và là các sản phẩm được khách hàng ưa thích nhất khi tham gia bảo hiểm nhân thọ.		/static/article/images/15.2.jpg			1	bảo hiểm số áp dụng vào bảo hiểm đầu tư như thế nào,bảo hiểm đầu tư khi có công nghệ số,công nghệ số sản phẩm đầu tư,sản phẩm đầu tư của bihama sử dụng công nghệ số,công nghệ số trong sản phẩm đầu tư,an tâm với số tiền đầu tư khi sử dụng công nghệ số,	0	2020-08-11 08:42:29.984348+00
15	BIHAMA-OPES  : Chính thức triển khai Bảo hiểm Nhà An Gia	bihama-opes-chinh-thuc-trien-khai-bao-hiem-nha-an-gia	\N	Đối với mỗi chúng ta, ngôi nhà không chỉ là tài sản quý giá, mà còn là tổ ấm vô giá. Từ 11/08 này, hãy để OPES cùng FinPLus cùng đồng hành và bảo vệ toàn diện cho mái ấm gia đình bạn trước mọi rủi ro trong cuộc sống với sản phẩm Bảo hiểm nhà An Gia. Đây là sản phẩm bảo hiểm nhà tư nhân ưu việt được thiết kế với mức chi phí hợp lý, có thể được cá nhân hóa linh hoạt theo nhu cầu của bạn và gia đình. Sản phẩm bảo hiểm Nhà An Gia của OPES sẽ được FinPlus phân phối qua trang thương mại điện tử Bihama.vn		/static/article/images/bihama_opes.jpg			1	nan	0	2020-08-11 08:42:30.048096+00
\.


--
-- Data for Name: article_gioithieuloaihinhbh; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.article_gioithieuloaihinhbh (id, content, link_video, loai_hinh_bao_hiem, created_time, status) FROM stdin;
\.


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
21	Can add Chi tiết công việc	6	add_chitietcongviec
22	Can change Chi tiết công việc	6	change_chitietcongviec
23	Can delete Chi tiết công việc	6	delete_chitietcongviec
24	Can view Chi tiết công việc	6	view_chitietcongviec
25	Can add Công ty	7	add_company
26	Can change Công ty	7	change_company
27	Can delete Công ty	7	delete_company
28	Can view Công ty	7	view_company
29	Can add Quận huyện 	8	add_district
30	Can change Quận huyện 	8	change_district
31	Can delete Quận huyện 	8	delete_district
32	Can view Quận huyện 	8	view_district
33	Can add AI GoogleCloud	9	add_googlevision
34	Can change AI GoogleCloud	9	change_googlevision
35	Can delete AI GoogleCloud	9	delete_googlevision
36	Can view AI GoogleCloud	9	view_googlevision
37	Can add Lĩnh vực nghề nghiệp	10	add_linhvunghenghiep
38	Can change Lĩnh vực nghề nghiệp	10	change_linhvunghenghiep
39	Can delete Lĩnh vực nghề nghiệp	10	delete_linhvunghenghiep
40	Can view Lĩnh vực nghề nghiệp	10	view_linhvunghenghiep
41	Can add Người mua bảo hiểm	11	add_nguoimuabaohiem
42	Can change Người mua bảo hiểm	11	change_nguoimuabaohiem
43	Can delete Người mua bảo hiểm	11	delete_nguoimuabaohiem
44	Can view Người mua bảo hiểm	11	view_nguoimuabaohiem
45	Can add Người mua bảo hiểm tạm	12	add_nguoimuabaohiemtam
46	Can change Người mua bảo hiểm tạm	12	change_nguoimuabaohiemtam
47	Can delete Người mua bảo hiểm tạm	12	delete_nguoimuabaohiemtam
48	Can view Người mua bảo hiểm tạm	12	view_nguoimuabaohiemtam
49	Can add Nội dung công việc	13	add_noidungnghenghiep
50	Can change Nội dung công việc	13	change_noidungnghenghiep
51	Can delete Nội dung công việc	13	delete_noidungnghenghiep
52	Can view Nội dung công việc	13	view_noidungnghenghiep
53	Can add Tỉnh thành phố 	14	add_provincial
54	Can change Tỉnh thành phố 	14	change_provincial
55	Can delete Tỉnh thành phố 	14	delete_provincial
56	Can view Tỉnh thành phố 	14	view_provincial
57	Can add User	15	add_user
58	Can change User	15	change_user
59	Can delete User	15	delete_user
60	Can view User	15	view_user
61	Can add Tài khoản ngân hàng user 	16	add_bankaccount
62	Can change Tài khoản ngân hàng user 	16	change_bankaccount
63	Can delete Tài khoản ngân hàng user 	16	delete_bankaccount
64	Can view Tài khoản ngân hàng user 	16	view_bankaccount
65	Can add Đếm số lần nhập OTP 	17	add_countotp
66	Can change Đếm số lần nhập OTP 	17	change_countotp
67	Can delete Đếm số lần nhập OTP 	17	delete_countotp
68	Can view Đếm số lần nhập OTP 	17	view_countotp
69	Can add notification	18	add_notification
70	Can change notification	18	change_notification
71	Can delete notification	18	delete_notification
72	Can view notification	18	view_notification
73	Can add oder tutorial	19	add_odertutorial
74	Can change oder tutorial	19	change_odertutorial
75	Can delete oder tutorial	19	delete_odertutorial
76	Can view oder tutorial	19	view_odertutorial
77	Can add user notification	20	add_usernotification
78	Can change user notification	20	change_usernotification
79	Can delete user notification	20	delete_usernotification
80	Can view user notification	20	view_usernotification
81	Can add token	21	add_token
82	Can change token	21	change_token
83	Can delete token	21	delete_token
84	Can view token	21	view_token
85	Can add reset token	22	add_resettoken
86	Can change reset token	22	change_resettoken
87	Can delete reset token	22	delete_resettoken
88	Can view reset token	22	view_resettoken
89	Can add Lịch sử đăng nhập login 	23	add_loginhistory
90	Can change Lịch sử đăng nhập login 	23	change_loginhistory
91	Can delete Lịch sử đăng nhập login 	23	delete_loginhistory
92	Can view Lịch sử đăng nhập login 	23	view_loginhistory
93	Can add Đặt lệnh rút tiền	24	add_lenhruttien
94	Can change Đặt lệnh rút tiền	24	change_lenhruttien
95	Can delete Đặt lệnh rút tiền	24	delete_lenhruttien
96	Can view Đặt lệnh rút tiền	24	view_lenhruttien
97	Can add Lấy lại mật khẩu	25	add_forgotpassword
98	Can change Lấy lại mật khẩu	25	change_forgotpassword
99	Can delete Lấy lại mật khẩu	25	delete_forgotpassword
100	Can view Lấy lại mật khẩu	25	view_forgotpassword
101	Can add confirm email token	26	add_confirmemailtoken
102	Can change confirm email token	26	change_confirmemailtoken
103	Can delete confirm email token	26	delete_confirmemailtoken
104	Can view confirm email token	26	view_confirmemailtoken
105	Can add Người được bảo hiểm tạm	27	add_nguoiduocbaohiemtam
106	Can change Người được bảo hiểm tạm	27	change_nguoiduocbaohiemtam
107	Can delete Người được bảo hiểm tạm	27	delete_nguoiduocbaohiemtam
108	Can view Người được bảo hiểm tạm	27	view_nguoiduocbaohiemtam
109	Can add Người được bảo hiểm	28	add_nguoiduocbaohiem
110	Can change Người được bảo hiểm	28	change_nguoiduocbaohiem
111	Can delete Người được bảo hiểm	28	delete_nguoiduocbaohiem
112	Can view Người được bảo hiểm	28	view_nguoiduocbaohiem
113	Can add Gói sản phẩm phụ	29	add_goisanphamphu
114	Can change Gói sản phẩm phụ	29	change_goisanphamphu
115	Can delete Gói sản phẩm phụ	29	delete_goisanphamphu
116	Can view Gói sản phẩm phụ	29	view_goisanphamphu
117	Can add Gói sản phẩm chính	30	add_goisanphamchinh
118	Can change Gói sản phẩm chính	30	change_goisanphamchinh
119	Can delete Gói sản phẩm chính	30	delete_goisanphamchinh
120	Can view Gói sản phẩm chính	30	view_goisanphamchinh
121	Can add Đơn đặt hàng 	31	add_dondathang
122	Can change Đơn đặt hàng 	31	change_dondathang
123	Can delete Đơn đặt hàng 	31	delete_dondathang
124	Can view Đơn đặt hàng 	31	view_dondathang
125	Can add Mã giảm giá 	32	add_magiamgia
126	Can change Mã giảm giá 	32	change_magiamgia
127	Can delete Mã giảm giá 	32	delete_magiamgia
128	Can view Mã giảm giá 	32	view_magiamgia
129	Can add Tái Tục và Đóng Thêm	33	add_taituc
130	Can change Tái Tục và Đóng Thêm	33	change_taituc
131	Can delete Tái Tục và Đóng Thêm	33	delete_taituc
132	Can view Tái Tục và Đóng Thêm	33	view_taituc
133	Can add Tin tức	34	add_article
134	Can change Tin tức	34	change_article
135	Can delete Tin tức	34	delete_article
136	Can view Tin tức	34	view_article
137	Can add Giới thiệu loại hình bảo hiểm	35	add_gioithieuloaihinhbh
138	Can change Giới thiệu loại hình bảo hiểm	35	change_gioithieuloaihinhbh
139	Can delete Giới thiệu loại hình bảo hiểm	35	delete_gioithieuloaihinhbh
140	Can view Giới thiệu loại hình bảo hiểm	35	view_gioithieuloaihinhbh
141	Can add Yêu cầu bảo lãnh viện phí	36	add_yeucaubaolanhvienphi
142	Can change Yêu cầu bảo lãnh viện phí	36	change_yeucaubaolanhvienphi
143	Can delete Yêu cầu bảo lãnh viện phí	36	delete_yeucaubaolanhvienphi
144	Can view Yêu cầu bảo lãnh viện phí	36	view_yeucaubaolanhvienphi
145	Can add Yêu cầu chung	37	add_yeucauchung
146	Can change Yêu cầu chung	37	change_yeucauchung
147	Can delete Yêu cầu chung	37	delete_yeucauchung
148	Can view Yêu cầu chung	37	view_yeucauchung
149	Can add Yêu cầu nhà tư nhân	38	add_yeucaunhatunhan
150	Can change Yêu cầu nhà tư nhân	38	change_yeucaunhatunhan
151	Can delete Yêu cầu nhà tư nhân	38	delete_yeucaunhatunhan
152	Can view Yêu cầu nhà tư nhân	38	view_yeucaunhatunhan
153	Can add Yêu cầu ô tô	39	add_yeucauoto
154	Can change Yêu cầu ô tô	39	change_yeucauoto
155	Can delete Yêu cầu ô tô	39	delete_yeucauoto
156	Can view Yêu cầu ô tô	39	view_yeucauoto
157	Can add Yêu cầu sức khỏe	40	add_yeucausuckhoe
158	Can change Yêu cầu sức khỏe	40	change_yeucausuckhoe
159	Can delete Yêu cầu sức khỏe	40	delete_yeucausuckhoe
160	Can view Yêu cầu sức khỏe	40	view_yeucausuckhoe
161	Can add Yêu cầu tai nạn cá nhân	41	add_yeucautainancanhan
162	Can change Yêu cầu tai nạn cá nhân	41	change_yeucautainancanhan
163	Can delete Yêu cầu tai nạn cá nhân	41	delete_yeucautainancanhan
164	Can view Yêu cầu tai nạn cá nhân	41	view_yeucautainancanhan
165	Can add Yêu cầu tử kỳ	42	add_yeucautuky
166	Can change Yêu cầu tử kỳ	42	change_yeucautuky
167	Can delete Yêu cầu tử kỳ	42	delete_yeucautuky
168	Can view Yêu cầu tử kỳ	42	view_yeucautuky
169	Can add Người được bảo hiểm	43	add_nguoiduocbaohiem
170	Can change Người được bảo hiểm	43	change_nguoiduocbaohiem
171	Can delete Người được bảo hiểm	43	delete_nguoiduocbaohiem
172	Can view Người được bảo hiểm	43	view_nguoiduocbaohiem
173	Can add Người thụ hưởng	44	add_nguoithuhuong
174	Can change Người thụ hưởng	44	change_nguoithuhuong
175	Can delete Người thụ hưởng	44	delete_nguoithuhuong
176	Can view Người thụ hưởng	44	view_nguoithuhuong
177	Can add Người được bảo hiểm tạm	45	add_nguoiduocbaohiemtam
178	Can change Người được bảo hiểm tạm	45	change_nguoiduocbaohiemtam
179	Can delete Người được bảo hiểm tạm	45	delete_nguoiduocbaohiemtam
180	Can view Người được bảo hiểm tạm	45	view_nguoiduocbaohiemtam
181	Can add Gói sản phẩm phụ	46	add_goisanphamphu
182	Can change Gói sản phẩm phụ	46	change_goisanphamphu
183	Can delete Gói sản phẩm phụ	46	delete_goisanphamphu
184	Can view Gói sản phẩm phụ	46	view_goisanphamphu
185	Can add Gói sản phẩm chính	47	add_goisanphamchinh
186	Can change Gói sản phẩm chính	47	change_goisanphamchinh
187	Can delete Gói sản phẩm chính	47	delete_goisanphamchinh
188	Can view Gói sản phẩm chính	47	view_goisanphamchinh
189	Can add Giá trị đầu tư	48	add_giatridautu
190	Can change Giá trị đầu tư	48	change_giatridautu
191	Can delete Giá trị đầu tư	48	delete_giatridautu
192	Can view Giá trị đầu tư	48	view_giatridautu
193	Can add Lãi suất thị trường	49	add_laisuatthitruong
194	Can change Lãi suất thị trường	49	change_laisuatthitruong
195	Can delete Lãi suất thị trường	49	delete_laisuatthitruong
196	Can view Lãi suất thị trường	49	view_laisuatthitruong
197	Can add Người được bảo hiểm	50	add_nguoiduocbaohiem
198	Can change Người được bảo hiểm	50	change_nguoiduocbaohiem
199	Can delete Người được bảo hiểm	50	delete_nguoiduocbaohiem
200	Can view Người được bảo hiểm	50	view_nguoiduocbaohiem
201	Can add Người được bảo hiểm tạm	51	add_nguoiduocbaohiemtam
202	Can change Người được bảo hiểm tạm	51	change_nguoiduocbaohiemtam
203	Can delete Người được bảo hiểm tạm	51	delete_nguoiduocbaohiemtam
204	Can view Người được bảo hiểm tạm	51	view_nguoiduocbaohiemtam
205	Can add Người thụ hưởng tạm	52	add_nguoithuhuongtam
206	Can change Người thụ hưởng tạm	52	change_nguoithuhuongtam
207	Can delete Người thụ hưởng tạm	52	delete_nguoithuhuongtam
208	Can view Người thụ hưởng tạm	52	view_nguoithuhuongtam
209	Can add Người thụ hưởng	53	add_nguoithuhuong
210	Can change Người thụ hưởng	53	change_nguoithuhuong
211	Can delete Người thụ hưởng	53	delete_nguoithuhuong
212	Can view Người thụ hưởng	53	view_nguoithuhuong
213	Can add Gói sản phẩm phụ	54	add_goisanphamphu
214	Can change Gói sản phẩm phụ	54	change_goisanphamphu
215	Can delete Gói sản phẩm phụ	54	delete_goisanphamphu
216	Can view Gói sản phẩm phụ	54	view_goisanphamphu
217	Can add Gói sản phẩm chính	55	add_goisanphamchinh
218	Can change Gói sản phẩm chính	55	change_goisanphamchinh
219	Can delete Gói sản phẩm chính	55	delete_goisanphamchinh
220	Can view Gói sản phẩm chính	55	view_goisanphamchinh
221	Can add Category Kiến thức	56	add_kienthuccategory
222	Can change Category Kiến thức	56	change_kienthuccategory
223	Can delete Category Kiến thức	56	delete_kienthuccategory
224	Can view Category Kiến thức	56	view_kienthuccategory
225	Can add Kiến thức	57	add_kienthucmodel
226	Can change Kiến thức	57	change_kienthucmodel
227	Can delete Kiến thức	57	delete_kienthucmodel
228	Can view Kiến thức	57	view_kienthucmodel
229	Can add Robot1 đầu tư	58	add_robot1dautu
230	Can change Robot1 đầu tư	58	change_robot1dautu
231	Can delete Robot1 đầu tư	58	delete_robot1dautu
232	Can view Robot1 đầu tư	58	view_robot1dautu
233	Can add Robot chung	59	add_robotchung
234	Can change Robot chung	59	change_robotchung
235	Can delete Robot chung	59	delete_robotchung
236	Can view Robot chung	59	view_robotchung
237	Can add Người được bảo hiểm	60	add_nguoiduocbaohiem
238	Can change Người được bảo hiểm	60	change_nguoiduocbaohiem
239	Can delete Người được bảo hiểm	60	delete_nguoiduocbaohiem
240	Can view Người được bảo hiểm	60	view_nguoiduocbaohiem
241	Can add Người được bảo hiểm tạm	61	add_nguoiduocbaohiemtam
242	Can change Người được bảo hiểm tạm	61	change_nguoiduocbaohiemtam
243	Can delete Người được bảo hiểm tạm	61	delete_nguoiduocbaohiemtam
244	Can view Người được bảo hiểm tạm	61	view_nguoiduocbaohiemtam
245	Can add Người thụ hưởng tạm	62	add_nguoithuhuongtam
246	Can change Người thụ hưởng tạm	62	change_nguoithuhuongtam
247	Can delete Người thụ hưởng tạm	62	delete_nguoithuhuongtam
248	Can view Người thụ hưởng tạm	62	view_nguoithuhuongtam
249	Can add Người thụ hưởng	63	add_nguoithuhuong
250	Can change Người thụ hưởng	63	change_nguoithuhuong
251	Can delete Người thụ hưởng	63	delete_nguoithuhuong
252	Can view Người thụ hưởng	63	view_nguoithuhuong
253	Can add Gói sản phẩm phụ	64	add_goisanphamphu
254	Can change Gói sản phẩm phụ	64	change_goisanphamphu
255	Can delete Gói sản phẩm phụ	64	delete_goisanphamphu
256	Can view Gói sản phẩm phụ	64	view_goisanphamphu
257	Can add Gói sản phẩm chính	65	add_goisanphamchinh
258	Can change Gói sản phẩm chính	65	change_goisanphamchinh
259	Can delete Gói sản phẩm chính	65	delete_goisanphamchinh
260	Can view Gói sản phẩm chính	65	view_goisanphamchinh
261	Can add Người được bảo hiểm tạm	66	add_nguoiduocbaohiemtam
262	Can change Người được bảo hiểm tạm	66	change_nguoiduocbaohiemtam
263	Can delete Người được bảo hiểm tạm	66	delete_nguoiduocbaohiemtam
264	Can view Người được bảo hiểm tạm	66	view_nguoiduocbaohiemtam
265	Can add Người được bảo hiểm	67	add_nguoiduocbaohiem
266	Can change Người được bảo hiểm	67	change_nguoiduocbaohiem
267	Can delete Người được bảo hiểm	67	delete_nguoiduocbaohiem
268	Can view Người được bảo hiểm	67	view_nguoiduocbaohiem
269	Can add Gói sản phẩm phụ	68	add_goisanphamphu
270	Can change Gói sản phẩm phụ	68	change_goisanphamphu
271	Can delete Gói sản phẩm phụ	68	delete_goisanphamphu
272	Can view Gói sản phẩm phụ	68	view_goisanphamphu
273	Can add Gói sản phẩm chính	69	add_goisanphamchinh
274	Can change Gói sản phẩm chính	69	change_goisanphamchinh
275	Can delete Gói sản phẩm chính	69	delete_goisanphamchinh
276	Can view Gói sản phẩm chính	69	view_goisanphamchinh
277	Can add Người được bảo hiểm tạm	70	add_nguoiduocbaohiemtam
278	Can change Người được bảo hiểm tạm	70	change_nguoiduocbaohiemtam
279	Can delete Người được bảo hiểm tạm	70	delete_nguoiduocbaohiemtam
280	Can view Người được bảo hiểm tạm	70	view_nguoiduocbaohiemtam
281	Can add Người được bảo hiểm	71	add_nguoiduocbaohiem
282	Can change Người được bảo hiểm	71	change_nguoiduocbaohiem
283	Can delete Người được bảo hiểm	71	delete_nguoiduocbaohiem
284	Can view Người được bảo hiểm	71	view_nguoiduocbaohiem
285	Can add Gói sản phẩm phụ	72	add_goisanphamphu
286	Can change Gói sản phẩm phụ	72	change_goisanphamphu
287	Can delete Gói sản phẩm phụ	72	delete_goisanphamphu
288	Can view Gói sản phẩm phụ	72	view_goisanphamphu
289	Can add Gói sản phẩm chính	73	add_goisanphamchinh
290	Can change Gói sản phẩm chính	73	change_goisanphamchinh
291	Can delete Gói sản phẩm chính	73	delete_goisanphamchinh
292	Can view Gói sản phẩm chính	73	view_goisanphamchinh
293	Can add Công ty bảo hiểm	74	add_insurancecompany
294	Can change Công ty bảo hiểm	74	change_insurancecompany
295	Can delete Công ty bảo hiểm	74	delete_insurancecompany
296	Can view Công ty bảo hiểm	74	view_insurancecompany
\.


--
-- Data for Name: claim_yeucaubaolanhvienphi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.claim_yeucaubaolanhvienphi (id, ho_ten_nguoi_khai_bao, so_hop_dong, so_the_bao_hiem, so_dien_thoai, chon_phuong_thuc, co_so_y_te_bao_lanh, ngay_nhap_vien, quyen_loi_chinh, quyen_loi_chi_tiet, anh_chung_tu_benh, anh_chung_tu_thuoc) FROM stdin;
\.


--
-- Data for Name: claim_yeucauchung; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.claim_yeucauchung (id, chon_phuong_thuc_nhan_tien, so_giay_chung_nhan_bao_hiem, nguoi_khai_bao, so_dien_thoai, chi_tiet_xay_ra) FROM stdin;
\.


--
-- Data for Name: claim_yeucaunhatunhan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.claim_yeucaunhatunhan (id, ho_ten_nguoi_khai_bao, so_dien_thoai, dia_chi, chon_phuong_thuc_nhan_tien, so_hop_dong, ngay_xay_ra, dia_chi_ton_that, loai_ton_that, nguyen_nhan, anh_hien_truong, anh_xac_nhan) FROM stdin;
\.


--
-- Data for Name: claim_yeucauoto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.claim_yeucauoto (id, ho_ten_nguoi_khai_bao, so_hop_dong, so_dien_thoai, ngay_ton_that, dia_chi_tinh_thanh_pho, dia_chi_quan_huyen, nhom_nguyen_nhan, nguyen_nhan_ton_that_chi_tiet, hau_qua_ton_that_chi_tiet, dia_chi, chon_phuong_thuc, chon_garage_sua_chua, anh_ton_that, anh_xac_nhan_co_quan) FROM stdin;
\.


--
-- Data for Name: claim_yeucausuckhoe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.claim_yeucausuckhoe (id, ho_ten_nguoi_khai_bao, so_hop_dong, so_the_bao_hiem, so_dien_thoai, chon_phuong_thuc, co_so_y_te_bao_lanh, ngay_nhap_vien, quyen_loi_chinh, quyen_loi_chi_tiet, anh_chung_tu_benh, anh_chung_tu_thuoc) FROM stdin;
\.


--
-- Data for Name: claim_yeucautainancanhan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.claim_yeucautainancanhan (id, ho_ten_nguoi_khai_bao, so_hop_dong, so_the_bao_hiem, so_dien_thoai, chon_phuong_thuc, co_so_y_te_bao_lanh, ngay_nhap_vien, thuong_tat_chinh, quyen_loi_chi_tiet, anh_thuong_tat, anh_giay_chung_tu) FROM stdin;
\.


--
-- Data for Name: claim_yeucautuky; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.claim_yeucautuky (id, ho_ten_nguoi_khai_bao, so_dien_thoai, dia_chi, chon_phuong_thuc_nhan_tien, so_hop_dong, ngay_chet, nguyen_nhan, anh_thuong_tat, anh_giay_chung_tu) FROM stdin;
\.


--
-- Data for Name: confirm_email_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.confirm_email_token (token, created_at, user_id) FROM stdin;
\.


--
-- Data for Name: core_chitietcongviec; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_chitietcongviec (id, chitiet, code_chitiet, code_linhvuc) FROM stdin;
1	Hành Chính Sự Nghiệp	1	1
2	Ngành Bán Lẻ	2	2
3	Ngành Bán Sỉ	3	2
4	Ngành Nghề Tự Do	4	3
5	Ngành Dịch Vụ Thông Thường	5	3
6	Khác	6	3
7	Ngân Hàng, Bảo Hiểm, Tín Dụng, Cầm Cố, Chứng Khoán	7	4
8	Lâm Nghiệp	8	5
9	Sản Xuất Gỗ	9	5
10	Nông Nghiệp	10	5
11	Chăn Nuôi	11	5
12	Thuỷ Lợi	12	5
13	Ngư Nghiệp	13	5
14	Bưu Chính	14	6
15	Đường Bộ	15	7
16	Đường Sắt	16	7
17	Hàng Hải	17	7
18	Hàng Hải (làm việc tại cảng)	18	7
19	Hàng Không (làm việc dưới mặt đất)	19	7
20	Hàng Không (nhân viên công ty hàng không)	20	7
21	Hàng Không (làm việc trên không)	21	7
22	Thang Máy	22	8
23	Công Ty Xây Dựng	23	8
24	Khác	24	8
25	Xây Dựng Đường Sắt, Đường Bộ	25	8
26	Trang Trí Nội Thất	26	8
27	Sửa Chữa Đóng Tàu	27	9
28	Cơ Điện	28	9
29	Điện Tử	29	9
30	Dệt May	30	9
31	Xưởng Sắt Thép	31	9
32	Nguyên Liệu Hoá Học	32	9
33	Khoáng chất mi ăng asbetos	33	9
34	Xưởng Máy Móc	34	9
35	Sản Xuất Đồ Gia Dụng	35	9
36	Chế Tạo Xe Cơ Giới	36	9
37	Gia Công Chế Biến Thực Phẩm	37	10
38	Thủ Công Mỹ Nghệ	38	10
39	Xi Măng	39	10
40	Thổi Nhựa	40	10
41	Chế Tạo Cao Su	41	10
42	Chế Biến Dược	42	10
43	Công Nghiệp Giầy	43	10
44	Khác	44	10
45	Thuốc Nổ	45	10
46	Quảng Cáo	46	11
47	Tạp Chí Xuất Bản	47	11
48	Nhân Viên Y Tế Phòng Dịch	48	12
49	Bệnh Viện Hoặc Phòng Khám	49	12
50	Cấp Cứu	50	12
51	Khu Vui Chơi Giải Trí (sở thú)	51	13
52	Điện Ảnh, Truyền Hình	52	13
53	Giải Trí	53	13
54	Khu Vui Chơi	54	13
55	Hồ Bơi Và Bãi Biển	55	13
56	An Ninh	56	14
57	Vận Động Trên Băng	57	15
58	Các Môn Thể Thao Bóng	58	15
59	Quyền Anh Boxing	59	15
60	Thể Thao Dưới Nước	60	15
61	Khác	61	15
62	Giáo Dục	62	16
63	Ngoài Đường Hầm	63	17
64	Mỏ Than Quốc Doanh	64	17
65	Trong Đường hầm	65	17
66	Mỏ Than Quốc Doanh Địa Phương (làm trong đường hầm)	66	17
67	Bộ Đội	67	18
68	Ngành Công Cộng	68	19
69	Nghề Nghiệp	69	19
70	Giải Trí Đặc Biệt	70	20
71	Khác	71	20
\.


--
-- Data for Name: core_company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_company (id, logo, ten_cong_ty, id_ten_cong_ty, bai_gioi_thieu_cong_ty, nam_thanh_lap, bien_thanh_toan, so_chi_nhanh) FROM stdin;
1	1	Bảo hiểm VBI	1	1	2000	1.10000000000000009	50
2	2	Bảo hiểm Fubon	2	2	2000	1.19999999999999996	50
3	3	Bảo hiểm Opes	3	3	2000	1.10000000000000009	50
\.


--
-- Data for Name: core_district; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_district (id, name, parent_code, longitude, latitude) FROM stdin;
1	Bến Cát	74	106.597499999999997	11.1494440000000008
2	Minh Long	51	108.701111000000012	14.9191670000000016
3	Tây Trà	51	108.373056000000005	15.1500000000000004
4	Sông Lô	26	105.387500000000003	21.4509722200000006
5	Nghi Lộc	40	105.539722220000002	18.7947222200000006
6	Bảo Lâm	68	107.723611000000005	11.6419440000000005
7	Văn Lâm	33	106.015000000000001	20.9747222200000003
8	Quảng Trạch	44	106.377222200000006	17.8713888899999986
9	Yên Định	38	105.598514999999992	19.9872929999999975
10	Phú Quốc	91	103.983021999999991	10.2909699999999997
11	Tịnh Biên	89	104.949237999999994	10.5919699999999999
12	Yên Lạc	26	105.573664999999991	21.2264160000000004
13	Lang Chánh	38	105.240173999999996	20.1546170000000018
14	Bắc Kạn	6	105.827662000000018	22.1478149999999978
15	Đắk R'Lấp	67	107.505362000000005	11.9202410000000008
16	Cẩm Giàng	30	106.21445700000001	20.9564470000000007
17	Ngã Năm	94	105.607875000000007	9.53991100000000003
18	Ia Grai	64	107.718223999999992	13.9933920000000018
19	Ý Yên	36	106.022925999999998	20.2979279999999989
20	Thanh Oai	1	105.782068999999993	20.857959000000001
21	Xuân Trường	36	106.356752	20.3049739999999979
22	Ba Tơ	51	108.67604399999999	14.7283109999999979
23	Hà Đông	1	105.760498999999996	20.9525199999999998
24	Điện Biên	11	103.039709999999999	21.4067670000000021
25	An Minh	91	104.93374399999999	9.67113299999999931
26	Quảng Trị	45	107.152230000000003	16.6634980000000006
27	Hớn Quản	70	106.639597999999992	11.5934350000000013
28	Tx Hồng Ngự	87	105.380502000000007	10.8180720000000008
29	Nghĩa Lộ	15	104.495514999999997	21.5942280000000011
30	Nậm Pồ	11	102.762166000000008	21.8093920000000026
31	Mỹ Đức	1	105.713635000000011	20.6835319999999996
32	Lê Chân	31	106.67920500000001	20.8379779999999997
33	Bàu Bàng	74	106.634721999999996	11.2725000000000009
34	Tây Hồ	1	105.811831000000012	21.0707050000000002
35	Hai Bà Trưng	1	105.847646999999995	21.0117179999999983
36	Thống Nhất	75	107.146666999999994	10.9513890000000007
37	Lâm Hà	68	108.191943999999992	11.9238889999999991
38	Triệu Sơn	38	105.582999999999998	19.8170000000000002
39	Mang Thít	86	106.086943999999988	10.182777999999999
40	Châu Thành	80	106.5	10.4644440000000003
41	Na Rì	6	106.172221999999991	22.2561109999999971
42	Vị Thuỷ	93	105.536943999999991	9.80138900000000035
43	Thới Bình	96	105.147386000000012	9.36043100000000017
44	Móng Cái	22	107.84873300000001	21.5861730000000023
45	Quảng Uyên	4	106.43724499999999	22.684355
46	An Lão	52	108.811611000000013	14.5703230000000019
47	H Long Mỹ	93	105.423333000000014	9.63777799999999907
48	Châu Phú	89	105.171727000000004	10.5586140000000004
49	Bạc Liêu	95	105.761366999999993	9.27413600000000038
50	Ngũ Hành Sơn	48	108.247379000000009	15.9947900000000001
51	quận 8	79	106.643831000000006	10.7350250000000003
52	Đức Trọng	68	108.343015999999992	11.6392229999999994
53	Buôn Đôn	66	107.739543999999995	12.9239090000000001
54	Đống Đa	1	105.825501000000003	21.0147070000000014
55	Bù Đăng	70	107.234692999999993	11.796716
56	Hòa Bình	17	105.326162999999994	20.8365219999999987
57	Bảo Yên	10	104.456028000000003	22.2713630000000009
58	Tuy Phước	52	109.165301999999997	13.8553890000000006
59	Sông Công	19	105.841448	21.4947090000000003
60	Đăk Pơ	64	108.587551000000005	13.9368230000000004
61	Quế Sơn	49	108.253305000000012	15.7136109999999984
62	Long Khánh	75	107.241060000000004	10.9377270000000006
63	Nam Định	36	106.173162000000005	20.424671
64	Tuyên Hóa	44	106.050517999999997	17.9021849999999993
65	Tân An	80	106.411833000000001	10.5323779999999996
66	Sơn Tây	51	108.356708000000012	14.9768309999999989
67	Tuần Giáo	11	103.422201999999999	21.6613369999999996
68	Ân Thi	33	106.101679000000004	20.8064510000000027
69	Kim Động	33	106.030267999999992	20.7364779999999982
70	Hoàng Mai	40	105.70660500000001	19.2645680000000006
71	Yên Sơn	8	105.271460000000005	21.9182170000000021
72	Kiến An	31	106.638036000000014	20.8071850000000005
73	Phước Long	70	106.97976899999999	11.8217999999999996
74	Bắc Mê	2	105.292704000000001	22.7487359999999974
75	Ngọc Hiển	96	104.961096999999995	8.66638299999999973
76	Kế Sách	94	105.938951000000003	9.81258899999999912
77	Núi Thành	49	108.556338999999994	15.430491
78	Quang Bình	2	104.649881000000008	22.4061020000000006
79	Chợ Gạo	82	106.43895400000001	10.3812689999999996
80	Krông Nô	67	107.857062000000013	12.3570390000000003
81	Hồng Lĩnh	42	105.713565999999986	18.5258409999999998
82	Bình Giang	30	106.189378000000005	20.8725060000000013
83	Tứ Kỳ	30	106.41830800000001	20.813879
84	H Cao Lãnh	87	105.696232000000009	10.4859919999999995
85	Long Thành	75	106.994837999999987	10.8068929999999988
86	Mê Linh	1	105.706440999999998	21.1809750000000001
87	Diên Khánh	56	109.041477	12.2778510000000001
88	Cô Tô	22	107.75009399999999	20.9990070000000024
89	Vĩnh Châu	94	105.960310000000007	9.3477320000000006
90	Tương Dương	40	104.544544999999999	19.3061739999999986
91	Hà Tiên	91	104.511506999999995	10.3926230000000004
92	Quỳ Châu	40	105.075665999999998	19.5425509999999996
93	Bắc Tân Uyên	74	106.863602999999998	11.0729129999999998
94	Sơn Tây	1	105.47623999999999	21.0926000000000009
95	Bình Lục	35	106.045597999999998	20.5030079999999977
96	Hải An	31	106.743471	20.8203950000000013
97	Lập Thạch	26	105.491161000000005	21.429666000000001
98	Kiên Hải	91	104.637403000000006	9.80689600000000006
99	Chi Lăng	20	106.611515999999995	21.6777470000000001
100	Ninh Giang	30	106.33064499999999	20.7464370000000002
101	Cẩm Xuyên	42	106.008581000000007	18.1979849999999992
102	Xín Mần	2	104.509081999999992	22.6473410000000008
103	Năm Căn	96	105.035537000000005	8.81260399999999855
104	Bắc Sơn	20	106.271140999999986	21.8289410000000004
105	Điện Bàn	49	108.221956000000006	15.9081140000000012
106	Tân Sơn	25	104.965460000000007	21.2155039999999993
107	Vinh	40	105.684964999999991	18.6897239999999982
108	Phú Tân	89	105.269144999999995	10.6625580000000006
109	Hoà Bình	95	105.616230999999999	9.25537199999999949
110	Đan Phượng	1	105.677683000000002	21.1132659999999994
111	Khoái Châu	33	105.973082000000005	20.8309560000000005
112	Nam Đàn	40	105.521863999999994	18.6819230000000012
113	Thanh Xuân	1	105.816277999999997	20.9951119999999989
114	Pác Nặm	6	105.655636000000015	22.6104009999999995
115	Trần Đề	94	106.084134000000006	9.50208999999999904
116	Đức Hòa	80	106.420449000000005	10.8921600000000005
117	Đồng Hới	44	106.583280000000002	17.4592029999999987
118	Kỳ Sơn	40	104.229703999999998	19.4550289999999997
119	Ninh Sơn	58	108.751671999999999	11.7046639999999993
120	Giang Thành	91	104.670709000000002	10.4683659999999996
121	Tam Bình	86	105.948043999999996	10.0773019999999995
122	Lý Sơn	51	109.11866599999999	15.3822920000000014
123	Hưng Yên	33	106.060360000000003	20.6614890000000031
124	Đông Hà	45	107.085325999999995	16.8014459999999985
125	Krông A Na	66	108.052108000000004	12.4997469999999993
126	Nam Đông	46	107.682928000000004	16.1235339999999994
127	Châu Thành	87	105.81622800000001	10.224278
128	Krông Búk	66	108.203971999999993	13.024699
129	Ea H'leo	66	108.165364999999994	13.2498980000000017
130	Tư Nghĩa	51	108.707346000000001	15.1074160000000006
131	Tam Điệp	37	105.893836000000007	20.1618490000000001
132	Tam Nông	87	105.527210000000011	10.7395990000000001
133	Yên Bình	15	104.996831	21.8120960000000004
134	An Lão	31	106.565865999999986	20.8054339999999982
135	Sơn Hà	51	108.517204000000007	14.9942859999999989
136	Nhà Bè	79	106.722796000000002	10.6610949999999995
137	Phong Điền	92	105.659824	10.0044850000000007
138	Tuy Hoà	54	109.278941999999986	13.1114720000000009
139	Thanh Chương	40	105.240946999999991	18.7530010000000011
140	Gia Lộc	30	106.290747999999994	20.8472019999999993
141	Đại Lộc	49	107.978833000000009	15.8396510000000017
142	Vũ Thư	34	106.269424999999998	20.4413170000000015
143	Sơn Tịnh	51	108.738565999999992	15.2003570000000003
144	Đồng Hỷ	19	105.896823999999995	21.6736940000000011
145	Mỏ Cày Nam	83	106.357056	10.0728279999999994
146	Ba Đồn	44	106.422370999999998	17.7560380000000002
147	Phước Sơn	49	107.830788999999996	15.392357999999998
148	Trà Vinh	84	106.330512999999982	9.95638999999999896
149	Quận 9	79	106.820139999999995	10.8303600000000007
150	Đạ Huoai	68	107.634761000000012	11.4410419999999995
151	Đồng Văn	2	105.268111000000005	23.234884000000001
152	Vụ Bản	36	106.097257000000013	20.3758710000000001
153	Hạ Lang	4	106.679338999999985	22.7248309999999982
154	Nga Sơn	38	105.98355500000001	20.0177589999999981
155	Tân Thạnh	80	105.955294999999992	10.6105160000000005
156	Đam Rông	68	108.164424999999994	12.0772600000000008
157	Vĩnh Lộc	38	105.654887000000016	20.0500019999999992
158	Vị Xuyên	2	104.940246000000002	22.6922739999999976
159	Ayun Pa	64	108.414162999999988	13.3422109999999989
160	Gò Quao	91	105.292285000000007	9.75514800000000015
161	Đồng Xoài	70	106.846391999999994	11.517906
162	Phù Cát	52	109.064260000000004	14.0389339999999994
163	Thới Lai	92	105.533040999999997	10.0390429999999995
164	Bỉm Sơn	38	105.882840999999985	20.0879320000000021
165	Châu Thành	93	105.817550999999995	9.92353100000000055
166	An Nhơn	52	109.062117999999998	13.8720350000000003
167	An Khê	64	108.698851000000005	14.0138269999999991
168	Đa Krông	45	106.960886000000016	16.5960640000000019
169	Thạch Thất	1	105.511954000000003	21.0056869999999982
170	Tân Phú	75	107.404908000000006	11.3952489999999997
171	Quảng Ninh	44	106.490683000000004	17.2824709999999975
172	Lộc Hà	42	105.863790999999992	18.4747769999999996
173	Hữu Lũng	20	106.327690999999987	21.5836260000000024
174	An Biên	91	105.045791999999992	9.8288139999999995
175	Tri Tôn	89	104.942063999999988	10.4171899999999997
176	Hậu Lộc	38	105.888047999999998	19.9370779999999996
177	Trần Văn Thời	96	104.922786000000016	9.15282100000000121
178	Lộc Bình	20	106.941405000000003	21.7055959999999999
179	Phú Thiện	64	108.319033000000005	13.4933910000000008
180	Sa Thầy	62	107.608952000000002	14.3075579999999984
181	An Dương	31	106.580995000000001	20.889327999999999
182	Tx Cai Lậy	82	106.118669999999995	10.4050710000000013
183	Chư Sê	64	108.110831000000005	13.7154369999999997
184	Vĩnh Hưng	80	105.773477	10.9296629999999997
185	Hàm Yên	8	105.017130000000009	22.1250409999999995
186	Chiêm Hóa	8	105.256659000000013	22.1825849999999996
187	Tx Duyên Hải	84	106.497573000000003	9.63316700000000026
188	Ngọc Lặc	38	105.367295999999996	20.0740279999999984
189	Đô Lương	40	105.341550999999995	18.8909440000000011
190	Con Cuông	40	104.817433999999992	19.0394469999999991
191	Sơn Động	24	106.863545000000002	21.3038920000000012
192	Long Biên	1	105.890005000000002	21.0459160000000018
193	Quận 4	79	106.703008000000011	10.7587320000000002
194	Gò Công Đông	82	106.743818999999988	10.3663959999999999
195	Cẩm Mỹ	75	107.251812999999984	10.819725
196	Thanh Liêm	35	105.92135900000001	20.4642720000000011
197	Phủ Lý	35	105.918116999999995	20.5393299999999996
198	Thuỷ Nguyên	31	106.674419	20.9524760000000008
199	Kông Chro	64	108.576980000000006	13.762696
200	Sơn Dương	8	105.369030000000009	21.648857999999997
201	Tuyên Quang	8	105.228121000000002	21.7780079999999998
202	Chợ Đồn	6	105.572717999999995	22.19285
203	Hải Châu	48	108.207179000000011	16.0479100000000017
204	Tiên Phước	49	108.269347999999994	15.4842450000000014
205	Lạng Giang	24	106.25268100000001	21.3757190000000001
206	Hoa Lư	37	105.916944999999998	20.2567649999999979
207	Bình Long	70	106.592485000000011	11.6878449999999994
208	Lương Sơn	17	105.522284000000013	20.8558810000000001
209	Nam Trà My	49	108.086774000000005	15.1407310000000006
210	Sa Pa	10	103.824681999999996	22.3579940000000015
211	Tuy An	54	109.209253000000004	13.2560719999999996
212	Quỳnh Lưu	40	105.63875800000001	19.2273540000000018
213	Thạnh Hóa	80	106.175052000000008	10.6733649999999987
214	Kim Bôi	17	105.539525999999995	20.6842799999999976
215	Hương Thủy	46	107.619913999999994	16.3162319999999994
216	Tân Hưng	80	105.675737000000012	10.8474719999999998
217	Quận 10	79	106.669637999999992	10.7739750000000001
218	Điện Biên Phủ	11	103.049876999999995	21.4011579999999988
219	Phan Thiết	60	108.205615999999992	10.9587369999999993
220	Quỳ Hợp	40	105.156972999999994	19.3344009999999997
221	Cao Bằng	4	106.251893999999993	22.6593480000000014
222	H Kỳ Anh	42	106.257712999999995	18.1275450000000014
223	Tủa Chùa	11	103.375396999999992	21.9708630000000014
224	Bình Thuỷ	92	105.722785000000016	10.0689659999999996
225	Bình Đại	83	106.621203000000008	10.2117880000000003
226	Ia Pa	64	108.51502099999999	13.5299420000000019
227	Tân Yên	24	106.101083000000003	21.393021000000001
228	Uông Bí	22	106.769369999999995	21.0784990000000008
229	KBang	64	108.600370999999996	14.1435290000000009
230	Đắk Mil	67	107.667863999999994	12.511417999999999
231	Mường Ảng	11	103.257846000000001	21.5207949999999997
232	Kon Tum	62	107.975127000000001	14.3416619999999995
233	Kim Bảng	35	105.847484000000009	20.5674759999999992
234	Vĩnh Thạnh	52	108.742731000000006	14.2406390000000016
235	Chương Mỹ	1	105.661828999999997	20.8893629999999995
236	Đồ Sơn	31	106.762306000000009	20.7223179999999978
237	Xuyên Mộc	77	107.456625000000003	10.6199550000000009
238	Phú Riềng	70	106.943242999999995	11.6798000000000002
239	H Duyên Hải	84	106.467321999999996	9.63170399999999916
240	Gò Vấp	79	106.667139999999989	10.8446879999999997
241	Cư M'gar	66	108.068683000000007	12.8924310000000002
242	Thạnh Trị	94	105.716983000000013	9.47735400000000006
243	Đà Lạt	68	108.463999999999999	11.9318969999999993
244	Dương Minh Châu	72	106.240403000000001	11.3243949999999991
245	Mai Châu	17	105.018453000000008	20.6797520000000006
246	Đông Hưng	34	106.349631000000002	20.5411499999999982
247	Thuận An	74	106.71083999999999	10.9362089999999998
248	Hà Tĩnh	42	105.900612999999993	18.358156000000001
249	Quảng Ngãi	51	108.83591899999999	15.1485510000000012
250	Mộ Đức	51	108.886408000000003	14.9644049999999993
251	Long Xuyên	89	105.428837000000016	10.3681160000000006
252	Tiểu Cần	84	106.201400000000007	9.80857400000000013
253	H Hồng Ngự	87	105.378893999999988	10.8236679999999996
254	Lương Tài	27	106.227762000000013	21.0249140000000025
255	Hoàng Mai	1	105.855969999999999	20.9781270000000006
256	Cẩm Phả	22	107.294402000000005	21.0858549999999987
257	Sông Hinh	54	108.888890999999987	12.9487679999999994
258	Tam Kỳ	49	108.50071100000001	15.602860999999999
259	Tháp Mười	87	105.799056000000007	10.5721429999999987
260	Tân Hiệp	91	105.238101999999998	10.1048929999999988
261	Bình Minh	86	105.841945999999993	10.0490870000000001
262	Thanh Hà	30	106.420789999999997	20.9120709999999974
263	Bắc Hà	10	104.310760000000002	22.506457000000001
264	Gò Công	82	106.662120999999999	10.4249510000000001
265	Nha Trang	56	109.167571999999993	12.2441089999999999
266	Cầu Giấy	1	105.791881000000004	21.0303339999999999
267	Văn Giang	33	105.948738999999989	20.9336950000000002
268	Thái Bình	34	106.345782	20.4504260000000002
269	Hà Trung	38	105.816563999999985	20.0342829999999985
270	Vân Hồ	14	104.744850999999997	20.7879769999999979
271	Mỹ Lộc	36	106.121210000000005	20.4557230000000025
272	Tây Hoà	54	109.160606000000001	12.9198729999999991
273	Lâm Bình	8	105.224485000000016	22.5093420000000002
274	A Lưới	46	107.307287000000017	16.2315640000000023
275	Hoàn Kiếm	1	105.852498999999995	21.0294160000000012
276	Phù Ninh	25	105.303581000000008	21.4615829999999974
277	Than Uyên	12	103.884293999999997	21.9658899999999981
278	Thường Tín	1	105.861896000000002	20.8710599999999999
279	Thủ Đức	79	106.745207000000008	10.856992
280	Cái Răng	92	105.784972999999994	9.99116199999999921
281	Phổ Yên	19	105.798786000000007	21.4322799999999987
282	Thanh Hóa	38	105.782514999999989	19.8133710000000001
283	Thông Nông	4	105.941682	22.828398
284	Đức Thọ	42	105.605214999999987	18.4940260000000016
285	Thuận Thành	27	106.075536000000014	21.0404410000000013
286	Thanh Ba	25	105.160904000000002	21.472569
287	Tân Châu	89	105.18282099999999	10.8083960000000001
288	Long Điền	77	107.224560000000011	10.4519490000000008
289	Phú Mỹ	77	107.046740999999997	10.5892730000000004
290	Thọ Xuân	38	105.474620999999999	19.9300840000000008
291	Đức Linh	60	107.524818999999994	11.1537939999999995
292	Huế	46	107.574829000000008	16.4551769999999991
293	Trảng Bom	75	107.029597999999993	10.9656359999999999
294	Cẩm Thủy	38	105.467999999999989	20.2061069999999994
295	Tây Sơn	52	108.882475999999997	13.9418299999999995
296	Phú Nhuận	79	106.677616999999998	10.8006309999999992
297	Quỳnh Phụ	34	106.367985000000004	20.6553119999999986
298	Thái Nguyên	19	105.804693	21.5679619999999979
299	Lắk	66	108.219870999999998	12.3308169999999997
300	Cam Lộ	45	106.981169999999992	16.8194559999999989
301	Hoà An	4	106.216462000000007	22.7218330000000002
302	Quận 3	79	106.684128000000001	10.7824939999999998
303	Lục Ngạn	24	106.663503000000006	21.4581569999999999
304	Hoài Ân	52	108.900743999999989	14.3736959999999989
305	Giá Rai	95	105.389086000000006	9.27189499999999889
306	Mường Tè	12	102.710571000000002	22.4452239999999996
307	Thạch Hà	42	105.829526000000001	18.3428749999999994
308	Hướng Hóa	45	106.66904199999999	16.7256800000000005
309	Bố Trạch	44	106.284497000000002	17.5381670000000014
310	Tây Ninh	72	106.126847999999995	11.372833
311	Văn Bàn	10	104.189869999999999	22.0722430000000003
312	Thanh Trì	1	105.832564999999988	20.9341529999999985
313	Anh Sơn	40	105.055058000000002	18.9529910000000008
314	Tiên Yên	22	107.370724999999993	21.3727370000000008
315	M'Đrắk	66	108.784487000000013	12.7349820000000005
316	Lệ Thủy	44	106.713340999999986	17.0934419999999996
317	Đức Phổ	51	108.952590999999998	14.8043790000000008
318	Lục Yên	15	104.718598	22.1105859999999979
319	Phú Vang	46	107.78953700000001	16.4453279999999999
320	Cần Giờ	79	106.866865999999987	10.5565479999999994
321	Mỹ Xuyên	94	105.873629000000008	9.45485000000000042
322	Bảo Thắng	10	104.138268000000011	22.3959119999999992
323	Nậm Nhùn	12	103.013889000000006	22.1422220000000003
324	Nam Từ Liêm	1	105.761094999999997	21.0161829999999981
325	Văn Yên	15	104.551837000000006	21.9136929999999985
326	Thủ Dầu Một	74	106.663808000000003	11.0198869999999989
327	Quế Phong	40	104.882204000000002	19.7153069999999992
328	Cam Ranh	56	109.104554000000007	11.9224390000000007
329	Yên Phong	27	105.967332000000013	21.2073540000000023
330	Tu Mơ Rông	62	107.941625999999999	14.8987510000000007
331	Tam Đảo	26	105.590209000000002	21.4694830000000003
332	Trường Sa	56	103.131363000000007	22.0395499999999984
333	Mường Lay	11	111.932999999999993	8.63299999999999912
334	Yên Dũng	24	106.277013999999994	21.2383969999999991
335	Định Quán	75	107.329498000000001	11.2203039999999987
336	Hòn Đất	91	104.926098999999994	10.2396030000000007
337	Ninh Phước	58	108.857714999999985	11.5032379999999996
338	Lục Nam	24	106.432330000000007	21.2789450000000002
339	Mèo Vạc	2	105.434335000000004	23.1461049999999986
340	Phú Hoà	54	109.180206000000013	13.0752240000000004
341	Thanh Miện	30	106.216586000000007	20.7863429999999987
342	Cái Bè	82	105.937628000000004	10.3943130000000004
343	Gò Công Tây	82	106.595066999999986	10.354616
344	Quận 11	79	106.647043999999994	10.7645320000000009
345	Chợ Mới	89	105.452687000000012	10.489889999999999
346	Châu Thành A	93	105.642247999999995	9.92973200000000134
347	Yên Mỹ	33	106.026908000000006	20.8959510000000002
348	Tánh Linh	60	107.696083000000002	11.1263929999999984
349	Đồng Phú	70	106.977242999999987	11.5298689999999997
350	Việt Trì	25	105.368035000000006	21.334695
351	Ia H' Drai	62	107.454924000000005	14.1048959999999983
352	Châu Đốc	89	105.092399	10.682383999999999
353	Ba Tri	83	106.598777999999996	10.0818180000000002
354	Tân Biên	72	106.004854000000009	11.5801940000000005
355	Vĩnh Thuận	91	105.238538999999989	9.5541640000000001
356	Châu Thành	84	106.347971000000001	9.84380200000000016
357	Châu Thành	82	106.269081	10.382835
358	Lấp Vò	87	105.610415999999987	10.3665749999999992
359	Bình Tân	86	105.763460000000009	10.1396750000000004
360	Liên Chiểu	48	108.132137000000014	16.0821229999999993
361	Đức Huệ	80	106.247805	10.868404
362	Từ Sơn	27	105.957901000000007	21.1289529999999992
363	Thái Thụy	34	106.518357000000009	20.5419160000000005
364	Tiên Lữ	33	106.121348999999995	20.6799490000000006
365	Nhơn Trạch	75	106.883552000000009	10.7043800000000005
366	Tân Phước	82	106.231680000000011	10.5277949999999993
367	Hoằng Hóa	38	105.860703999999998	105.860703999999998
368	Võ Nhai	19	106.049712000000014	21.7772280000000009
369	Như Xuân	38	105.38721000000001	19.6141910000000017
370	Hải Hậu	36	106.257396	20.147276999999999
371	Tân Uyên	12	103.690993000000006	22.1066749999999992
372	Cần Giuộc	80	106.650448999999995	10.5953300000000006
373	Mai Sơn	14	104.024323999999993	21.1695640000000012
374	Vĩnh Lợi	95	105.709160000000011	9.35105300000000028
375	Hồng Bàng	31	106.643054000000006	20.8727410000000013
376	Vạn Ninh	56	109.210567999999995	12.7566820000000014
377	Lý Nhân	35	106.098888999999986	20.5669920000000026
378	Yên Bái	15	104.901319999999998	21.709070999999998
379	Tân Hồng	87	105.478794999999991	10.878616000000001
380	Bát Xát	10	103.698214000000007	22.5778420000000004
381	Đông Sơn	38	105.730551000000006	19.7766899999999985
382	Yên Mô	37	106.00687099999999	20.1278260000000024
383	Pleiku	64	107.993964999999989	13.9508559999999999
384	Vĩnh Cửu	75	107.022639999999996	11.2357849999999999
385	Ninh Hải	58	109.110703000000001	11.6126149999999999
386	Tây Giang	49	107.464368999999991	15.8690260000000016
387	Yên Lập	25	105.016998999999998	21.3501290000000026
388	Việt Yên	24	106.086811000000012	21.2669530000000009
389	Chơn Thành	70	106.664114999999995	11.4775139999999993
390	Rạch Giá	91	105.099108000000001	10.0358450000000001
391	Mộc Hóa	80	105.981647999999993	10.778518
392	Mộc Châu	14	104.699915000000004	20.8666440000000009
393	Thuận Châu	14	103.653718000000012	21.4295059999999999
394	Châu Đức	77	107.250789999999995	10.6592450000000003
395	Thạch Thành	38	105.644740999999996	20.2026469999999989
396	Cửa Lò	40	105.721230000000006	18.7910000000000004
397	Đại Từ	19	105.602139999999991	21.6297500000000014
398	Nghĩa Hành	51	108.788687999999993	14.9903910000000007
399	Yên Thành	40	105.43425400000001	19.0291829999999997
400	Hòa Thành	72	106.129722000000001	11.2830560000000002
401	Bến Tre	83	106.371087999999986	10.2419539999999998
402	Tp Cao Lãnh	87	105.631522000000004	10.4467610000000004
403	Kon Rẫy	62	108.187007000000008	14.5243719999999996
404	Chí Linh	30	106.376277999999999	21.112992000000002
405	Cam Lâm	56	109.083377999999996	12.0769130000000011
406	Mường La	14	104.090206999999992	21.5394149999999982
407	Kiến Thuỵ	31	106.671366999999989	20.7362499999999983
408	Đà Bắc	17	105.062269999999998	20.9147739999999978
409	Quận 12	79	106.654568999999995	10.8715119999999992
410	Thanh Thuỷ	25	105.281159000000002	21.1338709999999992
411	Tân Trụ	80	106.506472000000002	10.5339880000000008
412	Mù Căng Chải	15	104.113208	21.8087410000000013
413	Vũng Liêm	86	106.159680000000009	10.065842
414	Kiên Lương	91	104.649837000000005	10.3088110000000004
415	Cái Nước	96	105.050286000000014	9.00934299999999944
416	Lai Vung	87	105.652104000000008	10.2604229999999994
417	Bác Ái	58	108.879700999999997	11.8948850000000004
418	Dương Kinh	31	106.715064999999996	20.7876660000000015
419	Phù Mỹ	52	109.082080000000005	14.2323810000000002
420	Nghĩa Hưng	36	106.170703000000003	20.0772370000000002
421	Dầu Tiếng	74	106.446995000000001	11.3304789999999986
422	Ngọc Hồi	62	107.633462000000009	14.7192070000000008
423	Châu Thành	91	105.167458000000011	10.0131339999999991
424	Sóc Trăng	94	105.972144999999998	9.60187400000000046
425	Biên Hòa	75	106.894052000000002	10.9272650000000002
426	Nam Sách	30	106.33278700000001	21.0195329999999991
427	Trùng Khánh	4	106.533913999999996	22.8422340000000013
428	Hương Trà	46	107.49724599999999	16.4094200000000008
429	Sơn Trà	48	108.258812999999989	16.1170799999999979
430	Phù Cừ	33	106.190702000000002	20.7180759999999999
431	U Minh	96	104.939339999999987	9.37587899999999941
432	Đắk Hà	62	107.974613999999988	14.6048969999999994
433	Quan Hóa	38	104.947550000000007	20.4569119999999991
434	Văn Quan	20	106.533409000000006	21.8449989999999978
435	Bắc Yên	14	104.380444999999995	21.2609890000000021
436	Bá Thước	38	105.241973999999999	20.3617760000000025
437	Thăng Bình	49	108.370511000000008	15.6931840000000005
438	Lâm Thao	25	105.293162999999993	21.3066689999999994
439	Cát Tiên	68	107.367552000000003	11.6671029999999991
440	Trạm Tấu	15	104.42121800000001	21.4925029999999992
441	Tân Châu	72	106.257625000000004	11.6053879999999996
442	Phú Bình	19	105.964710000000011	21.4956399999999981
443	Lộc Ninh	70	106.567929000000007	11.8509740000000008
444	Bà Rịa	77	107.182380000000009	10.513287
445	Ngã Bảy	93	105.819445000000002	9.83528399999999969
446	Di Linh	68	108.080817999999994	11.5038529999999994
447	Phú Ninh	49	108.406183000000013	15.544003
448	Thiệu Hóa	38	105.679137999999995	19.9009570000000018
449	Kinh Môn	30	106.498642999999987	21.0211059999999996
450	Hàm Thuận Bắc	60	108.036054000000007	11.1666949999999989
451	Chợ Lách	83	106.174819999999997	10.2318870000000004
452	Hà Quảng	4	106.117125999999999	22.9107730000000025
453	Đắk Glei	62	107.735510000000005	15.1058260000000004
454	Mỹ Tú	94	105.779549000000003	9.61438200000000087
455	Hàm Tân	60	107.643327999999997	10.7745359999999994
456	Đăk Glong	67	107.888511000000008	12.0485469999999992
457	Si Ma Cai	10	104.259338	22.6661049999999982
458	Yên Thế	24	106.128005000000002	21.5237920000000003
459	Xuân Lộc	75	107.433002999999999	10.9364249999999998
460	Tân Phú Đông	82	106.615519999999989	10.2725489999999997
461	Tuy Đức	67	107.374125000000006	12.1558410000000006
462	Bắc Từ Liêm	1	105.760037999999994	21.0722730000000027
463	Ứng Hòa	1	105.798374999999993	20.7181350000000002
464	Ba Bể	6	105.747716999999994	22.4024469999999987
465	Hòa Vang	48	108.01388	16.0824479999999994
466	Nghĩa Đàn	40	105.431455	19.3918609999999987
467	Phú Quí	60	108.947470999999993	10.5323659999999997
468	Cù Lao Dung	94	106.168655999999999	9.6475350000000013
469	Mường Chà	11	103.059421999999998	21.869095999999999
470	Đông Triều	22	106.587525999999997	21.1195730000000026
471	Phú Lương	19	105.730612999999991	21.7677279999999982
472	Duy Tiên	35	105.972088999999983	20.6324989999999993
473	Hóc Môn	79	106.58013600000001	10.8853969999999993
474	Tĩnh Gia	38	105.735561000000004	19.444148000000002
475	Thủ Thừa	80	106.338228999999998	10.6623889999999992
476	Hương Khê	42	105.675178000000002	18.1817780000000013
477	Gia Bình	27	106.202205000000006	21.0745189999999987
478	Tân Lạc	17	105.234361000000007	20.6018350000000012
479	Cư Kuin	66	108.180618999999993	12.5863689999999995
480	Na Hang	8	105.453651000000008	22.4432079999999985
481	Tuy Phong	60	108.695024000000004	11.3520059999999994
482	Sìn Hồ	12	103.25211800000001	22.3510049999999971
483	Lai Châu	12	103.420493000000008	22.403459999999999
484	Vũ Quang	42	105.436258000000009	18.3332980000000028
485	Lạng Sơn	20	106.740884000000008	21.8590690000000016
486	Bù Gia Mập	70	106.983064999999996	11.9454979999999988
487	Tiền Hải	34	106.534223999999995	20.3842420000000004
488	Bắc Giang	24	106.192374999999998	21.2907140000000012
489	Định Hóa	19	105.617976999999996	21.9003820000000005
490	Phước Long	95	105.414883000000003	9.39977599999999924
491	Tiên Du	27	106.03581100000001	21.1131320000000002
492	Thoại Sơn	89	105.254153000000002	10.3108759999999986
493	Krông Năng	66	108.381568999999999	13.0176580000000008
494	Bù Đốp	70	106.818095	12.0061499999999999
495	Quan Sơn	38	104.838634999999996	20.2698159999999987
496	Bạch Thông	6	105.856385000000003	22.2401480000000014
497	Bảo Lâm	4	105.478562000000011	22.8847130000000014
498	Phú Thọ	25	105.233015999999992	21.4168629999999993
499	Tx Long Mỹ	93	105.570833000000007	9.68138899999999936
500	Bến Lức	80	106.453671	10.6919960000000014
501	Hoài Đức	1	105.701812000000018	21.0273089999999989
502	Cờ Đỏ	92	105.452620999999994	10.1213390000000008
503	Cư Jút	67	107.773385000000005	12.7005719999999993
504	Sóc Sơn	1	105.838076999999998	21.2766669999999998
505	Kiến Xương	34	106.425321999999994	20.4002769999999991
506	Tiên Lãng	31	106.576048	20.7077910000000003
507	Trà Ôn	86	106.014054999999999	9.99770200000000031
508	Ba Chẽ	22	107.185333000000014	21.2888100000000016
509	Quận 6	79	106.636111000000014	10.7461110000000009
510	Can Lộc	42	105.745164999999986	18.4269540000000021
511	Gio Linh	45	106.972223999999997	16.8955799999999989
512	Bình Liêu	22	107.435336000000007	21.5485410000000002
513	Phú Lộc	46	107.852160000000012	16.2446279999999987
514	Thốt Nốt	92	105.543987999999985	10.2449969999999997
515	Hải Hà	22	107.672087000000005	21.5155659999999997
516	Cao Phong	17	105.328702000000007	20.6921929999999996
517	Cần Đước	80	106.597797	10.5230630000000005
518	Đơn Dương	68	108.559279000000004	11.7420279999999995
519	Tân Phú	79	106.627918999999991	10.7914560000000002
520	Đông Hòa	54	109.354734000000008	12.9548330000000007
521	Hạ Hoà	25	104.944089999999989	21.5582980000000006
522	Nghi Xuân	42	105.760662000000011	18.6236920000000019
523	Thanh Sơn	25	105.186172999999997	21.0686109999999971
524	Khánh Sơn	56	108.91422	12.0308850000000014
525	Cà Mau	96	105.186825999999996	9.16552899999999937
526	Ea Kar	66	108.536868999999996	12.751650999999999
527	Hoài Nhơn	52	109.024518	14.5111399999999993
528	Kiến Tường	80	105.923714999999987	10.780066999999999
529	Nam Trực	36	106.203837000000007	20.345404000000002
530	Ngân Sơn	6	105.998086000000015	22.4147390000000009
531	Đạ Tẻh	68	107.515768999999992	11.5867079999999998
532	Chư Pưh	64	108.070770999999993	13.5130339999999993
533	Thái Hoà	40	105.442881	19.2923630000000017
534	Hạ Long	22	106.98725300000001	20.9750579999999971
535	Phúc Yên	26	105.736271000000002	21.3161629999999995
536	Buôn Ma Thuột	66	108.035942999999989	12.6546269999999996
537	Vân Đồn	22	107.482062999999982	20.9379269999999984
538	Ba Vì	1	105.376968999999988	21.124842000000001
539	Trà Bồng	51	108.526694999999989	15.2273989999999984
540	Đầm Hà	22	107.55431999999999	21.3903769999999973
541	Bảo Lộc	68	107.803052000000008	11.5365770000000012
542	Quản Bạ	2	104.956462000000016	23.0806970000000007
543	Tân Uyên	74	106.817564999999988	11.1255100000000002
544	Chư Prông	64	107.822243	13.5986820000000002
545	Duy Xuyên	49	108.173792999999989	15.7900749999999999
546	Trực Ninh	36	106.232256000000007	20.2510310000000011
547	Quảng Yên	22	106.842659000000012	20.9415939999999985
548	Bình Gia	20	106.309545999999997	22.0606089999999995
549	Quận 1	79	106.699477999999999	10.7774529999999995
550	Buôn Hồ	66	108.282325	12.8592570000000013
551	Quận 5	79	106.669349999999994	10.755039
552	Văn Chấn	15	104.588412000000005	21.5976689999999998
553	Phong Điền	46	107.292410000000004	16.5165369999999996
554	Quảng Xương	38	105.797105000000002	19.7107049999999973
555	Dĩ An	74	106.771924999999996	10.9120360000000005
556	Nam Giang	49	107.610105000000004	15.6398440000000001
557	Sốp Cộp	14	103.492929000000004	20.9220660000000009
558	Đông Hải	95	105.412416999999991	9.15411399999999986
559	Chư Păh	64	107.970101999999997	14.1823339999999991
560	Hưng Nguyên	40	105.621632000000005	18.6641159999999999
561	Bình Tân	79	106.597577999999999	10.7657769999999999
562	Như Thanh	38	105.571359000000015	19.5995290000000004
563	Kon Plông	62	108.307321999999999	14.7760239999999996
564	Tràng Định	20	106.478061000000011	22.2948999999999984
565	Quảng Điền	46	107.498265999999987	16.5751080000000002
566	Cầu Kè	84	106.079168999999993	9.88245500000000021
567	Quỳnh Nhai	14	103.641518999999988	21.7952640000000031
568	Sầm Sơn	38	105.901135000000011	19.7575690000000002
569	Lạc Sơn	17	105.434208000000012	20.4894709999999982
570	Cát Hải	31	107.002857000000006	20.8049409999999995
571	Hoàng Su Phì	2	104.68560699999999	22.7018869999999993
572	Yên Thủy	17	105.614167999999992	20.4299280000000003
573	Gia Viễn	37	105.865480000000005	20.3500370000000004
574	Triệu Phong	45	107.14472099999999	16.7615079999999992
575	Đoan Hùng	25	105.163443999999998	21.6134459999999997
576	Châu Thành	89	105.261178000000001	10.4246189999999999
577	Hưng Hà	34	106.209943999999993	20.5937750000000008
578	Gia Lâm	1	105.952970999999991	21.0160499999999999
579	Đông Anh	1	105.834893999999991	21.1363480000000017
580	Thanh Khê	48	108.18743400000001	16.0661640000000006
581	Phú Xuyên	1	105.90595900000001	20.7323689999999985
582	Thuận Bắc	58	109.079243999999989	11.7556999999999992
583	Vũng Tàu	77	107.135063999999986	10.3999539999999993
584	Nông Sơn	49	107.968461000000005	15.6601230000000005
585	Đồng Xuân	54	108.985833000000014	13.4221040000000009
586	Yên Khánh	37	106.088449999999995	20.1903450000000007
587	Tân Bình	79	106.650182000000001	10.8096160000000001
588	Bình Sơn	51	108.719209000000006	15.3018249999999991
589	Phù Yên	14	104.671102000000005	21.2267690000000009
590	Vĩnh Yên	26	105.594340999999986	21.3075590000000012
591	Bắc Quang	2	104.845455999999999	22.4047850000000004
592	Krông Pắc	66	108.353769999999997	12.6986319999999999
593	Thuận Nam	58	108.898651999999998	11.4592030000000005
594	Cẩm Lệ	48	108.186350000000004	16.0086529999999989
595	Phú Tân	96	104.887844000000001	8.90372499999999967
596	H Cai Lậy	82	106.101388999999983	10.4055559999999989
597	Củ Chi	79	106.513318999999996	11.0004139999999992
598	Mang Yang	64	108.295482000000007	13.9892519999999987
599	Sông Mã	14	103.675989999999999	21.0812190000000008
600	La Gi	60	107.779445999999993	10.7316399999999987
601	U Minh Thượng	91	105.121212999999983	9.64381799999999956
602	Cao Lộc	20	106.837462000000016	21.9060609999999976
603	Càng Long	84	106.208446999999992	9.95996300000000012
604	Trấn Yên	15	104.765338999999997	21.6740920000000017
605	Bến Cầu	72	106.128701000000007	11.1405750000000001
606	Hàm Thuận Nam	60	107.904904000000002	10.9363720000000004
607	Quế Võ	27	106.177532000000014	21.1444320000000019
608	Cầu Ngang	84	106.448333000000005	9.80277799999999999
609	Vị Thanh	93	105.427268999999995	9.74547199999999947
610	Ninh Kiều	92	105.755589999999984	10.02501
611	Trà Lĩnh	4	106.313943999999992	22.8167149999999985
612	Quốc Oai	1	105.591565999999986	20.9622039999999998
613	Mỏ Cày Bắc	83	106.285543999999987	10.1740329999999997
614	Tx Kỳ Anh	42	106.296666999999999	18.0677780000000006
615	Phú Giáo	74	106.765142999999995	11.3254009999999994
616	Thạch An	4	106.305187000000018	22.4885160000000006
617	Minh Hóa	44	105.856453000000002	17.7575769999999977
618	Bắc Trà My	49	108.210571999999999	15.2947749999999996
619	Nguyên Bình	4	105.917735000000008	22.641570999999999
620	Hiệp Hòa	24	105.966734000000002	21.3235109999999999
621	Quận 7	79	106.723191999999997	10.7390990000000013
622	Long Phú	94	106.089905999999999	9.63965199999999989
623	Vân Canh	52	108.963577999999998	13.6535209999999996
624	Đất Đỏ	77	107.30036299999999	10.4949639999999995
625	Ninh Bình	37	105.969958000000005	20.2460820000000012
626	Phúc Thọ	1	105.583844999999997	21.1201550000000005
627	Hồng Dân	95	105.399134000000004	9.51372500000000088
628	Bình Xuyên	26	105.661993999999993	21.3221090000000011
629	Phong Thổ	12	103.364989000000008	22.6024419999999999
630	Bảo Lạc	4	105.704705000000004	22.911206
631	Lạc Dương	68	108.539525999999995	12.122897
632	Đức Cơ	64	107.638183000000012	13.7748619999999988
633	Ba Đình	1	105.820362000000017	21.0341969999999989
634	Gia Nghĩa	67	107.693212000000017	11.9964309999999994
635	Tam Dương	26	105.555785000000014	21.3668179999999985
636	Bình Thạnh	79	106.696555000000004	10.802802999999999
637	Đắk Song	67	107.62978600000001	12.2428810000000006
638	Quận 2	79	106.757974000000004	10.7897970000000001
639	Đông Giang	49	107.741174999999998	15.9323370000000004
640	Châu Thành	94	105.903828000000004	9.67972100000000069
641	Đắk Tô	62	107.807129000000003	14.6883420000000005
642	Krông Bông	66	108.48810300000001	12.4778579999999994
643	Kim Sơn	37	106.087712999999994	20.0588799999999985
644	Diễn Châu	40	105.564987999999985	18.9931700000000028
645	Tân Kỳ	40	105.219985000000008	19.1222570000000012
646	Ngô Quyền	31	106.701290999999998	20.8563900000000011
647	Mỹ Hào	33	106.096785000000011	20.9378790000000023
648	Châu Thành	83	106.322047999999995	10.3018110000000007
649	An Phú	89	105.076104000000001	10.8638619999999992
650	Lạc Thủy	17	105.736307000000011	20.4999749999999992
651	Thạnh Phú	83	106.533832000000004	9.93638999999999939
652	Hương Sơn	42	105.31998200000001	18.5006500000000003
653	Đình Lập	20	107.123730000000009	21.5424119999999988
654	Điện Biên Đông	11	103.261277000000007	21.245160000000002
655	Bình Chánh	79	106.544995999999998	10.7789110000000008
656	Hải Lăng	45	107.241364999999988	16.6659320000000015
657	Bắc Bình	60	108.411947999999995	11.2822230000000001
658	Vĩnh Tường	26	105.499895999999993	21.2450829999999975
659	Trà Cú	84	106.286381000000006	9.70131699999999952
660	Qui Nhơn	52	109.179637000000014	13.7522660000000005
661	Vĩnh Thạnh	92	105.349178000000009	10.2021350000000002
662	Long Hồ	86	105.967755000000011	10.2062340000000003
663	Mường Lát	38	104.621032	20.5165350000000011
664	Vĩnh Long	86	105.951966999999996	10.2474959999999999
665	Thanh Bình	87	105.460006000000007	10.6124770000000002
666	Vĩnh Linh	45	106.927374	17.0206309999999981
667	Tam Đường	12	103.591626000000005	22.3413630000000012
668	Phan Rang-Tháp Chàm	58	108.977419999999995	11.5960169999999998
669	Hội An	49	108.337419999999995	15.8872440000000008
670	Gò Dầu	72	106.269611000000012	11.1569479999999999
671	Ea Súp	66	107.782858000000004	13.181414000000002
672	Giao Thủy	36	106.452150000000003	20.2487139999999997
673	Cẩm Khê	25	105.111606000000009	21.4076710000000006
674	Hiệp Đức	49	108.094165999999987	15.5561049999999987
675	Thường Xuân	38	105.253959000000009	19.8729559999999985
676	Chợ Mới	6	105.859556000000012	21.9841920000000002
677	Giồng Riềng	91	105.365701000000001	9.91577400000000075
678	Mỹ Tho	82	106.33960900000001	10.3751160000000002
679	Lào Cai	10	103.992987999999997	22.5131209999999982
680	Bắc Ninh	27	106.070274999999995	21.178917000000002
681	Phục Hoà	4	106.53258799999999	22.5603100000000012
682	Krông Pa	64	108.654921000000002	13.2405760000000008
683	Vĩnh Bảo	31	106.487410000000011	20.6755500000000012
684	Sơn Hòa	54	108.973794999999996	13.1776160000000004
685	Tam Nông	25	105.232146999999998	21.2980470000000004
686	Yên Châu	14	104.330531000000008	21.0049069999999993
687	Sa Đéc	87	105.736281000000005	10.3225979999999993
688	Văn Lãng	20	106.602823999999998	22.0522980000000004
689	Sông Cầu	54	109.180171999999999	13.5269230000000018
690	Châu Thành	72	105.995737999999989	11.3001389999999997
691	Hải Dương	30	106.323126999999999	20.9436129999999991
692	Kim Thành	30	106.510733000000002	20.9343530000000015
693	Khánh Vĩnh	56	108.828312999999994	12.3174929999999989
694	Phụng Hiệp	93	105.706451999999999	9.80067500000000003
695	Giồng Trôm	83	106.473059000000006	10.161719999999999
696	Mường Khương	10	104.117372000000003	22.6814779999999985
697	Hà Giang	2	105.013037999999995	22.8063459999999978
698	Nông Cống	38	105.677910000000011	19.6178460000000001
699	Yên Minh	2	105.201329000000001	23.0479579999999977
700	Ninh Hòa	56	109.051455000000004	12.5709889999999991
701	Đăk Đoa	64	108.145527000000001	14.0641290000000012
702	Nho Quan	37	105.744970999999993	20.2974989999999984
703	Sơn La	14	103.916096999999993	21.3431880000000014
704	Mường Nhé	11	102.544657999999998	22.1575689999999987
705	Ô Môn	92	105.627919999999989	10.1409160000000007
706	Đầm Dơi	96	105.24194399999999	8.97432700000000061
707	Trảng Bàng	72	106.368499999999997	11.0805279999999993
\.


--
-- Data for Name: core_googlevision; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_googlevision (id, access_token, expires_in, refresh_token, scope, token_type) FROM stdin;
\.


--
-- Data for Name: core_linhvunghenghiep; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_linhvunghenghiep (id, linhvuc, code_linhvuc) FROM stdin;
1	NGÀNH NGHỀ THÔNG THƯỜNG	1
2	THƯƠNG NGHIỆP	2
3	DỊCH VỤ	3
4	TÀI CHÍNH, BẢO HIỂM, NGÂN HÀNG	4
5	NÔNG LÂM NGHIỆP, GIA CẦM, THUỶ LỢI	5
6	BƯU CHÍNH VIỄN THÔNG	6
7	GIAO THÔNG VẬN TẢI	7
8	XÂY DỰNG CÔNG TRÌNH	8
9	NGÀNH SẢN XUẤT	9
10	QUẢNG CÁO, TIN TỨC, THỜI SỰ	10
11	Y TẾ	11
12	GIẢI TRÍ	12
13	CÔNG AN	13
14	THỂ THAO	14
15	GIÁO DỤC	15
16	KHAI THÁC KHOÁNG MỎ	16
17	BỘ ĐỘI	17
18	KHÁC	18
\.


--
-- Data for Name: core_nguoimuabaohiem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_nguoimuabaohiem (id, username, fullname, birth_day, birth_month, birth_year, gioi_tinh, email, dia_chi_tinh_thanh_pho, dia_chi_quan_huyen, dia_chi_chi_tiet, so_cmnd, images_cmt_mattruoc, images_cmt_matsau, cmt_ngay_cap, cmt_noi_cap, ngay_hieu_luc, ngay_ket_thuc, ho_ten_nhan, email_nhan, so_dien_thoai_nhan, dia_chi_tinh_thanh_pho_nhan, dia_chi_quan_huyen_nhan, dia_chi_chi_tiet_nhan, status_marriage, job, weight, height, nationality, nationality_paper, created_at) FROM stdin;
\.


--
-- Data for Name: core_nguoimuabaohiemtam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_nguoimuabaohiemtam (id, username, fullname, birth_day, birth_month, birth_year, gioi_tinh, email, dia_chi_tinh_thanh_pho, dia_chi_quan_huyen, dia_chi_chi_tiet, so_cmnd, images_cmt_mattruoc, images_cmt_matsau, cmt_ngay_cap, cmt_noi_cap, ngay_hieu_luc, ngay_ket_thuc, ho_ten_nhan, email_nhan, so_dien_thoai_nhan, dia_chi_tinh_thanh_pho_nhan, dia_chi_quan_huyen_nhan, dia_chi_chi_tiet_nhan, status_marriage, job, weight, height, nationality, nationality_paper, created_at) FROM stdin;
\.


--
-- Data for Name: core_noidungnghenghiep; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_noidungnghenghiep (id, noidungcongviec, code_chitiet, capnghenghiep, hanchetichluy) FROM stdin;
1	Người quản lý	1	1	0
2	Nhân viên văn phòng thông thường	1	1	0
3	Nhân viên văn phòng hay phải ra ngoài giải quyết công việc	1	2	0
4	Công chức làm trong ngành chính trị	1	2	0
5	Nhân viên văn phòng thông thường	2	1	0
6	Nhân viên bán hàng thông thường	2	1	0
7	Nhân viên bán hàng (kính)	2	3	0
8	Nhân viên/ người đứng bán vật liệu xây dựng (xi măng, gạch, đá, cát, sắt, thép); buôn bán phế liệu; bán vé số dạo; bán hàng ở lề đường; bán hàng rong các loại; buôn bán chó, mèo, gia cầm, gia súc, chim chóc, động vật hoang dã	2	3	0
9	Bán cá	2	2	0
10	Bán thịt	2	2	0
11	Người giữ kho	2	2	0
12	Thu mua, tiếp thị	2	2	0
13	Chủ tiệm kim hoàn, nhân viên đứng bán tại tiệm kim hoàn, chủ cây xăng, chủ hiệu cầm đồ	2	2	0
14	Công nhân vận chuyển hàng hóa	2	3	0
15	Tài xế	2	3	0
16	Văn phòng	3	1	0
17	Bán hàng	3	2	0
18	Buôn hàng chuyến	3	4	600000000
19	Bán hàng (kính)	3	2	0
20	Ghi đồng hồ nước, thu phí	3	2	0
21	Công nhân vận chuyển	3	3	0
22	Tài xế	3	3	0
23	Kế toán	4	1	0
24	Môi giới	4	2	0
25	Luật sư	4	1	0
26	Chuyên viên đánh giá (nhà phê bình)	4	1	0
27	Nhân viên thu mua	5	2	0
28	Nhân viên phục vụ quán ăn	5	2	0
29	Nhân viên trà đạo	5	1	0
30	Đầu bếp	5	2	0
31	Pha chế rượu bartender	5	2	0
32	Bảo vệ (tòa nhà, công xưởng, công ty)	5	3	0
33	Nhân viên phục vụ nhà hàng, khách sạn	5	2	0
34	Công nhân khắc chữ	5	2	0
35	Thợ cắt tóc	5	1	0
36	Hướng dẫn viên du lịch	5	2	0
37	Nhân viên thẩm mỹ viện	5	1	0
38	Thợ chụp hình	5	1	0
39	Thu ngân	5	2	0
40	Quản lí vật liệu	5	2	0
41	Tiệm giặt ủi laundery	5	2	0
42	Làm giày, làm dù	5	2	0
43	Nhân viên phục vụ ở nhà tắm công cộng	5	2	0
44	Thợ điện dân dụng	5	4	600000000
45	Thợ sửa xe gắn máy, thợ sửa xe ô tô, thợ làm việc tại các garage	5	4	0
46	Nhân viên chuyển nhà	5	4	0
47	Thợ đồng hồ	5	1	0
48	Bảo mẫu, công nhân bán thời gian	6	2	800000000
49	Công nhân mai táng	6	2	0
50	Công nhân vệ sinh đường phố	6	3	0
51	Công nhân vệ sinh bên ngoài cao ốc	6	4	600000000
52	Nhân viên trạm xăng	6	3	0
53	Hộ lí gia đình	6	2	800000000
54	Nội trợ (không nghề nghiệp) housewife	6	1	800000000
55	Công nhân vệ sinh kiêm vệ sinh đường cống	6	4	600000000
56	Công nhân thu phí, gửi xe và rửa xe	6	2	0
57	Công nhân vệ sinh đường cống	6	4	600000000
58	Nhân viên cứu nạn (vùng đồng bằng)	6	3	0
59	Nhân viên cứu nạn (vùng đồi núi, sông nước)	6	4	600000000
60	Nhân viên phòng độc, diệt côn trùng	6	2	600000000
61	Công nhân sữa chữa	6	4	600000000
62	Vận chuyển tiền mặt (tài xế)	7	4	600000000
63	Phòng tiết kiệm	7	1	0
64	Nhân viên văn phòng	7	1	0
65	Nhân viên đòi nợ ngân hàng	7	4	600000000
66	Nhân viên hay phải ra ngoài giải quyết công việc, nhân viên thu phí, nhân viên điều tra, nhân viên đánh giá bất động sản	7	2	0
67	Đại lý	7	2	0
68	Kinh doanh	7	1	0
69	Công nhân phá rừng	8	4	600000000
70	Nhân viên điều khiển cần cẩu	8	4	600000000
71	Nhân viên phòng chống cháy rừng	8	4	600000000
72	Công nhân xe vận chuyển, tài xế và áp tải gỗ	8	4	600000000
73	Công nhân bốc xếp	8	4	600000000
74	Nhân viên quản lí rừng	8	4	600000000
75	Nhân viên quản lí hành chính	8	2	0
76	Nhân viên ươm giống cây trồng	8	2	0
77	Công nhân trồng rừng	8	4	600000000
78	Công nhân cưa gỗ	9	4	600000000
79	Công nhân vận chuyển gỗ	9	4	600000000
80	Lái xe nâng	9	3	0
81	Công nhân chất chống phân hủy	9	4	600000000
82	Sản xuất ghép gỗ	9	4	600000000
83	Kỹ thuật	9	2	0
84	Quản lý chất lượng	9	2	0
85	Công nhân giữ gỗ	9	4	600000000
86	Công nhân leo hái dừa	10	4	600000000
87	Công nhân cạo mủ cao su tại các nông trường, đồn điền; công nhân nông trường cao su, nông dân trồng và cạo mủ cao su	10	4	0
88	Công nhân biên chế hoặc thời vụ	10	3	0
89	Công nhân trồng cây ăn quả	10	2	0
90	Người nuôi côn trùng sâu bọ (ong mật)	10	3	0
91	Công nhân trồng vườn	10	2	0
92	Nhân viên điều khiển máy móc nông nghiệp	10	3	0
93	Kỹ sư nông nghiệp	10	2	0
94	Giám đốc nông trường, hợp tác xã, cán bộ khuyến nông	10	2	0
95	Công nhân kỹ thuật lò đường	10	4	600000000
96	Người nuôi cá sấu, rắn, động vật nguy hiểm	10	4	600000000
97	Người chăn nuôi	10	2	0
98	Người trồng thực vật	10	2	0
99	Người chăn gia súc	11	3	0
100	Bác sĩ thú y vets	11	3	0
101	Quản lí chăn nuôi	11	1	0
102	Người huấn luyện chó	11	3	0
103	Kỹ sư	12	2	0
104	Quản lí đập nước, hồ chứa nước	12	3	0
105	Thi công thiết kế công trình thủy lợi	12	4	600000000
106	Phân tích nguồn nước (thực địa)	12	3	0
107	Ghi đồng hồ nước, thu phí	12	2	0
108	Quản lí hệ thống cung cấp nước	12	3	0
109	Ngư dân đánh cá (sông, hồ…)	13	3	0
110	Người nuôi trồng thủy sản (sông, hồ)	13	3	0
111	Người nuôi trồng thủy sản (vùng duyên hải)	13	4	600000000
112	Người quản lí ao hồ cá	13	2	0
113	Ngư dân đánh cá (vùng duyên hải)	13	4	600000000
114	Người đánh bắt gần bờ	13	4	600000000
115	Kiểm định thủy sản (thực địa)	13	4	600000000
116	Người đánh bắt xa bờ	13	4	600000000
117	Người vận chuyển bưu phẩm	14	3	0
118	Nhân viên văn phòng	14	1	0
119	Nhân viên phát thư	14	3	0
120	Tài xế xe rác	15	3	0
121	Tài xế xe ôm thuộc doanh nghiệp	15	3	0
122	Lái xe cứu hỏa	15	4	600000000
123	Phụ xe, lơ xe, chủ xe đi theo xe, nhân viên soát vé xe buýt	15	4	0
124	Tài xế các loại xe vận tải	15	4	0
125	Tài xế bồn chở xăng, dầu, khí đốt, chất nổ, chất dễ cháy	15	4	0
126	Nhân viên thu phí cầu đường	15	2	0
127	Tài xế taxi, xe khách	15	3	0
128	Người điều khiển xe 3 bánh có gắn motor	15	4	600000000
129	Tài xế xe ôm tự do	15	4	600000000
130	Người kéo xe 3 bánh	15	3	0
131	Công việc thông thường (không tham gia lái xe)	15	1	0
132	Tài xế chở hàng cho doanh nghiệp (xe có trọng tải dưới hoặc bằng 5 tấn)	15	3	0
133	Tài xế chở hàng cho doanh nghiệp (xe có trọng tải trên 5 tấn)	15	4	600000000
134	Tài xế xe du lịch và nhân viên phục vụ (xe dưới hoặc bằng 16 chỗ ngồi)	15	3	0
135	Tài xế xe du lịch và nhân viên phục vụ (xe trên 16 chỗ ngồi)	15	4	600000000
136	Công nhân sửa chữa đường sắt	16	4	600000000
137	Công nhân làm đường	16	4	600000000
138	Quản lý bến xe, nhân viên bán vé, nhân viên phát thanh, nhân viên soát vé, nhân viên phục vụ quầy, nhân viên thông thường khác	16	1	0
139	Công nhân vệ sinh bến xe	16	2	0
140	Bảo vệ cổng	16	3	0
141	Công nhân cơ điện	16	3	0
142	Lái tàu	16	3	0
143	Nhân viên tiếp nhiên liệu	16	3	0
144	Phụ lái tàu	16	2	0
145	Công nhân sửa chữa khoang tàu	16	3	0
146	Nhân viên kỹ thuật sửa chữa khoang tàu	16	2	0
147	Quản lí	16	1	0
148	Công nhân bốc dỡ hàng hóa	16	4	600000000
149	Thuyền trưởng	17	3	0
150	Kỹ sư trưởng	17	3	0
151	Thủy thủ cao cấp	17	3	0
152	Thủy thủ thông thường	17	3	0
153	Thuyền viên cứu nạn	17	4	600000000
154	Nhân viên lái thuyền du lịch, ca-nô	17	3	0
155	Quản đốc và công nhân bến đò	18	3	0
156	Thao tác máy xe nâng	18	4	600000000
157	Hoa tiêu	18	3	0
158	Hải quan	18	2	0
159	Tra xét, bắt buôn lậu	18	4	600000000
160	Người lái tàu kéo	18	3	0
161	Người lái phà	18	3	0
162	Nhân viên cứu hộ	18	4	600000000
163	Văn phòng	19	1	0
164	Bắt buôn lậu	19	3	0
165	Vệ sinh	19	2	0
166	Tài xế lái xe trong sân bay	19	2	0
167	Vận chuyển hàng hóa hành lý	19	3	0
168	Đổ nhiên liệu	19	3	0
169	Công nhân rửa máy bay	19	3	0
170	Công nhân bảo trì đường băng	19	3	0
171	Kỹ sư sửa chữa máy bay	19	2	0
172	Nhân viên bảo trì máy bay	19	3	0
173	Văn phòng	20	1	0
174	Ngoại vụ	20	2	0
175	Tìm hành lí thất lạc	20	3	0
176	Phi công máy bay hàng không dân dụng	21	4	600000000
177	Nhân viên phục vụ trên máy bay	21	4	600000000
178	Phi hành viên máy bay trực thăng	21	4	600000000
179	Công nhân lắp ráp	22	3	0
180	Thợ máy	22	2	0
181	Sữa chữa và bảo trì	22	3	0
182	Công nhân kết cấu cốt thép	23	4	600000000
183	Thợ hàn	23	4	600000000
184	Tài xế lái xe cho công trình xây dựng và thao tác máy móc	23	4	600000000
185	Công nhân xây dựng	23	4	600000000
186	Thiết kế xây dựng	23	1	0
187	Công nhân bốc dỡ cửa, cửa sổ	23	4	600000000
188	Giám sát hiện trường	23	3	0
189	Văn phòng	23	1	0
190	Công nhân bắt nối khung giá	23	4	600000000
191	Công nhân phá dỡ công trình	24	4	600000000
192	Đo lường trắc địa	24	3	0
193	Bảo vệ đất xây dựng	24	4	600000000
194	Công trình cảng biển	24	4	600000000
195	Thợ lặn diver	24	4	600000000
196	Công trình cầu	24	4	600000000
197	Công trình đập nước	24	4	600000000
198	Thi công đường hầm	24	4	600000000
199	Công nhân nạo vét bùn	24	4	600000000
200	Công nhân bảo trì và kéo dây điện cab worker	25	4	600000000
201	Công trình đường cao tốc	25	4	600000000
202	Tài xế xe công trình	25	4	600000000
203	Thao tác máy móc công trình	25	4	600000000
204	Công nhân bảo trì và xây dựng đường hầm	25	4	600000000
205	Công nhân xây dựng (đất đồng bằng)	25	4	600000000
206	Công nhân xây dựng (đất đồi núi)	25	4	600000000
207	Thi công đường hầm	25	4	600000000
208	Công nhân bảo trì	25	4	600000000
209	Giám sát hiện trường	25	3	0
210	Thiết kế	26	1	0
211	Trang trí nội thất	26	3	0
212	Trang trí nội thất làm việc bên ngoài (trên không)	26	4	600000000
213	(Nhân viên chế tạo và sửa chữa tàu thuyền nhỏ thì giảm 1 bậc)	27	4	600000000
214	Công nhân tháo dỡ tàu thuyền	27	4	600000000
215	Công nhân sữa chữa tàu thuyền	27	4	600000000
216	Công nhân đóng thuyền	27	4	600000000
217	Kỹ sư	27	2	0
218	Kỹ thuật	28	2	0
219	Lắp đặt điện lạnh	28	3	0
220	Quản lí hành chính	28	1	0
221	Làm việc liên quan điện cao áp	28	4	600000000
222	Thợ sửa chữa điện tử, TV, radio, cassette	29	3	0
223	Kỹ thuật	29	2	0
224	Quản lí hành chính	29	1	0
225	Công nhân sữa chữa lắp đặt	29	2	0
226	Công nhân may mặc	30	2	0
227	Công nhân sản xuất giày da, bao bì	30	3	0
228	Kỹ thuật	30	2	0
229	Công nhân nhuộm hàng	30	3	0
230	Quản lí hành chính	30	1	0
231	Kỹ thuật	31	2	0
232	Công nhân luyện thép	31	4	600000000
233	Công nhân khác	31	4	600000000
234	Quản lí hành chính	31	1	0
235	Công nhân tạo acid-sulphurit, acid-clohydric, acid-saltpeter	32	4	600000000
236	Kỹ thuật sản xuất	32	2	0
237	Quản lí hành chính	32	1	0
238	Công nhân phổ thông	32	3	0
239	Assembler Công nhân khai thác	33	4	600000000
240	Driller (Asbestos) Công nhân khoan	33	4	600000000
241	Foreman, Supervisor (Asbestos) Công nhân, đốc công	33	4	600000000
242	Labourer (Asbestos) Công nhân	33	4	600000000
243	Công nhân kìm, dũa	34	3	0
244	Thợ tiện,thợ khoan,thợ đánh bóng	34	4	600000000
245	Thợ nồi hơi	34	4	600000000
246	Thợ hàn	34	4	600000000
247	Kỹ thuật	34	2	0
248	Công nhân thủy điện	34	3	0
249	Quản lí hành chính	34	1	0
250	Công nhân đúc	34	4	600000000
251	Thợ cơ khí, công nhân cơ khí, thợ làm cửa sắt, cửa nhôm, thợ sơn, thợ đánh vecni, thợ đóng tàu	34	4	600000000
252	Công nhân lắp ráp	34	3	0
253	Kỹ thuật	35	1	0
254	Công nhân sữa chữa, lắp ráp đồ gia dụng bằng kim loại	35	3	0
255	Công nhân sữa chữa, lắp ráp đồ gỗ	35	3	0
256	Quản lí hành chính	35	1	0
257	Công nhân bảo dưỡng bảo trì sữa chữa lắp ráp xe máy, xe cơ giới	36	3	0
258	Kỹ thuật	36	2	0
259	Quản lí hành chính	36	2	0
260	Công nhân bảo dưỡng bảo trì sữa chữa lắp ráp xe đạp	36	3	0
261	Gia công sản xuất dầu ăn	37	3	0
262	Sản xuất thưc phẩm dầu ăn	37	3	0
263	Ủ rượu	37	3	0
264	Gia công thực phẩm trứng, thịt	37	3	0
265	Nhân viên làm nước giải khát, sữa, đồ nguội, đồ đóng hộp	37	3	0
266	Gia công sản xuất thức ăn gia súc	37	3	0
267	Gia công giết mổ	37	3	0
268	Ice room attendant Công nhân phòng đông lạnh	37	4	600000000
269	Peeler, Slab (Hand) Công nhân chặt, lọc, tách	37	3	0
270	Poultry sticker, plucker, dresser Công nhân thịt gia cầm, làm lông	37	3	0
271	Mixer, Drier, Boiler, Washer, Flaking millman (Fish, Meat, Fruit and vegetable,...), Sugar beet cutter, Sawyer; Purifier man Công nhân trộn, xay, rửa ( thịt, rau, củ , quả..)	37	3	0
272	Gia công chế biến đường	37	3	0
273	Công nhân gia công đồ thủ công mỹ nghệ trên giấy, vải các loại	38	1	0
274	Công nhân gia công đồ thủ công mỹ nghệ bằng kim loại	38	3	0
275	Công nhân gia công đồ thủ công mỹ nghệ bằng đá	38	3	0
276	Công nhân gia công đồ thủ công mỹ nghệ khác	38	3	0
277	Quản lí hành chính	38	1	0
278	Candle maker Thợ làm nến	38	4	600000000
457	Bất động sản	69	2	0
279	Ceramicist (using machine); Machine operator; Thrower; Conveyor operator, Thợ làm đồ gốm (sử dụng máy móc); Thao tác máy; vận hành băng tải	38	4	600000000
280	Ceramicist (worker) Thợ làm đồ gốm (công nhân)	38	4	600000000
281	Jewellery making and repair, Silversmith, Sửa và chế tác đồ trang sức, Thợ bạc	38	2	0
282	Công nhân gia công đồ thủ công mỹ nghệ bằng gỗ trúc bamboo worker	38	2	0
283	Công nhân gài mìn phá đá	39	4	600000000
284	Công nhân khai thác	39	4	600000000
285	Công nhân (gồm làm gốm sứ, than củi, gạch)	39	4	600000000
286	Kỹ thuật	39	2	0
287	Quản lí hành chính	39	1	0
288	Công nhân	40	3	0
289	Kỹ thuật	40	2	0
290	Quản lí hành chính	40	1	0
291	Gia công sản phẩm từ nhựa	41	3	0
292	Gia công sản phẩm từ cao su	41	3	0
293	Chế tạo thuốc medicine producer	42	2	0
294	Kỹ thuật bào chế thuốc từ sinh vật extracting	42	2	0
295	Pha chế các vị thuốc pharmacy producer	42	2	0
296	Bào chế thuốc bắc	42	2	0
297	Kỹ thuật	43	2	0
298	Quản lí hành chính	43	2	0
299	Công nhân xưởng giấy paper mill worker	43	3	0
300	Công nhân xưởng bột giấy paper powder worker	43	3	0
301	Công nhân làm thùng giấy carton box worker	43	3	0
302	Nhân viên kiểm tra chất lượng sản phẩm (nhân viên KCS) đối với các sản phẩm như: sắt, thép, hóa chất …	44	3	0
303	Nhân viên kiểm tra chất lượng sản phẩm (nhân viên KCS) đối với các sản phẩm như: hàng dệt may, giầy dép, linh kiện điện tử, nhựa, cao su, gốm sứ …	44	2	0
304	Nhân viên xử lí và chế tạo thuốc nổ	45	4	600000000
305	Làm bảng quảng cáo (trên cao)	46	4	600000000
306	Quay phim,chụp ảnh quảng cáo	46	3	0
307	Vẽ bảng quảng cáo (dưới đất）	46	3	0
308	Vẽ bảng quảng cáo (trên cao）	46	4	600000000
309	Nhân viên nghiệp vụ chạy bên ngoài	46	2	0
310	Văn phòng	46	1	0
311	Phóng viên ghi hình	47	3	0
312	Giao báo	47	3	0
313	Ký giả	47	2	0
314	Văn phòng	47	1	0
315	Công nhân xưởng in	47	3	0
316	Phóng viên vùng chiến tranh	47	4	600000000
317	Phân tích	48	1	0
318	Bác sĩ, y tá trại tạm giam, nhà tù Bác sĩ thú y, nhân viên thú, y tá trại giam, y tá bệnh viện tâm thần	48	3	0
319	Khử trùng	48	3	0
320	Y tá, bác sĩ, Bác sỹ tổng quát, y tá, bác sỹ giải phẫu, bác sỹ gây mê, nha sỹ, dược sỹ bệnh viện, thanh tra y tế, nhân viên cấp phát thuốc	48	1	0
321	Hành chính bệnh viện	48	1	0
322	Nhân viên kiểm tra bệnh	49	1	0
323	Kỹ thuật tia phóng xạ	49	2	0
324	Nhân viên chụp X quang	49	2	0
325	Thầy lang	49	2	0
326	Bác sĩ,y tá, hộ lí bệnh tâm thần	49	3	0
327	Bác sĩ, y tá	49	1	0
328	Nhân viên kiểm tra bệnh, nhân viên phân tích, nhân viên cấp phát thuốc	49	1	0
329	Hành chính bệnh viện	49	1	0
330	Đầu bếp bệnh viện	49	2	0
331	Nhân viên sửa chữa máy móc có tia phóng xạ	49	4	600000000
332	Tạp vụ	49	2	0
333	Constable, Sergeant - Clerical (Police force)   Công an	50	2	0
334	Fireman, Leading fireman (Fire service) Lính cứu hỏa	50	4	600000000
335	Lifeboatman, Salvage person (Enrolled crew) Người cứu hộ, cứu nạn	50	4	600000000
336	Người huấn luyện trong sở thú	51	4	600000000
337	Người nuôi thú	51	3	0
338	Người làm đồ chơi điện tử	51	2	0
339	Bác sĩ thú y sở thú	51	3	0
340	Quản lí	51	1	0
341	Công nhân quét dọn vườn thú	51	3	0
342	Bán vé	51	1	0
343	Công nhân máy thủy điện	51	3	0
344	Công nhân vệ sinh	51	2	0
345	Nhân viên ngành khác (diễn tấu, hội họa, sáng tác v.v..) employees in other fields such as acting, art, composer, etc	52	1	0
346	Biên kịch	52	1	0
347	Nhân viên dựng cảnh environment maker	52	3	0
348	Thư ký trường quay film making secretary	52	1	0
349	Nhân viên tráng phim	52	1	0
350	Nhân viên phụ trách âm thanh, ánh sáng	52	2	0
351	Phóng viên truyền hình	52	2	0
352	Nhân viên bán vé rạp chiếu phim	52	1	0
353	Nhân viên rạp chiếu phim	52	1	0
354	Diễn viên xiếc	52	4	600000000
355	Thợ hóa trang	52	1	0
356	Công nhân điện, máy	52	3	0
357	Phụ trách chụp ảnh	52	2	0
358	Diễn viên đóng thế	52	4	600000000
359	Diễn viên múa	52	3	0
360	Diễn viên võ thuật	52	3	0
361	Hành chính	52	1	0
362	Diễn viên đoàn văn nghệ lưu động (trừ xiếc)	52	3	0
363	Diễn viên	52	2	0
364	Người làm phim film maker	52	1	0
365	Acrobat (Aerial, Heights, Tightrope artiste, Trapeze artiste) Nhảy dù	53	4	600000000
366	Acrobat (Ground level, Tumbler) Nhảy dù	53	4	600000000
367	Classical ,Opera, Jazz, Pop, Orchestra singer, musician, Nhạc sĩ, nghệ sĩ, ca sỹ	53	2	0
368	Clown (Circus) Diễn viên hề trong rạp xiếc	53	4	600000000
369	Comedian Diễn viên hài kịch	53	3	0
370	Fashion model Người mẫu thời trang	53	2	0
371	Fire eater, Sword swallower Diễn viên xiếc, biểu diễn nuốt lửa, nuốt gươm	53	4	600000000
372	Hostess (Nightclub) Nữ tiếp viên ( phục vụ hộp đêm)	53	3	0
373	Quản lí	53	1	0
374	Phục vụ	54	2	0
375	Công nhân bảo trì	54	3	0
376	Quản lí	54	1	0
377	Phục vụ	55	1	0
378	Cứu hộ hồ bơi	55	3	0
379	Nhân viên cứu hộ bãi tắm biển	55	4	600000000
380	Bảo vệ	55	4	600000000
381	Cảnh sát cơ động	56	4	600000000
382	Quản lí nhà tù, trại tạm giam	56	3	0
383	Cảnh sát giao thông	56	3	0
384	Cảnh sát (người phụ trách tuần tra)	56	3	0
385	Hành chính và hậu cần	56	1	0
386	Nhân viên phòng cháy chữa cháy	56	4	600000000
387	Cảnh sát hình sự	56	4	600000000
388	Nhân viên trật tự công cộng	56	3	0
389	Vận động viên trượt băng	56	4	600000000
390	Vận động viên trượt tuyết	57	4	600000000
391	Huấn luyện viên	57	2	0
392	Huấn luyện khúc côn cầu, khúc côn cầu trên băng	57	3	0
393	Vận động viên khúc côn cầu, khúc côn cầu trên băng	58	4	600000000
394	Huấn luyện viên bóng bầu dục	58	2	0
395	Vận động viên bóng bầu dục	58	4	600000000
396	Huấn luyện viên bóng rổ,bóng chuyền,bóng chày	58	2	0
397	Vận động viên bóng rổ,bóng chuyền,bóng chày	58	3	0
398	Huấn luyện viên khúc côn cầu	58	2	0
399	Vận động viên khúc côn cầu	58	4	600000000
400	Huấn luyện viên bóng ném	58	2	0
401	Vận động viên bóng ném	58	3	0
402	Huấn luyện viên khúc côn cầu trên nước	58	2	0
403	Vận động viên khúc côn cầu trên nước	58	4	600000000
404	Huấn luyện viên và vận động viên bóng bàn,cầu lông,bơi lội,bắn tên,quần vợt,bóng chày, golf, bowling	58	2	0
405	Huấn luyện viên bóng đá	58	2	0
406	Cầu thủ bóng đá	58	4	600000000
407	Huấn luyện viên	58	2	0
408	Vận động viên	59	4	600000000
409	Huấn luyện viên	59	2	0
410	Vận động viên	60	4	600000000
411	Huấn luyện viên	60	2	0
412	Vận động viên	61	3	0
413	Giáo viên	61	2	0
414	Giáo viên quân sự, thể dục	62	2	0
415	Giáo viên dạy lái xe hơi	62	3	0
416	Người làm công ở trường	62	2	0
417	Học sinh	62	1	600000000
418	Giáo viên thông thường	62	1	0
419	Giáo viên mỹ thuật/ thủ công mỹ nghệ	62	2	0
420	Giáo viên dạy nấu ăn, ẩm thực	62	2	0
421	Trẻ em	62	1	600000000
422	Quản giáo (nhà giam, tại giam, trung tâm phục hồi nhân phẩm)	62	3	0
423	Học sinh trường xiếc, thể thao, nghệ thuật (không phải nghề nghiệp)	62	3	0
424	Công nhân khai thác đá	63	4	600000000
425	Kỹ sư xây dựng,kỹ thuật viên	63	2	0
426	Công nhân đào mỏ kim loại	63	4	600000000
427	Công nhân đào mỏ than	63	4	600000000
428	Quản lí hành chính	63	1	0
429	Công nhân thăm dò mỏ dầu	63	4	600000000
430	Nhân viên quản lí kỹ thuật sản xuất	64	3	0
431	Công nhân khai thác	65	4	600000000
432	Nghiệp vụ khác	65	4	600000000
433	Nhân viên quản lí kỹ thuật sản xuất	66	3	0
434	Công nhân khai thác	66	4	600000000
435	Nghiệp vụ khác	66	4	600000000
436	Mỏ than tư nhân và tập thể ở các thành thị	66	4	600000000
437	Sĩ quan	67	2	0
438	Quân nhân	67	3	0
439	Lính đặt biệt（lính nhảy dù,lính đánh thủy,lính hóa học,lính phụ trách gở phá mìn）	67	4	600000000
440	Army (Armed services, Military Personnel) Quân đội	67	4	600000000
441	Army (Aviation) Không quân	67	4	600000000
442	Army (Manufacturing weapons) Quân đội ( sản xuất vũ khí)	67	4	600000000
443	Army (Special Air Service) Quân đội ( dịch vụ hàng không đặc biệt)	67	4	600000000
444	Army (Special Boat Service) Quân đội ( dịch vụ thủy quân đặc biệt)	67	4	600000000
445	Navy (Military Personnel) non-officer rank at sea, Thủy quân( thuộc thủy quân) và không thuộc khối văn phòng	67	4	600000000
446	Hành chính và hậu cần	68	1	0
447	Nhân viên ghi đồng hồ	68	2	0
448	Kiểm tra	68	4	600000000
449	Công nhân lắp đặt gas	68	2	0
450	Thu phí	68	3	0
451	Nhân viên & tài xế theo xe chở bình hóa chất	68	4	600000000
452	Nhà sản xuất	69	2	0
453	Môi giới tiền tệ	69	1	0
454	Biên dịch viên	69	2	0
455	Nhà khoáng vật học	69	2	0
456	Môi giới chứng khoán	69	2	0
458	Luật sư, tư vấn viên	69	1	0
459	Nhà khoa học hạt nhân	69	4	600000000
460	Công nhân : làm công việc liên quan tới cần , đĩa sắt, đường ray, đường điện, cáp	69	4	600000000
461	Pháp sư, người tu hành, tăng lữ	69	1	0
462	Nhân viên làm việc tại các quán café, quán trà, câu lạc bộ trá hình	70	4	300000000
463	Nhân viên làm nghề mua vui tại quán karaoke, rạp phim, quán rượu, câu lạc bộ, hộp đêm, quán ăn, quán bia, quán trà, v.v	70	4	300000000
464	Nhân viên quản lý mát xa, sauna, xông hơi	70	4	300000000
465	Nhân viên làm việc trong khu vực trò chơi điện tử, có tính chất cờ bạc	70	4	300000000
466	Nhân viên múa cột, vũ nữ	70	4	300000000
467	Nhân viên mát xa, spa	70	4	300000000
468	Vũ nữ, nhân viên bán rượu, nhân viên làm việc trong hộp đêm	70	4	300000000
469	Nhân viên bảo vệ xe	70	4	300000000
470	Bảo vệ bar rượu, hộp đêm	70	4	300000000
471	Bảo vệ	70	4	300000000
472	Thất nghiệp	71	4	300000000
\.


--
-- Data for Name: core_provincial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_provincial (id, name, code, "group", longitude, latitude) FROM stdin;
1	Cao Bằng	4	1	106.263084000000006	22.6856179999999981
2	Yên Bái	15	4	104.872741999999988	21.6931609999999999
3	Cần Thơ	92	28	105.784091999999987	10.0324150000000003
4	Bình Thuận	60	22	108.141173999999992	11.1002520000000011
5	Tiền Giang	82	25	106.296843999999993	10.4202880000000011
6	Bình Dương	74	24	106.625061000000017	11.1622350000000008
7	Quảng Ngãi	51	17	108.811727000000005	15.123875
8	Lâm Đồng	68	21	108.141173999999992	11.6845140000000001
9	Nam Định	36	12	106.25	20.25
10	Vĩnh Phúc	26	8	105.548400999999998	21.3635710000000003
11	Quảng Ninh	22	11	107.193604000000008	21.2509820000000005
12	Hồ Chí Minh	79	24	106.681944000000001	10.769444
13	Đắk Nông	67	21	107.701720999999992	12.256812
14	Bắc Giang	24	6	106.201583000000014	21.274837999999999
15	Lai Châu	12	2	103.265991	22.3627760000000002
16	Cà Mau	96	30	105.032042999999987	9.06141399999999919
17	Ninh Thuận	58	20	108.990278000000004	11.5655559999999991
18	Thái Nguyên	19	7	105.879363999999995	21.5642250000000004
19	Khánh Hòa	56	20	109.047767999999991	12.0730579999999996
20	Hà Giang	2	1	104.980737999999988	22.8168000000000006
21	Phú Yên	54	19	109.091491999999988	13.0901789999999991
22	Điện Biên	11	3	103.013913000000002	21.3853960000000001
23	Long An	80	25	106.204834000000005	10.6916469999999997
24	An Giang	89	27	105.41988400000001	10.3811160000000005
25	Hà Tĩnh	42	14	105.907344999999992	18.3410019999999996
26	Hải Dương	30	10	106.316670000000002	20.933329999999998
27	Bến Tre	83	26	106.378888999999987	10.240278
28	Kon Tum	62	17	108.000412000000011	14.3515429999999995
29	Quảng Bình	44	15	106.254272	17.4685730000000028
30	Hưng Yên	33	10	106.016006000000004	20.8543200000000013
31	Đắk Lắk	66	19	108.325194999999994	12.7662680000000002
32	Ninh Bình	37	13	105.97480800000001	20.2509239999999977
33	Nghệ An	40	14	104.977112000000005	19.1763010000000023
34	Thái Bình	34	12	106.394347999999994	20.5389350000000022
35	Trà Vinh	84	29	106.298904000000007	9.81394600000000139
36	Hải Phòng	31	11	106.682500000000005	20.8663890000000016
37	Gia Lai	64	18	108.179625999999999	13.9047420000000006
38	Vĩnh Long	86	26	105.959014999999994	10.2448230000000002
39	Hậu Giang	93	28	105.640411000000014	9.76455099999999909
40	Thanh Hóa	38	13	105.309448000000003	20.1410489999999989
41	Thừa Thiên Huế	46	16	107.584819999999993	16.4637440000000019
42	Lạng Sơn	20	5	106.761188999999987	21.8538510000000024
43	Tuyên Quang	8	4	105.228424000000004	21.777355
44	Đồng Tháp	87	27	105.682983000000007	10.5755719999999993
45	Hoà Bình	17	8	105.339661000000007	20.8312190000000008
46	Bạc Liêu	95	30	105.49346899999999	9.3122139999999991
47	Phú Thọ	25	7	105.125427000000002	21.2625010000000003
48	Đồng Nai	75	22	107.146912000000015	11.05443
49	Bắc Ninh	27	9	106.073406000000006	21.1875479999999996
50	Bình Phước	70	23	106.719817999999989	11.7557809999999989
51	Quảng Trị	45	15	107.067261000000016	16.8308320000000009
52	Bà Rịa - Vũng Tàu	77	24	107.136555000000001	10.4101569999999999
53	Đà Nẵng	48	16	108.220556000000002	16.0319439999999993
54	Hà Nội	1	8	105.853333000000006	21.0283329999999999
55	Lào Cai	10	2	104.157859999999999	22.3799969999999995
56	Bắc Kạn	6	5	105.830497999999992	22.1613350000000011
57	Quảng Nam	49	16	108.036799999999999	15.5568980000000003
58	Sóc Trăng	94	29	105.900000000000006	9.59999999999999964
59	Hà Nam	35	13	105.923996000000002	20.5858670000000004
60	Bình Định	52	18	108.880005000000011	14.1951630000000009
61	Sơn La	14	3	103.907780000000002	21.3427570000000024
62	Kiên Giang	91	30	105.125427000000002	9.83627300000000027
63	Tây Ninh	72	23	106.119003000000006	11.3677949999999992
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
6	core	chitietcongviec
7	core	company
8	core	district
9	core	googlevision
10	core	linhvunghenghiep
11	core	nguoimuabaohiem
12	core	nguoimuabaohiemtam
13	core	noidungnghenghiep
14	core	provincial
15	users	user
16	users	bankaccount
17	users	countotp
18	users	notification
19	users	odertutorial
20	users	usernotification
21	users	token
22	users	resettoken
23	users	loginhistory
24	users	lenhruttien
25	users	forgotpassword
26	users	confirmemailtoken
27	personalhealth	nguoiduocbaohiemtam
28	personalhealth	nguoiduocbaohiem
29	personalhealth	goisanphamphu
30	personalhealth	goisanphamchinh
31	payment	dondathang
32	payment	magiamgia
33	payment	taituc
34	article	article
35	article	gioithieuloaihinhbh
36	claim	yeucaubaolanhvienphi
37	claim	yeucauchung
38	claim	yeucaunhatunhan
39	claim	yeucauoto
40	claim	yeucausuckhoe
41	claim	yeucautainancanhan
42	claim	yeucautuky
43	homeinsurance	nguoiduocbaohiem
44	homeinsurance	nguoithuhuong
45	homeinsurance	nguoiduocbaohiemtam
46	homeinsurance	goisanphamphu
47	homeinsurance	goisanphamchinh
48	investment	giatridautu
49	investment	laisuatthitruong
50	investment	nguoiduocbaohiem
51	investment	nguoiduocbaohiemtam
52	investment	nguoithuhuongtam
53	investment	nguoithuhuong
54	investment	goisanphamphu
55	investment	goisanphamchinh
56	kienthuc	kienthuccategory
57	kienthuc	kienthucmodel
58	robot	robot1dautu
59	robot	robotchung
60	termlife	nguoiduocbaohiem
61	termlife	nguoiduocbaohiemtam
62	termlife	nguoithuhuongtam
63	termlife	nguoithuhuong
64	termlife	goisanphamphu
65	termlife	goisanphamchinh
66	tndsoto	nguoiduocbaohiemtam
67	tndsoto	nguoiduocbaohiem
68	tndsoto	goisanphamphu
69	tndsoto	goisanphamchinh
70	tndsxemay	nguoiduocbaohiemtam
71	tndsxemay	nguoiduocbaohiem
72	tndsxemay	goisanphamphu
73	tndsxemay	goisanphamchinh
74	insurancecompany	insurancecompany
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-08-11 08:35:06.225964+00
2	contenttypes	0002_remove_content_type_name	2020-08-11 08:35:06.240472+00
3	auth	0001_initial	2020-08-11 08:35:06.274098+00
4	auth	0002_alter_permission_name_max_length	2020-08-11 08:35:06.302149+00
5	auth	0003_alter_user_email_max_length	2020-08-11 08:35:06.308144+00
6	auth	0004_alter_user_username_opts	2020-08-11 08:35:06.317119+00
7	auth	0005_alter_user_last_login_null	2020-08-11 08:35:06.325545+00
8	auth	0006_require_contenttypes_0002	2020-08-11 08:35:06.330693+00
9	auth	0007_alter_validators_add_error_messages	2020-08-11 08:35:06.344767+00
10	auth	0008_alter_user_username_max_length	2020-08-11 08:35:06.359961+00
11	auth	0009_alter_user_last_name_max_length	2020-08-11 08:35:06.375617+00
12	auth	0010_alter_group_name_max_length	2020-08-11 08:35:06.389294+00
13	auth	0011_update_proxy_permissions	2020-08-11 08:35:06.402521+00
14	users	0001_initial	2020-08-11 08:35:06.638289+00
15	admin	0001_initial	2020-08-11 08:35:06.720928+00
16	admin	0002_logentry_remove_auto_add	2020-08-11 08:35:06.749885+00
17	admin	0003_logentry_add_action_flag_choices	2020-08-11 08:35:06.772433+00
18	article	0001_initial	2020-08-11 08:35:06.794236+00
19	claim	0001_initial	2020-08-11 08:35:06.930266+00
20	core	0001_initial	2020-08-11 08:35:07.140667+00
21	homeinsurance	0001_initial	2020-08-11 08:35:07.210917+00
22	insurancecompany	0001_initial	2020-08-11 08:35:07.23856+00
23	investment	0001_initial	2020-08-11 08:35:07.356399+00
24	kienthuc	0001_initial	2020-08-11 08:35:07.415308+00
25	payment	0001_initial	2020-08-11 08:35:07.500251+00
26	payment	0002_dondathang_user	2020-08-11 08:35:07.549616+00
27	personalhealth	0001_initial	2020-08-11 08:35:07.663454+00
28	robot	0001_initial	2020-08-11 08:35:07.710756+00
29	sessions	0001_initial	2020-08-11 08:35:07.731362+00
30	termlife	0001_initial	2020-08-11 08:35:07.910943+00
31	tndsoto	0001_initial	2020-08-11 08:35:08.053894+00
32	tndsxemay	0001_initial	2020-08-11 08:35:08.19436+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
6p53jhgxq0e35xdauua426l8tfyxz3ns	M2FhOWQxYWFhMjEwNDYyMWM2MDUzMTNmZTk0OTliNjIwZTJjMWM3ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2ZmRhY2RiZjRhMjNiMmZmNjQ4MmRkNTMzNmQ3MGRlM2JjOWM0MmUyIn0=	2020-08-25 08:49:15.677539+00
\.


--
-- Data for Name: homeinsurance_goisanphamchinh; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.homeinsurance_goisanphamchinh (id, ten_loai_hinh_bao_hiem, id_loai_hinh_bao_hiem, ten_goi_san_pham_chinh, id_goi_san_pham_chinh, so_phi_chinh, company_id) FROM stdin;
1	Bảo hiểm nhà tư nhân	19	Giá trị căn nhà	1	0.000803999999999999919	3
2	Bảo hiểm nhà tư nhân	19	Giá trị tài sản bên trong	2	0.00148740000000000005	3
\.


--
-- Data for Name: homeinsurance_goisanphamphu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.homeinsurance_goisanphamphu (id, ten_loai_hinh_bao_hiem, id_loai_hinh_bao_hiem, ten_goi_san_pham_chinh, id_goi_san_pham_chinh, ten_goi_san_pham_phu, id_goi_san_pham_phu, so_phi_phu, company_id) FROM stdin;
1	Bảo hiểm nhà tư nhân	19	Giá trị căn nhà	1	Giông, bão, lũ lụt	1	7.20000000000000018e-05	3
2	Bảo hiểm nhà tư nhân	19	Giá trị căn nhà	1	Động đất, núi lửa phun	2	1.20000000000000003e-05	3
3	Bảo hiểm nhà tư nhân	19	Giá trị căn nhà	1	Vỡ, tràn bể nước	3	5.99999999999999947e-05	3
4	Bảo hiểm nhà tư nhân	19	Giá trị căn nhà	1	Đâm va	4	5.99999999999999947e-05	3
5	Bảo hiểm nhà tư nhân	19	Giá trị căn nhà	1	Trộm, cướp	5	7.20000000000000018e-05	3
6	Bảo hiểm nhà tư nhân	19	Giá trị căn nhà	1	Chi phí dọn dẹp hiện trường	6	3.60000000000000009e-05	3
7	Bảo hiểm nhà tư nhân	19	Giá trị căn nhà	1	Chi phí cứu hoả và dập lửa	7	3.60000000000000009e-05	3
8	Bảo hiểm nhà tư nhân	19	Giá trị căn nhà	1	Chi phí thuê nhà sau tổn thất	8	4.80000000000000012e-05	3
\.


--
-- Data for Name: homeinsurance_nguoiduocbaohiem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.homeinsurance_nguoiduocbaohiem (id, ma_don_hang_bihama, loai_nha, muc_dich_nha, tuoi_tho_ngoi_nha, dia_chi_tinh_thanh_pho, dia_chi_quan_huyen, dia_chi_chi_tiet, gia_tri_can_nha, gia_tri_tai_san_ben_trong, so_tien_bh, ngay_hieu_luc, ngay_ket_thuc, relationship, is_fire, created_at, nguoimuabaohiem_id) FROM stdin;
\.


--
-- Data for Name: homeinsurance_nguoiduocbaohiemtam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.homeinsurance_nguoiduocbaohiemtam (id, loai_nha, muc_dich_nha, tuoi_tho_ngoi_nha, dia_chi_tinh_thanh_pho, dia_chi_quan_huyen, dia_chi_chi_tiet, gia_tri_can_nha, gia_tri_tai_san_ben_trong, so_tien_bh, ngay_hieu_luc, ngay_ket_thuc, relationship, is_fire, created_at, nguoimuabaohiemtam_id) FROM stdin;
\.


--
-- Data for Name: homeinsurance_nguoithuhuong; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.homeinsurance_nguoithuhuong (id, fullname, birth_day, birth_month, birth_year, gioi_tinh, so_cmnd, nguoiduocbaohiem_id) FROM stdin;
\.


--
-- Data for Name: insurancecompany_insurancecompany; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insurancecompany_insurancecompany (id, id_cpn, name_cpn, slug, sub_title, title, link_cpn, content, tac_gia, seo_key_word, images, created_time) FROM stdin;
1	0	Tổng công ty Bảo Việt Nhân thọ (Bảo Việt Nhân thọ)	tong-cong-ty-bao-viet-nhan-tho-bao-viet-nhan-tho	Là doanh nghiệp phát hành hợp đồng Cơm Trưa Văn Phòng đầu tiên trên thị trường Việt Nam - từ năm 1996\nBảo Việt Nhân thọ hiện giờ là một trong số ít các doanh nghiệp Cơm Trưa Văn Phòng Việt Nam có lịch sự hoạt động lâu năm và ngày càng khẳng định vị thế dẫn đầu thị trường.	\N	www.baovietnhantho.com.vn			\N	/static/insurancecompany/images/bao-viet-nhan-tho.jpg	2020-08-11 08:44:54.547997+00
2	0	Công ty TNHH Cơm Trưa Văn Phòng Prudential Việt Nam (Prudential)	cong-ty-tnhh-bao-hiem-nhan-tho-prudential-viet-nam-prudential	Prudential Việt Nam (Prudential) tự hào là thành viên của Tập đoàn Prudential plc, tập đoàn tài chính hàng đầu thế giới có trụ sở chính tại Vương quốc Anh với bề dày kinh nghiệm lâu đời, sự phát triển vững mạnh, cam kết đầu tư lâu dài, an toàn và hiệu quả.	\N	www.prudential.com.vn			\N	/static/insurancecompany/images/pruentiend.jpg	2020-08-11 08:44:54.561433+00
3	0	Công ty TNHH Manulife (Việt Nam) (Manulife)	cong-ty-tnhh-manulife-viet-nam-manulife	Là thành viên của Manulife Financial, Manulife Việt Nam tự hào là doanh nghiệp Cơm Trưa Văn Phòng nước ngoài đầu tiên có mặt tại Việt Nam từ năm 1999 và sở hữu tòa nhà trụ sở riêng có với giá trị đầu tư hơn 10 triệu USD. Với bề dày kinh nghiệm và uy tín toàn cầu, Manulife hiện là Công ty Cơm Trưa Văn Phòng lớn nhất\nViệt Nam, tính theo vốn điều lệ (Cập nhật đến tháng 05/2018).\nManulife Việt Nam hiện đang cung cấp một danh mục các sản phẩm đa dạng từ sản phẩm bảo hiểm truyền thống đến sản phẩm bảo hiểm sức khoẻ, giáo dục, liên kết đầu tư, hưu trí… cho hơn 800.000 khách hàng thông qua đội ngũ đại lý hùng hậu và chuyên nghiệp tại 61 văn phòng trên 45 tỉnh thành cả nước.	\N	www.manulife.com.vn			\N	/static/insurancecompany/images/Manulife.jpg	2020-08-11 08:44:54.572817+00
4	0	Công ty TNHH Cơm Trưa Văn Phòng AIA (Việt Nam) (AIA)	cong-ty-tnhh-bao-hiem-nhan-tho-aia-viet-nam-aia	GAIA Việt Nam là thành viên của Tập đoàn AIA - tập đoàn Cơm Trưa Văn Phòng độc lập, có nguồn gốc châu Á lớn nhất thế giới được niêm yết.\nĐược thành lập vào năm 2000 với mục tiêu bảo vệ sự phồn thịnh và an toàn tài chính cho người dân Việt Nam, AIA Việt Nam hiện đang là một trong những công ty Cơm Trưa Văn Phòng hàng đầu và là thương hiệu được khách hàng và công chúng tin cậy.	\N	www.aia.com.vn			\N	/static/insurancecompany/images/bao-hiem-aia-viet-nam.jpg	2020-08-11 08:44:54.586213+00
5	0	Công ty TNHH Cơm Trưa Văn Phòng Chubb Việt Nam (Chubb Life	cong-ty-tnhh-bao-hiem-nhan-tho-chubb-viet-nam-chubb-life	Tại Việt Nam, Chubb hoạt động trong cả lĩnh vực Cơm Trưa Văn Phòng và phi nhân thọ. Công ty TNHH Bảo hiểm Chubb Việt Nam cung cấp các sản phẩm bảo hiểm chuyên ngành và linh hoạt bao gồm Bảo hiểm Tài sản, Thương vong, Hàng hải, Tài chính, Năng lượng & Dịch vụ công ích, cũng như Bảo hiểm Sức khỏe & Tai nạn.\nHoạt động của Chubb tại Việt Nam được thừa hưởng kinh nghiệm toàn cầu và sự am hiểu địa phương, cung cấp cho khách hàng những giải pháp bảo hiểm phù hợp nhằm giảm thiểu rủi ro.\nNgoài ra, công ty chú trọng xây dựng mối quan hệ bền chặt với khách hàng thông qua việc cung cấp dịch vụ đáp ứng, phát triển các sản phẩm tân tiến và vai trò dẫn dắt thị trường dựa trên nền tảng tài chính vững mạnh.	\N	https://www.chubb.com/			\N	/static/insurancecompany/images/chupp.jpg	2020-08-11 08:44:54.600278+00
6	0	Công ty TNHH Cơm Trưa Văn Phòng Mirae Asset Prévoir	cong-ty-tnhh-bao-hiem-nhan-tho-mirae-asset-prevoir	CÔNG TY Cơm Trưa Văn Phòng MIRAE ASSET PRÉVOIR Là thành viên của Công ty Cơm Trưa Văn Phòng Mirae Asset (Hàn Quốc) và Tập đoàn Prévoir (Pháp), Mirae Asset Prévoir là công ty Cơm Trưa Văn Phòng hàng đầu, cung cấp tập hợp các giải pháp tài chính toàn diện và bền vững cho khách hàng và đối tác.\nMirae Asset Prévoir tập trung nâng cao sự hiểu biết sâu sắc về nhu cầu của khách hàng, xây dựng nền tảng vững mạnh về tài chính và tăng cường xây dựng các kênh phân phối đa dạng giúp khách hàng đưa ra quyết định dễ dàng hơn và sống tốt hơn với phương châm “Cho ngày mai tốt hơn, từ hôm nay”.	\N	https://www.map-life.com.vn/			\N	/static/insurancecompany/images/mirae .jpg	2020-08-11 08:44:54.613735+00
7	0	Công ty TNHH Cơm Trưa Văn Phòng Dai-ichi Việt Nam (Dai-ichi)	cong-ty-tnhh-bao-hiem-nhan-tho-dai-ichi-viet-nam-dai-ichi	Được thành lập vào tháng 1/2007 với 100% vốn Nhật Bản, Công ty BHNT Dai-ichi Việt Nam (Dai-ichi Life Việt Nam) là thành viên của Tập đoàn Dai-ichi Life - doanh nghiệp Cơm Trưa Văn Phòng lớn nhất tại Nhật Bản và là một trong những tập đoàn bảo hiểm hàng đầu thế giới với tiềm lực tài chính vững mạnh và kinh nghiệm hoạt động hơn 118 năm.\nDai-ichi Life Việt Nam hiện đứng vị trí thứ 3 về mạng lưới kinh doanh với hơn 290 văn phòng “phủ sóng” khắp 63 tỉnh thành trên toàn quốc, cùng đội ngũ 1.470 Nhân viên và 85.300 Tư vấn tài chính chuyên nghiệp (tính đến 31/12/2019).	\N	www.dai-ichi-life.com.vn			\N	/static/insurancecompany/images/daichi.png	2020-08-11 08:44:54.628443+00
8	0	Công ty TNHH Cơm Trưa Văn Phòng Cathay Việt Nam (Cathay life)	cong-ty-tnhh-bao-hiem-nhan-tho-cathay-viet-nam-cathay-life	CÔNG TY TNHH BHNT CATHAY - THƯƠNG HIỆU SỐ 1 TRONG NGÀNH Cơm Trưa Văn Phòng TẠI ĐÀI LOAN\nCông ty TNHH BHNT Cathay thành lập tháng 08 năm 1962, trực thuộc tập đoàn tài chính hàng đầu Cathay.\nTrong hơn 4 thập niên qua, với sự hỗ trợ đắc lực của hơn 26.000 nhân viên chuyên nghiệp, các cổ đông cùng mạng lưới khách hàng rộng lớn, chính sách chăm sóc khách hàng chu đáo, công ty BHNT Cathay đã luôn duy trì được mức doanh thu, tài sản và chính sách phát triển ổn định. Ngày nay, tại Đài Loan, công ty BHNT Cathay chính là thương hiệu số một trong ngành bảo hiểm nhân thọ.	\N	https://www.cathaylife.com.vn/			\N	/static/insurancecompany/images/cathay.png	2020-08-11 08:44:54.642778+00
18	0	Tổng công ty cổ phần Bảo hiểm Sài Gòn - Hà Nội (BSH)	tong-cong-ty-co-phan-bao-hiem-sai-gon-ha-noi-bsh	Giấy phép thành lập và hoạt động số 56 GP/KDBH ngày 10/12/2008 của Bộ Tài chính \nGiấy phép điều chỉnh số 56/GPĐC15/KDBH ngày 05/05/2015 của Bộ Tài chính\nTên Tiếng Việt: Tổng Công ty Cổ phần Bảo hiểm Sài Gòn – Hà Nội\nTên Tiếng Anh: Sai Gon - Hanoi Insurance Corporation \nTên giao dịch: Bảo hiểm BSH Tên viết tắt: BSH	\N	https://bshc.com.vn/			\N	/static/insurancecompany/images/bao-hiem-bsh-ebaohiem.jpg	2020-08-11 08:44:54.785865+00
9	0	Công ty TNHH Cơm Trưa Văn Phòng FWD Việt Nam (FWD	cong-ty-tnhh-bao-hiem-nhan-tho-fwd-viet-nam-fwd	Cuộc sống sẽ tưởng thưởng những ai dám sống hết mình. Hãy vô tư sống trọn hôm nay vì tương lai đã có FWD đảm bảo. Chúng tôi mang đến sản phẩm bảo hiểm đơn giản, dễ hiểu và sự tư vấn tận tình. Với FWD, bạn sẽ có cảm nhận hoàn toàn khác về bảo hiểm nhân thọ.\nFWD cung cấp sản phẩm bảo hiểm đa dạng từ giáo dục, y tế, tài chính, hưu trí và nhiều lĩnh vực khác. Tất cả nhằm mang đến cho bạn những trải nghiệm tiện lợi và dễ dàng. Các chuyên gia FWD sẽ tư vấn và cùng bạn thiết kế những sản phẩm bảo hiểm phù hợp nhất. Chúng tôi sẽ đi cùng bạn trên hành trình chinh phục mọi hoài bão của mình.\nFWD Sẽ Thay Đổi Cảm Nhận Của Mọi Người Về Bảo Hiểm	\N	www.fwd.com.vn			\N	/static/insurancecompany/images/fwd.jpg	2020-08-11 08:44:54.657703+00
10	0	Công ty TNHH Cơm Trưa Văn Phòng Hanwha Life Việt Nam	cong-ty-tnhh-bao-hiem-nhan-tho-hanwha-life-viet-nam	Tập đoàn Hanwha - một trong 10 tập đoàn lớn nhất của Hàn Quốc và nằm trong Top 500 tập đoàn kinh tế lớn nhất thế giới. Hanwha hiện có danh mục kinh doanh đa dạng trong các lĩnh vực: Sản xuất & Xây dựng, Tài chính, Dịch vụ & Nghỉ dưỡng, Hàng không v\nNăng lượng mặt trời với mạng lưới gồm 76 pháp nhân và 351 mạng lưới thành viên trên toàn cầu.\nTại Việt Nam, Hanwha đã đầu tư hơn 1 tỉ đô la Mỹ vào các dự án quan trọng như: Nhà máy năng lượng điện mặt trời tại tỉnh Long An (100 triệu USD), nhà máy sản xuất các thiết bị an ninh tại Khu công nghiệp Quế Võ, Bắc Ninh (100 triệu USD), nhà máy sản xuất linh kiện động cơ máy bay đầu tiên và duy nhất tại Khu công nghệ cao Hòa Lạc, Hà Nội (200 triệu USD) và đầu tư gần 400 triệu đô la Mỹ vào Tập đoàn Vingroup thông qua việc mua 84 triệu cổ phiếu của tập đoàn này.	\N	www.hanwhalife.com.vn			\N	/static/insurancecompany/images/hanwha.jpg	2020-08-11 08:44:54.672438+00
11	0	Công ty TNHH Cơm Trưa Văn Phòng Fubon (Việt Nam) (Fubon life)	cong-ty-tnhh-bao-hiem-nhan-tho-fubon-viet-nam-fubon-life	GIỚI THIỆU VỀ CÔNG TY Cơm Trưa Văn Phòng FUBON VIỆT NAM ĐÀO TẠO BỒI DƯỠNG NHÂN TÀI, CUNG CẤP DỊCH VỤ BẢO HIỂM TOÀN DIỆN THEO KINH NGHIỆM ĐÃ THÀNH CÔNG TẠI ĐÀI LOAN.\nHướng tới trở thành một trong những “Tổ chức Tài chính hàng đầu châu Á”, Tập đoàn Tài chính Fubon không ngừng nắm bắt cơ hội phát triển nhanh của nền kinh tế Việt Nam.\nKết hợp kinh nghiệm kinh doanh thành công tại thị trường Việt Nam của Công ty Bảo hiểm Phi nhân thọ Fubon và Ngân hàng Fubon Đài Bắc, Công ty con của Tập đoàn Tài chính Fubon – Công ty Cơm Trưa Văn Phòng Fubon đã mở rộng địa bàn kinh doanh đến Việt Nam.\nNgày 1 tháng 7 năm 2010, Công ty Cơm Trưa Văn Phòng Fubon đã được Bộ Tài chính Việt Nam chấp thuận về nguyên tắc thành lập Công ty Bảo hiểm Nhân thọ, ngày 15 tháng 12 năm 2010, nhận được Giấy phép Thành lập và Hoạt động, chính thức thành lập Công ty TNHH Cơm Trưa Văn Phòng Fubon Việt Nam (gọi tắt là Cơm Trưa Văn Phòng Fubon Việt Nam), Trụ sở chính của Công ty đặt tại Hà Nội, đồng thời thành lập Chi nhánh tại thành phố Hồ Chí Minh.	\N	https://www.fubonlife.com.vn/			\N	/static/insurancecompany/images/fubon_life.jpg	2020-08-11 08:44:54.686561+00
12	0	Công ty TNHH Cơm Trưa Văn Phòng Generali (Việt Nam) (Generali)	cong-ty-tnhh-bao-hiem-nhan-tho-generali-viet-nam-generali	Sau 8 năm hoạt động, Generali Việt Nam đã nhanh chóng trở thành một trong những công ty Cơm Trưa Văn Phòng hàng đầu Việt Nam với mạng lưới hơn 60 GenCasa (văn phòng tổng đại lý) và trung tâm dịch vụ khách hàng trên toàn quốc, phục vụ gần 200.000 khách hàng.	\N	www.generali-life.com.vn			\N	/static/insurancecompany/images/unnamed.jpg	2020-08-11 08:44:54.700454+00
13	0	Công ty TNHH Cơm Trưa Văn Phòng Aviva Việt Nam	cong-ty-tnhh-bao-hiem-nhan-tho-aviva-viet-nam	Với lịch sử lừng lẫy trong ngành, chúng tôi tin tưởng vào khả năng và chuyên môn của mình để mang lại sự bình an trước mọi biến động cho khách hàng thông qua các sản phẩm và dịch vụ của Aviva.	\N	www.aviva.com.vn			\N	/static/insurancecompany/images/aviva.jpg	2020-08-11 08:44:54.714327+00
14	0	Công ty TNHH Cơm Trưa Văn Phòng Sun Life Việt Nam	cong-ty-tnhh-bao-hiem-nhan-tho-sun-life-viet-nam	Sun Life Việt Nam là công ty Cơm Trưa Văn Phòng 100% vốn từ Tập đoàn Sun Life Financial (Canada). Công ty hướng đến mục đích giúp Khách hàng đạt được an toàn tài chính trọn đời và tận hưởng cuộc sống khoẻ mạnh hơn. Sun Life Việt Nam là công ty tiên phong và dẫn đầu thị trường trong lĩnh vực bảo hiểm hưu trí, phục vụ cho cả Khách hàng cá nhân và doanh nghiệp tại Việt Nam.	\N	https://sunlife.com.vn			\N	/static/insurancecompany/images/sun_life.jpg	2020-08-11 08:44:54.728521+00
15	0	Công ty cổ phần Cơm Trưa Văn Phòng Phú Hưng (Phú Hưng life)	cong-ty-co-phan-bao-hiem-nhan-tho-phu-hung-phu-hung-life	Năm 2013, Công ty cổ phần Cơm Trưa Văn Phòng Phú Hưng (Phú Hưng Life) chính thức bước vào thị trường Cơm Trưa Văn Phòng Việt Nam và là công ty cổ phần đầu tiên hoạt động trong lĩnh vực bảo hiểm nhân thọ.\nCác cổ đông của Phú Hưng Life gồm có: Công ty Phú Mỹ Hưng và Công ty CX Technology dưới sự điều hành của Ting Family – một gia đình được biết đến qua những thành công nổi bật trong kinh doanh và những đóng góp đáng kể cho xã hội Việt Nam suốt 30 năm qua.	\N	www.phuhunglife.com			\N	/static/insurancecompany/images/phuhung.jpg	2020-08-11 08:44:54.742899+00
16	0	Công ty TNHH Cơm Trưa Văn Phòng BIDV Metlife (BIDV Metlife)	cong-ty-tnhh-bao-hiem-nhan-tho-bidv-metlife-bidv-metlife	Trong suốt hơn một thế kỷ qua, MetLife luôn xây dựng hình ảnh của một tập đoàn gắn liền với sự công bằng, liêm chính và đáng tin cậy trên toàn cầu.\nDanh tiếng và uy tín của tập đoàn ngày càng được được củng cố nhờ cam kết mang lại các dịch vụ cao cấp nhất, chất lượng toàn cầu cho khách hàng, với tâm thức luôn mang lại những điều tốt đẹp nhất đến cho tất cả khách hàng của mình.	\N	www.bidvmetlife.com.vn			\N	/static/insurancecompany/images/metlife.jpg	2020-08-11 08:44:54.75805+00
17	0	Công ty TNHH Cơm Trưa Văn Phòng MB Ageas (MB Ageas Life)	cong-ty-tnhh-bao-hiem-nhan-tho-mb-ageas-mb-ageas-life	Để biến những ước mơ thành hiện thực, với mong muốn được là người đồng hành đáng tin cậy trong suốt hành trình sống Bạn đang và sẽ trải qua, từ tháng Tám năm 2015, Ageas và Muang Thai Life Assurance đã ký thỏa thuận với Ngân hàng.\nThương mại Cổ phần Quân đội ("Ngân hàng Quân đội"), thành lập một liên doanh tại Việt Nam với thương hiệu MB Ageas Life, công ty hàng đầu chuyên về Bảo hiểm liên kết với ngân hàng tại Việt Nam.	\N	https://mbageas.life/			\N	/static/insurancecompany/images/ageas.jpg	2020-08-11 08:44:54.772452+00
19	0	Công ty cổ phần bảo hiểm OPES	cong-ty-co-phan-bao-hiem-opes	Sự thay đổi trong nhận thức và hành vi của người dùng trong kỷ nguyên số, đặc biệt là của thế hệ trẻ, đã tạo nên những nhu cầu mới trong hành trình trải nghiệm của mỗi khách hàng, đòi hỏi các sản phẩm và dịch vụ cần trở nên thú vị, tiện lợi, nhanh chóng và minh bạch hơn.\nHiểu được điều đó, OPES được khai sinh và mang trong mình tinh thần dám thách thức để thành công, dám nghĩ lớn vượt qua những lối mòn, lắng nghe hơi thở của thời đại để nâng tầm giá trị nhân văn của bảo hiểm và đem đến cho khách hàng những trải nghiệm đột phá.	\N	https://opes.com.vn/			\N	/static/insurancecompany/images/opes.jpg	2020-08-11 08:44:54.798597+00
\.


--
-- Data for Name: investment_giatridautu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.investment_giatridautu (id, phantram, nam) FROM stdin;
\.


--
-- Data for Name: investment_goisanphamchinh; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.investment_goisanphamchinh (id, ten_loai_hinh_bao_hiem, id_loai_hinh_bao_hiem, gioi_tinh, tuoi, phi_quan_ly_hop_dong, phi_ban_dau_co_ban, phi_ban_dau_dong_them, phi_cham_dut_co_ban, phi_cham_dut_dong_them, ten_goi_san_pham_chinh, id_goi_san_pham_chinh, so_phi_chinh_hang_nam, ty_le_phi_rui_ro_hang_nam, company_id) FROM stdin;
1	Sản phẩm đầu tư	2	1	0	360000	0.699999999999999956	0	1	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0139999999999999986	0.00188000000000000016	2
2	Sản phẩm đầu tư	2	1	1	360000	0.5	0	1	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0139999999999999986	0.000840000000000000035	2
3	Sản phẩm đầu tư	2	1	2	360000	0.299999999999999989	0	1	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0139999999999999986	0.000800000000000000038	2
4	Sản phẩm đầu tư	2	1	3	360000	0.100000000000000006	0	0.900000000000000022	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0139999999999999986	0.000779999999999999986	2
5	Sản phẩm đầu tư	2	1	4	360000	0.0500000000000000028	0	0.900000000000000022	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0139999999999999986	0.000770000000000000068	2
6	Sản phẩm đầu tư	2	1	5	360000	0.0200000000000000004	0	0.5	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0139999999999999986	0.000750000000000000016	2
7	Sản phẩm đầu tư	2	1	6	360000	0.0200000000000000004	0	0.400000000000000022	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0139999999999999986	0.000729999999999999963	2
8	Sản phẩm đầu tư	2	1	7	360000	0.0200000000000000004	0	0.299999999999999989	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0139999999999999986	0.000709999999999999911	2
9	Sản phẩm đầu tư	2	1	8	360000	0.0200000000000000004	0	0.200000000000000011	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0139999999999999986	0.000699999999999999993	2
10	Sản phẩm đầu tư	2	1	9	360000	0.0200000000000000004	0	0.100000000000000006	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0139999999999999986	0.000690000000000000075	2
11	Sản phẩm đầu tư	2	1	10	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0139999999999999986	0.00067999999999999994	2
12	Sản phẩm đầu tư	2	1	11	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0146000000000000001	0.000699999999999999993	2
13	Sản phẩm đầu tư	2	1	12	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0151000000000000006	0.000729999999999999963	2
14	Sản phẩm đầu tư	2	1	13	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0151000000000000006	0.000770000000000000068	2
15	Sản phẩm đầu tư	2	1	14	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0151000000000000006	0.000819999999999999982	2
16	Sản phẩm đầu tư	2	1	15	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0154000000000000005	0.000869999999999999897	2
17	Sản phẩm đầu tư	2	1	16	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0154000000000000005	0.000919999999999999919	2
18	Sản phẩm đầu tư	2	1	17	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0154000000000000005	0.000959999999999999916	2
19	Sản phẩm đầu tư	2	1	18	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0158000000000000015	0.00100000000000000002	2
20	Sản phẩm đầu tư	2	1	19	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0158000000000000015	0.0010300000000000001	2
21	Sản phẩm đầu tư	2	1	20	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0158000000000000015	0.00105999999999999996	2
22	Sản phẩm đầu tư	2	1	21	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0158000000000000015	0.00108000000000000001	2
23	Sản phẩm đầu tư	2	1	22	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0162999999999999985	0.00110000000000000007	2
24	Sản phẩm đầu tư	2	1	23	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0162999999999999985	0.0011199999999999999	2
25	Sản phẩm đầu tư	2	1	24	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0162999999999999985	0.00114999999999999998	2
26	Sản phẩm đầu tư	2	1	25	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0162999999999999985	0.00117000000000000003	2
27	Sản phẩm đầu tư	2	1	26	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0162999999999999985	0.00119999999999999989	2
28	Sản phẩm đầu tư	2	1	27	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0166000000000000002	0.00124	2
29	Sản phẩm đầu tư	2	1	28	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0166000000000000002	0.0012800000000000001	2
30	Sản phẩm đầu tư	2	1	29	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0166000000000000002	0.00131999999999999999	2
31	Sản phẩm đầu tư	2	1	30	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0170000000000000012	0.00136999999999999991	2
32	Sản phẩm đầu tư	2	1	31	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0170000000000000012	0.00141999999999999982	2
33	Sản phẩm đầu tư	2	1	32	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0175000000000000017	0.00146999999999999995	2
34	Sản phẩm đầu tư	2	1	33	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0177999999999999999	0.00154000000000000014	2
35	Sản phẩm đầu tư	2	1	34	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0180000000000000021	0.0016100000000000001	2
36	Sản phẩm đầu tư	2	1	35	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0184999999999999991	0.00169999999999999991	2
37	Sản phẩm đầu tư	2	1	36	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0189999999999999995	0.00182	2
38	Sản phẩm đầu tư	2	1	37	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0198000000000000016	0.00195999999999999994	2
39	Sản phẩm đầu tư	2	1	38	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0205000000000000009	0.00212999999999999995	2
40	Sản phẩm đầu tư	2	1	39	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0210000000000000013	0.00232000000000000001	2
41	Sản phẩm đầu tư	2	1	40	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0211000000000000007	0.00253000000000000013	2
42	Sản phẩm đầu tư	2	1	41	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0224999999999999992	0.00274999999999999984	2
43	Sản phẩm đầu tư	2	1	42	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0229999999999999996	0.00298000000000000001	2
44	Sản phẩm đầu tư	2	1	43	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0240000000000000005	0.00320000000000000015	2
45	Sản phẩm đầu tư	2	1	44	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0250000000000000014	0.00343999999999999992	2
46	Sản phẩm đầu tư	2	1	45	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0260000000000000023	0.00367999999999999968	2
47	Sản phẩm đầu tư	2	1	46	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0264999999999999993	0.00391999999999999987	2
48	Sản phẩm đầu tư	2	1	47	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0267000000000000015	0.00419000000000000015	2
49	Sản phẩm đầu tư	2	1	48	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0277999999999999983	0.00447999999999999961	2
50	Sản phẩm đầu tư	2	1	49	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.028999999999999998	0.00478999999999999999	2
51	Sản phẩm đầu tư	2	1	50	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0304999999999999993	0.00513000000000000001	2
52	Sản phẩm đầu tư	2	1	51	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.031699999999999999	0.00549999999999999968	2
53	Sản phẩm đầu tư	2	1	52	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0332000000000000003	0.00591999999999999992	2
54	Sản phẩm đầu tư	2	1	53	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0347999999999999976	0.00637999999999999939	2
55	Sản phẩm đầu tư	2	1	54	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0364999999999999977	0.00685000000000000019	2
56	Sản phẩm đầu tư	2	1	55	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0384999999999999995	0.00732999999999999971	2
57	Sản phẩm đầu tư	2	1	56	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0396999999999999992	0.00779999999999999964	2
58	Sản phẩm đầu tư	2	1	57	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0413000000000000034	0.00825000000000000039	2
59	Sản phẩm đầu tư	2	1	58	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.043499999999999997	0.0086999999999999994	2
60	Sản phẩm đầu tư	2	1	59	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0449999999999999983	0.00919999999999999984	2
61	Sản phẩm đầu tư	2	1	60	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0570000000000000021	0.00979999999999999968	2
62	Sản phẩm đầu tư	2	1	61	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0575000000000000025	0.0105400000000000008	2
63	Sản phẩm đầu tư	2	1	62	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0606000000000000011	0.0114900000000000002	2
64	Sản phẩm đầu tư	2	1	63	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0646999999999999936	0.0126299999999999989	2
65	Sản phẩm đầu tư	2	1	64	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0786000000000000032	0.0139199999999999983	2
66	Sản phẩm đầu tư	2	1	65	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0834000000000000019	0.0152899999999999998	2
67	Sản phẩm đầu tư	2	1	66	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.0882000000000000006	0.0167099999999999992	2
68	Sản phẩm đầu tư	2	1	67	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.1027	0.0181300000000000003	2
69	Sản phẩm đầu tư	2	1	68	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.117499999999999993	0.0195899999999999998	2
70	Sản phẩm đầu tư	2	1	69	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.133000000000000007	0.0212300000000000023	2
71	Sản phẩm đầu tư	2	1	70	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0.14499999999999999	0.02316	2
72	Sản phẩm đầu tư	2	1	71	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.0255300000000000006	2
73	Sản phẩm đầu tư	2	1	72	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.0284699999999999988	2
74	Sản phẩm đầu tư	2	1	73	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.0319899999999999976	2
75	Sản phẩm đầu tư	2	1	74	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.0360499999999999987	2
76	Sản phẩm đầu tư	2	1	75	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.0405599999999999988	2
77	Sản phẩm đầu tư	2	1	76	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.0454499999999999973	2
78	Sản phẩm đầu tư	2	1	77	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.0506800000000000028	2
79	Sản phẩm đầu tư	2	1	78	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.056320000000000002	2
80	Sản phẩm đầu tư	2	1	79	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.0625700000000000006	2
81	Sản phẩm đầu tư	2	1	80	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.0696700000000000097	2
82	Sản phẩm đầu tư	2	1	81	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.0778299999999999964	2
83	Sản phẩm đầu tư	2	1	82	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.0872499999999999942	2
84	Sản phẩm đầu tư	2	1	83	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.0979000000000000009	2
85	Sản phẩm đầu tư	2	1	84	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.109620000000000009	2
86	Sản phẩm đầu tư	2	1	85	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.12229000000000001	2
87	Sản phẩm đầu tư	2	1	86	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.135819999999999996	2
88	Sản phẩm đầu tư	2	1	87	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.150180000000000008	2
89	Sản phẩm đầu tư	2	1	88	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.165379999999999999	2
90	Sản phẩm đầu tư	2	1	89	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.181540000000000007	2
91	Sản phẩm đầu tư	2	1	90	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.198849999999999999	2
92	Sản phẩm đầu tư	2	1	91	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.217680000000000012	2
93	Sản phẩm đầu tư	2	1	92	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.238690000000000013	2
94	Sản phẩm đầu tư	2	1	93	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.263409999999999977	2
95	Sản phẩm đầu tư	2	1	94	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.295229999999999992	2
96	Sản phẩm đầu tư	2	1	95	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.34101999999999999	2
97	Sản phẩm đầu tư	2	1	96	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.413880000000000026	2
98	Sản phẩm đầu tư	2	1	97	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.53723999999999994	2
99	Sản phẩm đầu tư	2	1	98	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.743960000000000066	2
100	Sản phẩm đầu tư	2	1	99	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.0	1	0	0.00100000000000000002	2
101	Sản phẩm đầu tư	2	2	0	360000	0.699999999999999956	0	1	0.0200000000000000004	Phúc bảo an trường thịnh 2.1	1	0.0149999999999999994	0.00262999999999999996	2
102	Sản phẩm đầu tư	2	2	1	360000	0.5	0	1	0.0200000000000000004	Phúc bảo an trường thịnh 2.2	1	0.0149999999999999994	0.0010300000000000001	2
103	Sản phẩm đầu tư	2	2	2	360000	0.299999999999999989	0	1	0.0200000000000000004	Phúc bảo an trường thịnh 2.3	1	0.0149999999999999994	0.000989999999999999995	2
104	Sản phẩm đầu tư	2	2	3	360000	0.100000000000000006	0	0.900000000000000022	0.0200000000000000004	Phúc bảo an trường thịnh 2.4	1	0.0149999999999999994	0.000969999999999999942	2
105	Sản phẩm đầu tư	2	2	4	360000	0.0500000000000000028	0	0.900000000000000022	0.0200000000000000004	Phúc bảo an trường thịnh 2.5	1	0.0149999999999999994	0.000930000000000000054	2
106	Sản phẩm đầu tư	2	2	5	360000	0.0200000000000000004	0	0.5	0.0200000000000000004	Phúc bảo an trường thịnh 2.6	1	0.0149999999999999994	0.000880000000000000031	2
107	Sản phẩm đầu tư	2	2	6	360000	0.0200000000000000004	0	0.400000000000000022	0.0200000000000000004	Phúc bảo an trường thịnh 2.7	1	0.0149999999999999994	0.000830000000000000117	2
108	Sản phẩm đầu tư	2	2	7	360000	0.0200000000000000004	0	0.299999999999999989	0.0200000000000000004	Phúc bảo an trường thịnh 2.8	1	0.0149999999999999994	0.000779999999999999986	2
109	Sản phẩm đầu tư	2	2	8	360000	0.0200000000000000004	0	0.200000000000000011	0.0200000000000000004	Phúc bảo an trường thịnh 2.9	1	0.0149999999999999994	0.000750000000000000016	2
110	Sản phẩm đầu tư	2	2	9	360000	0.0200000000000000004	0	0.100000000000000006	0.0200000000000000004	Phúc bảo an trường thịnh 2.10	1	0.0149999999999999994	0.000739999999999999989	2
111	Sản phẩm đầu tư	2	2	10	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.11	1	0.0149999999999999994	0.000750000000000000016	2
112	Sản phẩm đầu tư	2	2	11	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.12	1	0.0154999999999999999	0.000809999999999999956	2
113	Sản phẩm đầu tư	2	2	12	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.13	1	0.0158000000000000015	0.000919999999999999919	2
114	Sản phẩm đầu tư	2	2	13	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.14	1	0.0166000000000000002	0.00106999999999999999	2
115	Sản phẩm đầu tư	2	2	14	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.15	1	0.0170000000000000012	0.00124	2
116	Sản phẩm đầu tư	2	2	15	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.16	1	0.0177999999999999999	0.00141999999999999982	2
117	Sản phẩm đầu tư	2	2	16	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.17	1	0.0184999999999999991	0.00159000000000000005	2
118	Sản phẩm đầu tư	2	2	17	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.18	1	0.0187000000000000013	0.00171999999999999996	2
119	Sản phẩm đầu tư	2	2	18	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.19	1	0.0187000000000000013	0.00182	2
120	Sản phẩm đầu tư	2	2	19	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.20	1	0.0187000000000000013	0.00188000000000000016	2
121	Sản phẩm đầu tư	2	2	20	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.21	1	0.0187000000000000013	0.0019	2
122	Sản phẩm đầu tư	2	2	21	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.22	1	0.0187000000000000013	0.0019	2
123	Sản phẩm đầu tư	2	2	22	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.23	1	0.0187000000000000013	0.00188000000000000016	2
124	Sản phẩm đầu tư	2	2	23	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.24	1	0.0188000000000000007	0.00183999999999999984	2
125	Sản phẩm đầu tư	2	2	24	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.25	1	0.0188000000000000007	0.00179999999999999995	2
126	Sản phẩm đầu tư	2	2	25	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.26	1	0.0188000000000000007	0.00175000000000000004	2
127	Sản phẩm đầu tư	2	2	26	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.27	1	0.0188000000000000007	0.00171999999999999996	2
128	Sản phẩm đầu tư	2	2	27	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.28	1	0.0188000000000000007	0.00171000000000000015	2
129	Sản phẩm đầu tư	2	2	28	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.29	1	0.0188000000000000007	0.00169999999999999991	2
130	Sản phẩm đầu tư	2	2	29	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.30	1	0.0188000000000000007	0.00171999999999999996	2
131	Sản phẩm đầu tư	2	2	30	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.31	1	0.0189000000000000001	0.00175000000000000004	2
132	Sản phẩm đầu tư	2	2	31	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.32	1	0.0195	0.00179999999999999995	2
133	Sản phẩm đầu tư	2	2	32	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.33	1	0.0195	0.00186999999999999992	2
134	Sản phẩm đầu tư	2	2	33	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.34	1	0.0195	0.00194999999999999991	2
135	Sản phẩm đầu tư	2	2	34	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.35	1	0.020799999999999999	0.00205000000000000017	2
136	Sản phẩm đầu tư	2	2	35	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.36	1	0.0210000000000000013	0.00217000000000000005	2
137	Sản phẩm đầu tư	2	2	36	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.37	1	0.0214999999999999983	0.00232000000000000001	2
138	Sản phẩm đầu tư	2	2	37	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.38	1	0.0220000000000000022	0.00249000000000000003	2
139	Sản phẩm đầu tư	2	2	38	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.39	1	0.0229999999999999996	0.00268000000000000009	2
140	Sản phẩm đầu tư	2	2	39	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.40	1	0.0235000000000000001	0.0028999999999999998	2
141	Sản phẩm đầu tư	2	2	40	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.41	1	0.0238000000000000017	0.00315000000000000002	2
142	Sản phẩm đầu tư	2	2	41	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.42	1	0.0264999999999999993	0.0034200000000000003	2
143	Sản phẩm đầu tư	2	2	42	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.43	1	0.0275000000000000001	0.00371000000000000019	2
144	Sản phẩm đầu tư	2	2	43	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.44	1	0.028999999999999998	0.00402999999999999973	2
145	Sản phẩm đầu tư	2	2	44	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.45	1	0.0299999999999999989	0.00437000000000000062	2
146	Sản phẩm đầu tư	2	2	45	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.46	1	0.0309999999999999998	0.00472999999999999983	2
147	Sản phẩm đầu tư	2	2	46	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.47	1	0.0330000000000000016	0.00512000000000000042	2
148	Sản phẩm đầu tư	2	2	47	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.48	1	0.0340000000000000024	0.00552999999999999933	2
149	Sản phẩm đầu tư	2	2	48	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.49	1	0.0360000000000000042	0.00597000000000000048	2
150	Sản phẩm đầu tư	2	2	49	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.50	1	0.0379999999999999991	0.0064599999999999996	2
151	Sản phẩm đầu tư	2	2	50	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.51	1	0.0400000000000000008	0.00699999999999999928	2
152	Sản phẩm đầu tư	2	2	51	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.52	1	0.0409999999999999948	0.00762999999999999963	2
153	Sản phẩm đầu tư	2	2	52	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.53	1	0.0429999999999999966	0.00832999999999999886	2
154	Sản phẩm đầu tư	2	2	53	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.54	1	0.0459999999999999992	0.00912999999999999923	2
155	Sản phẩm đầu tư	2	2	54	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.55	1	0.0490000000000000019	0.0100099999999999998	2
156	Sản phẩm đầu tư	2	2	55	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.56	1	0.0522999999999999993	0.0109599999999999993	2
157	Sản phẩm đầu tư	2	2	56	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.57	1	0.0558999999999999983	0.0119699999999999997	2
158	Sản phẩm đầu tư	2	2	57	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.58	1	0.059799999999999999	0.0130400000000000012	2
159	Sản phẩm đầu tư	2	2	58	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.59	1	0.0637999999999999956	0.0141800000000000016	2
160	Sản phẩm đầu tư	2	2	59	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.60	1	0.0681999999999999967	0.0154199999999999997	2
161	Sản phẩm đầu tư	2	2	60	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.61	1	0.0764999999999999986	0.016799999999999999	2
162	Sản phẩm đầu tư	2	2	61	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.62	1	0.0793999999999999984	0.0183599999999999978	2
163	Sản phẩm đầu tư	2	2	62	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.63	1	0.0859000000000000041	0.020119999999999999	2
164	Sản phẩm đầu tư	2	2	63	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.64	1	0.0931000000000000022	0.022090000000000002	2
165	Sản phẩm đầu tư	2	2	64	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.65	1	0.100999999999999993	0.0242699999999999999	2
166	Sản phẩm đầu tư	2	2	65	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.66	1	0.109399999999999997	0.0266199999999999978	2
167	Sản phẩm đầu tư	2	2	66	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.67	1	0.118300000000000002	0.0291299999999999996	2
168	Sản phẩm đầu tư	2	2	67	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.68	1	0.127400000000000013	0.0317899999999999988	2
169	Sản phẩm đầu tư	2	2	68	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.69	1	0.140000000000000013	0.0346500000000000002	2
170	Sản phẩm đầu tư	2	2	69	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.70	1	0.154999999999999999	0.0378100000000000033	2
171	Sản phẩm đầu tư	2	2	70	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.71	1	0.170000000000000012	0.0413699999999999971	2
172	Sản phẩm đầu tư	2	2	71	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.72	1	0	0.0454299999999999982	2
173	Sản phẩm đầu tư	2	2	72	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.73	1	0	0.0500799999999999995	2
174	Sản phẩm đầu tư	2	2	73	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.74	1	0	0.0553400000000000003	2
175	Sản phẩm đầu tư	2	2	74	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.75	1	0	0.0611000000000000015	2
176	Sản phẩm đầu tư	2	2	75	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.76	1	0	0.0672500000000000042	2
177	Sản phẩm đầu tư	2	2	76	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.77	1	0	0.0737000000000000016	2
178	Sản phẩm đầu tư	2	2	77	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.78	1	0	0.0803700000000000109	2
179	Sản phẩm đầu tư	2	2	78	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.79	1	0	0.0873200000000000087	2
180	Sản phẩm đầu tư	2	2	79	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.80	1	0	0.094759999999999997	2
181	Sản phẩm đầu tư	2	2	80	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.81	1	0	0.102940000000000004	2
182	Sản phẩm đầu tư	2	2	81	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.82	1	0	0.112090000000000009	2
183	Sản phẩm đầu tư	2	2	82	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.83	1	0	0.122409999999999991	2
184	Sản phẩm đầu tư	2	2	83	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.84	1	0	0.133840000000000015	2
185	Sản phẩm đầu tư	2	2	84	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.85	1	0	0.14612	2
186	Sản phẩm đầu tư	2	2	85	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.86	1	0	0.158979999999999982	2
187	Sản phẩm đầu tư	2	2	86	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.87	1	0	0.172210000000000002	2
188	Sản phẩm đầu tư	2	2	87	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.88	1	0	0.185730000000000006	2
189	Sản phẩm đầu tư	2	2	88	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.89	1	0	0.199529999999999985	2
190	Sản phẩm đầu tư	2	2	89	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.90	1	0	0.213690000000000019	2
191	Sản phẩm đầu tư	2	2	90	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.91	1	0	0.228430000000000022	2
192	Sản phẩm đầu tư	2	2	91	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.92	1	0	0.244109999999999994	2
193	Sản phẩm đầu tư	2	2	92	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.93	1	0	0.261429999999999996	2
194	Sản phẩm đầu tư	2	2	93	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.94	1	0	0.282129999999999992	2
195	Sản phẩm đầu tư	2	2	94	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.95	1	0	0.309969999999999968	2
196	Sản phẩm đầu tư	2	2	95	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.96	1	0	0.351860000000000006	2
197	Sản phẩm đầu tư	2	2	96	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.97	1	0	0.420989999999999975	2
198	Sản phẩm đầu tư	2	2	97	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.98	1	0	0.541000000000000036	2
199	Sản phẩm đầu tư	2	2	98	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.99	1	0	0.745149999999999979	2
200	Sản phẩm đầu tư	2	2	99	360000	0.0200000000000000004	0	0	0.0200000000000000004	Phúc bảo an trường thịnh 2.100	1	0	0.00100000000000000002	2
\.


--
-- Data for Name: investment_goisanphamphu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.investment_goisanphamphu (id, ten_loai_hinh_bao_hiem, id_loai_hinh_bao_hiem, ten_goi_san_pham_chinh, id_goi_san_pham_chinh, ten_goi_san_pham_phu, id_goi_san_pham_phu, loai_nghe_nghiep, so_tien_bao_hiem, so_phi_phu_nam, company_id) FROM stdin;
1	Sản phẩm đầu tư	2	Phúc bảo an trường thịnh 2.0	1	Tử vong và thương tật do tai nạn	1	1	100000000	290000	2
2	Sản phẩm đầu tư	2	Phúc bảo an trường thịnh 2.1	1	Tử vong và thương tật do tai nạn	1	1	200000000	580000	2
3	Sản phẩm đầu tư	2	Phúc bảo an trường thịnh 2.2	1	Tử vong và thương tật do tai nạn	1	1	500000000	1450000	2
4	Sản phẩm đầu tư	2	Phúc bảo an trường thịnh 2.3	1	Tử vong và thương tật do tai nạn	1	1	1000000000	2900000	2
5	Sản phẩm đầu tư	2	Phúc bảo an trường thịnh 2.4	1	Tử vong và thương tật do tai nạn	1	2	100000000	435000	2
6	Sản phẩm đầu tư	2	Phúc bảo an trường thịnh 2.5	1	Tử vong và thương tật do tai nạn	1	2	200000000	870000	2
7	Sản phẩm đầu tư	2	Phúc bảo an trường thịnh 2.6	1	Tử vong và thương tật do tai nạn	1	2	500000000	2175000	2
8	Sản phẩm đầu tư	2	Phúc bảo an trường thịnh 2.7	1	Tử vong và thương tật do tai nạn	1	2	1000000000	4350000	2
9	Sản phẩm đầu tư	2	Phúc bảo an trường thịnh 2.8	1	Tử vong và thương tật do tai nạn	1	3	100000000	653000	2
10	Sản phẩm đầu tư	2	Phúc bảo an trường thịnh 2.9	1	Tử vong và thương tật do tai nạn	1	3	200000000	1306000	2
11	Sản phẩm đầu tư	2	Phúc bảo an trường thịnh 2.10	1	Tử vong và thương tật do tai nạn	1	3	500000000	3265000	2
12	Sản phẩm đầu tư	2	Phúc bảo an trường thịnh 2.11	1	Tử vong và thương tật do tai nạn	1	3	1000000000	6530000	2
\.


--
-- Data for Name: investment_laisuatthitruong; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.investment_laisuatthitruong (id, phantram, nam) FROM stdin;
1	0.114000000000000004	2010
2	0.132000000000000006	2011
3	0.125	2012
4	0.0819999999999999896	2013
5	0.0680000000000000049	2014
6	0.0565000000000000016	2015
7	0.0630000000000000004	2016
8	0.0720000000000000084	2017
9	0.067000000000000004	2018
10	0.0690000000000000058	2019
\.


--
-- Data for Name: investment_nguoiduocbaohiem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.investment_nguoiduocbaohiem (id, ma_don_hang_bihama, username, fullname, birth_day, birth_month, birth_year, gioi_tinh, email, dia_chi_tinh_thanh_pho, dia_chi_quan_huyen, dia_chi_chi_tiet, so_cmnd, images_cmt_mattruoc, images_cmt_matsau, cmt_ngay_cap, cmt_noi_cap, ngay_hieu_luc, ngay_ket_thuc, cau_hoi_suc_khoe_1, cau_hoi_suc_khoe_2, cau_hoi_suc_khoe_3, cau_hoi_suc_khoe_4, cau_hoi_suc_khoe_5, cau_hoi_suc_khoe_6, cau_hoi_suc_khoe_7, cau_hoi_suc_khoe_8, status_marriage, so_tien_bao_hiem, so_nam_hop_dong, so_nam_dong_phi, cach_tra_phi, dinh_ky_dong_phi, job, weight, height, nationality, nationality_paper, is_smoke, relationship, created_at, nguoimuabaohiem_id) FROM stdin;
\.


--
-- Data for Name: investment_nguoiduocbaohiemtam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.investment_nguoiduocbaohiemtam (id, username, fullname, birth_day, birth_month, birth_year, gioi_tinh, email, dia_chi_tinh_thanh_pho, dia_chi_quan_huyen, dia_chi_chi_tiet, so_cmnd, images_cmt_mattruoc, images_cmt_matsau, cmt_ngay_cap, cmt_noi_cap, ngay_hieu_luc, ngay_ket_thuc, cau_hoi_suc_khoe_1, cau_hoi_suc_khoe_2, cau_hoi_suc_khoe_3, cau_hoi_suc_khoe_4, cau_hoi_suc_khoe_5, cau_hoi_suc_khoe_6, cau_hoi_suc_khoe_7, cau_hoi_suc_khoe_8, status_marriage, so_tien_bao_hiem, so_nam_hop_dong, so_nam_dong_phi, cach_tra_phi, dinh_ky_dong_phi, job, weight, height, nationality, nationality_paper, is_smoke, relationship, created_at, nguoimuabaohiemtam_id) FROM stdin;
\.


--
-- Data for Name: investment_nguoithuhuong; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.investment_nguoithuhuong (id, fullname, birth_day, birth_month, birth_year, gioi_tinh, so_cmnd, images_cmt_mattruoc, images_cmt_matsau, cmt_ngay_cap, cmt_noi_cap, relationship, ty_le_thu_huong, nguoiduocbaohiem_id) FROM stdin;
\.


--
-- Data for Name: investment_nguoithuhuongtam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.investment_nguoithuhuongtam (id, fullname, birth_day, birth_month, birth_year, gioi_tinh, so_cmnd, images_cmt_mattruoc, images_cmt_matsau, cmt_ngay_cap, cmt_noi_cap, relationship, ty_le_thu_huong, nguoiduocbaohiemtam_id) FROM stdin;
\.


--
-- Data for Name: kienthuc_kienthuccategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kienthuc_kienthuccategory (id, name_category, slug) FROM stdin;
1	Bảo Hiểm Nhân Thọ	loai4
2	Bảo Hiểm Phi Nhân Thọ	loai5
3	Sử dụng Sàn Bihama	loai2
4	Cộng Tác Viên Bihama	loai3
5	Kiến thức bảo hiểm	loai1
\.


--
-- Data for Name: kienthuc_kienthucmodel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kienthuc_kienthucmodel (id, title, sub_title, slug, content, link_video, created_time, images, status, category_id) FROM stdin;
1	Bihama - Cơm Trưa Văn Phòng là gì ?		bihama-bao-hiem-nhan-tho-la-gi	Cơm Trưa Văn Phòng là gì?  Cơm Trưa Văn Phòng chính là giải pháp tài chính giúp bạn có thể tiết kiệm và bảo vệ hiệu quả cho gia đình,  ví dụ gia đình của anh Sơn sẽ nhận được một số tiền lớn khi chẳng may anh Sơn là trụ cột chính trong gia đình qua đời,  số tiền này sẽ bù đắp mất mát và giúp gia đình anh có cuộc sống ổn định trong thời gian dài.  Cơm Trưa Văn Phòng giúp chi trả viện phí cho các sự kiện tai nạn ốm đau bệnh tật. Ngoài ra khi kết thúc hợp đồng bảo hiểm bạn sẽ nhận lại toàn bộ tiền phí tiết kiệm đã đóng cộng với lãi suất.  Cơm Trưa Văn Phòng chính là xu hướng của thời đại mới !\nfanpage facebook:  https://www.facebook.com/BaohiemBihama\nlinkedin : https://www.linkedin.com/in/baohiembi...\nwebsite: http://bihama.com/\n#baohiem #baohiemnhantho #baohiembihama #bihama	https://www.youtube.com/embed/4-sLIdD04vY	2020-08-11 08:45:46.456765+00	/static/kienthuc/images/hqdefault.png	0	1
2	Bihama - Lợi ích của bảo hiểm sức khoẻ		bihama-loi-ich-cua-bao-hiem-suc-khoe	Bảo hiểm sức khỏe được triển khai nhằm hỗ trợ cho bảo hiểm y tế với mục đích thanh toán các chi phí khám và chữa bệnh.\nKhi tham gia loại hình bảo hiểm này, các thành viên trong gia đình của bạn sẽ được tự do lựa chọn cơ sở y tế cho việc khám chữa bệnh. Người được bảo hiểm không cần phải thanh toán trực tiếp mà sẽ được doanh nghiệp bảo hiểm thanh toán trên cơ sở xác nhận thẻ bảo hiểm chăm sóc sức khỏe do doanh nghiệp bảo hiểm phát hành. Trường hợp bảo hiểm khám chữa bệnh tại các cơ sở chăm sóc sức khỏe theo yêu cầu của mình, doanh nghiệp bảo hiểm sẽ hoàn trả các chi phí theo hóa đơn khám chữa bệnh tại cơ sở y tế do người được bảo hiểm lựa chọn.\n#bihama #baohiemsuckhoe #FinPlus #ifrm	https://www.youtube.com/embed/Jc-eXQUQEuI	2020-08-11 08:45:46.473201+00	/static/kienthuc/images/hqdefault2.png	0	2
3	Bihama - Bảo hiểm giáo dục là gì ?		bihama-bao-hiem-giao-duc-la-gi	Bảo hiểm giáo dục là sản phẩm Cơm Trưa Văn Phòng hướng đến đối tượng trẻ em với mục đích là vừa bảo vệ vừa lên kế hoạch tài chính cho tương lai học vấn của con.\nĐối tượng được bảo hiểm của sản phẩm bảo hiểm an sinh giáo dục là trẻ em thông thường là từ 0 đến 17 tuổi. Tùy từng sản phẩm của mỗi công ty, một số sản phẩm cho phép gia đình tham gia cho trẻ ngay từ khi còn trong bụng mẹ.\nThời hạn hợp đồng có thể là 8 năm, 10 năm hoặc đến 23 năm, 27 năm tùy mỗi sản phẩm mà khách hàng lựa chọn. Chủ yếu là phụ thuộc vào thời điểm cha mẹ tham gia cho con, nhu cầu bảo vệ và tích lũy cho con đến khi con bao nhiêu tuổi, đồng thời, cũng phụ thuộc vào điều kiện tài chính của gia đình. Như vậy cha mẹ có thể chọn thời gian đáo hạn hợp đồng khi con 17 tuổi, 18 tuổi hoặc khi con ra trường để lập nghiệp.\nLàm cha mẹ không ai là không muốn con mình được chăm sóc tốt nhất, bảo vệ tốt nhất và có một tương lai tươi sáng. Tuy nhiên, cuộc sống có nhiều rủi ro và không phải ai cũng có đủ điều kiện và thời gian để lo cho con suốt cả quá trình. Vì thế, bảo hiểm an sinh giáo dục là lựa chọn tốt nhất hiện nay giúp cha mẹ dự phòng tài chính và chuẩn bị kế hoạch học vấn cho tương lai của con.\n#bihama #baohiemgiaoduc #FinPlus #ifrm	https://www.youtube.com/embed/k6_AIFAiyjo	2020-08-11 08:45:46.48653+00	/static/kienthuc/images/hqdefault3.png	0	1
4	Bihama - Bảo hiểm hưu trí tự nguyện là gì ?		bihama-bao-hiem-huu-tri-tu-nguyen-la-gi	Bảo hiểm hưu trí tự nguyện là sản phẩm Cơm Trưa Văn Phòng do doanh nghiệp bảo hiểm thực hiện nhằm cung cấp thu nhập bổ sung cho người được bảo hiểm khi hết tuổi lao động.\nTrên cơ sở bên mua bảo hiểm đóng phí bảo hiểm, người được bảo hiểm bắt đầu nhận quyền lợi bảo hiểm hưu trí khi đạt đến tuổi theo thỏa thuận tại hợp đồng bảo hiểm, nhưng không dưới 55 (năm mươi lăm) tuổi đối với nữ và 60 (sáu mươi) tuổi đối với nam.\nQuyền lợi hưu trí được chi trả định kỳ đến khi người được bảo hiểm tử vong hoặc tối thiểu 15 (mười lăm) năm, tùy theo thỏa thuận tại hợp đồng bảo hiểm. Mức hưởng quyền lợi hưu trí được thỏa thuận và ghi rõ trên hợp đồng bảo hiểm. Ngoài ra phần quyền lợi hưu trí chưa chi trả sẽ được tính lãi với lãi suất không thấp hơn lãi suất đầu tư cam kết tối thiểu thỏa thuận trên hợp đồng bảo hiểm.\nTheo đó, với khoản trợ cấp định kỳ, người tham gia sẽ chắc chắn có khoản tiền dưỡng già khi không có khả năng làm ra tiền mà không cần dựa dẫm hay lệ thuộc vào con cháu. Tuổi già đồng nghĩa với việc sức khỏe ngày càng kém dần, khả năng ốm đau bệnh tật cao hơn nên khoản lương hưu sẽ giúp người già tự chủ và có điều kiện chăm sóc sức khỏe tốt nhất.\nThậm chí nhiều người còn dành dụm số tiền để thực hiện những mong muốn mà lúc trẻ họ chưa thể thực hiện được. Đó là cùng người đồng hành đến những nơi mình thích, tham gia các câu lạc bộ, mở quán cà phê nhỏ\nNgoài ra, với những người không may rơi vào hoàn cảnh thiếu sự quan tâm, chăm sóc của con cái và sống một mình thì số tiền từ quyền lợi hưu trí định kỳ giúp họ có thể chọn được viện dưỡng lão tốt nhất để được bầu bạn và an vui tuổi già.\n#bihama.com#baohiemhuutri#FinPlus#ifrm	https://www.youtube.com/embed/yk-V6fpV47k	2020-08-11 08:45:46.506869+00	/static/kienthuc/images/hqdefault4.png	0	1
5	Bihama - Lựa chọn sản phẩm đầu tư tốt nhất		bihama-lua-chon-san-pham-dau-tu-tot-nhat	Sản phẩm đầu tư Cơm Trưa Văn Phòng \nBảo hiểm đầu tư là một sản phẩm tài chính được cung cấp để có cơ hội tạo ra các tài sản lớn trong tương lai. Đây là sản phẩm Cơm Trưa Văn Phòng với quyền lợi chính là đầu tư. Ưu điểm lớn nhất là thông qua các sản phẩm nhân thọ, không chỉ tạo ra tài sản trong tương lai mà còn song song bảo vệ Người tham gia đến hết hợp đồng bảo hiểm. \n"bihama #baohiemdautu #FinPlus #IFRM	https://www.youtube.com/embed/K7GvVSEpaF0	2020-08-11 08:45:46.524189+00	/static/kienthuc/images/hqdefault5.png	0	1
6	Bihama - Sự khác biệt bảo hiểm vật chất xe ô tô		bihama-su-khac-biet-bao-hiem-vat-chat-xe-o-to	Kinh tế - Xã hội ngày càng phát triển kéo theo giá trị cuộc sống của con người cũng ngày càng được nâng cao trong đó có sự tăng thêm về việc mua sắm ô tô phục vụ nhu cầu đi lại hàng ngày  \nBạn có thể là người lái xe cẩn thận, chấp hành Luật Giao thông , tuy nhiên, chiếc xe ô tô của bạn vẫn có thể bị tổn thất do va chạm cố ý hay vô tình của các phương tiện khác hoặc do sự ảnh hưởng của thời tiết  Những phiền toái đó bạn không đáng phải chịu bởi vì bạn mua xe để đảm bảo sự tiện lợi, thoải mái chứ không phải mong muốn phiền toái đến với mình. Với số phí bảo hiểm chiếm từ 1-2% giá trị của tài sản, chiếc ô tô của bạn sẽ được bảo vệ khỏi những rắc rối đó.\n# bihama #baohiemvatchatxe #FinPlus #ifrm\n#bihama.com\n#https://www.facebook.com/BaohiemBiham...	https://www.youtube.com/embed/mwiYMdi8hHE	2020-08-11 08:45:46.544728+00	/static/kienthuc/images/hqdefault6.png	0	2
7	Bihama - Cách để Tin tứcvà Đăng nhập tài khoản trên bihama.vn		bihama-cach-de-dang-ky-va-dang-nhap-tai-khoan-tren-bihamavn	Video hướng dẫn bạn Tin tứcvà đăng nhập cho những người mới bắt đầu tham gia để trở thành cộng tác viên của bihama.vn hoặc muốn mua sản phẩm bảo hiểm trên sàn thương mại điện tử bihama.vn bạn cần Tin tứcđể có thể hưởng được nhiều chương trình khuyến mại cùng bihama. Hãy Tin tứcđể nhận được nhiều lợi ích từ chúng tôi nhé !\nfanpage facebook:  https://www.facebook.com/BaohiemBihama\nlinkedin : https://www.linkedin.com/in/baohiembi...\nwebsite: https://bihama.vn/\n#baohiem #dangkybihama #baohiembihama #bihama #dangnhapbihama\n#quenmatkhaubihama	https://www.youtube.com/embed/4jVBsQBHRTA	2020-08-11 08:45:46.563162+00	/static/kienthuc/images/hqdefault7.png	0	3
8	Bihama - Cách để trở thành Cộng tác viên của bihama.vn		bihama-cach-de-tro-thanh-cong-tac-vien-cua-bihamavn	Khi trở thành Cộng tác viên của bihama.vn bạn sẽ có cơ hội nhận thu nhập thụ động khi có thời gian rảnh. Các bước Tin tứcđể trở thành Cộng tác viên rất dễ dàng và nhanh chóng với công nghệ hỗ trợ tối đa từ sàn thương mại điện tử bihama.vn. Ngoài ra khi trở thành cộng tác viên của bihama.vn bạn sẽ được hỗ trợ trả thưởng và rất nhiều chương trình khuyến mại trên portal.bihama.vn hãy bắt đầu ngay cùng chúng tôi để gia tăng tài sản nhanh chóng nhé !\nfanpage facebook:  https://www.facebook.com/BaohiemBihama\nlinkedin : https://www.linkedin.com/in/baohiembi...\nwebsite: https://bihama.vn/\ndangky&dangnhap: https://www.youtube.com/watch?v=4jVBs...\n#baohiem #congtacvienbihama #baohiembihama #bihama	https://www.youtube.com/embed/Qfzw5ne38SY	2020-08-11 08:45:46.580813+00	/static/kienthuc/images/hqdefault8.png	0	4
9	Bihama - Chính sách trả thưởng của bihama.vn		bihama-chinh-sach-tra-thuong-cua-bihamavn	Với hệ thống portal.bihama.vn được chúng tôi xây dựng dựa trên nền tảng công nghệ tốt nhất và sáng tạo với nhiều chức năng thú vị dành cho Cộng tác viên. Ngoài ra bihama.vn xây dựng với nhiều loại thưởng tốt và minh bạch để khuyến khích và hỗ trợ các cộng tác viên tham gia. Chúng tôi hy vọng sẽ  nhận được nhiều ý kiến đóng góp xây dựng từ các cộng tác viên để bihama.vn trở thành nơi mà các cộng tác viên hưởng được nhiều thu nhập thụ động và cảm thấy vui vẻ và hạnh phúc khi tham gia cùng chúng tôi.\nfanpage facebook:  https://www.facebook.com/BaohiemBihama\nlinkedin : https://www.linkedin.com/in/baohiembi...\nwebsite: https://bihama.vn/\ndangky&dangnhap: https://www.youtube.com/watch?v=4jVBs...\n#baohiem #trathuongbihama #baohiembihama #bihama	https://www.youtube.com/embed/PPgDKq_rc-Q	2020-08-11 08:45:46.597118+00	/static/kienthuc/images/hqdefault9.png	0	4
10	Bihama - Introducting bihama.vn		bihama-introducting-bihamavn	Smart e-commerce platform bihama.vn was founded on the idea of applying Vietnamese-branded Insurtech technology so that Insurance becomes familiar and close to everyone.\nWe will create an e-commerce platform that sells the most online products in Vietnam, including life and non-life insurance products.\nIn particular, for the first time in Vietnam we sell life insurance products online. \nThe insurance products such as term life, investment plan, education plan, pension plan etc \nInsurance products are presented by us with a lot of breakthroughs in presentation so that people can easily access insurance.\nWe welcome insurance companies to join bihama to bring their best products to the e-commerce platform. We are very happy that investors will trust us and we will continually improve the model so that every Vietnamese citizen will feel that insurance is really valuable.\nThank you very much\nfanpage facebook:  https://www.facebook.com/BaohiemBihama\nlinkedin : https://www.linkedin.com/in/baohiembi...\nwebsite: https://bihama.vn/\ndangky&dangnhap: https://www.youtube.com/watch?v=4jVBs...\n#baohiem #bihama.vn #baohiembihama #bihama	https://www.youtube.com/embed/JFltl-zuvaU	2020-08-11 08:45:46.613452+00	/static/kienthuc/images/hqdefault10.png	0	3
11	Bihama - Các đối tác của bihama.vn		bihama-cac-doi-tac-cua-bihamavn	sàn thương mại điện tử bihama.vn là nơi mà các đối tác là các công ty bảo hiểm, các cộng tác viên có thể tin cậy và đặt niềm tin vào để cùng nhau tạo nên một hệ sinh thái bảo hiểm giúp ích cho sự phát triển của ngành bảo hiểm nói riêng và cộng đồng nói chung. Khi nhắc tới bihama.vn là nhắc tới một thương hiệu uy tín của người Việt!\nfanpage facebook:  https://www.facebook.com/BaohiemBihama\nlinkedin : https://www.linkedin.com/in/baohiembi...\nwebsite: https://bihama.vn/\n#baohiem #doitacbihama #baohiembihama #bihama	https://www.youtube.com/embed/LSLBlZCQ0qw	2020-08-11 08:45:46.630772+00	/static/kienthuc/images/hqdefault11.png	0	3
12	Bihama - Hướng dẫn Tin tứcCâu chuyện thịt sạch.vn		bihama-huong-dan-dang-ky-ban-hang-cung-bihamavn	Chúng tôi sẽ hướng dẫn bạn Tin tứcđể trở thành cộng tác viên hoặc đại lý bảo hiểm chuyên nghiệp để Câu chuyện thịt sạch.vn để nhận được thu động thụ động lên tới 75% và rất nhiều chương trình khuyến mại hấp dẫn được chúng tôi đưa ra. Hãy nhanh tay để Tin tứccùng chúng tôi nhé!\nfanpage facebook:  https://www.facebook.com/BaohiemBihama\nlinkedin : https://www.linkedin.com/in/baohiembi...\nwebsite: https://bihama.vn/\n#baohiem #trathuongbihama #baohiembihama #bihama	https://www.youtube.com/embed/fs0-hdMCNKg	2020-08-11 08:45:46.646819+00	/static/kienthuc/images/hqdefault12.png	0	4
13	Bihama - Câu chuyện về Bihama		bihama-cau-chuyen-ve-bihama	Đây là câu chuyện về sự hình thành, phát triển và ước mơ về một sản phẩm bảo hiểm công nghệ số dành cho Bảo hiểm tại Việt Nam. Bihama được hình thành từ một đội ngũ trẻ và giàu sức sáng tạo, mong muốn mang những công nghệ mới nhất vào bảo hiểm. Chúng tôi mong rằng sẽ nhận được sự ủng hộ và đồng hành của tất cả mọi người để bihama sẽ luôn phát triển và phục vụ cộng đồng. Xin chân thành cảm ơn!\nfanpage facebook:  https://www.facebook.com/BaohiemBihama\nlinkedin : https://www.linkedin.com/in/baohiembi...\nwebsite: https://bihama.vn/\n#baohiem #cauchuyenbihama #baohiembihama #bihama	https://www.youtube.com/embed/tNPssLHMiPQ	2020-08-11 08:45:46.6637+00	/static/kienthuc/images/hqdefault13.png	0	3
14	Bihama - Bạn có thể tiết kiệm khi mua bảo hiểm cùng Bihama?		bihama-ban-co-the-tiet-kiem-khi-mua-bao-hiem-cung-bihama	Bihama là một sàn thương mại điện tử về bảo hiểm với mô hình kinh doanh kết hợp giưã công nghệ và con người. Công nghệ giúp cho khách hàng mua bảo hiểm tiết kiệm được chi phí với rất nhiều chương trình khuyến mại được chúng tôi đưa ra. Ngoài ra Chương trình Câu chuyện thịt sạch giúp cho mọi người có thể kiếm tiền thụ động khi có thời gian rảnh và trao đổi các kiến thức về bảo hiểm với những người xung quanh, lan toả giá trị nhân văn tới mọi nhà.\nNgoài ra , chúng tôi cam kết sẽ hỗ trợ và đồng hành cùng bạn đến hết chặng đường được bảo hiểm !\nfanpage facebook:  https://www.facebook.com/BaohiemBihama\nlinkedin : https://www.linkedin.com/in/baohiembi...\nwebsite: https://bihama.vn/\n#baohiem #tietkiemtbihama #baohiembihama #bihama	https://www.youtube.com/embed/K-TMopB_cEk	2020-08-11 08:45:46.680365+00	/static/kienthuc/images/hqdefault14.png	0	3
15	Bihama - Hướng dẫn mua sản phẩm Bảo hiểm nhà tư nhân trên bihama.vn		bihama-huong-dan-mua-san-pham-bao-hiem-nha-tu-nhan-tren-bihamavn	Sản phẩm bảo hiểm nhà tư nhân bảo vệ cho căn nhà thân yêu của bạn trước các rủi ro cháy, nổ, sét đánh và các rủi ro lũ lụt, giông bão kèm theo. Với một số bước đơn giản, bạn có thể chọn cho mình một sản phẩm bảo hiểm với chi phí thấp nhất và có nhiều hỗ trợ nhất. Chúc bạn được bảo vệ tốt nhất!\nfanpage facebook:  https://www.facebook.com/BaohiemBihama\nlinkedin : https://www.linkedin.com/in/baohiembi...\nwebsite: https://bihama.vn/\n#baohiem #nhatunhanbihama #baohiembihama #bihama	https://www.youtube.com/embed/Y5-r_WZXLJI	2020-08-11 08:45:46.69796+00	/static/kienthuc/images/hqdefault15.png	0	3
16	Bihama - Mua Cơm Trưa Văn Phòng trong 30 giây trên bihama.vn		bihama-mua-bao-hiem-nhan-tho-trong-30-giay-tren-bihamavn	Bạn có thể tự hỏi sẽ mất thời gian bao lâu để tìm hiểu về bảo hiểm và mất bao lâu để mua được một sản phẩm Cơm Trưa Văn Phòng phù hợp. Với các công cụ có sẵn trên sàn thương mại điện tử Bihama bao gồm robot tư vấn sản phẩm và chu trình yêu cầu bảo hiểm, thanh toán tự động với thời gian chỉ trong 30 giây sẽ là một trải nghiệm rất thú vị với những người muốn có một sản phẩm Cơm Trưa Văn Phòng để vừa bảo vệ và vừa gia tăng tài sản. Hợp đồng bảo hiểm sẽ được chuyển đến cho bạn trong thời gian sớm nhất sau khi hoàn tất thanh toán trên sàn và tình trạng sức khoẻ hiện tại của bạn trước khi tham gia bảo hiểm là hoàn toàn bình thường. Chúc bạn chọn được một sản phẩm tốt cùng bihama.\nfanpage facebook:  https://www.facebook.com/BaohiemBihama\nlinkedin : https://www.linkedin.com/in/baohiembi...\nwebsite: https://bihama.vn/\n#baohiem #30giaybihama #baohiembihama #bihama	https://www.youtube.com/embed/PO7tLQIg9-Q	2020-08-11 08:45:46.714795+00	/static/kienthuc/images/hqdefault16.png	0	3
17	Bihama - Điều gì làm cho Bihama trở nên đặc biệt?		bihama-dieu-gi-lam-cho-bihama-tro-nen-dac-biet	Chúng tôi tự hào có một đội ngũ trẻ tài năng muốn tạo nên một thương hiệu Bihama. Tại công ty mọi người có thể thoả sức sáng tạo và áp dụng những công nghệ mới nhất vào bảo hiểm. Các platform của chúng tôi được thiết kế tiện lợi nhất cho khách hàng và các kỹ sư phần mềm luôn lắng nghe và đáp ứng những yêu cầu của khách hàng nhanh nhất. Chúng tôi cố gắng tạo ra các hình ảnh sinh động, gần gũi và đáng yêu với tất cả mọi người để bảo hiểm là một biểu tượng thân thuộc mà mọi người sẽ nhớ đến khi nhắc về Bihama. Với phương châm hoạt động chuyên nghiệp và sáng tạo không ngừng, chúng tôi sẽ mang đến cho khách hàng những trải nghiệm dịch vụ mới và tuyệt vời nhất. Chúc quý khách hàng phát triển, thịnh vượng và hạnh phúc.\nfanpage facebook:  https://www.facebook.com/BaohiemBihama\nlinkedin : https://www.linkedin.com/in/baohiembi...\nwebsite: https://bihama.vn/\n#baohiem #dacbietbihama #baohiembihama #bihama	https://www.youtube.com/embed/hEEWRb4FBKI	2020-08-11 08:45:46.731489+00	/static/kienthuc/images/hqdefault17.png	0	3
18	Bihama - Bảo hiểm không chỉ bảo vệ mà còn có thể gia tăng tài sản		bihama-bao-hiem-khong-chi-bao-ve-ma-con-co-the-gia-tang-tai-san	Bảo hiểm không chỉ bảo vệ bạn khi chẳng may gặp rủi ro trong cuộc sống mà còn có thể tiết kiệm và gia tăng tài sản với các hợp đồng bảo hiểm nhân thọ. Tuy nhiên do tính chất của các hợp đồng Cơm Trưa Văn Phòng nhắm đến là bảo vệ và giúp Người tham gia bảo hiểm trong thời gian dài ít nhất là 10 năm đến trọn đời nên Cơm Trưa Văn Phòng tạo cho bạn một thói quen là tiết kiệm theo quy luật. Bạn chắc chắn sẽ lỗ nếu chỉ tham gia trong thời gian ngắn và tài sản của bạn thực sự lớn và gia tăng sau khoảng từ 15 năm trở lên tuỳ từng sản phẩm. Chúc bạn chọn được một sản phẩm phù hợp nhất.\nfanpage facebook:  https://www.facebook.com/BaohiemBihama\nlinkedin : https://www.linkedin.com/in/baohiembi...\nwebsite: https://bihama.vn/\n#baohiem #baovebihama #baohiembihama #bihama	https://www.youtube.com/embed/0apfqFlM5kA	2020-08-11 08:45:46.748967+00	/static/kienthuc/images/hqdefault18.png	0	5
19	Bihama - Làm sao loại bỏ hợp đồng ảo trong Cơm Trưa Văn Phòng ?		bihama-lam-sao-loai-bo-hop-dong-ao-trong-bao-hiem-nhan-tho	Hợp đồng ảo là hợp đồng do đội ngũ kinh doanh tạo ra nhằm đạt các chỉ tiêu thưởng của công ty. Các hợp đồng ảo thường chỉ đóng phí trong năm đầu tiên của hợp đồng Cơm Trưa Văn Phòng vì họ không phải là khách hàng thực sự muốn tham gia bảo hiểm.\nBihama là mô hình kết hợp giữa đại lý và công nghệ với đối tượng khách hàng nhắm đến là những người thực sự quan tâm đến bảo hiểm và là những khách hàng thực sự bởi vì đơn giản nhất là khi mua sản phẩm Cơm Trưa Văn Phòng với mức phí thấp hơn và nhận nhiều ưu đãi từ sàn thương mại điện tử thì những người tham gia bảo hiểm sẽ thực sự cảm thấy có lợi thực sự. Các công ty bảo hiểm sau khi kiểm soát được chi phí, không phải đổ tiền vào chạy đua theo doanh thu để đưa ra các chính sách trả thưởng có phần thái quá thì sẽ tiết kiệm được cho phí và tạo ra thêm nhiều quyền lợi cho khách hàng để không có lý do gì mà không tham gia bảo hiểm nhân thọ.\nMột sản phẩm vừa được bảo vệ, vừa có thể gia tăng tài sản đáng kể nhất.\nfanpage facebook:  https://www.facebook.com/BaohiemBihama\nlinkedin : https://www.linkedin.com/in/baohiembi...\nwebsite: https://bihama.vn/\n#baohiem #hopdongaobihama #baohiembihama #bihama	https://www.youtube.com/embed/nWZpXefV9VI	2020-08-11 08:45:46.765343+00	/static/kienthuc/images/hqdefault19.png	0	5
20	Bihama - Tại sao bảo hiểm đầu tư lại được ưa chuộng?		bihama-tai-sao-bao-hiem-dau-tu-lai-duoc-ua-chuong	Các sản phẩm bảo hiểm đầu tư ra đời gồm bảo hiểm liên kết đơn vị và bảo hiểm liên kết chung đã thực sự mang lại thành công cho dòng sản phẩm Cơm Trưa Văn Phòng khi đánh thức được đam mê của khách hàng khi vừa muốn bảo vệ và vừa muốn số tiền phí đóng của mình có thể đầu tư. Để các sản phẩm đầu tư trở nên hấp dẫn hơn các công ty bảo hiểm sẽ phải tạo ra nhiều loại hình quỹ từ ít rủi ro đến rủi ro cao vì quy luật tất yếu sẽ là kỳ vọng ít rủi ro thì biến động lãi suất thấp và kỳ vọng rủi ro cao thì biến động lãi suất cao. Ngoài ra người tham gia bảo hiểm còn có thể tự điều chỉnh tỷ lệ số phí bảo hiểm tham gia vào các loại quỹ khác nhau để không bỏ tất cả tiền vào một giỏ trứng. Các yếu tố này tạo nên sự hấp dẫn của bảo hiểm đầu tư và chúng tôi mong rằng thời gian sắp tới các công ty bảo hiểm sẽ tạo thêm nhiều quyền lợi, quỹ hấp dẫn khách hàng hơn nữa.\nfanpage facebook:  https://www.facebook.com/BaohiemBihama\nlinkedin : https://www.linkedin.com/in/baohiembi...\nwebsite: https://bihama.vn/\n#baohiem #dautubihama #baohiembihama #bihama	https://www.youtube.com/embed/BpQNovtQ7bU	2020-08-11 08:45:46.782392+00	/static/kienthuc/images/hqdefault20.png	0	5
21	Bihama - Cải thiện hệ thống chăm sóc sức khoẻ tại Việt Nam		bihama-cai-thien-he-thong-cham-soc-suc-khoe-tai-viet-nam	Bảo hiểm chăm sóc sức khoẻ là sản phẩm được quan tâm nhất vì gắn liền với sức khoẻ của các thành viên khi tham gia. Một hệ thống bảo hiểm  chăm sóc sức khoẻ chuyên nghiệp là hệ thống đáp ứng được hầu hết các nhu cầu sức khoẻ của người dân như: khám chữa bệnh, thuốc men, phẫu thuật…\nLúc này hệ thống bảo hiểm xã hội sẽ phải liên thông với hệ thống bảo hiểm chăm sóc sức khoẻ thương mại để tiết kiệm chi phí và hỗ trợ lẫn nhau trong khi nguồn lực có hạn. Ngoài ra hệ thống cơ sở hạ tầng hiện đại và kết nối giữa bệnh viện và trung tâm bảo hiểm xã hội và bảo hiểm thương mại là cần thiết và đưa các quy trình triển khai như cấp đơn, giải quyết thủ tục được điện tử hoá để mọi vấn đề sức khoẻ được giải quyết nhanh chóng và chính xác là thực sự cần thiết.\nfanpage facebook:  https://www.facebook.com/BaohiemBihama\nlinkedin : https://www.linkedin.com/in/baohiembi...\nwebsite: https://bihama.vn/\n#baohiem #chámocsuckhoebihama #baohiembihama #bihama	https://www.youtube.com/embed/yHWQjG3Rg-g	2020-08-11 08:45:46.798824+00	/static/kienthuc/images/hqdefault21.png	0	5
22	Bihama - Tại sao mọi người tin tưởng Bihama?		bihama-tai-sao-moi-nguoi-tin-tuong-bihama	Bihama được xây dựng để giúp đỡ mọi người. Mọi quy trình tham gia bảo hiểm là đơn giản nhất, chúng tôi nhận được rất nhiều phản hồi rằng chưa thấy một chỗ nào mà mua bảo hiểm dễ hơn trên Bihama hiện tại. Mô hình kinh doanh là sự kết hợp giữa con người và công nghệ. Lần đầu tiên Cơm Trưa Văn Phòng được mua online một cách dễ dàng, tiện lợi và nhanh chóng. \nSự cải tiến không ngừng của Bihama giúp cho khách hàng muốn quay lại Bihama nhiều lần sau khi tham gia một sản phẩm bảo hiểm trên sàn.\nHãy bắt đầu ngay ngày hôm nay nhé !\nfanpage facebook:  https://www.facebook.com/BaohiemBihama\nlinkedin : https://www.linkedin.com/in/baohiembi...\nwebsite: https://bihama.vn/\n#baohiem #tintuongbihama #baohiembihama #bihama	https://www.youtube.com/embed/10c_pPmXcDM	2020-08-11 08:45:46.816057+00	/static/kienthuc/images/hqdefault22.png	0	3
23	Bihama - Quỹ tương hỗ là cần thiết cho Việt Nam?		bihama-quy-tuong-ho-la-can-thiet-cho-viet-nam	Khi các sản phẩm truyền thống và bảo hiểm thương mại chưa đáp ứng được hết các nhu cầu bảo hiểm của người dân. Đặc biệt là các sản phẩm có mức phí thấp và chỉ tập trung vào một số nhóm có chung một rủi ro nào đó. Lúc này các sản phẩm như quỹ tương hỗ bảo hiểm hoặc các sản phẩm bảo hiểm ngang hàng (peer to peer) là cần thiết. Các sản phẩm này giống như hình thức chơi hụi, chơi phường tại Việt Nam. Tuy nhiên sẽ không phải là người này lấy tiền trước và người kia lấy tiền sau mà là khi có rủi ro xảy ra trong nhóm thì sẽ lấy số tiền của người này để bù đắp cho những người gặp thiếu may mắn khác. Các sản phẩm này cần phải có sự giám sát chặt chẽ của các cơ quan quản lý như Bộ tài chính và phụ thuộc nhiều vào những chuyên gia định phí để luật chơi hấp dẫn và công bằng cho tất cả mọi người. Mức phí đóng sẽ chia đều cho các thành viên khi không có rủi ro nào xảy ra. Nếu hoàn chỉnh luật và được áp dụng thì chúng tôi tin rằng đây sẽ là một mô hình mà đối với hành vi tiêu dùng tại Việt nam sẽ rất được ưa chuộng.\nfanpage facebook:  https://www.facebook.com/BaohiemBihama\nlinkedin : https://www.linkedin.com/in/baohiembi...\nwebsite: https://bihama.vn/\n#baohiem #tuonghobihama #baohiembihama #bihama	https://www.youtube.com/embed/MhPGWnbjDg4	2020-08-11 08:45:46.832317+00	/static/kienthuc/images/hqdefault23.png	0	5
\.


--
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notification (id, title, body, created_at) FROM stdin;
\.


--
-- Data for Name: payment_dondathang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_dondathang (id, loai_hinh_bao_hiem, cong_ty, goi_san_pham_chinh, goi_san_pham_phu, so_phi_chinh, tong_so_phi_phu, "so_phi_VAT", tong_phi_thanh_toan, tong_phi_thanh_toan_sau_giam_gia, created_at, loai_hop_dong, ngay_phat_hanh_hop_dong_hoac_ack, loai_thanh_toan, ma_don_hang_bihama, tinh_trang_don_dat_hang, ma_giao_dich_cong_thanh_toan, tinh_trang_thanh_toan_cong_thanh_toan, code_ma_giam_gia, ma_hop_dong, link_giay_chung_nhan, is_da_gui_manager, is_da_gui_cong_thanh_toan, is_tai_tuc, nguoimuabaohiem_id, user_id) FROM stdin;
\.


--
-- Data for Name: payment_magiamgia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_magiamgia (id, loai_hinh_bao_hiem, cong_ty, goi_san_pham, ngay_hieu_luc, ngay_ket_thuc, chi_tieu, ten_chien_luoc, discount, code_ma_giam_gia, is_su_dung, created_at) FROM stdin;
\.


--
-- Data for Name: payment_taituc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_taituc (id, ma_tai_tuc_bihama, cach_tra_phi, dinh_ky_dong_phi, ky_dong_phi, so_tien, created_at, dondathang_id) FROM stdin;
\.


--
-- Data for Name: personalhealth_goisanphamchinh; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personalhealth_goisanphamchinh (id, ten_loai_hinh_bao_hiem, id_loai_hinh_bao_hiem, gioi_tinh, tuoi, ten_goi_san_pham_chinh, id_goi_san_pham_chinh, so_phi_chinh, company_id) FROM stdin;
1	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói Đồng	1	757000	1
2	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói Đồng	1	582000	1
3	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói Đồng	1	582000	1
4	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói Đồng	1	582000	1
5	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói Đồng	1	425000	1
6	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói Đồng	1	425000	1
7	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói Đồng	1	425000	1
8	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói Đồng	1	390000	1
9	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói Đồng	1	390000	1
10	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói Đồng	1	390000	1
11	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói Đồng	1	374000	1
12	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói Đồng	1	374000	1
13	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói Đồng	1	374000	1
14	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói Đồng	1	374000	1
15	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói Đồng	1	374000	1
16	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói Đồng	1	374000	1
17	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói Đồng	1	374000	1
18	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói Đồng	1	374000	1
19	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói Đồng	1	374000	1
20	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói Đồng	1	358000	1
21	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói Đồng	1	358000	1
22	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói Đồng	1	358000	1
23	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói Đồng	1	358000	1
24	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói Đồng	1	358000	1
25	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói Đồng	1	358000	1
26	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói Đồng	1	358000	1
27	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói Đồng	1	358000	1
28	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói Đồng	1	358000	1
29	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói Đồng	1	358000	1
30	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói Đồng	1	358000	1
31	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói Đồng	1	358000	1
32	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói Đồng	1	390000	1
33	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói Đồng	1	390000	1
34	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói Đồng	1	390000	1
35	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói Đồng	1	390000	1
36	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói Đồng	1	390000	1
37	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói Đồng	1	390000	1
38	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói Đồng	1	390000	1
39	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói Đồng	1	390000	1
40	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói Đồng	1	390000	1
41	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói Đồng	1	390000	1
42	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói Đồng	1	406000	1
43	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói Đồng	1	406000	1
44	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói Đồng	1	406000	1
45	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói Đồng	1	406000	1
46	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói Đồng	1	406000	1
47	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói Đồng	1	406000	1
48	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói Đồng	1	406000	1
49	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói Đồng	1	406000	1
50	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói Đồng	1	406000	1
51	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói Đồng	1	406000	1
52	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói Đồng	1	422000	1
53	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói Đồng	1	422000	1
54	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói Đồng	1	422000	1
55	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói Đồng	1	422000	1
56	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói Đồng	1	422000	1
57	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói Đồng	1	422000	1
58	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói Đồng	1	422000	1
59	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói Đồng	1	422000	1
60	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói Đồng	1	422000	1
61	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói Đồng	1	422000	1
62	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói Đồng	1	454000	1
63	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói Đồng	1	454000	1
64	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói Đồng	1	454000	1
65	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói Đồng	1	454000	1
66	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói Đồng	1	454000	1
67	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói Bạc	2	1513000	1
68	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói Bạc	2	1164000	1
69	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói Bạc	2	1164000	1
70	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói Bạc	2	1164000	1
71	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói Bạc	2	850000	1
72	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói Bạc	2	850000	1
73	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói Bạc	2	850000	1
74	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói Bạc	2	780000	1
75	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói Bạc	2	780000	1
76	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói Bạc	2	780000	1
77	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói Bạc	2	748000	1
78	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói Bạc	2	748000	1
79	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói Bạc	2	748000	1
80	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói Bạc	2	748000	1
81	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói Bạc	2	748000	1
82	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói Bạc	2	748000	1
83	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói Bạc	2	748000	1
84	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói Bạc	2	748000	1
85	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói Bạc	2	748000	1
86	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói Bạc	2	716000	1
87	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói Bạc	2	716000	1
88	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói Bạc	2	716000	1
89	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói Bạc	2	716000	1
90	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói Bạc	2	716000	1
91	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói Bạc	2	716000	1
92	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói Bạc	2	716000	1
93	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói Bạc	2	716000	1
94	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói Bạc	2	716000	1
95	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói Bạc	2	716000	1
96	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói Bạc	2	716000	1
97	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói Bạc	2	716000	1
98	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói Bạc	2	780000	1
99	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói Bạc	2	780000	1
100	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói Bạc	2	780000	1
101	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói Bạc	2	780000	1
102	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói Bạc	2	780000	1
103	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói Bạc	2	780000	1
104	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói Bạc	2	780000	1
105	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói Bạc	2	780000	1
106	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói Bạc	2	780000	1
107	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói Bạc	2	780000	1
108	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói Bạc	2	812000	1
109	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói Bạc	2	812000	1
110	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói Bạc	2	812000	1
111	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói Bạc	2	812000	1
112	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói Bạc	2	812000	1
113	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói Bạc	2	812000	1
114	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói Bạc	2	812000	1
115	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói Bạc	2	812000	1
116	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói Bạc	2	812000	1
117	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói Bạc	2	812000	1
118	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói Bạc	2	844000	1
119	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói Bạc	2	844000	1
120	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói Bạc	2	844000	1
121	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói Bạc	2	844000	1
122	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói Bạc	2	844000	1
123	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói Bạc	2	844000	1
124	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói Bạc	2	844000	1
125	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói Bạc	2	844000	1
126	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói Bạc	2	844000	1
127	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói Bạc	2	844000	1
128	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói Bạc	2	908000	1
129	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói Bạc	2	908000	1
130	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói Bạc	2	908000	1
131	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói Bạc	2	908000	1
132	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói Bạc	2	908000	1
133	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói TiTan	3	3026000	1
134	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói TiTan	3	2328000	1
135	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói TiTan	3	2328000	1
136	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói TiTan	3	2328000	1
137	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói TiTan	3	1701000	1
138	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói TiTan	3	1701000	1
139	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói TiTan	3	1701000	1
140	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói TiTan	3	1560000	1
141	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói TiTan	3	1560000	1
142	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói TiTan	3	1560000	1
143	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói TiTan	3	1496000	1
144	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói TiTan	3	1496000	1
145	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói TiTan	3	1496000	1
146	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói TiTan	3	1496000	1
147	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói TiTan	3	1496000	1
148	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói TiTan	3	1496000	1
149	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói TiTan	3	1496000	1
150	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói TiTan	3	1496000	1
151	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói TiTan	3	1496000	1
152	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói TiTan	3	1432000	1
153	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói TiTan	3	1432000	1
154	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói TiTan	3	1432000	1
155	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói TiTan	3	1432000	1
156	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói TiTan	3	1432000	1
157	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói TiTan	3	1432000	1
158	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói TiTan	3	1432000	1
159	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói TiTan	3	1432000	1
160	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói TiTan	3	1432000	1
161	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói TiTan	3	1432000	1
162	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói TiTan	3	1432000	1
163	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói TiTan	3	1432000	1
164	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói TiTan	3	1560000	1
165	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói TiTan	3	1560000	1
166	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói TiTan	3	1560000	1
167	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói TiTan	3	1560000	1
168	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói TiTan	3	1560000	1
169	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói TiTan	3	1560000	1
170	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói TiTan	3	1560000	1
171	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói TiTan	3	1560000	1
172	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói TiTan	3	1560000	1
173	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói TiTan	3	1560000	1
174	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói TiTan	3	1624000	1
175	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói TiTan	3	1624000	1
176	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói TiTan	3	1624000	1
177	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói TiTan	3	1624000	1
178	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói TiTan	3	1624000	1
179	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói TiTan	3	1624000	1
180	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói TiTan	3	1624000	1
181	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói TiTan	3	1624000	1
182	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói TiTan	3	1624000	1
183	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói TiTan	3	1624000	1
184	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói TiTan	3	1688000	1
185	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói TiTan	3	1688000	1
186	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói TiTan	3	1688000	1
187	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói TiTan	3	1688000	1
188	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói TiTan	3	1688000	1
189	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói TiTan	3	1688000	1
190	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói TiTan	3	1688000	1
191	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói TiTan	3	1688000	1
192	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói TiTan	3	1688000	1
193	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói TiTan	3	1688000	1
194	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói TiTan	3	1816000	1
195	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói TiTan	3	1816000	1
196	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói TiTan	3	1816000	1
197	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói TiTan	3	1816000	1
198	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói TiTan	3	1816000	1
199	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói Vàng	4	6185000	1
200	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói Vàng	4	4758000	1
201	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói Vàng	4	4758000	1
202	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói Vàng	4	4758000	1
203	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói Vàng	4	3496000	1
204	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói Vàng	4	3496000	1
205	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói Vàng	4	3496000	1
206	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói Vàng	4	3213000	1
207	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói Vàng	4	3213000	1
208	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói Vàng	4	3213000	1
209	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói Vàng	4	3084000	1
210	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói Vàng	4	3084000	1
211	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói Vàng	4	3084000	1
212	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói Vàng	4	3084000	1
213	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói Vàng	4	3084000	1
214	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói Vàng	4	3084000	1
215	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói Vàng	4	3084000	1
216	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói Vàng	4	3084000	1
217	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói Vàng	4	3084000	1
218	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói Vàng	4	2955000	1
219	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói Vàng	4	2955000	1
220	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói Vàng	4	2955000	1
221	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói Vàng	4	2955000	1
222	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói Vàng	4	2955000	1
223	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói Vàng	4	2955000	1
224	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói Vàng	4	2955000	1
225	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói Vàng	4	2955000	1
226	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói Vàng	4	2955000	1
227	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói Vàng	4	2955000	1
228	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói Vàng	4	2955000	1
229	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói Vàng	4	2955000	1
230	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói Vàng	4	3213000	1
231	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói Vàng	4	3213000	1
232	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói Vàng	4	3213000	1
233	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói Vàng	4	3213000	1
234	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói Vàng	4	3213000	1
235	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói Vàng	4	3213000	1
236	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói Vàng	4	3213000	1
237	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói Vàng	4	3213000	1
238	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói Vàng	4	3213000	1
239	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói Vàng	4	3213000	1
240	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói Vàng	4	3341000	1
241	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói Vàng	4	3341000	1
242	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói Vàng	4	3341000	1
243	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói Vàng	4	3341000	1
244	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói Vàng	4	3341000	1
245	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói Vàng	4	3341000	1
246	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói Vàng	4	3341000	1
247	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói Vàng	4	3341000	1
248	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói Vàng	4	3341000	1
249	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói Vàng	4	3341000	1
250	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói Vàng	4	3470000	1
251	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói Vàng	4	3470000	1
252	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói Vàng	4	3470000	1
253	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói Vàng	4	3470000	1
254	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói Vàng	4	3470000	1
255	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói Vàng	4	3470000	1
256	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói Vàng	4	3470000	1
257	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói Vàng	4	3470000	1
258	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói Vàng	4	3470000	1
259	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói Vàng	4	3470000	1
260	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói Vàng	4	3728000	1
261	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói Vàng	4	3728000	1
262	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói Vàng	4	3728000	1
263	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói Vàng	4	3728000	1
264	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói Vàng	4	3728000	1
265	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói Bạch Kim	5	12188000	1
266	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói Bạch Kim	5	9375000	1
267	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói Bạch Kim	5	9375000	1
268	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói Bạch Kim	5	9375000	1
269	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói Bạch Kim	5	6852000	1
270	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói Bạch Kim	5	6852000	1
271	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói Bạch Kim	5	6852000	1
272	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói Bạch Kim	5	6285000	1
273	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói Bạch Kim	5	6285000	1
274	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói Bạch Kim	5	6285000	1
275	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói Bạch Kim	5	6028000	1
276	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói Bạch Kim	5	6028000	1
277	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói Bạch Kim	5	6028000	1
278	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói Bạch Kim	5	6028000	1
279	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói Bạch Kim	5	6028000	1
280	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói Bạch Kim	5	6028000	1
281	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói Bạch Kim	5	6028000	1
282	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói Bạch Kim	5	6028000	1
283	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói Bạch Kim	5	6028000	1
284	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói Bạch Kim	5	5770000	1
285	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói Bạch Kim	5	5770000	1
286	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói Bạch Kim	5	5770000	1
287	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói Bạch Kim	5	5770000	1
288	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói Bạch Kim	5	5770000	1
289	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói Bạch Kim	5	5770000	1
290	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói Bạch Kim	5	5770000	1
291	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói Bạch Kim	5	5770000	1
292	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói Bạch Kim	5	5770000	1
293	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói Bạch Kim	5	5770000	1
294	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói Bạch Kim	5	5770000	1
295	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói Bạch Kim	5	5770000	1
296	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói Bạch Kim	5	6285000	1
297	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói Bạch Kim	5	6285000	1
298	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói Bạch Kim	5	6285000	1
299	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói Bạch Kim	5	6285000	1
300	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói Bạch Kim	5	6285000	1
301	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói Bạch Kim	5	6285000	1
302	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói Bạch Kim	5	6285000	1
303	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói Bạch Kim	5	6285000	1
304	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói Bạch Kim	5	6285000	1
305	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói Bạch Kim	5	6285000	1
306	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói Bạch Kim	5	6543000	1
307	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói Bạch Kim	5	6543000	1
308	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói Bạch Kim	5	6543000	1
309	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói Bạch Kim	5	6543000	1
310	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói Bạch Kim	5	6543000	1
311	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói Bạch Kim	5	6543000	1
312	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói Bạch Kim	5	6543000	1
313	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói Bạch Kim	5	6543000	1
314	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói Bạch Kim	5	6543000	1
315	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói Bạch Kim	5	6543000	1
316	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói Bạch Kim	5	6800000	1
317	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói Bạch Kim	5	6800000	1
318	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói Bạch Kim	5	6800000	1
319	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói Bạch Kim	5	6800000	1
320	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói Bạch Kim	5	6800000	1
321	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói Bạch Kim	5	6800000	1
322	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói Bạch Kim	5	6800000	1
323	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói Bạch Kim	5	6800000	1
324	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói Bạch Kim	5	6800000	1
325	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói Bạch Kim	5	6800000	1
326	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói Bạch Kim	5	7315000	1
327	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói Bạch Kim	5	7315000	1
328	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói Bạch Kim	5	7315000	1
329	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói Bạch Kim	5	7315000	1
330	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói Bạch Kim	5	7315000	1
331	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói Kim Cương	6	38480000	1
332	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói Kim Cương	6	29600000	1
333	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói Kim Cương	6	29600000	1
334	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói Kim Cương	6	29600000	1
335	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói Kim Cương	6	21368000	1
336	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói Kim Cương	6	21368000	1
337	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói Kim Cương	6	21368000	1
338	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói Kim Cương	6	19520000	1
339	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói Kim Cương	6	19520000	1
340	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói Kim Cương	6	19520000	1
341	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói Kim Cương	6	18680000	1
342	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói Kim Cương	6	18680000	1
343	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói Kim Cương	6	18680000	1
344	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói Kim Cương	6	18680000	1
345	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói Kim Cương	6	18680000	1
346	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói Kim Cương	6	18680000	1
347	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói Kim Cương	6	18680000	1
348	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói Kim Cương	6	18680000	1
349	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói Kim Cương	6	18680000	1
350	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói Kim Cương	6	17840000	1
351	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói Kim Cương	6	17840000	1
352	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói Kim Cương	6	17840000	1
353	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói Kim Cương	6	17840000	1
354	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói Kim Cương	6	17840000	1
355	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói Kim Cương	6	17840000	1
356	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói Kim Cương	6	17840000	1
357	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói Kim Cương	6	17840000	1
358	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói Kim Cương	6	17840000	1
359	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói Kim Cương	6	17840000	1
360	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói Kim Cương	6	17840000	1
361	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói Kim Cương	6	17840000	1
362	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói Kim Cương	6	19520000	1
363	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói Kim Cương	6	19520000	1
364	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói Kim Cương	6	19520000	1
365	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói Kim Cương	6	19520000	1
366	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói Kim Cương	6	19520000	1
367	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói Kim Cương	6	19520000	1
368	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói Kim Cương	6	19520000	1
369	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói Kim Cương	6	19520000	1
370	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói Kim Cương	6	19520000	1
371	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói Kim Cương	6	19520000	1
372	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói Kim Cương	6	20360000	1
373	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói Kim Cương	6	20360000	1
374	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói Kim Cương	6	20360000	1
375	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói Kim Cương	6	20360000	1
376	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói Kim Cương	6	20360000	1
377	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói Kim Cương	6	20360000	1
378	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói Kim Cương	6	20360000	1
379	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói Kim Cương	6	20360000	1
380	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói Kim Cương	6	20360000	1
381	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói Kim Cương	6	20360000	1
382	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói Kim Cương	6	21200000	1
383	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói Kim Cương	6	21200000	1
384	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói Kim Cương	6	21200000	1
385	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói Kim Cương	6	21200000	1
386	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói Kim Cương	6	21200000	1
387	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói Kim Cương	6	21200000	1
388	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói Kim Cương	6	21200000	1
389	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói Kim Cương	6	21200000	1
390	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói Kim Cương	6	21200000	1
391	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói Kim Cương	6	21200000	1
392	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói Kim Cương	6	22880000	1
393	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói Kim Cương	6	22880000	1
394	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói Kim Cương	6	22880000	1
395	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói Kim Cương	6	22880000	1
396	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói Kim Cương	6	22880000	1
\.


--
-- Data for Name: personalhealth_goisanphamphu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personalhealth_goisanphamphu (id, ten_loai_hinh_bao_hiem, id_loai_hinh_bao_hiem, gioi_tinh, tuoi, ten_goi_san_pham_chinh, id_goi_san_pham_chinh, ten_goi_san_pham_phu, id_goi_san_pham_phu, so_phi_phu, company_id) FROM stdin;
1	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
2	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
3	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
4	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
5	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
6	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
7	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
8	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
9	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
10	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
11	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
12	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
13	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
14	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
15	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
16	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
17	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
18	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
19	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
20	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
21	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
22	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
23	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
24	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
25	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
26	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
27	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
28	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
29	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
30	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
31	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
32	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
33	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
34	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
35	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
36	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
37	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
38	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
39	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
40	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
41	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
42	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
43	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
44	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
45	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
46	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
47	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
48	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
49	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
50	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
51	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
52	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
53	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
54	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
55	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
56	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
57	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
58	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
59	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
60	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
61	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
62	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
63	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
64	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
65	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
66	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói Đồng	1	Điều Trị Ngoại Trú	1	0	1
67	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói Đồng	1	Thai Sản	2	0	1
68	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói Đồng	1	Thai Sản	2	0	1
69	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói Đồng	1	Thai Sản	2	0	1
70	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói Đồng	1	Thai Sản	2	0	1
71	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói Đồng	1	Thai Sản	2	0	1
72	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói Đồng	1	Thai Sản	2	0	1
73	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói Đồng	1	Thai Sản	2	0	1
74	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói Đồng	1	Thai Sản	2	0	1
75	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói Đồng	1	Thai Sản	2	0	1
76	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói Đồng	1	Thai Sản	2	0	1
77	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói Đồng	1	Thai Sản	2	0	1
78	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói Đồng	1	Thai Sản	2	0	1
79	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói Đồng	1	Thai Sản	2	0	1
80	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói Đồng	1	Thai Sản	2	0	1
81	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói Đồng	1	Thai Sản	2	0	1
82	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói Đồng	1	Thai Sản	2	0	1
83	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói Đồng	1	Thai Sản	2	0	1
84	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói Đồng	1	Thai Sản	2	0	1
85	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói Đồng	1	Thai Sản	2	0	1
86	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói Đồng	1	Thai Sản	2	0	1
87	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói Đồng	1	Thai Sản	2	0	1
88	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói Đồng	1	Thai Sản	2	0	1
89	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói Đồng	1	Thai Sản	2	0	1
90	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói Đồng	1	Thai Sản	2	0	1
91	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói Đồng	1	Thai Sản	2	0	1
92	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói Đồng	1	Thai Sản	2	0	1
93	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói Đồng	1	Thai Sản	2	0	1
94	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói Đồng	1	Thai Sản	2	0	1
95	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói Đồng	1	Thai Sản	2	0	1
96	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói Đồng	1	Thai Sản	2	0	1
97	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói Đồng	1	Thai Sản	2	0	1
98	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói Đồng	1	Thai Sản	2	0	1
99	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói Đồng	1	Thai Sản	2	0	1
100	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói Đồng	1	Thai Sản	2	0	1
101	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói Đồng	1	Thai Sản	2	0	1
102	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói Đồng	1	Thai Sản	2	0	1
103	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói Đồng	1	Thai Sản	2	0	1
104	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói Đồng	1	Thai Sản	2	0	1
105	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói Đồng	1	Thai Sản	2	0	1
106	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói Đồng	1	Thai Sản	2	0	1
107	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói Đồng	1	Thai Sản	2	0	1
108	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói Đồng	1	Thai Sản	2	0	1
109	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói Đồng	1	Thai Sản	2	0	1
110	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói Đồng	1	Thai Sản	2	0	1
111	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói Đồng	1	Thai Sản	2	0	1
112	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói Đồng	1	Thai Sản	2	0	1
113	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói Đồng	1	Thai Sản	2	0	1
114	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói Đồng	1	Thai Sản	2	0	1
115	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói Đồng	1	Thai Sản	2	0	1
116	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói Đồng	1	Thai Sản	2	0	1
117	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói Đồng	1	Thai Sản	2	0	1
118	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói Đồng	1	Thai Sản	2	0	1
119	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói Đồng	1	Thai Sản	2	0	1
120	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói Đồng	1	Thai Sản	2	0	1
121	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói Đồng	1	Thai Sản	2	0	1
122	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói Đồng	1	Thai Sản	2	0	1
123	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói Đồng	1	Thai Sản	2	0	1
124	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói Đồng	1	Thai Sản	2	0	1
125	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói Đồng	1	Thai Sản	2	0	1
126	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói Đồng	1	Thai Sản	2	0	1
127	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói Đồng	1	Thai Sản	2	0	1
128	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói Đồng	1	Thai Sản	2	0	1
129	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói Đồng	1	Thai Sản	2	0	1
130	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói Đồng	1	Thai Sản	2	0	1
131	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói Đồng	1	Thai Sản	2	0	1
132	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói Đồng	1	Thai Sản	2	0	1
133	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói Đồng	1	Nha Khoa	3	0	1
134	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói Đồng	1	Nha Khoa	3	0	1
135	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói Đồng	1	Nha Khoa	3	0	1
136	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói Đồng	1	Nha Khoa	3	0	1
137	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói Đồng	1	Nha Khoa	3	0	1
138	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói Đồng	1	Nha Khoa	3	0	1
139	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói Đồng	1	Nha Khoa	3	0	1
140	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói Đồng	1	Nha Khoa	3	0	1
141	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói Đồng	1	Nha Khoa	3	0	1
142	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói Đồng	1	Nha Khoa	3	0	1
143	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói Đồng	1	Nha Khoa	3	0	1
144	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói Đồng	1	Nha Khoa	3	0	1
145	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói Đồng	1	Nha Khoa	3	0	1
146	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói Đồng	1	Nha Khoa	3	0	1
147	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói Đồng	1	Nha Khoa	3	0	1
148	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói Đồng	1	Nha Khoa	3	0	1
149	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói Đồng	1	Nha Khoa	3	0	1
150	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói Đồng	1	Nha Khoa	3	0	1
151	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói Đồng	1	Nha Khoa	3	0	1
152	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói Đồng	1	Nha Khoa	3	0	1
153	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói Đồng	1	Nha Khoa	3	0	1
154	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói Đồng	1	Nha Khoa	3	0	1
155	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói Đồng	1	Nha Khoa	3	0	1
156	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói Đồng	1	Nha Khoa	3	0	1
157	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói Đồng	1	Nha Khoa	3	0	1
158	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói Đồng	1	Nha Khoa	3	0	1
159	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói Đồng	1	Nha Khoa	3	0	1
160	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói Đồng	1	Nha Khoa	3	0	1
161	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói Đồng	1	Nha Khoa	3	0	1
162	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói Đồng	1	Nha Khoa	3	0	1
163	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói Đồng	1	Nha Khoa	3	0	1
164	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói Đồng	1	Nha Khoa	3	0	1
165	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói Đồng	1	Nha Khoa	3	0	1
166	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói Đồng	1	Nha Khoa	3	0	1
167	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói Đồng	1	Nha Khoa	3	0	1
168	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói Đồng	1	Nha Khoa	3	0	1
169	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói Đồng	1	Nha Khoa	3	0	1
170	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói Đồng	1	Nha Khoa	3	0	1
171	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói Đồng	1	Nha Khoa	3	0	1
172	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói Đồng	1	Nha Khoa	3	0	1
173	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói Đồng	1	Nha Khoa	3	0	1
174	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói Đồng	1	Nha Khoa	3	0	1
175	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói Đồng	1	Nha Khoa	3	0	1
176	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói Đồng	1	Nha Khoa	3	0	1
177	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói Đồng	1	Nha Khoa	3	0	1
178	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói Đồng	1	Nha Khoa	3	0	1
179	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói Đồng	1	Nha Khoa	3	0	1
180	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói Đồng	1	Nha Khoa	3	0	1
181	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói Đồng	1	Nha Khoa	3	0	1
182	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói Đồng	1	Nha Khoa	3	0	1
183	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói Đồng	1	Nha Khoa	3	0	1
184	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói Đồng	1	Nha Khoa	3	0	1
185	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói Đồng	1	Nha Khoa	3	0	1
186	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói Đồng	1	Nha Khoa	3	0	1
187	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói Đồng	1	Nha Khoa	3	0	1
188	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói Đồng	1	Nha Khoa	3	0	1
189	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói Đồng	1	Nha Khoa	3	0	1
190	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói Đồng	1	Nha Khoa	3	0	1
191	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói Đồng	1	Nha Khoa	3	0	1
192	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói Đồng	1	Nha Khoa	3	0	1
193	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói Đồng	1	Nha Khoa	3	0	1
194	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói Đồng	1	Nha Khoa	3	0	1
195	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói Đồng	1	Nha Khoa	3	0	1
196	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói Đồng	1	Nha Khoa	3	0	1
197	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói Đồng	1	Nha Khoa	3	0	1
198	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói Đồng	1	Nha Khoa	3	0	1
199	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	20000	1
200	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
201	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
202	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
203	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
204	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
205	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
206	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
207	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
208	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
209	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
210	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
211	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
212	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
213	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
214	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
215	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
216	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
217	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
218	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
219	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
220	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
221	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
222	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
223	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
224	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
225	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
226	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
227	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
228	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
229	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
230	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
231	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
232	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
233	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
234	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
235	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
236	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
237	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
238	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
239	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
240	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
241	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
242	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
243	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
244	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
245	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
246	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
247	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
248	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
249	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
250	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
251	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
252	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
253	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
254	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
255	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
256	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
257	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
258	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
259	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
260	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
261	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
262	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
263	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
264	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói Đồng	1	Trợ Cấp Nằm Viện Do Tai Nạn	4	15000	1
265	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói Bạc	2	Điều Trị Ngoại Trú	1	1243000	1
266	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói Bạc	2	Điều Trị Ngoại Trú	1	956000	1
267	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói Bạc	2	Điều Trị Ngoại Trú	1	956000	1
268	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói Bạc	2	Điều Trị Ngoại Trú	1	956000	1
269	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói Bạc	2	Điều Trị Ngoại Trú	1	681000	1
270	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói Bạc	2	Điều Trị Ngoại Trú	1	681000	1
271	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói Bạc	2	Điều Trị Ngoại Trú	1	681000	1
272	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói Bạc	2	Điều Trị Ngoại Trú	1	619000	1
273	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói Bạc	2	Điều Trị Ngoại Trú	1	619000	1
274	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói Bạc	2	Điều Trị Ngoại Trú	1	619000	1
275	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói Bạc	2	Điều Trị Ngoại Trú	1	591000	1
276	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói Bạc	2	Điều Trị Ngoại Trú	1	591000	1
277	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói Bạc	2	Điều Trị Ngoại Trú	1	591000	1
278	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói Bạc	2	Điều Trị Ngoại Trú	1	591000	1
279	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói Bạc	2	Điều Trị Ngoại Trú	1	591000	1
280	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói Bạc	2	Điều Trị Ngoại Trú	1	591000	1
281	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói Bạc	2	Điều Trị Ngoại Trú	1	591000	1
282	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói Bạc	2	Điều Trị Ngoại Trú	1	591000	1
283	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói Bạc	2	Điều Trị Ngoại Trú	1	591000	1
284	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói Bạc	2	Điều Trị Ngoại Trú	1	563000	1
285	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói Bạc	2	Điều Trị Ngoại Trú	1	563000	1
286	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói Bạc	2	Điều Trị Ngoại Trú	1	563000	1
287	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói Bạc	2	Điều Trị Ngoại Trú	1	563000	1
288	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói Bạc	2	Điều Trị Ngoại Trú	1	563000	1
289	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói Bạc	2	Điều Trị Ngoại Trú	1	563000	1
290	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói Bạc	2	Điều Trị Ngoại Trú	1	563000	1
291	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói Bạc	2	Điều Trị Ngoại Trú	1	563000	1
292	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói Bạc	2	Điều Trị Ngoại Trú	1	563000	1
293	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói Bạc	2	Điều Trị Ngoại Trú	1	563000	1
294	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói Bạc	2	Điều Trị Ngoại Trú	1	563000	1
295	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói Bạc	2	Điều Trị Ngoại Trú	1	563000	1
296	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói Bạc	2	Điều Trị Ngoại Trú	1	619000	1
297	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói Bạc	2	Điều Trị Ngoại Trú	1	619000	1
298	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói Bạc	2	Điều Trị Ngoại Trú	1	619000	1
299	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói Bạc	2	Điều Trị Ngoại Trú	1	619000	1
300	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói Bạc	2	Điều Trị Ngoại Trú	1	619000	1
301	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói Bạc	2	Điều Trị Ngoại Trú	1	619000	1
302	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói Bạc	2	Điều Trị Ngoại Trú	1	619000	1
303	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói Bạc	2	Điều Trị Ngoại Trú	1	619000	1
304	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói Bạc	2	Điều Trị Ngoại Trú	1	619000	1
305	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói Bạc	2	Điều Trị Ngoại Trú	1	619000	1
306	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói Bạc	2	Điều Trị Ngoại Trú	1	647000	1
307	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói Bạc	2	Điều Trị Ngoại Trú	1	647000	1
308	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói Bạc	2	Điều Trị Ngoại Trú	1	647000	1
309	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói Bạc	2	Điều Trị Ngoại Trú	1	647000	1
310	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói Bạc	2	Điều Trị Ngoại Trú	1	647000	1
311	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói Bạc	2	Điều Trị Ngoại Trú	1	647000	1
312	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói Bạc	2	Điều Trị Ngoại Trú	1	647000	1
313	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói Bạc	2	Điều Trị Ngoại Trú	1	647000	1
314	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói Bạc	2	Điều Trị Ngoại Trú	1	647000	1
315	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói Bạc	2	Điều Trị Ngoại Trú	1	647000	1
316	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói Bạc	2	Điều Trị Ngoại Trú	1	675000	1
317	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói Bạc	2	Điều Trị Ngoại Trú	1	675000	1
318	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói Bạc	2	Điều Trị Ngoại Trú	1	675000	1
319	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói Bạc	2	Điều Trị Ngoại Trú	1	675000	1
320	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói Bạc	2	Điều Trị Ngoại Trú	1	675000	1
321	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói Bạc	2	Điều Trị Ngoại Trú	1	675000	1
322	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói Bạc	2	Điều Trị Ngoại Trú	1	675000	1
323	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói Bạc	2	Điều Trị Ngoại Trú	1	675000	1
324	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói Bạc	2	Điều Trị Ngoại Trú	1	675000	1
325	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói Bạc	2	Điều Trị Ngoại Trú	1	675000	1
326	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói Bạc	2	Điều Trị Ngoại Trú	1	731000	1
327	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói Bạc	2	Điều Trị Ngoại Trú	1	731000	1
328	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói Bạc	2	Điều Trị Ngoại Trú	1	731000	1
329	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói Bạc	2	Điều Trị Ngoại Trú	1	731000	1
330	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói Bạc	2	Điều Trị Ngoại Trú	1	731000	1
331	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói Bạc	2	Thai Sản	2	0	1
332	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói Bạc	2	Thai Sản	2	0	1
333	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói Bạc	2	Thai Sản	2	0	1
334	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói Bạc	2	Thai Sản	2	0	1
335	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói Bạc	2	Thai Sản	2	0	1
336	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói Bạc	2	Thai Sản	2	0	1
337	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói Bạc	2	Thai Sản	2	0	1
338	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói Bạc	2	Thai Sản	2	0	1
339	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói Bạc	2	Thai Sản	2	0	1
340	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói Bạc	2	Thai Sản	2	0	1
341	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói Bạc	2	Thai Sản	2	0	1
342	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói Bạc	2	Thai Sản	2	0	1
343	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói Bạc	2	Thai Sản	2	0	1
344	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói Bạc	2	Thai Sản	2	0	1
345	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói Bạc	2	Thai Sản	2	0	1
346	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói Bạc	2	Thai Sản	2	0	1
347	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói Bạc	2	Thai Sản	2	0	1
348	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói Bạc	2	Thai Sản	2	0	1
349	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói Bạc	2	Thai Sản	2	0	1
350	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói Bạc	2	Thai Sản	2	1000000	1
351	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói Bạc	2	Thai Sản	2	1000000	1
352	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói Bạc	2	Thai Sản	2	1000000	1
353	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói Bạc	2	Thai Sản	2	1000000	1
354	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói Bạc	2	Thai Sản	2	1000000	1
355	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói Bạc	2	Thai Sản	2	1000000	1
356	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói Bạc	2	Thai Sản	2	1000000	1
357	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói Bạc	2	Thai Sản	2	1000000	1
358	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói Bạc	2	Thai Sản	2	1000000	1
359	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói Bạc	2	Thai Sản	2	1000000	1
360	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói Bạc	2	Thai Sản	2	1000000	1
361	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói Bạc	2	Thai Sản	2	1000000	1
362	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói Bạc	2	Thai Sản	2	1000000	1
363	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói Bạc	2	Thai Sản	2	1000000	1
364	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói Bạc	2	Thai Sản	2	1000000	1
365	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói Bạc	2	Thai Sản	2	1000000	1
366	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói Bạc	2	Thai Sản	2	1000000	1
367	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói Bạc	2	Thai Sản	2	1000000	1
368	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói Bạc	2	Thai Sản	2	1000000	1
369	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói Bạc	2	Thai Sản	2	1000000	1
370	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói Bạc	2	Thai Sản	2	1000000	1
371	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói Bạc	2	Thai Sản	2	1000000	1
372	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói Bạc	2	Thai Sản	2	1000000	1
373	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói Bạc	2	Thai Sản	2	1000000	1
374	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói Bạc	2	Thai Sản	2	1000000	1
375	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói Bạc	2	Thai Sản	2	1000000	1
376	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói Bạc	2	Thai Sản	2	1000000	1
377	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói Bạc	2	Thai Sản	2	1000000	1
378	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói Bạc	2	Thai Sản	2	1000000	1
379	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói Bạc	2	Thai Sản	2	1000000	1
380	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói Bạc	2	Thai Sản	2	1000000	1
381	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói Bạc	2	Thai Sản	2	1000000	1
382	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói Bạc	2	Thai Sản	2	0	1
383	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói Bạc	2	Thai Sản	2	0	1
384	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói Bạc	2	Thai Sản	2	0	1
385	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói Bạc	2	Thai Sản	2	0	1
386	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói Bạc	2	Thai Sản	2	0	1
387	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói Bạc	2	Thai Sản	2	0	1
388	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói Bạc	2	Thai Sản	2	0	1
389	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói Bạc	2	Thai Sản	2	0	1
390	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói Bạc	2	Thai Sản	2	0	1
391	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói Bạc	2	Thai Sản	2	0	1
392	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói Bạc	2	Thai Sản	2	0	1
393	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói Bạc	2	Thai Sản	2	0	1
394	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói Bạc	2	Thai Sản	2	0	1
395	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói Bạc	2	Thai Sản	2	0	1
396	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói Bạc	2	Thai Sản	2	0	1
397	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói Bạc	2	Nha Khoa	3	298000	1
398	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói Bạc	2	Nha Khoa	3	230000	1
399	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói Bạc	2	Nha Khoa	3	230000	1
400	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói Bạc	2	Nha Khoa	3	230000	1
401	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói Bạc	2	Nha Khoa	3	163000	1
402	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói Bạc	2	Nha Khoa	3	163000	1
403	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói Bạc	2	Nha Khoa	3	163000	1
404	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói Bạc	2	Nha Khoa	3	149000	1
405	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói Bạc	2	Nha Khoa	3	149000	1
406	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói Bạc	2	Nha Khoa	3	149000	1
407	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói Bạc	2	Nha Khoa	3	142000	1
408	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói Bạc	2	Nha Khoa	3	142000	1
409	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói Bạc	2	Nha Khoa	3	142000	1
410	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói Bạc	2	Nha Khoa	3	142000	1
411	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói Bạc	2	Nha Khoa	3	142000	1
412	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói Bạc	2	Nha Khoa	3	142000	1
413	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói Bạc	2	Nha Khoa	3	142000	1
414	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói Bạc	2	Nha Khoa	3	142000	1
415	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói Bạc	2	Nha Khoa	3	142000	1
416	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói Bạc	2	Nha Khoa	3	135000	1
417	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói Bạc	2	Nha Khoa	3	135000	1
418	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói Bạc	2	Nha Khoa	3	135000	1
419	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói Bạc	2	Nha Khoa	3	135000	1
420	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói Bạc	2	Nha Khoa	3	135000	1
421	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói Bạc	2	Nha Khoa	3	135000	1
422	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói Bạc	2	Nha Khoa	3	135000	1
423	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói Bạc	2	Nha Khoa	3	135000	1
424	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói Bạc	2	Nha Khoa	3	135000	1
425	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói Bạc	2	Nha Khoa	3	135000	1
426	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói Bạc	2	Nha Khoa	3	135000	1
427	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói Bạc	2	Nha Khoa	3	135000	1
428	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói Bạc	2	Nha Khoa	3	149000	1
429	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói Bạc	2	Nha Khoa	3	149000	1
430	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói Bạc	2	Nha Khoa	3	149000	1
431	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói Bạc	2	Nha Khoa	3	149000	1
432	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói Bạc	2	Nha Khoa	3	149000	1
433	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói Bạc	2	Nha Khoa	3	149000	1
434	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói Bạc	2	Nha Khoa	3	149000	1
435	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói Bạc	2	Nha Khoa	3	149000	1
436	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói Bạc	2	Nha Khoa	3	149000	1
437	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói Bạc	2	Nha Khoa	3	149000	1
438	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói Bạc	2	Nha Khoa	3	155000	1
439	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói Bạc	2	Nha Khoa	3	155000	1
440	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói Bạc	2	Nha Khoa	3	155000	1
441	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói Bạc	2	Nha Khoa	3	155000	1
442	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói Bạc	2	Nha Khoa	3	155000	1
443	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói Bạc	2	Nha Khoa	3	155000	1
444	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói Bạc	2	Nha Khoa	3	155000	1
445	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói Bạc	2	Nha Khoa	3	155000	1
446	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói Bạc	2	Nha Khoa	3	155000	1
447	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói Bạc	2	Nha Khoa	3	155000	1
448	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói Bạc	2	Nha Khoa	3	162000	1
449	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói Bạc	2	Nha Khoa	3	162000	1
450	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói Bạc	2	Nha Khoa	3	162000	1
451	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói Bạc	2	Nha Khoa	3	162000	1
452	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói Bạc	2	Nha Khoa	3	162000	1
453	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói Bạc	2	Nha Khoa	3	162000	1
454	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói Bạc	2	Nha Khoa	3	162000	1
455	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói Bạc	2	Nha Khoa	3	162000	1
456	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói Bạc	2	Nha Khoa	3	162000	1
457	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói Bạc	2	Nha Khoa	3	162000	1
458	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói Bạc	2	Nha Khoa	3	176000	1
459	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói Bạc	2	Nha Khoa	3	176000	1
460	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói Bạc	2	Nha Khoa	3	176000	1
461	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói Bạc	2	Nha Khoa	3	176000	1
462	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói Bạc	2	Nha Khoa	3	176000	1
463	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	39000	1
464	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
465	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
466	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
467	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
468	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
469	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
470	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
471	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
472	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
473	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
474	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
475	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
476	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
477	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
478	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
479	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
480	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
481	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
482	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
483	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
484	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
485	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
486	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
487	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
488	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
489	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
490	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
491	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
492	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
493	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
494	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
495	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
496	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
497	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
498	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
499	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
500	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
501	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
502	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
503	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
504	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
505	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
506	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
507	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
508	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
509	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
510	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
623	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói TiTan	3	Thai Sản	2	1700000	1
511	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
512	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
513	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
514	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
515	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
516	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
517	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
518	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
519	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
520	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
521	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
522	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
523	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
524	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
525	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
526	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
527	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
528	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói Bạc	2	Trợ Cấp Nằm Viện Do Tai Nạn	4	30000	1
529	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói TiTan	3	Điều Trị Ngoại Trú	1	2486000	1
530	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói TiTan	3	Điều Trị Ngoại Trú	1	1913000	1
531	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói TiTan	3	Điều Trị Ngoại Trú	1	1913000	1
532	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói TiTan	3	Điều Trị Ngoại Trú	1	1913000	1
533	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói TiTan	3	Điều Trị Ngoại Trú	1	1361000	1
534	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói TiTan	3	Điều Trị Ngoại Trú	1	1361000	1
535	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói TiTan	3	Điều Trị Ngoại Trú	1	1361000	1
536	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói TiTan	3	Điều Trị Ngoại Trú	1	1238000	1
537	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói TiTan	3	Điều Trị Ngoại Trú	1	1238000	1
538	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói TiTan	3	Điều Trị Ngoại Trú	1	1238000	1
539	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói TiTan	3	Điều Trị Ngoại Trú	1	1181000	1
540	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói TiTan	3	Điều Trị Ngoại Trú	1	1181000	1
541	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói TiTan	3	Điều Trị Ngoại Trú	1	1181000	1
542	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói TiTan	3	Điều Trị Ngoại Trú	1	1181000	1
543	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói TiTan	3	Điều Trị Ngoại Trú	1	1181000	1
544	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói TiTan	3	Điều Trị Ngoại Trú	1	1181000	1
545	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói TiTan	3	Điều Trị Ngoại Trú	1	1181000	1
546	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói TiTan	3	Điều Trị Ngoại Trú	1	1181000	1
547	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói TiTan	3	Điều Trị Ngoại Trú	1	1181000	1
548	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói TiTan	3	Điều Trị Ngoại Trú	1	1125000	1
549	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói TiTan	3	Điều Trị Ngoại Trú	1	1125000	1
550	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói TiTan	3	Điều Trị Ngoại Trú	1	1125000	1
551	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói TiTan	3	Điều Trị Ngoại Trú	1	1125000	1
552	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói TiTan	3	Điều Trị Ngoại Trú	1	1125000	1
553	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói TiTan	3	Điều Trị Ngoại Trú	1	1125000	1
554	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói TiTan	3	Điều Trị Ngoại Trú	1	1125000	1
555	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói TiTan	3	Điều Trị Ngoại Trú	1	1125000	1
556	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói TiTan	3	Điều Trị Ngoại Trú	1	1125000	1
557	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói TiTan	3	Điều Trị Ngoại Trú	1	1125000	1
558	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói TiTan	3	Điều Trị Ngoại Trú	1	1125000	1
559	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói TiTan	3	Điều Trị Ngoại Trú	1	1125000	1
560	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói TiTan	3	Điều Trị Ngoại Trú	1	1238000	1
561	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói TiTan	3	Điều Trị Ngoại Trú	1	1238000	1
562	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói TiTan	3	Điều Trị Ngoại Trú	1	1238000	1
563	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói TiTan	3	Điều Trị Ngoại Trú	1	1238000	1
564	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói TiTan	3	Điều Trị Ngoại Trú	1	1238000	1
565	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói TiTan	3	Điều Trị Ngoại Trú	1	1238000	1
566	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói TiTan	3	Điều Trị Ngoại Trú	1	1238000	1
567	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói TiTan	3	Điều Trị Ngoại Trú	1	1238000	1
568	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói TiTan	3	Điều Trị Ngoại Trú	1	1238000	1
569	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói TiTan	3	Điều Trị Ngoại Trú	1	1238000	1
570	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói TiTan	3	Điều Trị Ngoại Trú	1	1294000	1
571	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói TiTan	3	Điều Trị Ngoại Trú	1	1294000	1
572	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói TiTan	3	Điều Trị Ngoại Trú	1	1294000	1
573	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói TiTan	3	Điều Trị Ngoại Trú	1	1294000	1
574	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói TiTan	3	Điều Trị Ngoại Trú	1	1294000	1
575	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói TiTan	3	Điều Trị Ngoại Trú	1	1294000	1
576	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói TiTan	3	Điều Trị Ngoại Trú	1	1294000	1
577	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói TiTan	3	Điều Trị Ngoại Trú	1	1294000	1
578	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói TiTan	3	Điều Trị Ngoại Trú	1	1294000	1
579	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói TiTan	3	Điều Trị Ngoại Trú	1	1294000	1
580	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói TiTan	3	Điều Trị Ngoại Trú	1	1350000	1
581	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói TiTan	3	Điều Trị Ngoại Trú	1	1350000	1
582	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói TiTan	3	Điều Trị Ngoại Trú	1	1350000	1
583	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói TiTan	3	Điều Trị Ngoại Trú	1	1350000	1
584	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói TiTan	3	Điều Trị Ngoại Trú	1	1350000	1
585	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói TiTan	3	Điều Trị Ngoại Trú	1	1350000	1
586	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói TiTan	3	Điều Trị Ngoại Trú	1	1350000	1
587	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói TiTan	3	Điều Trị Ngoại Trú	1	1350000	1
588	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói TiTan	3	Điều Trị Ngoại Trú	1	1350000	1
589	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói TiTan	3	Điều Trị Ngoại Trú	1	1350000	1
590	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói TiTan	3	Điều Trị Ngoại Trú	1	1463000	1
591	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói TiTan	3	Điều Trị Ngoại Trú	1	1463000	1
592	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói TiTan	3	Điều Trị Ngoại Trú	1	1463000	1
593	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói TiTan	3	Điều Trị Ngoại Trú	1	1463000	1
594	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói TiTan	3	Điều Trị Ngoại Trú	1	1463000	1
595	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói TiTan	3	Thai Sản	2	0	1
596	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói TiTan	3	Thai Sản	2	0	1
597	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói TiTan	3	Thai Sản	2	0	1
598	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói TiTan	3	Thai Sản	2	0	1
599	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói TiTan	3	Thai Sản	2	0	1
600	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói TiTan	3	Thai Sản	2	0	1
601	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói TiTan	3	Thai Sản	2	0	1
602	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói TiTan	3	Thai Sản	2	0	1
603	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói TiTan	3	Thai Sản	2	0	1
604	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói TiTan	3	Thai Sản	2	0	1
605	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói TiTan	3	Thai Sản	2	0	1
606	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói TiTan	3	Thai Sản	2	0	1
607	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói TiTan	3	Thai Sản	2	0	1
608	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói TiTan	3	Thai Sản	2	0	1
609	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói TiTan	3	Thai Sản	2	0	1
610	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói TiTan	3	Thai Sản	2	0	1
611	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói TiTan	3	Thai Sản	2	0	1
612	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói TiTan	3	Thai Sản	2	0	1
613	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói TiTan	3	Thai Sản	2	0	1
614	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói TiTan	3	Thai Sản	2	1700000	1
615	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói TiTan	3	Thai Sản	2	1700000	1
616	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói TiTan	3	Thai Sản	2	1700000	1
617	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói TiTan	3	Thai Sản	2	1700000	1
618	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói TiTan	3	Thai Sản	2	1700000	1
619	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói TiTan	3	Thai Sản	2	1700000	1
620	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói TiTan	3	Thai Sản	2	1700000	1
621	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói TiTan	3	Thai Sản	2	1700000	1
622	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói TiTan	3	Thai Sản	2	1700000	1
624	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói TiTan	3	Thai Sản	2	1700000	1
625	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói TiTan	3	Thai Sản	2	1700000	1
626	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói TiTan	3	Thai Sản	2	1700000	1
627	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói TiTan	3	Thai Sản	2	1700000	1
628	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói TiTan	3	Thai Sản	2	1700000	1
629	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói TiTan	3	Thai Sản	2	1700000	1
630	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói TiTan	3	Thai Sản	2	1700000	1
631	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói TiTan	3	Thai Sản	2	1700000	1
632	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói TiTan	3	Thai Sản	2	1700000	1
633	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói TiTan	3	Thai Sản	2	1700000	1
634	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói TiTan	3	Thai Sản	2	1700000	1
635	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói TiTan	3	Thai Sản	2	1700000	1
636	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói TiTan	3	Thai Sản	2	1700000	1
637	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói TiTan	3	Thai Sản	2	1700000	1
638	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói TiTan	3	Thai Sản	2	1700000	1
639	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói TiTan	3	Thai Sản	2	1700000	1
640	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói TiTan	3	Thai Sản	2	1700000	1
641	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói TiTan	3	Thai Sản	2	1700000	1
642	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói TiTan	3	Thai Sản	2	1700000	1
643	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói TiTan	3	Thai Sản	2	1700000	1
644	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói TiTan	3	Thai Sản	2	1700000	1
645	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói TiTan	3	Thai Sản	2	1700000	1
646	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói TiTan	3	Thai Sản	2	0	1
647	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói TiTan	3	Thai Sản	2	0	1
648	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói TiTan	3	Thai Sản	2	0	1
649	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói TiTan	3	Thai Sản	2	0	1
650	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói TiTan	3	Thai Sản	2	0	1
651	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói TiTan	3	Thai Sản	2	0	1
652	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói TiTan	3	Thai Sản	2	0	1
653	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói TiTan	3	Thai Sản	2	0	1
654	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói TiTan	3	Thai Sản	2	0	1
655	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói TiTan	3	Thai Sản	2	0	1
656	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói TiTan	3	Thai Sản	2	0	1
657	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói TiTan	3	Thai Sản	2	0	1
658	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói TiTan	3	Thai Sản	2	0	1
659	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói TiTan	3	Thai Sản	2	0	1
660	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói TiTan	3	Thai Sản	2	0	1
661	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói TiTan	3	Nha Khoa	3	597000	1
662	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói TiTan	3	Nha Khoa	3	459000	1
663	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói TiTan	3	Nha Khoa	3	459000	1
664	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói TiTan	3	Nha Khoa	3	459000	1
665	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói TiTan	3	Nha Khoa	3	327000	1
666	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói TiTan	3	Nha Khoa	3	327000	1
667	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói TiTan	3	Nha Khoa	3	327000	1
668	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói TiTan	3	Nha Khoa	3	297000	1
669	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói TiTan	3	Nha Khoa	3	297000	1
670	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói TiTan	3	Nha Khoa	3	297000	1
671	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói TiTan	3	Nha Khoa	3	284000	1
672	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói TiTan	3	Nha Khoa	3	284000	1
673	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói TiTan	3	Nha Khoa	3	284000	1
674	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói TiTan	3	Nha Khoa	3	284000	1
675	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói TiTan	3	Nha Khoa	3	284000	1
676	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói TiTan	3	Nha Khoa	3	284000	1
677	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói TiTan	3	Nha Khoa	3	284000	1
678	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói TiTan	3	Nha Khoa	3	284000	1
679	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói TiTan	3	Nha Khoa	3	284000	1
680	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói TiTan	3	Nha Khoa	3	270000	1
681	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói TiTan	3	Nha Khoa	3	270000	1
682	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói TiTan	3	Nha Khoa	3	270000	1
683	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói TiTan	3	Nha Khoa	3	270000	1
684	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói TiTan	3	Nha Khoa	3	270000	1
685	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói TiTan	3	Nha Khoa	3	270000	1
686	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói TiTan	3	Nha Khoa	3	270000	1
687	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói TiTan	3	Nha Khoa	3	270000	1
688	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói TiTan	3	Nha Khoa	3	270000	1
689	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói TiTan	3	Nha Khoa	3	270000	1
690	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói TiTan	3	Nha Khoa	3	270000	1
691	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói TiTan	3	Nha Khoa	3	270000	1
692	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói TiTan	3	Nha Khoa	3	297000	1
693	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói TiTan	3	Nha Khoa	3	297000	1
694	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói TiTan	3	Nha Khoa	3	297000	1
695	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói TiTan	3	Nha Khoa	3	297000	1
696	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói TiTan	3	Nha Khoa	3	297000	1
697	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói TiTan	3	Nha Khoa	3	297000	1
698	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói TiTan	3	Nha Khoa	3	297000	1
699	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói TiTan	3	Nha Khoa	3	297000	1
700	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói TiTan	3	Nha Khoa	3	297000	1
701	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói TiTan	3	Nha Khoa	3	297000	1
702	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói TiTan	3	Nha Khoa	3	311000	1
703	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói TiTan	3	Nha Khoa	3	311000	1
704	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói TiTan	3	Nha Khoa	3	311000	1
705	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói TiTan	3	Nha Khoa	3	311000	1
706	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói TiTan	3	Nha Khoa	3	311000	1
707	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói TiTan	3	Nha Khoa	3	311000	1
708	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói TiTan	3	Nha Khoa	3	311000	1
709	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói TiTan	3	Nha Khoa	3	311000	1
710	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói TiTan	3	Nha Khoa	3	311000	1
711	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói TiTan	3	Nha Khoa	3	311000	1
712	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói TiTan	3	Nha Khoa	3	324000	1
713	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói TiTan	3	Nha Khoa	3	324000	1
714	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói TiTan	3	Nha Khoa	3	324000	1
715	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói TiTan	3	Nha Khoa	3	324000	1
716	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói TiTan	3	Nha Khoa	3	324000	1
717	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói TiTan	3	Nha Khoa	3	324000	1
718	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói TiTan	3	Nha Khoa	3	324000	1
719	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói TiTan	3	Nha Khoa	3	324000	1
720	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói TiTan	3	Nha Khoa	3	324000	1
721	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói TiTan	3	Nha Khoa	3	324000	1
722	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói TiTan	3	Nha Khoa	3	351000	1
723	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói TiTan	3	Nha Khoa	3	351000	1
724	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói TiTan	3	Nha Khoa	3	351000	1
725	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói TiTan	3	Nha Khoa	3	351000	1
726	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói TiTan	3	Nha Khoa	3	351000	1
727	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	78000	1
728	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
729	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
730	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
731	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
732	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
733	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
734	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
735	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
736	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
737	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
738	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
739	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
740	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
741	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
742	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
743	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
744	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
745	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
746	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
747	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
748	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
749	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
750	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
751	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
752	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
753	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
754	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
755	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
756	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
757	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
758	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
759	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
760	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
761	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
762	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
763	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
764	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
765	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
766	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
767	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
768	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
769	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
770	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
771	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
772	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
773	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
774	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
775	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
776	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
777	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
778	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
779	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
780	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
781	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
782	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
783	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
784	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
785	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
786	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
787	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
788	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
789	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
790	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
791	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
792	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói TiTan	3	Trợ Cấp Nằm Viện Do Tai Nạn	4	60000	1
793	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói Vàng	4	Điều Trị Ngoại Trú	1	4420000	1
794	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói Vàng	4	Điều Trị Ngoại Trú	1	3400000	1
795	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói Vàng	4	Điều Trị Ngoại Trú	1	3400000	1
796	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói Vàng	4	Điều Trị Ngoại Trú	1	3400000	1
797	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói Vàng	4	Điều Trị Ngoại Trú	1	2420000	1
798	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói Vàng	4	Điều Trị Ngoại Trú	1	2420000	1
799	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói Vàng	4	Điều Trị Ngoại Trú	1	2420000	1
800	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói Vàng	4	Điều Trị Ngoại Trú	1	2200000	1
801	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói Vàng	4	Điều Trị Ngoại Trú	1	2200000	1
802	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói Vàng	4	Điều Trị Ngoại Trú	1	2200000	1
803	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói Vàng	4	Điều Trị Ngoại Trú	1	2100000	1
804	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói Vàng	4	Điều Trị Ngoại Trú	1	2100000	1
805	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói Vàng	4	Điều Trị Ngoại Trú	1	2100000	1
806	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói Vàng	4	Điều Trị Ngoại Trú	1	2100000	1
807	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói Vàng	4	Điều Trị Ngoại Trú	1	2100000	1
808	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói Vàng	4	Điều Trị Ngoại Trú	1	2100000	1
809	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói Vàng	4	Điều Trị Ngoại Trú	1	2100000	1
810	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói Vàng	4	Điều Trị Ngoại Trú	1	2100000	1
811	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói Vàng	4	Điều Trị Ngoại Trú	1	2100000	1
812	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói Vàng	4	Điều Trị Ngoại Trú	1	2000000	1
813	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói Vàng	4	Điều Trị Ngoại Trú	1	2000000	1
814	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói Vàng	4	Điều Trị Ngoại Trú	1	2000000	1
815	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói Vàng	4	Điều Trị Ngoại Trú	1	2000000	1
816	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói Vàng	4	Điều Trị Ngoại Trú	1	2000000	1
817	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói Vàng	4	Điều Trị Ngoại Trú	1	2000000	1
818	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói Vàng	4	Điều Trị Ngoại Trú	1	2000000	1
819	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói Vàng	4	Điều Trị Ngoại Trú	1	2000000	1
820	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói Vàng	4	Điều Trị Ngoại Trú	1	2000000	1
821	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói Vàng	4	Điều Trị Ngoại Trú	1	2000000	1
822	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói Vàng	4	Điều Trị Ngoại Trú	1	2000000	1
823	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói Vàng	4	Điều Trị Ngoại Trú	1	2000000	1
824	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói Vàng	4	Điều Trị Ngoại Trú	1	2200000	1
825	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói Vàng	4	Điều Trị Ngoại Trú	1	2200000	1
826	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói Vàng	4	Điều Trị Ngoại Trú	1	2200000	1
827	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói Vàng	4	Điều Trị Ngoại Trú	1	2200000	1
828	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói Vàng	4	Điều Trị Ngoại Trú	1	2200000	1
829	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói Vàng	4	Điều Trị Ngoại Trú	1	2200000	1
830	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói Vàng	4	Điều Trị Ngoại Trú	1	2200000	1
831	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói Vàng	4	Điều Trị Ngoại Trú	1	2200000	1
832	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói Vàng	4	Điều Trị Ngoại Trú	1	2200000	1
833	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói Vàng	4	Điều Trị Ngoại Trú	1	2200000	1
834	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói Vàng	4	Điều Trị Ngoại Trú	1	2300000	1
835	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói Vàng	4	Điều Trị Ngoại Trú	1	2300000	1
836	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói Vàng	4	Điều Trị Ngoại Trú	1	2300000	1
837	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói Vàng	4	Điều Trị Ngoại Trú	1	2300000	1
838	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói Vàng	4	Điều Trị Ngoại Trú	1	2300000	1
839	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói Vàng	4	Điều Trị Ngoại Trú	1	2300000	1
840	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói Vàng	4	Điều Trị Ngoại Trú	1	2300000	1
841	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói Vàng	4	Điều Trị Ngoại Trú	1	2300000	1
842	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói Vàng	4	Điều Trị Ngoại Trú	1	2300000	1
843	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói Vàng	4	Điều Trị Ngoại Trú	1	2300000	1
844	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói Vàng	4	Điều Trị Ngoại Trú	1	2400000	1
845	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói Vàng	4	Điều Trị Ngoại Trú	1	2400000	1
846	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói Vàng	4	Điều Trị Ngoại Trú	1	2400000	1
847	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói Vàng	4	Điều Trị Ngoại Trú	1	2400000	1
848	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói Vàng	4	Điều Trị Ngoại Trú	1	2400000	1
849	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói Vàng	4	Điều Trị Ngoại Trú	1	2400000	1
850	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói Vàng	4	Điều Trị Ngoại Trú	1	2400000	1
851	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói Vàng	4	Điều Trị Ngoại Trú	1	2400000	1
852	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói Vàng	4	Điều Trị Ngoại Trú	1	2400000	1
853	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói Vàng	4	Điều Trị Ngoại Trú	1	2400000	1
854	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói Vàng	4	Điều Trị Ngoại Trú	1	2600000	1
855	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói Vàng	4	Điều Trị Ngoại Trú	1	2600000	1
856	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói Vàng	4	Điều Trị Ngoại Trú	1	2600000	1
857	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói Vàng	4	Điều Trị Ngoại Trú	1	2600000	1
858	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói Vàng	4	Điều Trị Ngoại Trú	1	2600000	1
859	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói Vàng	4	Thai Sản	2	0	1
860	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói Vàng	4	Thai Sản	2	0	1
861	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói Vàng	4	Thai Sản	2	0	1
862	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói Vàng	4	Thai Sản	2	0	1
863	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói Vàng	4	Thai Sản	2	0	1
864	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói Vàng	4	Thai Sản	2	0	1
865	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói Vàng	4	Thai Sản	2	0	1
866	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói Vàng	4	Thai Sản	2	0	1
867	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói Vàng	4	Thai Sản	2	0	1
868	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói Vàng	4	Thai Sản	2	0	1
869	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói Vàng	4	Thai Sản	2	0	1
870	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói Vàng	4	Thai Sản	2	0	1
871	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói Vàng	4	Thai Sản	2	0	1
872	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói Vàng	4	Thai Sản	2	0	1
873	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói Vàng	4	Thai Sản	2	0	1
874	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói Vàng	4	Thai Sản	2	0	1
875	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói Vàng	4	Thai Sản	2	0	1
876	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói Vàng	4	Thai Sản	2	0	1
877	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói Vàng	4	Thai Sản	2	0	1
878	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói Vàng	4	Thai Sản	2	3400000	1
879	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói Vàng	4	Thai Sản	2	3400000	1
880	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói Vàng	4	Thai Sản	2	3400000	1
881	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói Vàng	4	Thai Sản	2	3400000	1
882	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói Vàng	4	Thai Sản	2	3400000	1
883	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói Vàng	4	Thai Sản	2	3400000	1
884	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói Vàng	4	Thai Sản	2	3400000	1
885	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói Vàng	4	Thai Sản	2	3400000	1
886	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói Vàng	4	Thai Sản	2	3400000	1
887	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói Vàng	4	Thai Sản	2	3400000	1
888	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói Vàng	4	Thai Sản	2	3400000	1
889	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói Vàng	4	Thai Sản	2	3400000	1
890	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói Vàng	4	Thai Sản	2	3400000	1
891	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói Vàng	4	Thai Sản	2	3400000	1
892	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói Vàng	4	Thai Sản	2	3400000	1
893	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói Vàng	4	Thai Sản	2	3400000	1
894	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói Vàng	4	Thai Sản	2	3400000	1
895	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói Vàng	4	Thai Sản	2	3400000	1
896	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói Vàng	4	Thai Sản	2	3400000	1
897	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói Vàng	4	Thai Sản	2	3400000	1
898	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói Vàng	4	Thai Sản	2	3400000	1
899	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói Vàng	4	Thai Sản	2	3400000	1
900	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói Vàng	4	Thai Sản	2	3400000	1
901	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói Vàng	4	Thai Sản	2	3400000	1
902	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói Vàng	4	Thai Sản	2	3400000	1
903	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói Vàng	4	Thai Sản	2	3400000	1
904	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói Vàng	4	Thai Sản	2	3400000	1
905	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói Vàng	4	Thai Sản	2	3400000	1
906	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói Vàng	4	Thai Sản	2	3400000	1
907	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói Vàng	4	Thai Sản	2	3400000	1
908	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói Vàng	4	Thai Sản	2	3400000	1
909	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói Vàng	4	Thai Sản	2	3400000	1
910	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói Vàng	4	Thai Sản	2	0	1
911	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói Vàng	4	Thai Sản	2	0	1
912	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói Vàng	4	Thai Sản	2	0	1
913	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói Vàng	4	Thai Sản	2	0	1
914	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói Vàng	4	Thai Sản	2	0	1
915	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói Vàng	4	Thai Sản	2	0	1
916	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói Vàng	4	Thai Sản	2	0	1
917	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói Vàng	4	Thai Sản	2	0	1
918	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói Vàng	4	Thai Sản	2	0	1
919	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói Vàng	4	Thai Sản	2	0	1
920	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói Vàng	4	Thai Sản	2	0	1
921	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói Vàng	4	Thai Sản	2	0	1
922	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói Vàng	4	Thai Sản	2	0	1
923	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói Vàng	4	Thai Sản	2	0	1
924	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói Vàng	4	Thai Sản	2	0	1
925	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói Vàng	4	Nha Khoa	3	1193000	1
926	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói Vàng	4	Nha Khoa	3	918000	1
927	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói Vàng	4	Nha Khoa	3	918000	1
928	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói Vàng	4	Nha Khoa	3	918000	1
929	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói Vàng	4	Nha Khoa	3	653000	1
930	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói Vàng	4	Nha Khoa	3	653000	1
931	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói Vàng	4	Nha Khoa	3	653000	1
932	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói Vàng	4	Nha Khoa	3	594000	1
933	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói Vàng	4	Nha Khoa	3	594000	1
934	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói Vàng	4	Nha Khoa	3	594000	1
935	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói Vàng	4	Nha Khoa	3	567000	1
936	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói Vàng	4	Nha Khoa	3	567000	1
937	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói Vàng	4	Nha Khoa	3	567000	1
938	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói Vàng	4	Nha Khoa	3	567000	1
939	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói Vàng	4	Nha Khoa	3	567000	1
940	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói Vàng	4	Nha Khoa	3	567000	1
941	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói Vàng	4	Nha Khoa	3	567000	1
942	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói Vàng	4	Nha Khoa	3	567000	1
943	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói Vàng	4	Nha Khoa	3	567000	1
944	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói Vàng	4	Nha Khoa	3	540000	1
945	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói Vàng	4	Nha Khoa	3	540000	1
946	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói Vàng	4	Nha Khoa	3	540000	1
947	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói Vàng	4	Nha Khoa	3	540000	1
948	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói Vàng	4	Nha Khoa	3	540000	1
949	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói Vàng	4	Nha Khoa	3	540000	1
950	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói Vàng	4	Nha Khoa	3	540000	1
951	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói Vàng	4	Nha Khoa	3	540000	1
952	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói Vàng	4	Nha Khoa	3	540000	1
953	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói Vàng	4	Nha Khoa	3	540000	1
954	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói Vàng	4	Nha Khoa	3	540000	1
955	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói Vàng	4	Nha Khoa	3	540000	1
956	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói Vàng	4	Nha Khoa	3	594000	1
957	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói Vàng	4	Nha Khoa	3	594000	1
958	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói Vàng	4	Nha Khoa	3	594000	1
959	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói Vàng	4	Nha Khoa	3	594000	1
960	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói Vàng	4	Nha Khoa	3	594000	1
961	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói Vàng	4	Nha Khoa	3	594000	1
962	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói Vàng	4	Nha Khoa	3	594000	1
963	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói Vàng	4	Nha Khoa	3	594000	1
964	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói Vàng	4	Nha Khoa	3	594000	1
965	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói Vàng	4	Nha Khoa	3	594000	1
966	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói Vàng	4	Nha Khoa	3	621000	1
967	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói Vàng	4	Nha Khoa	3	621000	1
968	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói Vàng	4	Nha Khoa	3	621000	1
969	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói Vàng	4	Nha Khoa	3	621000	1
970	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói Vàng	4	Nha Khoa	3	621000	1
971	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói Vàng	4	Nha Khoa	3	621000	1
972	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói Vàng	4	Nha Khoa	3	621000	1
973	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói Vàng	4	Nha Khoa	3	621000	1
974	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói Vàng	4	Nha Khoa	3	621000	1
975	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói Vàng	4	Nha Khoa	3	621000	1
976	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói Vàng	4	Nha Khoa	3	648000	1
977	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói Vàng	4	Nha Khoa	3	648000	1
978	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói Vàng	4	Nha Khoa	3	648000	1
979	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói Vàng	4	Nha Khoa	3	648000	1
980	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói Vàng	4	Nha Khoa	3	648000	1
981	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói Vàng	4	Nha Khoa	3	648000	1
982	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói Vàng	4	Nha Khoa	3	648000	1
983	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói Vàng	4	Nha Khoa	3	648000	1
984	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói Vàng	4	Nha Khoa	3	648000	1
985	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói Vàng	4	Nha Khoa	3	648000	1
986	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói Vàng	4	Nha Khoa	3	702000	1
987	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói Vàng	4	Nha Khoa	3	702000	1
988	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói Vàng	4	Nha Khoa	3	702000	1
989	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói Vàng	4	Nha Khoa	3	702000	1
990	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói Vàng	4	Nha Khoa	3	702000	1
991	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	156000	1
992	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
993	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
994	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
995	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
996	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
997	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
998	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
999	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1000	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1001	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1002	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1003	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1004	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1005	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1006	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1007	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1008	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1009	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1010	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1011	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1012	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1013	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1014	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1015	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1016	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1017	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1018	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1019	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1020	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1021	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1022	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1023	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1024	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1025	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1026	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1027	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1028	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1029	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1030	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1031	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1032	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1033	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1034	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1035	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1036	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1037	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1038	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1039	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1040	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1041	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1042	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1043	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1044	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1045	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1046	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1047	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1048	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1049	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1050	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1051	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1052	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1053	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1054	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1055	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1056	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói Vàng	4	Trợ Cấp Nằm Viện Do Tai Nạn	4	120000	1
1057	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	8840000	1
1058	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	6800000	1
1059	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	6800000	1
1060	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	6800000	1
1061	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4840000	1
1062	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4840000	1
1063	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4840000	1
1064	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4400000	1
1065	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4400000	1
1066	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4400000	1
1067	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4200000	1
1068	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4200000	1
1069	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4200000	1
1070	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4200000	1
1071	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4200000	1
1072	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4200000	1
1073	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4200000	1
1074	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4200000	1
1075	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4200000	1
1076	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4000000	1
1077	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4000000	1
1078	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4000000	1
1079	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4000000	1
1080	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4000000	1
1081	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4000000	1
1082	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4000000	1
1083	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4000000	1
1084	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4000000	1
1085	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4000000	1
1086	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4000000	1
1087	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4000000	1
1088	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4400000	1
1089	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4400000	1
1090	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4400000	1
1091	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4400000	1
1092	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4400000	1
1093	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4400000	1
1094	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4400000	1
1095	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4400000	1
1096	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4400000	1
1097	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4400000	1
1098	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4600000	1
1099	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4600000	1
1100	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4600000	1
1101	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4600000	1
1102	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4600000	1
1103	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4600000	1
1104	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4600000	1
1105	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4600000	1
1106	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4600000	1
1107	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4600000	1
1108	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4800000	1
1109	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4800000	1
1110	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4800000	1
1111	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4800000	1
1112	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4800000	1
1113	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4800000	1
1114	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4800000	1
1115	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4800000	1
1116	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4800000	1
1117	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	4800000	1
1118	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	5200000	1
1119	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	5200000	1
1120	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	5200000	1
1121	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	5200000	1
1122	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói Bạch Kim	5	Điều Trị Ngoại Trú	1	5200000	1
1123	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói Bạch Kim	5	Thai Sản	2	0	1
1124	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói Bạch Kim	5	Thai Sản	2	0	1
1125	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói Bạch Kim	5	Thai Sản	2	0	1
1126	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói Bạch Kim	5	Thai Sản	2	0	1
1127	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói Bạch Kim	5	Thai Sản	2	0	1
1128	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói Bạch Kim	5	Thai Sản	2	0	1
1129	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói Bạch Kim	5	Thai Sản	2	0	1
1130	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói Bạch Kim	5	Thai Sản	2	0	1
1131	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói Bạch Kim	5	Thai Sản	2	0	1
1132	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói Bạch Kim	5	Thai Sản	2	0	1
1133	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói Bạch Kim	5	Thai Sản	2	0	1
1134	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói Bạch Kim	5	Thai Sản	2	0	1
1135	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói Bạch Kim	5	Thai Sản	2	0	1
1136	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói Bạch Kim	5	Thai Sản	2	0	1
1137	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói Bạch Kim	5	Thai Sản	2	0	1
1138	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói Bạch Kim	5	Thai Sản	2	0	1
1139	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói Bạch Kim	5	Thai Sản	2	0	1
1140	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói Bạch Kim	5	Thai Sản	2	0	1
1141	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói Bạch Kim	5	Thai Sản	2	0	1
1142	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1143	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1144	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1145	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1146	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1147	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1148	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1149	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1150	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1151	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1152	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1153	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1154	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1155	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1156	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1157	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1158	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1159	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1160	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1161	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1162	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1163	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1164	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1165	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1166	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1167	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1168	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1169	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1170	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1171	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1172	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1173	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói Bạch Kim	5	Thai Sản	2	6800000	1
1174	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói Bạch Kim	5	Thai Sản	2	0	1
1175	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói Bạch Kim	5	Thai Sản	2	0	1
1176	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói Bạch Kim	5	Thai Sản	2	0	1
1177	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói Bạch Kim	5	Thai Sản	2	0	1
1178	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói Bạch Kim	5	Thai Sản	2	0	1
1179	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói Bạch Kim	5	Thai Sản	2	0	1
1180	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói Bạch Kim	5	Thai Sản	2	0	1
1181	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói Bạch Kim	5	Thai Sản	2	0	1
1182	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói Bạch Kim	5	Thai Sản	2	0	1
1183	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói Bạch Kim	5	Thai Sản	2	0	1
1184	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói Bạch Kim	5	Thai Sản	2	0	1
1185	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói Bạch Kim	5	Thai Sản	2	0	1
1186	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói Bạch Kim	5	Thai Sản	2	0	1
1187	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói Bạch Kim	5	Thai Sản	2	0	1
1188	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói Bạch Kim	5	Thai Sản	2	0	1
1189	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói Bạch Kim	5	Nha Khoa	3	2387000	1
1190	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói Bạch Kim	5	Nha Khoa	3	1836000	1
1191	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói Bạch Kim	5	Nha Khoa	3	1836000	1
1192	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói Bạch Kim	5	Nha Khoa	3	1836000	1
1193	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói Bạch Kim	5	Nha Khoa	3	1307000	1
1194	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói Bạch Kim	5	Nha Khoa	3	1307000	1
1195	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói Bạch Kim	5	Nha Khoa	3	1307000	1
1196	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói Bạch Kim	5	Nha Khoa	3	1188000	1
1197	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói Bạch Kim	5	Nha Khoa	3	1188000	1
1198	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói Bạch Kim	5	Nha Khoa	3	1188000	1
1199	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói Bạch Kim	5	Nha Khoa	3	1134000	1
1200	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói Bạch Kim	5	Nha Khoa	3	1134000	1
1201	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói Bạch Kim	5	Nha Khoa	3	1134000	1
1202	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói Bạch Kim	5	Nha Khoa	3	1134000	1
1203	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói Bạch Kim	5	Nha Khoa	3	1134000	1
1204	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói Bạch Kim	5	Nha Khoa	3	1134000	1
1205	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói Bạch Kim	5	Nha Khoa	3	1134000	1
1206	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói Bạch Kim	5	Nha Khoa	3	1134000	1
1207	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói Bạch Kim	5	Nha Khoa	3	1134000	1
1208	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói Bạch Kim	5	Nha Khoa	3	1080000	1
1209	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói Bạch Kim	5	Nha Khoa	3	1080000	1
1210	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói Bạch Kim	5	Nha Khoa	3	1080000	1
1211	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói Bạch Kim	5	Nha Khoa	3	1080000	1
1212	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói Bạch Kim	5	Nha Khoa	3	1080000	1
1213	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói Bạch Kim	5	Nha Khoa	3	1080000	1
1214	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói Bạch Kim	5	Nha Khoa	3	1080000	1
1215	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói Bạch Kim	5	Nha Khoa	3	1080000	1
1216	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói Bạch Kim	5	Nha Khoa	3	1080000	1
1217	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói Bạch Kim	5	Nha Khoa	3	1080000	1
1218	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói Bạch Kim	5	Nha Khoa	3	1080000	1
1219	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói Bạch Kim	5	Nha Khoa	3	1080000	1
1220	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói Bạch Kim	5	Nha Khoa	3	1188000	1
1221	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói Bạch Kim	5	Nha Khoa	3	1188000	1
1222	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói Bạch Kim	5	Nha Khoa	3	1188000	1
1223	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói Bạch Kim	5	Nha Khoa	3	1188000	1
1224	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói Bạch Kim	5	Nha Khoa	3	1188000	1
1225	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói Bạch Kim	5	Nha Khoa	3	1188000	1
1226	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói Bạch Kim	5	Nha Khoa	3	1188000	1
1227	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói Bạch Kim	5	Nha Khoa	3	1188000	1
1228	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói Bạch Kim	5	Nha Khoa	3	1188000	1
1229	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói Bạch Kim	5	Nha Khoa	3	1188000	1
1230	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói Bạch Kim	5	Nha Khoa	3	1242000	1
1231	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói Bạch Kim	5	Nha Khoa	3	1242000	1
1232	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói Bạch Kim	5	Nha Khoa	3	1242000	1
1233	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói Bạch Kim	5	Nha Khoa	3	1242000	1
1234	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói Bạch Kim	5	Nha Khoa	3	1242000	1
1235	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói Bạch Kim	5	Nha Khoa	3	1242000	1
1236	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói Bạch Kim	5	Nha Khoa	3	1242000	1
1237	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói Bạch Kim	5	Nha Khoa	3	1242000	1
1238	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói Bạch Kim	5	Nha Khoa	3	1242000	1
1239	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói Bạch Kim	5	Nha Khoa	3	1242000	1
1240	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói Bạch Kim	5	Nha Khoa	3	1296000	1
1241	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói Bạch Kim	5	Nha Khoa	3	1296000	1
1242	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói Bạch Kim	5	Nha Khoa	3	1296000	1
1243	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói Bạch Kim	5	Nha Khoa	3	1296000	1
1244	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói Bạch Kim	5	Nha Khoa	3	1296000	1
1245	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói Bạch Kim	5	Nha Khoa	3	1296000	1
1246	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói Bạch Kim	5	Nha Khoa	3	1296000	1
1247	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói Bạch Kim	5	Nha Khoa	3	1296000	1
1248	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói Bạch Kim	5	Nha Khoa	3	1296000	1
1249	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói Bạch Kim	5	Nha Khoa	3	1296000	1
1250	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói Bạch Kim	5	Nha Khoa	3	1404000	1
1251	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói Bạch Kim	5	Nha Khoa	3	1404000	1
1252	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói Bạch Kim	5	Nha Khoa	3	1404000	1
1253	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói Bạch Kim	5	Nha Khoa	3	1404000	1
1254	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói Bạch Kim	5	Nha Khoa	3	1404000	1
1255	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	234000	1
1256	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1257	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1258	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1259	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1260	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1261	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1262	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1263	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1264	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1265	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1266	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1267	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1268	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1269	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1270	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1271	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1272	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1273	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1274	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1275	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1276	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1277	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1278	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1279	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1280	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1281	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1282	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1283	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1284	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1285	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1286	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1287	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1288	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1289	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1290	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1291	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1292	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1293	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1294	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1295	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1296	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1297	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1298	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1299	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1300	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1301	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1302	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1303	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1304	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1305	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1306	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1307	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1308	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1309	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1310	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1311	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1312	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1313	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1314	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1315	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1316	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1317	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1318	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1319	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1320	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói Bạch Kim	5	Trợ Cấp Nằm Viện Do Tai Nạn	4	180000	1
1321	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	14144000	1
1322	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	10880000	1
1323	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	10880000	1
1324	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	10880000	1
1325	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7744000	1
1326	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7744000	1
1327	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7744000	1
1328	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7040000	1
1329	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7040000	1
1330	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7040000	1
1331	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	6720000	1
1332	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	6720000	1
1333	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	6720000	1
1334	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	6720000	1
1335	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	6720000	1
1336	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	6720000	1
1337	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	6720000	1
1338	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	6720000	1
1339	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	6720000	1
1340	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	6400000	1
1341	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	6400000	1
1342	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	6400000	1
1343	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	6400000	1
1344	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	6400000	1
1345	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	6400000	1
1346	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	6400000	1
1347	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	6400000	1
1348	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	6400000	1
1349	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	6400000	1
1350	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	6400000	1
1351	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	6400000	1
1352	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7040000	1
1353	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7040000	1
1354	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7040000	1
1355	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7040000	1
1356	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7040000	1
1357	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7040000	1
1358	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7040000	1
1359	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7040000	1
1360	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7040000	1
1361	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7040000	1
1362	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7360000	1
1363	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7360000	1
1364	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7360000	1
1365	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7360000	1
1366	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7360000	1
1367	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7360000	1
1368	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7360000	1
1369	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7360000	1
1370	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7360000	1
1371	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7360000	1
1372	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7680000	1
1373	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7680000	1
1374	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7680000	1
1375	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7680000	1
1376	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7680000	1
1377	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7680000	1
1378	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7680000	1
1379	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7680000	1
1380	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7680000	1
1381	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	7680000	1
1382	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	8320000	1
1383	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	8320000	1
1384	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	8320000	1
1385	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	8320000	1
1386	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói Kim Cương	6	Điều Trị Ngoại Trú	1	8320000	1
1387	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói Kim Cương	6	Thai Sản	2	0	1
1388	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói Kim Cương	6	Thai Sản	2	0	1
1389	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói Kim Cương	6	Thai Sản	2	0	1
1390	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói Kim Cương	6	Thai Sản	2	0	1
1391	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói Kim Cương	6	Thai Sản	2	0	1
1392	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói Kim Cương	6	Thai Sản	2	0	1
1393	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói Kim Cương	6	Thai Sản	2	0	1
1394	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói Kim Cương	6	Thai Sản	2	0	1
1395	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói Kim Cương	6	Thai Sản	2	0	1
1396	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói Kim Cương	6	Thai Sản	2	0	1
1397	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói Kim Cương	6	Thai Sản	2	0	1
1398	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói Kim Cương	6	Thai Sản	2	0	1
1399	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói Kim Cương	6	Thai Sản	2	0	1
1400	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói Kim Cương	6	Thai Sản	2	0	1
1401	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói Kim Cương	6	Thai Sản	2	0	1
1402	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói Kim Cương	6	Thai Sản	2	0	1
1403	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói Kim Cương	6	Thai Sản	2	0	1
1404	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói Kim Cương	6	Thai Sản	2	0	1
1405	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói Kim Cương	6	Thai Sản	2	0	1
1406	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói Kim Cương	6	Thai Sản	2	10880000	1
1407	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói Kim Cương	6	Thai Sản	2	10880000	1
1408	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói Kim Cương	6	Thai Sản	2	10880000	1
1409	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói Kim Cương	6	Thai Sản	2	10880000	1
1410	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói Kim Cương	6	Thai Sản	2	10880000	1
1411	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói Kim Cương	6	Thai Sản	2	10880000	1
1412	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói Kim Cương	6	Thai Sản	2	10880000	1
1413	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói Kim Cương	6	Thai Sản	2	10880000	1
1414	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói Kim Cương	6	Thai Sản	2	10880000	1
1415	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói Kim Cương	6	Thai Sản	2	10880000	1
1416	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói Kim Cương	6	Thai Sản	2	10880000	1
1417	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói Kim Cương	6	Thai Sản	2	10880000	1
1418	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói Kim Cương	6	Thai Sản	2	10880000	1
1419	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói Kim Cương	6	Thai Sản	2	10880000	1
1420	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói Kim Cương	6	Thai Sản	2	10880000	1
1421	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói Kim Cương	6	Thai Sản	2	10880000	1
1422	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói Kim Cương	6	Thai Sản	2	10880000	1
1423	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói Kim Cương	6	Thai Sản	2	10880000	1
1424	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói Kim Cương	6	Thai Sản	2	10880000	1
1425	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói Kim Cương	6	Thai Sản	2	10880000	1
1426	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói Kim Cương	6	Thai Sản	2	10880000	1
1427	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói Kim Cương	6	Thai Sản	2	10880000	1
1428	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói Kim Cương	6	Thai Sản	2	10880000	1
1429	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói Kim Cương	6	Thai Sản	2	10880000	1
1430	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói Kim Cương	6	Thai Sản	2	10880000	1
1431	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói Kim Cương	6	Thai Sản	2	10880000	1
1432	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói Kim Cương	6	Thai Sản	2	10880000	1
1433	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói Kim Cương	6	Thai Sản	2	10880000	1
1434	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói Kim Cương	6	Thai Sản	2	10880000	1
1435	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói Kim Cương	6	Thai Sản	2	10880000	1
1436	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói Kim Cương	6	Thai Sản	2	10880000	1
1437	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói Kim Cương	6	Thai Sản	2	10880000	1
1438	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói Kim Cương	6	Thai Sản	2	0	1
1439	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói Kim Cương	6	Thai Sản	2	0	1
1440	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói Kim Cương	6	Thai Sản	2	0	1
1441	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói Kim Cương	6	Thai Sản	2	0	1
1442	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói Kim Cương	6	Thai Sản	2	0	1
1443	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói Kim Cương	6	Thai Sản	2	0	1
1444	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói Kim Cương	6	Thai Sản	2	0	1
1445	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói Kim Cương	6	Thai Sản	2	0	1
1446	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói Kim Cương	6	Thai Sản	2	0	1
1447	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói Kim Cương	6	Thai Sản	2	0	1
1448	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói Kim Cương	6	Thai Sản	2	0	1
1449	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói Kim Cương	6	Thai Sản	2	0	1
1450	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói Kim Cương	6	Thai Sản	2	0	1
1451	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói Kim Cương	6	Thai Sản	2	0	1
1452	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói Kim Cương	6	Thai Sản	2	0	1
1453	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói Kim Cương	6	Nha Khoa	3	5967000	1
1454	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói Kim Cương	6	Nha Khoa	3	4590000	1
1455	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói Kim Cương	6	Nha Khoa	3	4590000	1
1456	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói Kim Cương	6	Nha Khoa	3	4590000	1
1457	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói Kim Cương	6	Nha Khoa	3	3267000	1
1458	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói Kim Cương	6	Nha Khoa	3	3267000	1
1459	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói Kim Cương	6	Nha Khoa	3	3267000	1
1460	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói Kim Cương	6	Nha Khoa	3	2970000	1
1461	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói Kim Cương	6	Nha Khoa	3	2970000	1
1462	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói Kim Cương	6	Nha Khoa	3	2970000	1
1463	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói Kim Cương	6	Nha Khoa	3	2835000	1
1464	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói Kim Cương	6	Nha Khoa	3	2835000	1
1465	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói Kim Cương	6	Nha Khoa	3	2835000	1
1466	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói Kim Cương	6	Nha Khoa	3	2835000	1
1467	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói Kim Cương	6	Nha Khoa	3	2835000	1
1468	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói Kim Cương	6	Nha Khoa	3	2835000	1
1469	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói Kim Cương	6	Nha Khoa	3	2835000	1
1470	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói Kim Cương	6	Nha Khoa	3	2835000	1
1471	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói Kim Cương	6	Nha Khoa	3	2835000	1
1472	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói Kim Cương	6	Nha Khoa	3	2700000	1
1473	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói Kim Cương	6	Nha Khoa	3	2700000	1
1474	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói Kim Cương	6	Nha Khoa	3	2700000	1
1475	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói Kim Cương	6	Nha Khoa	3	2700000	1
1476	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói Kim Cương	6	Nha Khoa	3	2700000	1
1477	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói Kim Cương	6	Nha Khoa	3	2700000	1
1478	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói Kim Cương	6	Nha Khoa	3	2700000	1
1479	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói Kim Cương	6	Nha Khoa	3	2700000	1
1480	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói Kim Cương	6	Nha Khoa	3	2700000	1
1481	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói Kim Cương	6	Nha Khoa	3	2700000	1
1482	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói Kim Cương	6	Nha Khoa	3	2700000	1
1483	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói Kim Cương	6	Nha Khoa	3	2700000	1
1484	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói Kim Cương	6	Nha Khoa	3	2970000	1
1485	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói Kim Cương	6	Nha Khoa	3	2970000	1
1486	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói Kim Cương	6	Nha Khoa	3	2970000	1
1487	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói Kim Cương	6	Nha Khoa	3	2970000	1
1488	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói Kim Cương	6	Nha Khoa	3	2970000	1
1489	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói Kim Cương	6	Nha Khoa	3	2970000	1
1490	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói Kim Cương	6	Nha Khoa	3	2970000	1
1491	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói Kim Cương	6	Nha Khoa	3	2970000	1
1492	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói Kim Cương	6	Nha Khoa	3	2970000	1
1493	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói Kim Cương	6	Nha Khoa	3	2970000	1
1494	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói Kim Cương	6	Nha Khoa	3	3105000	1
1495	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói Kim Cương	6	Nha Khoa	3	3105000	1
1496	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói Kim Cương	6	Nha Khoa	3	3105000	1
1497	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói Kim Cương	6	Nha Khoa	3	3105000	1
1498	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói Kim Cương	6	Nha Khoa	3	3105000	1
1499	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói Kim Cương	6	Nha Khoa	3	3105000	1
1500	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói Kim Cương	6	Nha Khoa	3	3105000	1
1501	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói Kim Cương	6	Nha Khoa	3	3105000	1
1502	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói Kim Cương	6	Nha Khoa	3	3105000	1
1503	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói Kim Cương	6	Nha Khoa	3	3105000	1
1504	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói Kim Cương	6	Nha Khoa	3	3240000	1
1505	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói Kim Cương	6	Nha Khoa	3	3240000	1
1506	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói Kim Cương	6	Nha Khoa	3	3240000	1
1507	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói Kim Cương	6	Nha Khoa	3	3240000	1
1508	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói Kim Cương	6	Nha Khoa	3	3240000	1
1509	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói Kim Cương	6	Nha Khoa	3	3240000	1
1510	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói Kim Cương	6	Nha Khoa	3	3240000	1
1511	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói Kim Cương	6	Nha Khoa	3	3240000	1
1512	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói Kim Cương	6	Nha Khoa	3	3240000	1
1513	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói Kim Cương	6	Nha Khoa	3	3240000	1
1514	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói Kim Cương	6	Nha Khoa	3	3510000	1
1515	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói Kim Cương	6	Nha Khoa	3	3510000	1
1516	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói Kim Cương	6	Nha Khoa	3	3510000	1
1517	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói Kim Cương	6	Nha Khoa	3	3510000	1
1518	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói Kim Cương	6	Nha Khoa	3	3510000	1
1519	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	0	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1300000	1
1520	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	1	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1521	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	2	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1522	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	3	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1523	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	4	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1524	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	5	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1525	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	6	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1526	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	7	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1527	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	8	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1528	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	9	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1529	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	10	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1530	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	11	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1531	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	12	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1532	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	13	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1533	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	14	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1534	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	15	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1535	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	16	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1536	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	17	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1537	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	18	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1538	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	19	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1539	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	20	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1540	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	21	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1541	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	22	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1542	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	23	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1543	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	24	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1544	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	25	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1545	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	26	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1546	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	27	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1547	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	28	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1548	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	29	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1549	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	30	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1550	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	31	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1551	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	32	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1552	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	33	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1553	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	34	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1554	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	35	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1555	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	36	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1556	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	37	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1557	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	38	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1558	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	39	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1559	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	40	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1560	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	41	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1561	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	42	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1562	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	43	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1563	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	44	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1564	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	45	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1565	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	46	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1566	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	47	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1567	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	48	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1568	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	49	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1569	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	50	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1570	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	51	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1571	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	52	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1572	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	53	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1573	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	54	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1574	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	55	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1575	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	56	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1576	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	57	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1577	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	58	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1578	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	59	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1579	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	60	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1580	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	61	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1581	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	62	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1582	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	63	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1583	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	64	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
1584	Bảo Hiểm Sức Khoẻ Cá Nhân	6	0	65	Gói Kim Cương	6	Trợ Cấp Nằm Viện Do Tai Nạn	4	1000000	1
\.


--
-- Data for Name: personalhealth_nguoiduocbaohiem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personalhealth_nguoiduocbaohiem (id, ma_don_hang_bihama, username, fullname, birth_day, birth_month, birth_year, gioi_tinh, email, dia_chi_tinh_thanh_pho, dia_chi_quan_huyen, dia_chi_chi_tiet, so_cmnd, images_cmt_mattruoc, images_cmt_matsau, cmt_ngay_cap, cmt_noi_cap, ngay_hieu_luc, ngay_ket_thuc, cau_hoi_suc_khoe_1, cau_hoi_suc_khoe_2, chi_tiet_benh_tat, relationship, created_at, nguoimuabaohiem_id) FROM stdin;
\.


--
-- Data for Name: personalhealth_nguoiduocbaohiemtam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personalhealth_nguoiduocbaohiemtam (id, username, fullname, birth_day, birth_month, birth_year, gioi_tinh, email, dia_chi_tinh_thanh_pho, dia_chi_quan_huyen, dia_chi_chi_tiet, so_cmnd, images_cmt_mattruoc, images_cmt_matsau, cmt_ngay_cap, cmt_noi_cap, ngay_hieu_luc, ngay_ket_thuc, cau_hoi_suc_khoe_1, cau_hoi_suc_khoe_2, chi_tiet_benh_tat, relationship, created_at, nguoimuabaohiemtam_id) FROM stdin;
\.


--
-- Data for Name: reset_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reset_token (reset_token, created_at, user_id) FROM stdin;
\.


--
-- Data for Name: robot_robot1dautu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.robot_robot1dautu (id, "user", ma_don_hang_bihama, cong_ty, loai_hinh_bao_hiem, goi_san_pham_chinh, goi_san_pham_phu, so_phi_chinh, tong_so_phi_phu, tong_phi_thanh_toan, gender, tuoi, thu_nhap_hang_nam, khi_dau_tu_ban_quan_tam_gi_nhat, co_hoi_nhan_thuong_chuong_trinh_truyen_hinh, y_tuong_rui_ro_trong_dau_tu, du_bao_gia_vang, tim_quy_dau_tu) FROM stdin;
\.


--
-- Data for Name: robot_robotchung; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.robot_robotchung (id, "user", ma_don_hang_bihama, cong_ty, loai_hinh_bao_hiem, goi_san_pham_chinh, goi_san_pham_phu, so_phi_chinh, tong_so_phi_phu, tong_phi_thanh_toan, gender, tuoi, tham_gia_bao_hiem_xa_hoi, tham_gia_bao_hiem_y_te, thu_nhap_hang_nam, muc_dich_tham_gia_bao_hiem, tinh_trang_hon_nhan, ban_dang_la) FROM stdin;
\.


--
-- Data for Name: termlife_goisanphamchinh; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.termlife_goisanphamchinh (id, ten_loai_hinh_bao_hiem, id_loai_hinh_bao_hiem, gioi_tinh, tuoi, so_nam_hop_dong, so_nam_dong_phi, cach_tra_phi, ten_goi_san_pham_chinh, id_goi_san_pham_chinh, so_phi_chinh_hang_nam, so_phi_chinh_hang_nua_nam, so_phi_chinh_hang_quy, so_phi_chinh_hang_thang, company_id) FROM stdin;
1	Sản phẩm tử kỳ	1	0	0	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
2	Sản phẩm tử kỳ	1	0	1	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
3	Sản phẩm tử kỳ	1	0	2	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
4	Sản phẩm tử kỳ	1	0	3	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
5	Sản phẩm tử kỳ	1	0	4	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
6	Sản phẩm tử kỳ	1	0	5	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
7	Sản phẩm tử kỳ	1	0	6	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
8	Sản phẩm tử kỳ	1	0	7	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
9	Sản phẩm tử kỳ	1	0	8	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
10	Sản phẩm tử kỳ	1	0	9	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
11	Sản phẩm tử kỳ	1	0	10	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
12	Sản phẩm tử kỳ	1	0	11	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
13	Sản phẩm tử kỳ	1	0	12	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
14	Sản phẩm tử kỳ	1	0	13	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
15	Sản phẩm tử kỳ	1	0	14	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
16	Sản phẩm tử kỳ	1	0	15	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
17	Sản phẩm tử kỳ	1	0	16	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
18	Sản phẩm tử kỳ	1	0	17	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
19	Sản phẩm tử kỳ	1	0	18	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
20	Sản phẩm tử kỳ	1	0	19	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
21	Sản phẩm tử kỳ	1	0	20	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
22	Sản phẩm tử kỳ	1	0	21	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
23	Sản phẩm tử kỳ	1	0	22	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
24	Sản phẩm tử kỳ	1	0	23	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
25	Sản phẩm tử kỳ	1	0	24	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
26	Sản phẩm tử kỳ	1	0	25	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
27	Sản phẩm tử kỳ	1	0	26	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
28	Sản phẩm tử kỳ	1	0	27	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
29	Sản phẩm tử kỳ	1	0	28	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
30	Sản phẩm tử kỳ	1	0	29	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
31	Sản phẩm tử kỳ	1	0	30	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
32	Sản phẩm tử kỳ	1	0	31	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
33	Sản phẩm tử kỳ	1	0	32	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
34	Sản phẩm tử kỳ	1	0	33	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
35	Sản phẩm tử kỳ	1	0	34	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
36	Sản phẩm tử kỳ	1	0	35	2	1	1	Hoàn lại phí đóng	1	0.228000000000000008	0	0	0	2
37	Sản phẩm tử kỳ	1	0	36	2	1	1	Hoàn lại phí đóng	1	0.258000000000000007	0	0	0	2
38	Sản phẩm tử kỳ	1	0	37	2	1	1	Hoàn lại phí đóng	1	0.258000000000000007	0	0	0	2
39	Sản phẩm tử kỳ	1	0	38	2	1	1	Hoàn lại phí đóng	1	0.258000000000000007	0	0	0	2
40	Sản phẩm tử kỳ	1	0	39	2	1	1	Hoàn lại phí đóng	1	0.258000000000000007	0	0	0	2
41	Sản phẩm tử kỳ	1	0	40	2	1	1	Hoàn lại phí đóng	1	0.258000000000000007	0	0	0	2
42	Sản phẩm tử kỳ	1	0	41	2	1	1	Hoàn lại phí đóng	1	0.258000000000000007	0	0	0	2
43	Sản phẩm tử kỳ	1	0	42	2	1	1	Hoàn lại phí đóng	1	0.258000000000000007	0	0	0	2
44	Sản phẩm tử kỳ	1	0	43	2	1	1	Hoàn lại phí đóng	1	0.258000000000000007	0	0	0	2
45	Sản phẩm tử kỳ	1	0	44	2	1	1	Hoàn lại phí đóng	1	0.258000000000000007	0	0	0	2
46	Sản phẩm tử kỳ	1	0	45	2	1	1	Hoàn lại phí đóng	1	0.258000000000000007	0	0	0	2
47	Sản phẩm tử kỳ	1	0	46	2	1	1	Hoàn lại phí đóng	1	0.306999999999999995	0	0	0	2
48	Sản phẩm tử kỳ	1	0	47	2	1	1	Hoàn lại phí đóng	1	0.306999999999999995	0	0	0	2
49	Sản phẩm tử kỳ	1	0	48	2	1	1	Hoàn lại phí đóng	1	0.306999999999999995	0	0	0	2
50	Sản phẩm tử kỳ	1	0	49	2	1	1	Hoàn lại phí đóng	1	0.306999999999999995	0	0	0	2
51	Sản phẩm tử kỳ	1	0	50	2	1	1	Hoàn lại phí đóng	1	0.306999999999999995	0	0	0	2
52	Sản phẩm tử kỳ	1	0	51	2	1	1	Hoàn lại phí đóng	1	0.306999999999999995	0	0	0	2
53	Sản phẩm tử kỳ	1	0	52	2	1	1	Hoàn lại phí đóng	1	0.306999999999999995	0	0	0	2
54	Sản phẩm tử kỳ	1	0	53	2	1	1	Hoàn lại phí đóng	1	0.306999999999999995	0	0	0	2
55	Sản phẩm tử kỳ	1	0	54	2	1	1	Hoàn lại phí đóng	1	0.306999999999999995	0	0	0	2
56	Sản phẩm tử kỳ	1	0	55	2	1	1	Hoàn lại phí đóng	1	0.306999999999999995	0	0	0	2
57	Sản phẩm tử kỳ	1	0	0	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
58	Sản phẩm tử kỳ	1	0	1	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
59	Sản phẩm tử kỳ	1	0	2	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
60	Sản phẩm tử kỳ	1	0	3	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
61	Sản phẩm tử kỳ	1	0	4	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
62	Sản phẩm tử kỳ	1	0	5	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
63	Sản phẩm tử kỳ	1	0	6	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
64	Sản phẩm tử kỳ	1	0	7	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
65	Sản phẩm tử kỳ	1	0	8	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
66	Sản phẩm tử kỳ	1	0	9	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
67	Sản phẩm tử kỳ	1	0	10	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
68	Sản phẩm tử kỳ	1	0	11	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
69	Sản phẩm tử kỳ	1	0	12	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
70	Sản phẩm tử kỳ	1	0	13	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
71	Sản phẩm tử kỳ	1	0	14	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
72	Sản phẩm tử kỳ	1	0	15	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
73	Sản phẩm tử kỳ	1	0	16	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
74	Sản phẩm tử kỳ	1	0	17	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
75	Sản phẩm tử kỳ	1	0	18	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
76	Sản phẩm tử kỳ	1	0	19	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
77	Sản phẩm tử kỳ	1	0	20	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
78	Sản phẩm tử kỳ	1	0	21	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
79	Sản phẩm tử kỳ	1	0	22	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
80	Sản phẩm tử kỳ	1	0	23	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
81	Sản phẩm tử kỳ	1	0	24	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
82	Sản phẩm tử kỳ	1	0	25	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
83	Sản phẩm tử kỳ	1	0	26	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
84	Sản phẩm tử kỳ	1	0	27	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
85	Sản phẩm tử kỳ	1	0	28	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
86	Sản phẩm tử kỳ	1	0	29	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
87	Sản phẩm tử kỳ	1	0	30	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
88	Sản phẩm tử kỳ	1	0	31	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
89	Sản phẩm tử kỳ	1	0	32	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
90	Sản phẩm tử kỳ	1	0	33	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
91	Sản phẩm tử kỳ	1	0	34	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
92	Sản phẩm tử kỳ	1	0	35	3	1	1	Hoàn lại phí đóng	1	0.233999999999999986	0	0	0	2
93	Sản phẩm tử kỳ	1	0	36	3	1	1	Hoàn lại phí đóng	1	0.264000000000000012	0	0	0	2
94	Sản phẩm tử kỳ	1	0	37	3	1	1	Hoàn lại phí đóng	1	0.264000000000000012	0	0	0	2
95	Sản phẩm tử kỳ	1	0	38	3	1	1	Hoàn lại phí đóng	1	0.264000000000000012	0	0	0	2
96	Sản phẩm tử kỳ	1	0	39	3	1	1	Hoàn lại phí đóng	1	0.264000000000000012	0	0	0	2
97	Sản phẩm tử kỳ	1	0	40	3	1	1	Hoàn lại phí đóng	1	0.264000000000000012	0	0	0	2
98	Sản phẩm tử kỳ	1	0	41	3	1	1	Hoàn lại phí đóng	1	0.264000000000000012	0	0	0	2
99	Sản phẩm tử kỳ	1	0	42	3	1	1	Hoàn lại phí đóng	1	0.264000000000000012	0	0	0	2
100	Sản phẩm tử kỳ	1	0	43	3	1	1	Hoàn lại phí đóng	1	0.264000000000000012	0	0	0	2
101	Sản phẩm tử kỳ	1	0	44	3	1	1	Hoàn lại phí đóng	1	0.264000000000000012	0	0	0	2
102	Sản phẩm tử kỳ	1	0	45	3	1	1	Hoàn lại phí đóng	1	0.264000000000000012	0	0	0	2
103	Sản phẩm tử kỳ	1	0	46	3	1	1	Hoàn lại phí đóng	1	0.314000000000000001	0	0	0	2
104	Sản phẩm tử kỳ	1	0	47	3	1	1	Hoàn lại phí đóng	1	0.314000000000000001	0	0	0	2
105	Sản phẩm tử kỳ	1	0	48	3	1	1	Hoàn lại phí đóng	1	0.314000000000000001	0	0	0	2
106	Sản phẩm tử kỳ	1	0	49	3	1	1	Hoàn lại phí đóng	1	0.314000000000000001	0	0	0	2
107	Sản phẩm tử kỳ	1	0	50	3	1	1	Hoàn lại phí đóng	1	0.314000000000000001	0	0	0	2
108	Sản phẩm tử kỳ	1	0	51	3	1	1	Hoàn lại phí đóng	1	0.314000000000000001	0	0	0	2
109	Sản phẩm tử kỳ	1	0	52	3	1	1	Hoàn lại phí đóng	1	0.314000000000000001	0	0	0	2
110	Sản phẩm tử kỳ	1	0	53	3	1	1	Hoàn lại phí đóng	1	0.314000000000000001	0	0	0	2
111	Sản phẩm tử kỳ	1	0	54	3	1	1	Hoàn lại phí đóng	1	0.314000000000000001	0	0	0	2
112	Sản phẩm tử kỳ	1	0	55	3	1	1	Hoàn lại phí đóng	1	0.314000000000000001	0	0	0	2
113	Sản phẩm tử kỳ	1	0	0	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
114	Sản phẩm tử kỳ	1	0	1	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
115	Sản phẩm tử kỳ	1	0	2	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
116	Sản phẩm tử kỳ	1	0	3	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
117	Sản phẩm tử kỳ	1	0	4	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
118	Sản phẩm tử kỳ	1	0	5	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
119	Sản phẩm tử kỳ	1	0	6	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
120	Sản phẩm tử kỳ	1	0	7	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
121	Sản phẩm tử kỳ	1	0	8	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
122	Sản phẩm tử kỳ	1	0	9	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
123	Sản phẩm tử kỳ	1	0	10	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
124	Sản phẩm tử kỳ	1	0	11	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
125	Sản phẩm tử kỳ	1	0	12	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
126	Sản phẩm tử kỳ	1	0	13	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
127	Sản phẩm tử kỳ	1	0	14	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
128	Sản phẩm tử kỳ	1	0	15	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
129	Sản phẩm tử kỳ	1	0	16	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
130	Sản phẩm tử kỳ	1	0	17	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
131	Sản phẩm tử kỳ	1	0	18	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
132	Sản phẩm tử kỳ	1	0	19	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
133	Sản phẩm tử kỳ	1	0	20	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
134	Sản phẩm tử kỳ	1	0	21	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
135	Sản phẩm tử kỳ	1	0	22	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
136	Sản phẩm tử kỳ	1	0	23	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
137	Sản phẩm tử kỳ	1	0	24	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
138	Sản phẩm tử kỳ	1	0	25	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
139	Sản phẩm tử kỳ	1	0	26	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
140	Sản phẩm tử kỳ	1	0	27	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
141	Sản phẩm tử kỳ	1	0	28	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
142	Sản phẩm tử kỳ	1	0	29	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
143	Sản phẩm tử kỳ	1	0	30	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
144	Sản phẩm tử kỳ	1	0	31	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
145	Sản phẩm tử kỳ	1	0	32	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
146	Sản phẩm tử kỳ	1	0	33	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
147	Sản phẩm tử kỳ	1	0	34	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
148	Sản phẩm tử kỳ	1	0	35	3	3	2	Hoàn lại phí đóng	1	0.145999999999999991	0.0759200000000000014	0.0382520000000000013	0.0128479999999999983	2
149	Sản phẩm tử kỳ	1	0	36	3	3	2	Hoàn lại phí đóng	1	0.166000000000000009	0.0863200000000000078	0.0434920000000000029	0.0146080000000000012	2
150	Sản phẩm tử kỳ	1	0	37	3	3	2	Hoàn lại phí đóng	1	0.166000000000000009	0.0863200000000000078	0.0434920000000000029	0.0146080000000000012	2
151	Sản phẩm tử kỳ	1	0	38	3	3	2	Hoàn lại phí đóng	1	0.166000000000000009	0.0863200000000000078	0.0434920000000000029	0.0146080000000000012	2
152	Sản phẩm tử kỳ	1	0	39	3	3	2	Hoàn lại phí đóng	1	0.166000000000000009	0.0863200000000000078	0.0434920000000000029	0.0146080000000000012	2
153	Sản phẩm tử kỳ	1	0	40	3	3	2	Hoàn lại phí đóng	1	0.166000000000000009	0.0863200000000000078	0.0434920000000000029	0.0146080000000000012	2
154	Sản phẩm tử kỳ	1	0	41	3	3	2	Hoàn lại phí đóng	1	0.166000000000000009	0.0863200000000000078	0.0434920000000000029	0.0146080000000000012	2
155	Sản phẩm tử kỳ	1	0	42	3	3	2	Hoàn lại phí đóng	1	0.166000000000000009	0.0863200000000000078	0.0434920000000000029	0.0146080000000000012	2
156	Sản phẩm tử kỳ	1	0	43	3	3	2	Hoàn lại phí đóng	1	0.166000000000000009	0.0863200000000000078	0.0434920000000000029	0.0146080000000000012	2
157	Sản phẩm tử kỳ	1	0	44	3	3	2	Hoàn lại phí đóng	1	0.166000000000000009	0.0863200000000000078	0.0434920000000000029	0.0146080000000000012	2
158	Sản phẩm tử kỳ	1	0	45	3	3	2	Hoàn lại phí đóng	1	0.166000000000000009	0.0863200000000000078	0.0434920000000000029	0.0146080000000000012	2
159	Sản phẩm tử kỳ	1	0	46	3	3	2	Hoàn lại phí đóng	1	0.209999999999999992	0.109200000000000005	0.0550200000000000064	0.0184799999999999999	2
160	Sản phẩm tử kỳ	1	0	47	3	3	2	Hoàn lại phí đóng	1	0.209999999999999992	0.109200000000000005	0.0550200000000000064	0.0184799999999999999	2
161	Sản phẩm tử kỳ	1	0	48	3	3	2	Hoàn lại phí đóng	1	0.209999999999999992	0.109200000000000005	0.0550200000000000064	0.0184799999999999999	2
162	Sản phẩm tử kỳ	1	0	49	3	3	2	Hoàn lại phí đóng	1	0.209999999999999992	0.109200000000000005	0.0550200000000000064	0.0184799999999999999	2
163	Sản phẩm tử kỳ	1	0	50	3	3	2	Hoàn lại phí đóng	1	0.209999999999999992	0.109200000000000005	0.0550200000000000064	0.0184799999999999999	2
164	Sản phẩm tử kỳ	1	0	51	3	3	2	Hoàn lại phí đóng	1	0.209999999999999992	0.109200000000000005	0.0550200000000000064	0.0184799999999999999	2
165	Sản phẩm tử kỳ	1	0	52	3	3	2	Hoàn lại phí đóng	1	0.209999999999999992	0.109200000000000005	0.0550200000000000064	0.0184799999999999999	2
166	Sản phẩm tử kỳ	1	0	53	3	3	2	Hoàn lại phí đóng	1	0.209999999999999992	0.109200000000000005	0.0550200000000000064	0.0184799999999999999	2
167	Sản phẩm tử kỳ	1	0	54	3	3	2	Hoàn lại phí đóng	1	0.209999999999999992	0.109200000000000005	0.0550200000000000064	0.0184799999999999999	2
168	Sản phẩm tử kỳ	1	0	55	3	3	2	Hoàn lại phí đóng	1	0.209999999999999992	0.109200000000000005	0.0550200000000000064	0.0184799999999999999	2
169	Sản phẩm tử kỳ	1	0	0	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
170	Sản phẩm tử kỳ	1	0	1	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
171	Sản phẩm tử kỳ	1	0	2	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
172	Sản phẩm tử kỳ	1	0	3	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
173	Sản phẩm tử kỳ	1	0	4	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
174	Sản phẩm tử kỳ	1	0	5	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
175	Sản phẩm tử kỳ	1	0	6	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
176	Sản phẩm tử kỳ	1	0	7	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
177	Sản phẩm tử kỳ	1	0	8	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
178	Sản phẩm tử kỳ	1	0	9	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
179	Sản phẩm tử kỳ	1	0	10	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
180	Sản phẩm tử kỳ	1	0	11	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
181	Sản phẩm tử kỳ	1	0	12	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
182	Sản phẩm tử kỳ	1	0	13	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
183	Sản phẩm tử kỳ	1	0	14	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
184	Sản phẩm tử kỳ	1	0	15	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
185	Sản phẩm tử kỳ	1	0	16	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
186	Sản phẩm tử kỳ	1	0	17	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
187	Sản phẩm tử kỳ	1	0	18	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
188	Sản phẩm tử kỳ	1	0	19	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
189	Sản phẩm tử kỳ	1	0	20	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
190	Sản phẩm tử kỳ	1	0	21	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
191	Sản phẩm tử kỳ	1	0	22	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
192	Sản phẩm tử kỳ	1	0	23	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
193	Sản phẩm tử kỳ	1	0	24	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
194	Sản phẩm tử kỳ	1	0	25	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
195	Sản phẩm tử kỳ	1	0	26	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
196	Sản phẩm tử kỳ	1	0	27	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
197	Sản phẩm tử kỳ	1	0	28	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
198	Sản phẩm tử kỳ	1	0	29	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
199	Sản phẩm tử kỳ	1	0	30	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
200	Sản phẩm tử kỳ	1	0	31	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
201	Sản phẩm tử kỳ	1	0	32	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
202	Sản phẩm tử kỳ	1	0	33	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
203	Sản phẩm tử kỳ	1	0	34	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
204	Sản phẩm tử kỳ	1	0	35	5	1	1	Hoàn lại phí đóng	1	0.239999999999999991	0	0	0	2
205	Sản phẩm tử kỳ	1	0	36	5	1	1	Hoàn lại phí đóng	1	0.270000000000000018	0	0	0	2
206	Sản phẩm tử kỳ	1	0	37	5	1	1	Hoàn lại phí đóng	1	0.270000000000000018	0	0	0	2
207	Sản phẩm tử kỳ	1	0	38	5	1	1	Hoàn lại phí đóng	1	0.270000000000000018	0	0	0	2
208	Sản phẩm tử kỳ	1	0	39	5	1	1	Hoàn lại phí đóng	1	0.270000000000000018	0	0	0	2
209	Sản phẩm tử kỳ	1	0	40	5	1	1	Hoàn lại phí đóng	1	0.270000000000000018	0	0	0	2
210	Sản phẩm tử kỳ	1	0	41	5	1	1	Hoàn lại phí đóng	1	0.270000000000000018	0	0	0	2
211	Sản phẩm tử kỳ	1	0	42	5	1	1	Hoàn lại phí đóng	1	0.270000000000000018	0	0	0	2
212	Sản phẩm tử kỳ	1	0	43	5	1	1	Hoàn lại phí đóng	1	0.270000000000000018	0	0	0	2
213	Sản phẩm tử kỳ	1	0	44	5	1	1	Hoàn lại phí đóng	1	0.270000000000000018	0	0	0	2
214	Sản phẩm tử kỳ	1	0	45	5	1	1	Hoàn lại phí đóng	1	0.270000000000000018	0	0	0	2
215	Sản phẩm tử kỳ	1	0	46	5	1	1	Hoàn lại phí đóng	1	0.321000000000000008	0	0	0	2
216	Sản phẩm tử kỳ	1	0	47	5	1	1	Hoàn lại phí đóng	1	0.321000000000000008	0	0	0	2
217	Sản phẩm tử kỳ	1	0	48	5	1	1	Hoàn lại phí đóng	1	0.321000000000000008	0	0	0	2
218	Sản phẩm tử kỳ	1	0	49	5	1	1	Hoàn lại phí đóng	1	0.321000000000000008	0	0	0	2
219	Sản phẩm tử kỳ	1	0	50	5	1	1	Hoàn lại phí đóng	1	0.321000000000000008	0	0	0	2
220	Sản phẩm tử kỳ	1	0	51	5	1	1	Hoàn lại phí đóng	1	0.321000000000000008	0	0	0	2
221	Sản phẩm tử kỳ	1	0	52	5	1	1	Hoàn lại phí đóng	1	0.321000000000000008	0	0	0	2
222	Sản phẩm tử kỳ	1	0	53	5	1	1	Hoàn lại phí đóng	1	0.321000000000000008	0	0	0	2
223	Sản phẩm tử kỳ	1	0	54	5	1	1	Hoàn lại phí đóng	1	0.321000000000000008	0	0	0	2
224	Sản phẩm tử kỳ	1	0	55	5	1	1	Hoàn lại phí đóng	1	0.321000000000000008	0	0	0	2
225	Sản phẩm tử kỳ	1	0	0	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
226	Sản phẩm tử kỳ	1	0	1	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
227	Sản phẩm tử kỳ	1	0	2	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
228	Sản phẩm tử kỳ	1	0	3	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
229	Sản phẩm tử kỳ	1	0	4	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
230	Sản phẩm tử kỳ	1	0	5	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
231	Sản phẩm tử kỳ	1	0	6	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
232	Sản phẩm tử kỳ	1	0	7	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
233	Sản phẩm tử kỳ	1	0	8	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
234	Sản phẩm tử kỳ	1	0	9	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
235	Sản phẩm tử kỳ	1	0	10	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
236	Sản phẩm tử kỳ	1	0	11	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
237	Sản phẩm tử kỳ	1	0	12	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
238	Sản phẩm tử kỳ	1	0	13	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
239	Sản phẩm tử kỳ	1	0	14	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
240	Sản phẩm tử kỳ	1	0	15	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
241	Sản phẩm tử kỳ	1	0	16	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
242	Sản phẩm tử kỳ	1	0	17	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
243	Sản phẩm tử kỳ	1	0	18	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
244	Sản phẩm tử kỳ	1	0	19	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
245	Sản phẩm tử kỳ	1	0	20	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
246	Sản phẩm tử kỳ	1	0	21	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
247	Sản phẩm tử kỳ	1	0	22	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
248	Sản phẩm tử kỳ	1	0	23	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
249	Sản phẩm tử kỳ	1	0	24	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
250	Sản phẩm tử kỳ	1	0	25	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
251	Sản phẩm tử kỳ	1	0	26	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
252	Sản phẩm tử kỳ	1	0	27	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
253	Sản phẩm tử kỳ	1	0	28	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
254	Sản phẩm tử kỳ	1	0	29	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
255	Sản phẩm tử kỳ	1	0	30	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
256	Sản phẩm tử kỳ	1	0	31	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
257	Sản phẩm tử kỳ	1	0	32	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
258	Sản phẩm tử kỳ	1	0	33	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
259	Sản phẩm tử kỳ	1	0	34	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
260	Sản phẩm tử kỳ	1	0	35	5	5	2	Hoàn lại phí đóng	1	0.134000000000000008	0.0696799999999999919	0.0351080000000000003	0.0117920000000000004	2
261	Sản phẩm tử kỳ	1	0	36	5	5	2	Hoàn lại phí đóng	1	0.149999999999999994	0.0779999999999999999	0.0393000000000000016	0.0131999999999999999	2
262	Sản phẩm tử kỳ	1	0	37	5	5	2	Hoàn lại phí đóng	1	0.149999999999999994	0.0779999999999999999	0.0393000000000000016	0.0131999999999999999	2
263	Sản phẩm tử kỳ	1	0	38	5	5	2	Hoàn lại phí đóng	1	0.149999999999999994	0.0779999999999999999	0.0393000000000000016	0.0131999999999999999	2
264	Sản phẩm tử kỳ	1	0	39	5	5	2	Hoàn lại phí đóng	1	0.149999999999999994	0.0779999999999999999	0.0393000000000000016	0.0131999999999999999	2
265	Sản phẩm tử kỳ	1	0	40	5	5	2	Hoàn lại phí đóng	1	0.149999999999999994	0.0779999999999999999	0.0393000000000000016	0.0131999999999999999	2
266	Sản phẩm tử kỳ	1	0	41	5	5	2	Hoàn lại phí đóng	1	0.149999999999999994	0.0779999999999999999	0.0393000000000000016	0.0131999999999999999	2
267	Sản phẩm tử kỳ	1	0	42	5	5	2	Hoàn lại phí đóng	1	0.149999999999999994	0.0779999999999999999	0.0393000000000000016	0.0131999999999999999	2
268	Sản phẩm tử kỳ	1	0	43	5	5	2	Hoàn lại phí đóng	1	0.149999999999999994	0.0779999999999999999	0.0393000000000000016	0.0131999999999999999	2
269	Sản phẩm tử kỳ	1	0	44	5	5	2	Hoàn lại phí đóng	1	0.149999999999999994	0.0779999999999999999	0.0393000000000000016	0.0131999999999999999	2
270	Sản phẩm tử kỳ	1	0	45	5	5	2	Hoàn lại phí đóng	1	0.149999999999999994	0.0779999999999999999	0.0393000000000000016	0.0131999999999999999	2
271	Sản phẩm tử kỳ	1	0	46	5	5	2	Hoàn lại phí đóng	1	0.193999999999999978	0.100879999999999997	0.0508279999999999982	0.0170720000000000004	2
272	Sản phẩm tử kỳ	1	0	47	5	5	2	Hoàn lại phí đóng	1	0.193999999999999978	0.100879999999999997	0.0508279999999999982	0.0170720000000000004	2
273	Sản phẩm tử kỳ	1	0	48	5	5	2	Hoàn lại phí đóng	1	0.193999999999999978	0.100879999999999997	0.0508279999999999982	0.0170720000000000004	2
274	Sản phẩm tử kỳ	1	0	49	5	5	2	Hoàn lại phí đóng	1	0.193999999999999978	0.100879999999999997	0.0508279999999999982	0.0170720000000000004	2
275	Sản phẩm tử kỳ	1	0	50	5	5	2	Hoàn lại phí đóng	1	0.193999999999999978	0.100879999999999997	0.0508279999999999982	0.0170720000000000004	2
276	Sản phẩm tử kỳ	1	0	51	5	5	2	Hoàn lại phí đóng	1	0.193999999999999978	0.100879999999999997	0.0508279999999999982	0.0170720000000000004	2
277	Sản phẩm tử kỳ	1	0	52	5	5	2	Hoàn lại phí đóng	1	0.193999999999999978	0.100879999999999997	0.0508279999999999982	0.0170720000000000004	2
278	Sản phẩm tử kỳ	1	0	53	5	5	2	Hoàn lại phí đóng	1	0.193999999999999978	0.100879999999999997	0.0508279999999999982	0.0170720000000000004	2
279	Sản phẩm tử kỳ	1	0	54	5	5	2	Hoàn lại phí đóng	1	0.193999999999999978	0.100879999999999997	0.0508279999999999982	0.0170720000000000004	2
280	Sản phẩm tử kỳ	1	0	55	5	5	2	Hoàn lại phí đóng	1	0.193999999999999978	0.100879999999999997	0.0508279999999999982	0.0170720000000000004	2
281	Sản phẩm tử kỳ	1	0	0	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
282	Sản phẩm tử kỳ	1	0	1	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
283	Sản phẩm tử kỳ	1	0	2	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
284	Sản phẩm tử kỳ	1	0	3	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
285	Sản phẩm tử kỳ	1	0	4	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
286	Sản phẩm tử kỳ	1	0	5	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
287	Sản phẩm tử kỳ	1	0	6	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
288	Sản phẩm tử kỳ	1	0	7	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
289	Sản phẩm tử kỳ	1	0	8	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
290	Sản phẩm tử kỳ	1	0	9	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
291	Sản phẩm tử kỳ	1	0	10	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
292	Sản phẩm tử kỳ	1	0	11	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
293	Sản phẩm tử kỳ	1	0	12	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
294	Sản phẩm tử kỳ	1	0	13	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
295	Sản phẩm tử kỳ	1	0	14	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
296	Sản phẩm tử kỳ	1	0	15	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
297	Sản phẩm tử kỳ	1	0	16	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
298	Sản phẩm tử kỳ	1	0	17	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
299	Sản phẩm tử kỳ	1	0	18	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
300	Sản phẩm tử kỳ	1	0	19	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
301	Sản phẩm tử kỳ	1	0	20	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
302	Sản phẩm tử kỳ	1	0	21	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
303	Sản phẩm tử kỳ	1	0	22	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
304	Sản phẩm tử kỳ	1	0	23	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
305	Sản phẩm tử kỳ	1	0	24	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
306	Sản phẩm tử kỳ	1	0	25	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
307	Sản phẩm tử kỳ	1	0	26	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
308	Sản phẩm tử kỳ	1	0	27	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
309	Sản phẩm tử kỳ	1	0	28	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
310	Sản phẩm tử kỳ	1	0	29	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
311	Sản phẩm tử kỳ	1	0	30	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
312	Sản phẩm tử kỳ	1	0	31	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
313	Sản phẩm tử kỳ	1	0	32	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
314	Sản phẩm tử kỳ	1	0	33	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
315	Sản phẩm tử kỳ	1	0	34	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
316	Sản phẩm tử kỳ	1	0	35	7	1	1	Hoàn lại phí đóng	1	0.246000000000000024	0	0	0	2
317	Sản phẩm tử kỳ	1	0	36	7	1	1	Hoàn lại phí đóng	1	0.276000000000000023	0	0	0	2
318	Sản phẩm tử kỳ	1	0	37	7	1	1	Hoàn lại phí đóng	1	0.276000000000000023	0	0	0	2
319	Sản phẩm tử kỳ	1	0	38	7	1	1	Hoàn lại phí đóng	1	0.276000000000000023	0	0	0	2
320	Sản phẩm tử kỳ	1	0	39	7	1	1	Hoàn lại phí đóng	1	0.276000000000000023	0	0	0	2
321	Sản phẩm tử kỳ	1	0	40	7	1	1	Hoàn lại phí đóng	1	0.276000000000000023	0	0	0	2
322	Sản phẩm tử kỳ	1	0	41	7	1	1	Hoàn lại phí đóng	1	0.276000000000000023	0	0	0	2
323	Sản phẩm tử kỳ	1	0	42	7	1	1	Hoàn lại phí đóng	1	0.276000000000000023	0	0	0	2
324	Sản phẩm tử kỳ	1	0	43	7	1	1	Hoàn lại phí đóng	1	0.276000000000000023	0	0	0	2
325	Sản phẩm tử kỳ	1	0	44	7	1	1	Hoàn lại phí đóng	1	0.276000000000000023	0	0	0	2
326	Sản phẩm tử kỳ	1	0	45	7	1	1	Hoàn lại phí đóng	1	0.276000000000000023	0	0	0	2
327	Sản phẩm tử kỳ	1	0	46	7	1	1	Hoàn lại phí đóng	1	0.327999999999999958	0	0	0	2
328	Sản phẩm tử kỳ	1	0	47	7	1	1	Hoàn lại phí đóng	1	0.327999999999999958	0	0	0	2
329	Sản phẩm tử kỳ	1	0	48	7	1	1	Hoàn lại phí đóng	1	0.327999999999999958	0	0	0	2
330	Sản phẩm tử kỳ	1	0	49	7	1	1	Hoàn lại phí đóng	1	0.327999999999999958	0	0	0	2
331	Sản phẩm tử kỳ	1	0	50	7	1	1	Hoàn lại phí đóng	1	0.327999999999999958	0	0	0	2
332	Sản phẩm tử kỳ	1	0	51	7	1	1	Hoàn lại phí đóng	1	0.327999999999999958	0	0	0	2
333	Sản phẩm tử kỳ	1	0	52	7	1	1	Hoàn lại phí đóng	1	0.327999999999999958	0	0	0	2
334	Sản phẩm tử kỳ	1	0	53	7	1	1	Hoàn lại phí đóng	1	0.327999999999999958	0	0	0	2
335	Sản phẩm tử kỳ	1	0	54	7	1	1	Hoàn lại phí đóng	1	0.327999999999999958	0	0	0	2
336	Sản phẩm tử kỳ	1	0	55	7	1	1	Hoàn lại phí đóng	1	0.327999999999999958	0	0	0	2
337	Sản phẩm tử kỳ	1	0	0	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
338	Sản phẩm tử kỳ	1	0	1	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
339	Sản phẩm tử kỳ	1	0	2	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
340	Sản phẩm tử kỳ	1	0	3	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
341	Sản phẩm tử kỳ	1	0	4	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
342	Sản phẩm tử kỳ	1	0	5	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
343	Sản phẩm tử kỳ	1	0	6	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
344	Sản phẩm tử kỳ	1	0	7	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
345	Sản phẩm tử kỳ	1	0	8	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
346	Sản phẩm tử kỳ	1	0	9	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
347	Sản phẩm tử kỳ	1	0	10	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
348	Sản phẩm tử kỳ	1	0	11	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
349	Sản phẩm tử kỳ	1	0	12	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
350	Sản phẩm tử kỳ	1	0	13	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
351	Sản phẩm tử kỳ	1	0	14	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
352	Sản phẩm tử kỳ	1	0	15	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
353	Sản phẩm tử kỳ	1	0	16	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
354	Sản phẩm tử kỳ	1	0	17	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
355	Sản phẩm tử kỳ	1	0	18	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
356	Sản phẩm tử kỳ	1	0	19	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
357	Sản phẩm tử kỳ	1	0	20	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
358	Sản phẩm tử kỳ	1	0	21	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
359	Sản phẩm tử kỳ	1	0	22	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
360	Sản phẩm tử kỳ	1	0	23	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
361	Sản phẩm tử kỳ	1	0	24	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
362	Sản phẩm tử kỳ	1	0	25	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
363	Sản phẩm tử kỳ	1	0	26	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
364	Sản phẩm tử kỳ	1	0	27	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
365	Sản phẩm tử kỳ	1	0	28	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
366	Sản phẩm tử kỳ	1	0	29	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
367	Sản phẩm tử kỳ	1	0	30	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
368	Sản phẩm tử kỳ	1	0	31	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
369	Sản phẩm tử kỳ	1	0	32	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
370	Sản phẩm tử kỳ	1	0	33	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
371	Sản phẩm tử kỳ	1	0	34	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
372	Sản phẩm tử kỳ	1	0	35	7	7	2	Hoàn lại phí đóng	1	0.121999999999999997	0.0634399999999999964	0.0319639999999999994	0.0107360000000000008	2
373	Sản phẩm tử kỳ	1	0	36	7	7	2	Hoàn lại phí đóng	1	0.13600000000000001	0.0707200000000000051	0.035631999999999997	0.0119680000000000012	2
374	Sản phẩm tử kỳ	1	0	37	7	7	2	Hoàn lại phí đóng	1	0.13600000000000001	0.0707200000000000051	0.035631999999999997	0.0119680000000000012	2
375	Sản phẩm tử kỳ	1	0	38	7	7	2	Hoàn lại phí đóng	1	0.13600000000000001	0.0707200000000000051	0.035631999999999997	0.0119680000000000012	2
376	Sản phẩm tử kỳ	1	0	39	7	7	2	Hoàn lại phí đóng	1	0.13600000000000001	0.0707200000000000051	0.035631999999999997	0.0119680000000000012	2
377	Sản phẩm tử kỳ	1	0	40	7	7	2	Hoàn lại phí đóng	1	0.13600000000000001	0.0707200000000000051	0.035631999999999997	0.0119680000000000012	2
378	Sản phẩm tử kỳ	1	0	41	7	7	2	Hoàn lại phí đóng	1	0.13600000000000001	0.0707200000000000051	0.035631999999999997	0.0119680000000000012	2
379	Sản phẩm tử kỳ	1	0	42	7	7	2	Hoàn lại phí đóng	1	0.13600000000000001	0.0707200000000000051	0.035631999999999997	0.0119680000000000012	2
380	Sản phẩm tử kỳ	1	0	43	7	7	2	Hoàn lại phí đóng	1	0.13600000000000001	0.0707200000000000051	0.035631999999999997	0.0119680000000000012	2
381	Sản phẩm tử kỳ	1	0	44	7	7	2	Hoàn lại phí đóng	1	0.13600000000000001	0.0707200000000000051	0.035631999999999997	0.0119680000000000012	2
382	Sản phẩm tử kỳ	1	0	45	7	7	2	Hoàn lại phí đóng	1	0.13600000000000001	0.0707200000000000051	0.035631999999999997	0.0119680000000000012	2
383	Sản phẩm tử kỳ	1	0	46	7	7	2	Hoàn lại phí đóng	1	0.178000000000000019	0.0925600000000000034	0.0466360000000000038	0.0156639999999999974	2
384	Sản phẩm tử kỳ	1	0	47	7	7	2	Hoàn lại phí đóng	1	0.178000000000000019	0.0925600000000000034	0.0466360000000000038	0.0156639999999999974	2
385	Sản phẩm tử kỳ	1	0	48	7	7	2	Hoàn lại phí đóng	1	0.178000000000000019	0.0925600000000000034	0.0466360000000000038	0.0156639999999999974	2
386	Sản phẩm tử kỳ	1	0	49	7	7	2	Hoàn lại phí đóng	1	0.178000000000000019	0.0925600000000000034	0.0466360000000000038	0.0156639999999999974	2
387	Sản phẩm tử kỳ	1	0	50	7	7	2	Hoàn lại phí đóng	1	0.178000000000000019	0.0925600000000000034	0.0466360000000000038	0.0156639999999999974	2
388	Sản phẩm tử kỳ	1	0	51	7	7	2	Hoàn lại phí đóng	1	0.178000000000000019	0.0925600000000000034	0.0466360000000000038	0.0156639999999999974	2
389	Sản phẩm tử kỳ	1	0	52	7	7	2	Hoàn lại phí đóng	1	0.178000000000000019	0.0925600000000000034	0.0466360000000000038	0.0156639999999999974	2
390	Sản phẩm tử kỳ	1	0	53	7	7	2	Hoàn lại phí đóng	1	0.178000000000000019	0.0925600000000000034	0.0466360000000000038	0.0156639999999999974	2
391	Sản phẩm tử kỳ	1	0	54	7	7	2	Hoàn lại phí đóng	1	0.178000000000000019	0.0925600000000000034	0.0466360000000000038	0.0156639999999999974	2
392	Sản phẩm tử kỳ	1	0	55	7	7	2	Hoàn lại phí đóng	1	0.178000000000000019	0.0925600000000000034	0.0466360000000000038	0.0156639999999999974	2
393	Sản phẩm tử kỳ	1	0	0	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
394	Sản phẩm tử kỳ	1	0	1	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
395	Sản phẩm tử kỳ	1	0	2	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
396	Sản phẩm tử kỳ	1	0	3	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
397	Sản phẩm tử kỳ	1	0	4	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
398	Sản phẩm tử kỳ	1	0	5	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
399	Sản phẩm tử kỳ	1	0	6	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
400	Sản phẩm tử kỳ	1	0	7	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
401	Sản phẩm tử kỳ	1	0	8	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
402	Sản phẩm tử kỳ	1	0	9	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
403	Sản phẩm tử kỳ	1	0	10	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
404	Sản phẩm tử kỳ	1	0	11	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
405	Sản phẩm tử kỳ	1	0	12	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
406	Sản phẩm tử kỳ	1	0	13	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
407	Sản phẩm tử kỳ	1	0	14	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
408	Sản phẩm tử kỳ	1	0	15	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
409	Sản phẩm tử kỳ	1	0	16	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
410	Sản phẩm tử kỳ	1	0	17	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
411	Sản phẩm tử kỳ	1	0	18	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
412	Sản phẩm tử kỳ	1	0	19	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
413	Sản phẩm tử kỳ	1	0	20	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
414	Sản phẩm tử kỳ	1	0	21	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
415	Sản phẩm tử kỳ	1	0	22	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
416	Sản phẩm tử kỳ	1	0	23	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
417	Sản phẩm tử kỳ	1	0	24	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
418	Sản phẩm tử kỳ	1	0	25	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
419	Sản phẩm tử kỳ	1	0	26	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
420	Sản phẩm tử kỳ	1	0	27	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
421	Sản phẩm tử kỳ	1	0	28	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
422	Sản phẩm tử kỳ	1	0	29	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
423	Sản phẩm tử kỳ	1	0	30	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
424	Sản phẩm tử kỳ	1	0	31	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
425	Sản phẩm tử kỳ	1	0	32	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
426	Sản phẩm tử kỳ	1	0	33	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
427	Sản phẩm tử kỳ	1	0	34	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
428	Sản phẩm tử kỳ	1	0	35	10	1	1	Hoàn lại phí đóng	1	0.252000000000000002	0	0	0	2
429	Sản phẩm tử kỳ	1	0	36	10	1	1	Hoàn lại phí đóng	1	0.281999999999999973	0	0	0	2
430	Sản phẩm tử kỳ	1	0	37	10	1	1	Hoàn lại phí đóng	1	0.281999999999999973	0	0	0	2
431	Sản phẩm tử kỳ	1	0	38	10	1	1	Hoàn lại phí đóng	1	0.281999999999999973	0	0	0	2
432	Sản phẩm tử kỳ	1	0	39	10	1	1	Hoàn lại phí đóng	1	0.281999999999999973	0	0	0	2
433	Sản phẩm tử kỳ	1	0	40	10	1	1	Hoàn lại phí đóng	1	0.281999999999999973	0	0	0	2
434	Sản phẩm tử kỳ	1	0	41	10	1	1	Hoàn lại phí đóng	1	0.281999999999999973	0	0	0	2
435	Sản phẩm tử kỳ	1	0	42	10	1	1	Hoàn lại phí đóng	1	0.281999999999999973	0	0	0	2
436	Sản phẩm tử kỳ	1	0	43	10	1	1	Hoàn lại phí đóng	1	0.281999999999999973	0	0	0	2
437	Sản phẩm tử kỳ	1	0	44	10	1	1	Hoàn lại phí đóng	1	0.281999999999999973	0	0	0	2
438	Sản phẩm tử kỳ	1	0	45	10	1	1	Hoàn lại phí đóng	1	0.281999999999999973	0	0	0	2
439	Sản phẩm tử kỳ	1	0	46	10	1	1	Hoàn lại phí đóng	1	0.336000000000000021	0	0	0	2
440	Sản phẩm tử kỳ	1	0	47	10	1	1	Hoàn lại phí đóng	1	0.336000000000000021	0	0	0	2
441	Sản phẩm tử kỳ	1	0	48	10	1	1	Hoàn lại phí đóng	1	0.336000000000000021	0	0	0	2
442	Sản phẩm tử kỳ	1	0	49	10	1	1	Hoàn lại phí đóng	1	0.336000000000000021	0	0	0	2
443	Sản phẩm tử kỳ	1	0	50	10	1	1	Hoàn lại phí đóng	1	0.336000000000000021	0	0	0	2
444	Sản phẩm tử kỳ	1	0	51	10	1	1	Hoàn lại phí đóng	1	0.336000000000000021	0	0	0	2
445	Sản phẩm tử kỳ	1	0	52	10	1	1	Hoàn lại phí đóng	1	0.336000000000000021	0	0	0	2
446	Sản phẩm tử kỳ	1	0	53	10	1	1	Hoàn lại phí đóng	1	0.336000000000000021	0	0	0	2
447	Sản phẩm tử kỳ	1	0	54	10	1	1	Hoàn lại phí đóng	1	0.336000000000000021	0	0	0	2
448	Sản phẩm tử kỳ	1	0	55	10	1	1	Hoàn lại phí đóng	1	0.336000000000000021	0	0	0	2
449	Sản phẩm tử kỳ	1	0	0	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
450	Sản phẩm tử kỳ	1	0	1	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
451	Sản phẩm tử kỳ	1	0	2	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
452	Sản phẩm tử kỳ	1	0	3	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
453	Sản phẩm tử kỳ	1	0	4	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
454	Sản phẩm tử kỳ	1	0	5	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
455	Sản phẩm tử kỳ	1	0	6	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
456	Sản phẩm tử kỳ	1	0	7	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
457	Sản phẩm tử kỳ	1	0	8	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
458	Sản phẩm tử kỳ	1	0	9	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
459	Sản phẩm tử kỳ	1	0	10	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
460	Sản phẩm tử kỳ	1	0	11	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
461	Sản phẩm tử kỳ	1	0	12	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
462	Sản phẩm tử kỳ	1	0	13	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
463	Sản phẩm tử kỳ	1	0	14	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
464	Sản phẩm tử kỳ	1	0	15	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
465	Sản phẩm tử kỳ	1	0	16	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
466	Sản phẩm tử kỳ	1	0	17	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
467	Sản phẩm tử kỳ	1	0	18	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
468	Sản phẩm tử kỳ	1	0	19	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
469	Sản phẩm tử kỳ	1	0	20	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
470	Sản phẩm tử kỳ	1	0	21	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
471	Sản phẩm tử kỳ	1	0	22	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
472	Sản phẩm tử kỳ	1	0	23	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
473	Sản phẩm tử kỳ	1	0	24	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
474	Sản phẩm tử kỳ	1	0	25	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
475	Sản phẩm tử kỳ	1	0	26	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
476	Sản phẩm tử kỳ	1	0	27	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
477	Sản phẩm tử kỳ	1	0	28	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
478	Sản phẩm tử kỳ	1	0	29	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
479	Sản phẩm tử kỳ	1	0	30	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
480	Sản phẩm tử kỳ	1	0	31	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
481	Sản phẩm tử kỳ	1	0	32	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
482	Sản phẩm tử kỳ	1	0	33	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
483	Sản phẩm tử kỳ	1	0	34	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
484	Sản phẩm tử kỳ	1	0	35	10	10	2	Hoàn lại phí đóng	1	0.110000000000000001	0.0572000000000000008	0.0288199999999999984	0.00967999999999999937	2
485	Sản phẩm tử kỳ	1	0	36	10	10	2	Hoàn lại phí đóng	1	0.116999999999999993	0.0608399999999999982	0.0306540000000000007	0.0102959999999999996	2
486	Sản phẩm tử kỳ	1	0	37	10	10	2	Hoàn lại phí đóng	1	0.116999999999999993	0.0608399999999999982	0.0306540000000000007	0.0102959999999999996	2
487	Sản phẩm tử kỳ	1	0	38	10	10	2	Hoàn lại phí đóng	1	0.116999999999999993	0.0608399999999999982	0.0306540000000000007	0.0102959999999999996	2
488	Sản phẩm tử kỳ	1	0	39	10	10	2	Hoàn lại phí đóng	1	0.116999999999999993	0.0608399999999999982	0.0306540000000000007	0.0102959999999999996	2
489	Sản phẩm tử kỳ	1	0	40	10	10	2	Hoàn lại phí đóng	1	0.116999999999999993	0.0608399999999999982	0.0306540000000000007	0.0102959999999999996	2
490	Sản phẩm tử kỳ	1	0	41	10	10	2	Hoàn lại phí đóng	1	0.116999999999999993	0.0608399999999999982	0.0306540000000000007	0.0102959999999999996	2
491	Sản phẩm tử kỳ	1	0	42	10	10	2	Hoàn lại phí đóng	1	0.116999999999999993	0.0608399999999999982	0.0306540000000000007	0.0102959999999999996	2
492	Sản phẩm tử kỳ	1	0	43	10	10	2	Hoàn lại phí đóng	1	0.116999999999999993	0.0608399999999999982	0.0306540000000000007	0.0102959999999999996	2
493	Sản phẩm tử kỳ	1	0	44	10	10	2	Hoàn lại phí đóng	1	0.116999999999999993	0.0608399999999999982	0.0306540000000000007	0.0102959999999999996	2
494	Sản phẩm tử kỳ	1	0	45	10	10	2	Hoàn lại phí đóng	1	0.116999999999999993	0.0608399999999999982	0.0306540000000000007	0.0102959999999999996	2
495	Sản phẩm tử kỳ	1	0	46	10	10	2	Hoàn lại phí đóng	1	0.162000000000000005	0.0842399999999999954	0.0424440000000000026	0.0142559999999999996	2
496	Sản phẩm tử kỳ	1	0	47	10	10	2	Hoàn lại phí đóng	1	0.162000000000000005	0.0842399999999999954	0.0424440000000000026	0.0142559999999999996	2
497	Sản phẩm tử kỳ	1	0	48	10	10	2	Hoàn lại phí đóng	1	0.162000000000000005	0.0842399999999999954	0.0424440000000000026	0.0142559999999999996	2
498	Sản phẩm tử kỳ	1	0	49	10	10	2	Hoàn lại phí đóng	1	0.162000000000000005	0.0842399999999999954	0.0424440000000000026	0.0142559999999999996	2
499	Sản phẩm tử kỳ	1	0	50	10	10	2	Hoàn lại phí đóng	1	0.162000000000000005	0.0842399999999999954	0.0424440000000000026	0.0142559999999999996	2
500	Sản phẩm tử kỳ	1	0	51	10	10	2	Hoàn lại phí đóng	1	0.162000000000000005	0.0842399999999999954	0.0424440000000000026	0.0142559999999999996	2
501	Sản phẩm tử kỳ	1	0	52	10	10	2	Hoàn lại phí đóng	1	0.162000000000000005	0.0842399999999999954	0.0424440000000000026	0.0142559999999999996	2
502	Sản phẩm tử kỳ	1	0	53	10	10	2	Hoàn lại phí đóng	1	0.162000000000000005	0.0842399999999999954	0.0424440000000000026	0.0142559999999999996	2
503	Sản phẩm tử kỳ	1	0	54	10	10	2	Hoàn lại phí đóng	1	0.162000000000000005	0.0842399999999999954	0.0424440000000000026	0.0142559999999999996	2
504	Sản phẩm tử kỳ	1	0	55	10	10	2	Hoàn lại phí đóng	1	0.162000000000000005	0.0842399999999999954	0.0424440000000000026	0.0142559999999999996	2
505	Sản phẩm tử kỳ	1	1	18	10	10	2	Truyền thống	2	0.00400000000000000008	0.00208000000000000025	0	0	2
506	Sản phẩm tử kỳ	1	1	19	10	10	2	Truyền thống	2	0.00400000000000000008	0.00208000000000000025	0	0	2
507	Sản phẩm tử kỳ	1	1	20	10	10	2	Truyền thống	2	0.00400000000000000008	0.00208000000000000025	0	0	2
508	Sản phẩm tử kỳ	1	1	21	10	10	2	Truyền thống	2	0.00419999999999999974	0.00218400000000000018	0	0	2
509	Sản phẩm tử kỳ	1	1	22	10	10	2	Truyền thống	2	0.00419999999999999974	0.00218400000000000018	0	0	2
510	Sản phẩm tử kỳ	1	1	23	10	10	2	Truyền thống	2	0.00419999999999999974	0.00218400000000000018	0	0	2
511	Sản phẩm tử kỳ	1	1	24	10	10	2	Truyền thống	2	0.0043	0.00223600000000000014	0	0	2
512	Sản phẩm tử kỳ	1	1	25	10	10	2	Truyền thống	2	0.0043	0.00223600000000000014	0	0	2
513	Sản phẩm tử kỳ	1	1	26	10	10	2	Truyền thống	2	0.00440000000000000027	0.0022880000000000001	0	0	2
514	Sản phẩm tử kỳ	1	1	27	10	10	2	Truyền thống	2	0.00440000000000000027	0.0022880000000000001	0	0	2
515	Sản phẩm tử kỳ	1	1	28	10	10	2	Truyền thống	2	0.00449999999999999966	0.00234000000000000007	0	0	2
516	Sản phẩm tử kỳ	1	1	29	10	10	2	Truyền thống	2	0.00459999999999999992	0.00239200000000000003	0	0	2
517	Sản phẩm tử kỳ	1	1	30	10	10	2	Truyền thống	2	0.00470000000000000018	0.00244399999999999999	0	0	2
518	Sản phẩm tử kỳ	1	1	31	10	10	2	Truyền thống	2	0.00479999999999999958	0.00249599999999999995	0	0	2
519	Sản phẩm tử kỳ	1	1	32	10	10	2	Truyền thống	2	0.00489999999999999984	0.00254799999999999992	0	0	2
520	Sản phẩm tử kỳ	1	1	33	10	10	2	Truyền thống	2	0.0050000000000000001	0.00259999999999999988	0	0	2
521	Sản phẩm tử kỳ	1	1	34	10	10	2	Truyền thống	2	0.00510000000000000037	0.00265199999999999984	0	0	2
522	Sản phẩm tử kỳ	1	1	35	10	10	2	Truyền thống	2	0.00530000000000000002	0.00275599999999999977	0	0	2
523	Sản phẩm tử kỳ	1	1	36	10	10	2	Truyền thống	2	0.00570000000000000021	0.00296400000000000005	0	0	2
524	Sản phẩm tử kỳ	1	1	37	10	10	2	Truyền thống	2	0.00610000000000000039	0.00317199999999999991	0	0	2
525	Sản phẩm tử kỳ	1	1	38	10	10	2	Truyền thống	2	0.0064999999999999997	0.00337999999999999976	0	0	2
526	Sản phẩm tử kỳ	1	1	39	10	10	2	Truyền thống	2	0.00689999999999999988	0.00358800000000000004	0	0	2
527	Sản phẩm tử kỳ	1	1	40	10	10	2	Truyền thống	2	0.00740000000000000033	0.00384799999999999986	0	0	2
528	Sản phẩm tử kỳ	1	1	41	10	10	2	Truyền thống	2	0.00800000000000000017	0.0041600000000000005	0	0	2
529	Sản phẩm tử kỳ	1	1	42	10	10	2	Truyền thống	2	0.00860000000000000001	0.00447200000000000028	0	0	2
530	Sản phẩm tử kỳ	1	1	43	10	10	2	Truyền thống	2	0.00919999999999999984	0.00478400000000000006	0	0	2
531	Sản phẩm tử kỳ	1	1	44	10	10	2	Truyền thống	2	0.00990000000000000081	0.0051479999999999998	0	0	2
532	Sản phẩm tử kỳ	1	1	45	10	10	2	Truyền thống	2	0.0105000000000000007	0.00546000000000000044	0	0	2
533	Sản phẩm tử kỳ	1	1	46	10	10	2	Truyền thống	2	0.0114999999999999998	0.00598000000000000007	0	0	2
534	Sản phẩm tử kỳ	1	1	47	10	10	2	Truyền thống	2	0.0126000000000000001	0.00655199999999999966	0	0	2
535	Sản phẩm tử kỳ	1	1	48	10	10	2	Truyền thống	2	0.0137000000000000004	0.00712399999999999926	0	0	2
536	Sản phẩm tử kỳ	1	1	49	10	10	2	Truyền thống	2	0.0148000000000000007	0.00769599999999999972	0	0	2
537	Sản phẩm tử kỳ	1	1	50	10	10	2	Truyền thống	2	0.0159000000000000009	0.00826800000000000104	0	0	2
538	Sản phẩm tử kỳ	1	1	51	10	10	2	Truyền thống	2	0.0170000000000000012	0.00884000000000000064	0	0	2
539	Sản phẩm tử kỳ	1	1	52	10	10	2	Truyền thống	2	0.0183999999999999997	0.00956800000000000012	0	0	2
540	Sản phẩm tử kỳ	1	1	53	10	10	2	Truyền thống	2	0.0200000000000000004	0.0103999999999999995	0	0	2
541	Sản phẩm tử kỳ	1	1	54	10	10	2	Truyền thống	2	0.0221000000000000016	0.0114920000000000005	0	0	2
542	Sản phẩm tử kỳ	1	1	55	10	10	2	Truyền thống	2	0.0241999999999999993	0.0125839999999999997	0	0	2
543	Sản phẩm tử kỳ	1	2	18	10	10	2	Truyền thống	2	0.00259999999999999988	0.0013519999999999999	0	0	2
544	Sản phẩm tử kỳ	1	2	19	10	10	2	Truyền thống	2	0.00300000000000000006	0.00155999999999999997	0	0	2
545	Sản phẩm tử kỳ	1	2	20	10	10	2	Truyền thống	2	0.00300000000000000006	0.00155999999999999997	0	0	2
546	Sản phẩm tử kỳ	1	2	21	10	10	2	Truyền thống	2	0.00300000000000000006	0.00155999999999999997	0	0	2
547	Sản phẩm tử kỳ	1	2	22	10	10	2	Truyền thống	2	0.00300000000000000006	0.00155999999999999997	0	0	2
548	Sản phẩm tử kỳ	1	2	23	10	10	2	Truyền thống	2	0.00329999999999999998	0.00171600000000000008	0	0	2
549	Sản phẩm tử kỳ	1	2	24	10	10	2	Truyền thống	2	0.00329999999999999998	0.00171600000000000008	0	0	2
550	Sản phẩm tử kỳ	1	2	25	10	10	2	Truyền thống	2	0.00329999999999999998	0.00171600000000000008	0	0	2
551	Sản phẩm tử kỳ	1	2	26	10	10	2	Truyền thống	2	0.0035999999999999999	0.00187199999999999997	0	0	2
552	Sản phẩm tử kỳ	1	2	27	10	10	2	Truyền thống	2	0.0035999999999999999	0.00187199999999999997	0	0	2
553	Sản phẩm tử kỳ	1	2	28	10	10	2	Truyền thống	2	0.00400000000000000008	0.00208000000000000025	0	0	2
554	Sản phẩm tử kỳ	1	2	29	10	10	2	Truyền thống	2	0.00400000000000000008	0.00208000000000000025	0	0	2
555	Sản phẩm tử kỳ	1	2	30	10	10	2	Truyền thống	2	0.0043	0.00223600000000000014	0	0	2
556	Sản phẩm tử kỳ	1	2	31	10	10	2	Truyền thống	2	0.00449999999999999966	0.00234000000000000007	0	0	2
557	Sản phẩm tử kỳ	1	2	32	10	10	2	Truyền thống	2	0.00459999999999999992	0.00239200000000000003	0	0	2
558	Sản phẩm tử kỳ	1	2	33	10	10	2	Truyền thống	2	0.00470000000000000018	0.00244399999999999999	0	0	2
559	Sản phẩm tử kỳ	1	2	34	10	10	2	Truyền thống	2	0.00479999999999999958	0.00249599999999999995	0	0	2
560	Sản phẩm tử kỳ	1	2	35	10	10	2	Truyền thống	2	0.00489999999999999984	0.00254799999999999992	0	0	2
561	Sản phẩm tử kỳ	1	2	36	10	10	2	Truyền thống	2	0.00510000000000000037	0.00265199999999999984	0	0	2
562	Sản phẩm tử kỳ	1	2	37	10	10	2	Truyền thống	2	0.00540000000000000029	0.00280799999999999973	0	0	2
563	Sản phẩm tử kỳ	1	2	38	10	10	2	Truyền thống	2	0.00570000000000000021	0.00296400000000000005	0	0	2
564	Sản phẩm tử kỳ	1	2	39	10	10	2	Truyền thống	2	0.00600000000000000012	0.00311999999999999994	0	0	2
565	Sản phẩm tử kỳ	1	2	40	10	10	2	Truyền thống	2	0.00630000000000000004	0.00327599999999999983	0	0	2
566	Sản phẩm tử kỳ	1	2	41	10	10	2	Truyền thống	2	0.00659999999999999996	0.00343200000000000015	0	0	2
567	Sản phẩm tử kỳ	1	2	42	10	10	2	Truyền thống	2	0.00710000000000000041	0.00369199999999999997	0	0	2
568	Sản phẩm tử kỳ	1	2	43	10	10	2	Truyền thống	2	0.00759999999999999998	0.00395200000000000065	0	0	2
569	Sản phẩm tử kỳ	1	2	44	10	10	2	Truyền thống	2	0.00809999999999999956	0.0042119999999999996	0	0	2
570	Sản phẩm tử kỳ	1	2	45	10	10	2	Truyền thống	2	0.00860000000000000001	0.00447200000000000028	0	0	2
571	Sản phẩm tử kỳ	1	2	46	10	10	2	Truyền thống	2	0.00910000000000000045	0.0047320000000000001	0	0	2
572	Sản phẩm tử kỳ	1	2	47	10	10	2	Truyền thống	2	0.00959999999999999916	0.00499199999999999991	0	0	2
573	Sản phẩm tử kỳ	1	2	48	10	10	2	Truyền thống	2	0.0100999999999999996	0.00525200000000000059	0	0	2
574	Sản phẩm tử kỳ	1	2	49	10	10	2	Truyền thống	2	0.0106	0.00551199999999999954	0	0	2
575	Sản phẩm tử kỳ	1	2	50	10	10	2	Truyền thống	2	0.0126999999999999995	0.00660400000000000049	0	0	2
576	Sản phẩm tử kỳ	1	2	51	10	10	2	Truyền thống	2	0.0137000000000000004	0.00712399999999999926	0	0	2
577	Sản phẩm tử kỳ	1	2	52	10	10	2	Truyền thống	2	0.0148000000000000007	0.00769599999999999972	0	0	2
578	Sản phẩm tử kỳ	1	2	53	10	10	2	Truyền thống	2	0.0159000000000000009	0.00826800000000000104	0	0	2
579	Sản phẩm tử kỳ	1	2	54	10	10	2	Truyền thống	2	0.0172	0.00894400000000000056	0	0	2
580	Sản phẩm tử kỳ	1	2	55	10	10	2	Truyền thống	2	0.0189999999999999995	0.00987999999999999989	0	0	2
581	Sản phẩm tử kỳ	1	1	18	15	15	2	Truyền thống	2	0.00419999999999999974	0.00218400000000000018	0	0	2
582	Sản phẩm tử kỳ	1	1	19	15	15	2	Truyền thống	2	0.00419999999999999974	0.00218400000000000018	0	0	2
583	Sản phẩm tử kỳ	1	1	20	15	15	2	Truyền thống	2	0.00419999999999999974	0.00218400000000000018	0	0	2
584	Sản phẩm tử kỳ	1	1	21	15	15	2	Truyền thống	2	0.0043	0.00223600000000000014	0	0	2
585	Sản phẩm tử kỳ	1	1	22	15	15	2	Truyền thống	2	0.0043	0.00223600000000000014	0	0	2
586	Sản phẩm tử kỳ	1	1	23	15	15	2	Truyền thống	2	0.0043	0.00223600000000000014	0	0	2
587	Sản phẩm tử kỳ	1	1	24	15	15	2	Truyền thống	2	0.00440000000000000027	0.0022880000000000001	0	0	2
588	Sản phẩm tử kỳ	1	1	25	15	15	2	Truyền thống	2	0.00449999999999999966	0.00234000000000000007	0	0	2
589	Sản phẩm tử kỳ	1	1	26	15	15	2	Truyền thống	2	0.00449999999999999966	0.00234000000000000007	0	0	2
590	Sản phẩm tử kỳ	1	1	27	15	15	2	Truyền thống	2	0.00459999999999999992	0.00239200000000000003	0	0	2
591	Sản phẩm tử kỳ	1	1	28	15	15	2	Truyền thống	2	0.00459999999999999992	0.00239200000000000003	0	0	2
592	Sản phẩm tử kỳ	1	1	29	15	15	2	Truyền thống	2	0.00470000000000000018	0.00244399999999999999	0	0	2
593	Sản phẩm tử kỳ	1	1	30	15	15	2	Truyền thống	2	0.00479999999999999958	0.00249599999999999995	0	0	2
594	Sản phẩm tử kỳ	1	1	31	15	15	2	Truyền thống	2	0.0050000000000000001	0.00259999999999999988	0	0	2
595	Sản phẩm tử kỳ	1	1	32	15	15	2	Truyền thống	2	0.00519999999999999976	0.00270399999999999981	0	0	2
596	Sản phẩm tử kỳ	1	1	33	15	15	2	Truyền thống	2	0.00549999999999999968	0.00286000000000000013	0	0	2
597	Sản phẩm tử kỳ	1	1	34	15	15	2	Truyền thống	2	0.0057999999999999996	0.00301600000000000002	0	0	2
598	Sản phẩm tử kỳ	1	1	35	15	15	2	Truyền thống	2	0.00610000000000000039	0.00317199999999999991	0	0	2
599	Sản phẩm tử kỳ	1	1	36	15	15	2	Truyền thống	2	0.00659999999999999996	0.00343200000000000015	0	0	2
600	Sản phẩm tử kỳ	1	1	37	15	15	2	Truyền thống	2	0.0071999999999999998	0.00374399999999999993	0	0	2
601	Sản phẩm tử kỳ	1	1	38	15	15	2	Truyền thống	2	0.00770000000000000025	0.00400399999999999975	0	0	2
602	Sản phẩm tử kỳ	1	1	39	15	15	2	Truyền thống	2	0.00820000000000000069	0.00426400000000000043	0	0	2
603	Sản phẩm tử kỳ	1	1	40	15	15	2	Truyền thống	2	0.00880000000000000053	0.00457600000000000021	0	0	2
604	Sản phẩm tử kỳ	1	1	41	15	15	2	Truyền thống	2	0.00919999999999999984	0.00478400000000000006	0	0	2
605	Sản phẩm tử kỳ	1	1	42	15	15	2	Truyền thống	2	0.0100000000000000002	0.00519999999999999976	0	0	2
606	Sản phẩm tử kỳ	1	1	43	15	15	2	Truyền thống	2	0.0106999999999999994	0.00556400000000000037	0	0	2
607	Sản phẩm tử kỳ	1	1	44	15	15	2	Truyền thống	2	0.0115999999999999992	0.00603200000000000004	0	0	2
608	Sản phẩm tử kỳ	1	1	45	15	15	2	Truyền thống	2	0.0126000000000000001	0.00655199999999999966	0	0	2
609	Sản phẩm tử kỳ	1	1	46	15	15	2	Truyền thống	2	0.0137000000000000004	0.00712399999999999926	0	0	2
610	Sản phẩm tử kỳ	1	1	47	15	15	2	Truyền thống	2	0.0148000000000000007	0.00769599999999999972	0	0	2
611	Sản phẩm tử kỳ	1	1	48	15	15	2	Truyền thống	2	0.0159000000000000009	0.00826800000000000104	0	0	2
612	Sản phẩm tử kỳ	1	1	49	15	15	2	Truyền thống	2	0.0170000000000000012	0.00884000000000000064	0	0	2
613	Sản phẩm tử kỳ	1	1	50	15	15	2	Truyền thống	2	0.0182000000000000009	0.00946400000000000019	0	0	2
614	Sản phẩm tử kỳ	1	2	18	15	15	2	Truyền thống	2	0.00300000000000000006	0.00155999999999999997	0	0	2
615	Sản phẩm tử kỳ	1	2	19	15	15	2	Truyền thống	2	0.00300000000000000006	0.00155999999999999997	0	0	2
616	Sản phẩm tử kỳ	1	2	20	15	15	2	Truyền thống	2	0.00300000000000000006	0.00155999999999999997	0	0	2
617	Sản phẩm tử kỳ	1	2	21	15	15	2	Truyền thống	2	0.00329999999999999998	0.00171600000000000008	0	0	2
618	Sản phẩm tử kỳ	1	2	22	15	15	2	Truyền thống	2	0.00329999999999999998	0.00171600000000000008	0	0	2
619	Sản phẩm tử kỳ	1	2	23	15	15	2	Truyền thống	2	0.00329999999999999998	0.00171600000000000008	0	0	2
620	Sản phẩm tử kỳ	1	2	24	15	15	2	Truyền thống	2	0.0035999999999999999	0.00187199999999999997	0	0	2
621	Sản phẩm tử kỳ	1	2	25	15	15	2	Truyền thống	2	0.0035999999999999999	0.00187199999999999997	0	0	2
622	Sản phẩm tử kỳ	1	2	26	15	15	2	Truyền thống	2	0.00400000000000000008	0.00208000000000000025	0	0	2
623	Sản phẩm tử kỳ	1	2	27	15	15	2	Truyền thống	2	0.0043	0.00223600000000000014	0	0	2
624	Sản phẩm tử kỳ	1	2	28	15	15	2	Truyền thống	2	0.0043	0.00223600000000000014	0	0	2
625	Sản phẩm tử kỳ	1	2	29	15	15	2	Truyền thống	2	0.00459999999999999992	0.00239200000000000003	0	0	2
626	Sản phẩm tử kỳ	1	2	30	15	15	2	Truyền thống	2	0.00479999999999999958	0.00249599999999999995	0	0	2
627	Sản phẩm tử kỳ	1	2	31	15	15	2	Truyền thống	2	0.00489999999999999984	0.00254799999999999992	0	0	2
628	Sản phẩm tử kỳ	1	2	32	15	15	2	Truyền thống	2	0.0050000000000000001	0.00259999999999999988	0	0	2
629	Sản phẩm tử kỳ	1	2	33	15	15	2	Truyền thống	2	0.00510000000000000037	0.00265199999999999984	0	0	2
630	Sản phẩm tử kỳ	1	2	34	15	15	2	Truyền thống	2	0.00519999999999999976	0.00270399999999999981	0	0	2
631	Sản phẩm tử kỳ	1	2	35	15	15	2	Truyền thống	2	0.00540000000000000029	0.00280799999999999973	0	0	2
632	Sản phẩm tử kỳ	1	2	36	15	15	2	Truyền thống	2	0.00570000000000000021	0.00296400000000000005	0	0	2
633	Sản phẩm tử kỳ	1	2	37	15	15	2	Truyền thống	2	0.00600000000000000012	0.00311999999999999994	0	0	2
634	Sản phẩm tử kỳ	1	2	38	15	15	2	Truyền thống	2	0.00630000000000000004	0.00327599999999999983	0	0	2
635	Sản phẩm tử kỳ	1	2	39	15	15	2	Truyền thống	2	0.00659999999999999996	0.00343200000000000015	0	0	2
636	Sản phẩm tử kỳ	1	2	40	15	15	2	Truyền thống	2	0.00699999999999999928	0.00364000000000000001	0	0	2
637	Sản phẩm tử kỳ	1	2	41	15	15	2	Truyền thống	2	0.00759999999999999998	0.00395200000000000065	0	0	2
638	Sản phẩm tử kỳ	1	2	42	15	15	2	Truyền thống	2	0.00820000000000000069	0.00426400000000000043	0	0	2
639	Sản phẩm tử kỳ	1	2	43	15	15	2	Truyền thống	2	0.00889999999999999993	0.00462800000000000017	0	0	2
640	Sản phẩm tử kỳ	1	2	44	15	15	2	Truyền thống	2	0.00949999999999999976	0.00493999999999999995	0	0	2
641	Sản phẩm tử kỳ	1	2	45	15	15	2	Truyền thống	2	0.0102000000000000007	0.00530399999999999969	0	0	2
642	Sản phẩm tử kỳ	1	2	46	15	15	2	Truyền thống	2	0.0108000000000000006	0.00561599999999999946	0	0	2
643	Sản phẩm tử kỳ	1	2	47	15	15	2	Truyền thống	2	0.0114000000000000004	0.00592800000000000011	0	0	2
644	Sản phẩm tử kỳ	1	2	48	15	15	2	Truyền thống	2	0.0120999999999999996	0.00629199999999999985	0	0	2
645	Sản phẩm tử kỳ	1	2	49	15	15	2	Truyền thống	2	0.0126999999999999995	0.00660400000000000049	0	0	2
646	Sản phẩm tử kỳ	1	2	50	15	15	2	Truyền thống	2	0.0134000000000000005	0.0069680000000000011	0	0	2
647	Sản phẩm tử kỳ	1	1	18	20	20	2	Truyền thống	2	0.00419999999999999974	0.00218400000000000018	0	0	2
648	Sản phẩm tử kỳ	1	1	19	20	20	2	Truyền thống	2	0.00419999999999999974	0.00218400000000000018	0	0	2
649	Sản phẩm tử kỳ	1	1	20	20	20	2	Truyền thống	2	0.00419999999999999974	0.00218400000000000018	0	0	2
650	Sản phẩm tử kỳ	1	1	21	20	20	2	Truyền thống	2	0.0043	0.00223600000000000014	0	0	2
651	Sản phẩm tử kỳ	1	1	22	20	20	2	Truyền thống	2	0.00440000000000000027	0.0022880000000000001	0	0	2
652	Sản phẩm tử kỳ	1	1	23	20	20	2	Truyền thống	2	0.00449999999999999966	0.00234000000000000007	0	0	2
653	Sản phẩm tử kỳ	1	1	24	20	20	2	Truyền thống	2	0.00459999999999999992	0.00239200000000000003	0	0	2
654	Sản phẩm tử kỳ	1	1	25	20	20	2	Truyền thống	2	0.00479999999999999958	0.00249599999999999995	0	0	2
655	Sản phẩm tử kỳ	1	1	26	20	20	2	Truyền thống	2	0.0050000000000000001	0.00259999999999999988	0	0	2
656	Sản phẩm tử kỳ	1	1	27	20	20	2	Truyền thống	2	0.00519999999999999976	0.00270399999999999981	0	0	2
657	Sản phẩm tử kỳ	1	1	28	20	20	2	Truyền thống	2	0.00540000000000000029	0.00280799999999999973	0	0	2
658	Sản phẩm tử kỳ	1	1	29	20	20	2	Truyền thống	2	0.00559999999999999994	0.00291200000000000009	0	0	2
659	Sản phẩm tử kỳ	1	1	30	20	20	2	Truyền thống	2	0.0057999999999999996	0.00301600000000000002	0	0	2
660	Sản phẩm tử kỳ	1	1	31	20	20	2	Truyền thống	2	0.00600000000000000012	0.00311999999999999994	0	0	2
661	Sản phẩm tử kỳ	1	1	32	20	20	2	Truyền thống	2	0.00619999999999999978	0.0032240000000000003	0	0	2
662	Sản phẩm tử kỳ	1	1	33	20	20	2	Truyền thống	2	0.00640000000000000031	0.00332800000000000023	0	0	2
663	Sản phẩm tử kỳ	1	1	34	20	20	2	Truyền thống	2	0.00659999999999999996	0.00343200000000000015	0	0	2
664	Sản phẩm tử kỳ	1	1	35	20	20	2	Truyền thống	2	0.00679999999999999962	0.00353600000000000008	0	0	2
665	Sản phẩm tử kỳ	1	1	36	20	20	2	Truyền thống	2	0.00740000000000000033	0.00384799999999999986	0	0	2
666	Sản phẩm tử kỳ	1	1	37	20	20	2	Truyền thống	2	0.00800000000000000017	0.0041600000000000005	0	0	2
667	Sản phẩm tử kỳ	1	1	38	20	20	2	Truyền thống	2	0.0086999999999999994	0.00452400000000000024	0	0	2
668	Sản phẩm tử kỳ	1	1	39	20	20	2	Truyền thống	2	0.00940000000000000037	0.00488799999999999998	0	0	2
669	Sản phẩm tử kỳ	1	1	40	20	20	2	Truyền thống	2	0.0100999999999999996	0.00525200000000000059	0	0	2
670	Sản phẩm tử kỳ	1	1	41	20	20	2	Truyền thống	2	0.0109	0.00566800000000000029	0	0	2
671	Sản phẩm tử kỳ	1	1	42	20	20	2	Truyền thống	2	0.0117999999999999997	0.00613599999999999996	0	0	2
672	Sản phẩm tử kỳ	1	1	43	20	20	2	Truyền thống	2	0.0128000000000000006	0.00665600000000000046	0	0	2
673	Sản phẩm tử kỳ	1	1	44	20	20	2	Truyền thống	2	0.0137999999999999998	0.00717600000000000009	0	0	2
674	Sản phẩm tử kỳ	1	1	45	20	20	2	Truyền thống	2	0.0148000000000000007	0.00769599999999999972	0	0	2
675	Sản phẩm tử kỳ	1	2	18	20	20	2	Truyền thống	2	0.00300000000000000006	0.00155999999999999997	0	0	2
676	Sản phẩm tử kỳ	1	2	19	20	20	2	Truyền thống	2	0.00329999999999999998	0.00171600000000000008	0	0	2
677	Sản phẩm tử kỳ	1	2	20	20	20	2	Truyền thống	2	0.00329999999999999998	0.00171600000000000008	0	0	2
678	Sản phẩm tử kỳ	1	2	21	20	20	2	Truyền thống	2	0.0035999999999999999	0.00187199999999999997	0	0	2
679	Sản phẩm tử kỳ	1	2	22	20	20	2	Truyền thống	2	0.0035999999999999999	0.00187199999999999997	0	0	2
680	Sản phẩm tử kỳ	1	2	23	20	20	2	Truyền thống	2	0.00400000000000000008	0.00208000000000000025	0	0	2
681	Sản phẩm tử kỳ	1	2	24	20	20	2	Truyền thống	2	0.00400000000000000008	0.00208000000000000025	0	0	2
682	Sản phẩm tử kỳ	1	2	25	20	20	2	Truyền thống	2	0.0043	0.00223600000000000014	0	0	2
683	Sản phẩm tử kỳ	1	2	26	20	20	2	Truyền thống	2	0.0043	0.00223600000000000014	0	0	2
684	Sản phẩm tử kỳ	1	2	27	20	20	2	Truyền thống	2	0.00459999999999999992	0.00239200000000000003	0	0	2
685	Sản phẩm tử kỳ	1	2	28	20	20	2	Truyền thống	2	0.00459999999999999992	0.00239200000000000003	0	0	2
686	Sản phẩm tử kỳ	1	2	29	20	20	2	Truyền thống	2	0.00479999999999999958	0.00249599999999999995	0	0	2
687	Sản phẩm tử kỳ	1	2	30	20	20	2	Truyền thống	2	0.00479999999999999958	0.00249599999999999995	0	0	2
688	Sản phẩm tử kỳ	1	2	31	20	20	2	Truyền thống	2	0.0050000000000000001	0.00259999999999999988	0	0	2
689	Sản phẩm tử kỳ	1	2	32	20	20	2	Truyền thống	2	0.00519999999999999976	0.00270399999999999981	0	0	2
690	Sản phẩm tử kỳ	1	2	33	20	20	2	Truyền thống	2	0.00540000000000000029	0.00280799999999999973	0	0	2
691	Sản phẩm tử kỳ	1	2	34	20	20	2	Truyền thống	2	0.00559999999999999994	0.00291200000000000009	0	0	2
692	Sản phẩm tử kỳ	1	2	35	20	20	2	Truyền thống	2	0.00589999999999999986	0.00306799999999999998	0	0	2
693	Sản phẩm tử kỳ	1	2	36	20	20	2	Truyền thống	2	0.00630000000000000004	0.00327599999999999983	0	0	2
694	Sản phẩm tử kỳ	1	2	37	20	20	2	Truyền thống	2	0.00670000000000000023	0.00348400000000000055	0	0	2
695	Sản phẩm tử kỳ	1	2	38	20	20	2	Truyền thống	2	0.00710000000000000041	0.00369199999999999997	0	0	2
696	Sản phẩm tử kỳ	1	2	39	20	20	2	Truyền thống	2	0.00759999999999999998	0.00395200000000000065	0	0	2
697	Sản phẩm tử kỳ	1	2	40	20	20	2	Truyền thống	2	0.00800000000000000017	0.0041600000000000005	0	0	2
698	Sản phẩm tử kỳ	1	2	41	20	20	2	Truyền thống	2	0.00880000000000000053	0.00457600000000000021	0	0	2
699	Sản phẩm tử kỳ	1	2	42	20	20	2	Truyền thống	2	0.00970000000000000029	0.00504399999999999987	0	0	2
700	Sản phẩm tử kỳ	1	2	43	20	20	2	Truyền thống	2	0.0105000000000000007	0.00546000000000000044	0	0	2
701	Sản phẩm tử kỳ	1	2	44	20	20	2	Truyền thống	2	0.0112999999999999993	0.00587600000000000015	0	0	2
702	Sản phẩm tử kỳ	1	2	45	20	20	2	Truyền thống	2	0.0122000000000000008	0.00634399999999999981	0	0	2
703	Sản phẩm tử kỳ	1	1	18	5	1	1	Thai sản	3	0.275000000000000022	0	0	0	2
704	Sản phẩm tử kỳ	1	1	19	5	1	1	Thai sản	3	0.275000000000000022	0	0	0	2
705	Sản phẩm tử kỳ	1	1	20	5	1	1	Thai sản	3	0.275000000000000022	0	0	0	2
706	Sản phẩm tử kỳ	1	1	21	5	1	1	Thai sản	3	0.275000000000000022	0	0	0	2
707	Sản phẩm tử kỳ	1	1	22	5	1	1	Thai sản	3	0.275000000000000022	0	0	0	2
708	Sản phẩm tử kỳ	1	1	23	5	1	1	Thai sản	3	0.275000000000000022	0	0	0	2
709	Sản phẩm tử kỳ	1	1	24	5	1	1	Thai sản	3	0.275000000000000022	0	0	0	2
710	Sản phẩm tử kỳ	1	1	25	5	1	1	Thai sản	3	0.275000000000000022	0	0	0	2
711	Sản phẩm tử kỳ	1	1	26	5	1	1	Thai sản	3	0.275000000000000022	0	0	0	2
712	Sản phẩm tử kỳ	1	1	27	5	1	1	Thai sản	3	0.275000000000000022	0	0	0	2
713	Sản phẩm tử kỳ	1	1	28	5	1	1	Thai sản	3	0.275000000000000022	0	0	0	2
714	Sản phẩm tử kỳ	1	1	29	5	1	1	Thai sản	3	0.275000000000000022	0	0	0	2
715	Sản phẩm tử kỳ	1	1	30	5	1	1	Thai sản	3	0.275000000000000022	0	0	0	2
716	Sản phẩm tử kỳ	1	1	31	5	1	1	Thai sản	3	0.280000000000000027	0	0	0	2
717	Sản phẩm tử kỳ	1	1	32	5	1	1	Thai sản	3	0.280000000000000027	0	0	0	2
718	Sản phẩm tử kỳ	1	1	33	5	1	1	Thai sản	3	0.280000000000000027	0	0	0	2
719	Sản phẩm tử kỳ	1	1	34	5	1	1	Thai sản	3	0.280000000000000027	0	0	0	2
720	Sản phẩm tử kỳ	1	1	35	5	1	1	Thai sản	3	0.280000000000000027	0	0	0	2
721	Sản phẩm tử kỳ	1	1	36	5	1	1	Thai sản	3	0.280000000000000027	0	0	0	2
722	Sản phẩm tử kỳ	1	1	37	5	1	1	Thai sản	3	0.280000000000000027	0	0	0	2
723	Sản phẩm tử kỳ	1	1	38	5	1	1	Thai sản	3	0.280000000000000027	0	0	0	2
724	Sản phẩm tử kỳ	1	1	39	5	1	1	Thai sản	3	0.280000000000000027	0	0	0	2
725	Sản phẩm tử kỳ	1	1	40	5	1	1	Thai sản	3	0.280000000000000027	0	0	0	2
726	Sản phẩm tử kỳ	1	1	18	5	2	2	Thai sản	3	0.139000000000000012	0	0	0	2
727	Sản phẩm tử kỳ	1	1	19	5	2	2	Thai sản	3	0.139000000000000012	0	0	0	2
728	Sản phẩm tử kỳ	1	1	20	5	2	2	Thai sản	3	0.139000000000000012	0	0	0	2
729	Sản phẩm tử kỳ	1	1	21	5	2	2	Thai sản	3	0.139000000000000012	0	0	0	2
730	Sản phẩm tử kỳ	1	1	22	5	2	2	Thai sản	3	0.139000000000000012	0	0	0	2
731	Sản phẩm tử kỳ	1	1	23	5	2	2	Thai sản	3	0.139000000000000012	0	0	0	2
732	Sản phẩm tử kỳ	1	1	24	5	2	2	Thai sản	3	0.139000000000000012	0	0	0	2
733	Sản phẩm tử kỳ	1	1	25	5	2	2	Thai sản	3	0.139000000000000012	0	0	0	2
734	Sản phẩm tử kỳ	1	1	26	5	2	2	Thai sản	3	0.139000000000000012	0	0	0	2
735	Sản phẩm tử kỳ	1	1	27	5	2	2	Thai sản	3	0.139000000000000012	0	0	0	2
736	Sản phẩm tử kỳ	1	1	28	5	2	2	Thai sản	3	0.139000000000000012	0	0	0	2
737	Sản phẩm tử kỳ	1	1	29	5	2	2	Thai sản	3	0.139000000000000012	0	0	0	2
738	Sản phẩm tử kỳ	1	1	30	5	2	2	Thai sản	3	0.139000000000000012	0	0	0	2
739	Sản phẩm tử kỳ	1	1	31	5	2	2	Thai sản	3	0.141999999999999987	0	0	0	2
740	Sản phẩm tử kỳ	1	1	32	5	2	2	Thai sản	3	0.141999999999999987	0	0	0	2
741	Sản phẩm tử kỳ	1	1	33	5	2	2	Thai sản	3	0.141999999999999987	0	0	0	2
742	Sản phẩm tử kỳ	1	1	34	5	2	2	Thai sản	3	0.141999999999999987	0	0	0	2
743	Sản phẩm tử kỳ	1	1	35	5	2	2	Thai sản	3	0.141999999999999987	0	0	0	2
744	Sản phẩm tử kỳ	1	1	36	5	2	2	Thai sản	3	0.141999999999999987	0	0	0	2
745	Sản phẩm tử kỳ	1	1	37	5	2	2	Thai sản	3	0.141999999999999987	0	0	0	2
746	Sản phẩm tử kỳ	1	1	38	5	2	2	Thai sản	3	0.141999999999999987	0	0	0	2
747	Sản phẩm tử kỳ	1	1	39	5	2	2	Thai sản	3	0.141999999999999987	0	0	0	2
748	Sản phẩm tử kỳ	1	1	40	5	2	2	Thai sản	3	0.141999999999999987	0	0	0	2
\.


--
-- Data for Name: termlife_goisanphamphu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.termlife_goisanphamphu (id, ten_loai_hinh_bao_hiem, id_loai_hinh_bao_hiem, gioi_tinh, tuoi, so_nam_hop_dong, so_nam_dong_phi, cach_tra_phi, ten_goi_san_pham_chinh, id_goi_san_pham_chinh, ten_goi_san_pham_phu, id_goi_san_pham_phu, so_tien_bao_hiem, so_phi_phu_nam, company_id) FROM stdin;
1	Bảo hiểm tử kỳ	1	0	6	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
2	Bảo hiểm tử kỳ	1	0	7	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
3	Bảo hiểm tử kỳ	1	0	8	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
4	Bảo hiểm tử kỳ	1	0	9	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
5	Bảo hiểm tử kỳ	1	0	10	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
6	Bảo hiểm tử kỳ	1	0	11	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
7	Bảo hiểm tử kỳ	1	0	12	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
8	Bảo hiểm tử kỳ	1	0	13	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
9	Bảo hiểm tử kỳ	1	0	14	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
10	Bảo hiểm tử kỳ	1	0	15	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
11	Bảo hiểm tử kỳ	1	0	16	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
12	Bảo hiểm tử kỳ	1	0	17	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
13	Bảo hiểm tử kỳ	1	0	18	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
14	Bảo hiểm tử kỳ	1	0	19	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
15	Bảo hiểm tử kỳ	1	0	20	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
16	Bảo hiểm tử kỳ	1	0	21	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
17	Bảo hiểm tử kỳ	1	0	22	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
18	Bảo hiểm tử kỳ	1	0	23	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
19	Bảo hiểm tử kỳ	1	0	24	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
20	Bảo hiểm tử kỳ	1	0	25	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
21	Bảo hiểm tử kỳ	1	0	26	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
22	Bảo hiểm tử kỳ	1	0	27	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
23	Bảo hiểm tử kỳ	1	0	28	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
24	Bảo hiểm tử kỳ	1	0	29	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
25	Bảo hiểm tử kỳ	1	0	30	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
26	Bảo hiểm tử kỳ	1	0	31	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
27	Bảo hiểm tử kỳ	1	0	32	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
28	Bảo hiểm tử kỳ	1	0	33	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
29	Bảo hiểm tử kỳ	1	0	34	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
30	Bảo hiểm tử kỳ	1	0	35	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	500000	2
31	Bảo hiểm tử kỳ	1	0	36	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	500000	2
32	Bảo hiểm tử kỳ	1	0	37	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	500000	2
33	Bảo hiểm tử kỳ	1	0	38	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	500000	2
34	Bảo hiểm tử kỳ	1	0	39	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	500000	2
35	Bảo hiểm tử kỳ	1	0	40	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	476191	2
36	Bảo hiểm tử kỳ	1	0	41	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	476191	2
37	Bảo hiểm tử kỳ	1	0	42	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	476191	2
38	Bảo hiểm tử kỳ	1	0	43	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	476191	2
39	Bảo hiểm tử kỳ	1	0	44	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	476191	2
40	Bảo hiểm tử kỳ	1	0	45	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	408164	2
41	Bảo hiểm tử kỳ	1	0	46	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	408164	2
42	Bảo hiểm tử kỳ	1	0	47	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	408164	2
43	Bảo hiểm tử kỳ	1	0	48	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	408164	2
44	Bảo hiểm tử kỳ	1	0	49	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	408164	2
45	Bảo hiểm tử kỳ	1	0	50	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	317461	2
46	Bảo hiểm tử kỳ	1	0	51	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	317461	2
47	Bảo hiểm tử kỳ	1	0	52	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	317461	2
48	Bảo hiểm tử kỳ	1	0	53	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	317461	2
49	Bảo hiểm tử kỳ	1	0	54	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	317461	2
50	Bảo hiểm tử kỳ	1	0	6	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
51	Bảo hiểm tử kỳ	1	0	7	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
52	Bảo hiểm tử kỳ	1	0	8	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
53	Bảo hiểm tử kỳ	1	0	9	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
54	Bảo hiểm tử kỳ	1	0	10	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
55	Bảo hiểm tử kỳ	1	0	11	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
56	Bảo hiểm tử kỳ	1	0	12	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
57	Bảo hiểm tử kỳ	1	0	13	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
58	Bảo hiểm tử kỳ	1	0	14	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
59	Bảo hiểm tử kỳ	1	0	15	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
60	Bảo hiểm tử kỳ	1	0	16	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
61	Bảo hiểm tử kỳ	1	0	17	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
62	Bảo hiểm tử kỳ	1	0	18	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
63	Bảo hiểm tử kỳ	1	0	19	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
64	Bảo hiểm tử kỳ	1	0	20	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
65	Bảo hiểm tử kỳ	1	0	21	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
66	Bảo hiểm tử kỳ	1	0	22	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
67	Bảo hiểm tử kỳ	1	0	23	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
68	Bảo hiểm tử kỳ	1	0	24	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
69	Bảo hiểm tử kỳ	1	0	25	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
70	Bảo hiểm tử kỳ	1	0	26	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
71	Bảo hiểm tử kỳ	1	0	27	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
72	Bảo hiểm tử kỳ	1	0	28	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
73	Bảo hiểm tử kỳ	1	0	29	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
74	Bảo hiểm tử kỳ	1	0	30	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
75	Bảo hiểm tử kỳ	1	0	31	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
76	Bảo hiểm tử kỳ	1	0	32	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
77	Bảo hiểm tử kỳ	1	0	33	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
78	Bảo hiểm tử kỳ	1	0	34	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
79	Bảo hiểm tử kỳ	1	0	35	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	875000	2
80	Bảo hiểm tử kỳ	1	0	36	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	875000	2
81	Bảo hiểm tử kỳ	1	0	37	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	875000	2
82	Bảo hiểm tử kỳ	1	0	38	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	875000	2
83	Bảo hiểm tử kỳ	1	0	39	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	875000	2
84	Bảo hiểm tử kỳ	1	0	40	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	833334	2
85	Bảo hiểm tử kỳ	1	0	41	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	833334	2
86	Bảo hiểm tử kỳ	1	0	42	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	833334	2
87	Bảo hiểm tử kỳ	1	0	43	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	833334	2
88	Bảo hiểm tử kỳ	1	0	44	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	833334	2
89	Bảo hiểm tử kỳ	1	0	45	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	714286	2
90	Bảo hiểm tử kỳ	1	0	46	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	714286	2
91	Bảo hiểm tử kỳ	1	0	47	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	714286	2
92	Bảo hiểm tử kỳ	1	0	48	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	714286	2
93	Bảo hiểm tử kỳ	1	0	49	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	714286	2
94	Bảo hiểm tử kỳ	1	0	50	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	555556	2
95	Bảo hiểm tử kỳ	1	0	51	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	555556	2
96	Bảo hiểm tử kỳ	1	0	52	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	555556	2
97	Bảo hiểm tử kỳ	1	0	53	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	555556	2
98	Bảo hiểm tử kỳ	1	0	54	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	555556	2
99	Bảo hiểm tử kỳ	1	0	6	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
100	Bảo hiểm tử kỳ	1	0	7	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
101	Bảo hiểm tử kỳ	1	0	8	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
102	Bảo hiểm tử kỳ	1	0	9	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
103	Bảo hiểm tử kỳ	1	0	10	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
104	Bảo hiểm tử kỳ	1	0	11	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
105	Bảo hiểm tử kỳ	1	0	12	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
106	Bảo hiểm tử kỳ	1	0	13	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
107	Bảo hiểm tử kỳ	1	0	14	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
108	Bảo hiểm tử kỳ	1	0	15	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
109	Bảo hiểm tử kỳ	1	0	16	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
110	Bảo hiểm tử kỳ	1	0	17	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
111	Bảo hiểm tử kỳ	1	0	18	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
112	Bảo hiểm tử kỳ	1	0	19	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
113	Bảo hiểm tử kỳ	1	0	20	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
114	Bảo hiểm tử kỳ	1	0	21	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
115	Bảo hiểm tử kỳ	1	0	22	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
116	Bảo hiểm tử kỳ	1	0	23	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
117	Bảo hiểm tử kỳ	1	0	24	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
118	Bảo hiểm tử kỳ	1	0	25	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
119	Bảo hiểm tử kỳ	1	0	26	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
120	Bảo hiểm tử kỳ	1	0	27	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
121	Bảo hiểm tử kỳ	1	0	28	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
122	Bảo hiểm tử kỳ	1	0	29	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
123	Bảo hiểm tử kỳ	1	0	30	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
124	Bảo hiểm tử kỳ	1	0	31	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
125	Bảo hiểm tử kỳ	1	0	32	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
126	Bảo hiểm tử kỳ	1	0	33	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
127	Bảo hiểm tử kỳ	1	0	34	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
128	Bảo hiểm tử kỳ	1	0	35	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1250000	2
129	Bảo hiểm tử kỳ	1	0	36	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1250000	2
130	Bảo hiểm tử kỳ	1	0	37	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1250000	2
131	Bảo hiểm tử kỳ	1	0	38	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1250000	2
132	Bảo hiểm tử kỳ	1	0	39	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1250000	2
133	Bảo hiểm tử kỳ	1	0	40	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1190477	2
134	Bảo hiểm tử kỳ	1	0	41	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1190477	2
135	Bảo hiểm tử kỳ	1	0	42	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1190477	2
136	Bảo hiểm tử kỳ	1	0	43	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1190477	2
137	Bảo hiểm tử kỳ	1	0	44	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1190477	2
138	Bảo hiểm tử kỳ	1	0	45	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1020409	2
139	Bảo hiểm tử kỳ	1	0	46	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1020409	2
140	Bảo hiểm tử kỳ	1	0	47	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1020409	2
141	Bảo hiểm tử kỳ	1	0	48	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1020409	2
142	Bảo hiểm tử kỳ	1	0	49	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1020409	2
143	Bảo hiểm tử kỳ	1	0	50	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	793651	2
144	Bảo hiểm tử kỳ	1	0	51	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	793651	2
145	Bảo hiểm tử kỳ	1	0	52	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	793651	2
146	Bảo hiểm tử kỳ	1	0	53	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	793651	2
147	Bảo hiểm tử kỳ	1	0	54	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	793651	2
148	Bảo hiểm tử kỳ	1	0	6	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
149	Bảo hiểm tử kỳ	1	0	7	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
150	Bảo hiểm tử kỳ	1	0	8	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
151	Bảo hiểm tử kỳ	1	0	9	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
152	Bảo hiểm tử kỳ	1	0	10	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
153	Bảo hiểm tử kỳ	1	0	11	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
154	Bảo hiểm tử kỳ	1	0	12	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
155	Bảo hiểm tử kỳ	1	0	13	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
156	Bảo hiểm tử kỳ	1	0	14	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
157	Bảo hiểm tử kỳ	1	0	15	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
158	Bảo hiểm tử kỳ	1	0	16	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
159	Bảo hiểm tử kỳ	1	0	17	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
160	Bảo hiểm tử kỳ	1	0	18	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
161	Bảo hiểm tử kỳ	1	0	19	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
162	Bảo hiểm tử kỳ	1	0	20	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
163	Bảo hiểm tử kỳ	1	0	21	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
164	Bảo hiểm tử kỳ	1	0	22	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
165	Bảo hiểm tử kỳ	1	0	23	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
166	Bảo hiểm tử kỳ	1	0	24	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
167	Bảo hiểm tử kỳ	1	0	25	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
168	Bảo hiểm tử kỳ	1	0	26	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
169	Bảo hiểm tử kỳ	1	0	27	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
170	Bảo hiểm tử kỳ	1	0	28	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
171	Bảo hiểm tử kỳ	1	0	29	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
172	Bảo hiểm tử kỳ	1	0	30	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
173	Bảo hiểm tử kỳ	1	0	31	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
174	Bảo hiểm tử kỳ	1	0	32	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
175	Bảo hiểm tử kỳ	1	0	33	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
176	Bảo hiểm tử kỳ	1	0	34	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
177	Bảo hiểm tử kỳ	1	0	35	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2500000	2
178	Bảo hiểm tử kỳ	1	0	36	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2500000	2
179	Bảo hiểm tử kỳ	1	0	37	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2500000	2
180	Bảo hiểm tử kỳ	1	0	38	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2500000	2
181	Bảo hiểm tử kỳ	1	0	39	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2500000	2
182	Bảo hiểm tử kỳ	1	0	40	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2380953	2
183	Bảo hiểm tử kỳ	1	0	41	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2380953	2
184	Bảo hiểm tử kỳ	1	0	42	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2380953	2
185	Bảo hiểm tử kỳ	1	0	43	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2380953	2
186	Bảo hiểm tử kỳ	1	0	44	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2380953	2
187	Bảo hiểm tử kỳ	1	0	45	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2040817	2
188	Bảo hiểm tử kỳ	1	0	46	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2040817	2
189	Bảo hiểm tử kỳ	1	0	47	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2040817	2
190	Bảo hiểm tử kỳ	1	0	48	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2040817	2
191	Bảo hiểm tử kỳ	1	0	49	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2040817	2
192	Bảo hiểm tử kỳ	1	0	50	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	1587302	2
193	Bảo hiểm tử kỳ	1	0	51	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	1587302	2
194	Bảo hiểm tử kỳ	1	0	52	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	1587302	2
195	Bảo hiểm tử kỳ	1	0	53	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	1587302	2
196	Bảo hiểm tử kỳ	1	0	54	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	1587302	2
197	Bảo hiểm tử kỳ	1	0	6	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
198	Bảo hiểm tử kỳ	1	0	7	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
199	Bảo hiểm tử kỳ	1	0	8	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
200	Bảo hiểm tử kỳ	1	0	9	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
201	Bảo hiểm tử kỳ	1	0	10	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
202	Bảo hiểm tử kỳ	1	0	11	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
203	Bảo hiểm tử kỳ	1	0	12	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
204	Bảo hiểm tử kỳ	1	0	13	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
205	Bảo hiểm tử kỳ	1	0	14	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
206	Bảo hiểm tử kỳ	1	0	15	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
207	Bảo hiểm tử kỳ	1	0	16	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
208	Bảo hiểm tử kỳ	1	0	17	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
209	Bảo hiểm tử kỳ	1	0	18	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
210	Bảo hiểm tử kỳ	1	0	19	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
211	Bảo hiểm tử kỳ	1	0	20	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
212	Bảo hiểm tử kỳ	1	0	21	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
213	Bảo hiểm tử kỳ	1	0	22	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
214	Bảo hiểm tử kỳ	1	0	23	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
215	Bảo hiểm tử kỳ	1	0	24	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
216	Bảo hiểm tử kỳ	1	0	25	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
217	Bảo hiểm tử kỳ	1	0	26	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
218	Bảo hiểm tử kỳ	1	0	27	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
219	Bảo hiểm tử kỳ	1	0	28	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
220	Bảo hiểm tử kỳ	1	0	29	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
221	Bảo hiểm tử kỳ	1	0	30	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
222	Bảo hiểm tử kỳ	1	0	31	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
223	Bảo hiểm tử kỳ	1	0	32	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
224	Bảo hiểm tử kỳ	1	0	33	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
225	Bảo hiểm tử kỳ	1	0	34	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
226	Bảo hiểm tử kỳ	1	0	35	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3750000	2
227	Bảo hiểm tử kỳ	1	0	36	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3750000	2
228	Bảo hiểm tử kỳ	1	0	37	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3750000	2
229	Bảo hiểm tử kỳ	1	0	38	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3750000	2
230	Bảo hiểm tử kỳ	1	0	39	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3750000	2
231	Bảo hiểm tử kỳ	1	0	40	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3571429	2
232	Bảo hiểm tử kỳ	1	0	41	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3571429	2
233	Bảo hiểm tử kỳ	1	0	42	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3571429	2
234	Bảo hiểm tử kỳ	1	0	43	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3571429	2
235	Bảo hiểm tử kỳ	1	0	44	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3571429	2
236	Bảo hiểm tử kỳ	1	0	45	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3061225	2
237	Bảo hiểm tử kỳ	1	0	46	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3061225	2
238	Bảo hiểm tử kỳ	1	0	47	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3061225	2
239	Bảo hiểm tử kỳ	1	0	48	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3061225	2
240	Bảo hiểm tử kỳ	1	0	49	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3061225	2
241	Bảo hiểm tử kỳ	1	0	50	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	2380953	2
242	Bảo hiểm tử kỳ	1	0	51	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	2380953	2
243	Bảo hiểm tử kỳ	1	0	52	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	2380953	2
244	Bảo hiểm tử kỳ	1	0	53	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	2380953	2
245	Bảo hiểm tử kỳ	1	0	54	1	1	1	Hoàn lại phí đóng	1	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	2380953	2
246	Bảo hiểm tử kỳ	1	0	6	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
247	Bảo hiểm tử kỳ	1	0	7	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
248	Bảo hiểm tử kỳ	1	0	8	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
249	Bảo hiểm tử kỳ	1	0	9	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
250	Bảo hiểm tử kỳ	1	0	10	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
251	Bảo hiểm tử kỳ	1	0	11	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
252	Bảo hiểm tử kỳ	1	0	12	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
253	Bảo hiểm tử kỳ	1	0	13	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
254	Bảo hiểm tử kỳ	1	0	14	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
255	Bảo hiểm tử kỳ	1	0	15	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
256	Bảo hiểm tử kỳ	1	0	16	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
257	Bảo hiểm tử kỳ	1	0	17	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
258	Bảo hiểm tử kỳ	1	0	18	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
259	Bảo hiểm tử kỳ	1	0	19	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
260	Bảo hiểm tử kỳ	1	0	20	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
261	Bảo hiểm tử kỳ	1	0	21	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
262	Bảo hiểm tử kỳ	1	0	22	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
263	Bảo hiểm tử kỳ	1	0	23	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
264	Bảo hiểm tử kỳ	1	0	24	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
265	Bảo hiểm tử kỳ	1	0	25	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
266	Bảo hiểm tử kỳ	1	0	26	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
267	Bảo hiểm tử kỳ	1	0	27	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
268	Bảo hiểm tử kỳ	1	0	28	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
269	Bảo hiểm tử kỳ	1	0	29	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
270	Bảo hiểm tử kỳ	1	0	30	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
271	Bảo hiểm tử kỳ	1	0	31	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
272	Bảo hiểm tử kỳ	1	0	32	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
273	Bảo hiểm tử kỳ	1	0	33	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
274	Bảo hiểm tử kỳ	1	0	34	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
275	Bảo hiểm tử kỳ	1	0	35	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	500000	2
276	Bảo hiểm tử kỳ	1	0	36	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	500000	2
277	Bảo hiểm tử kỳ	1	0	37	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	500000	2
278	Bảo hiểm tử kỳ	1	0	38	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	500000	2
279	Bảo hiểm tử kỳ	1	0	39	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	500000	2
280	Bảo hiểm tử kỳ	1	0	40	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	476191	2
281	Bảo hiểm tử kỳ	1	0	41	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	476191	2
282	Bảo hiểm tử kỳ	1	0	42	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	476191	2
283	Bảo hiểm tử kỳ	1	0	43	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	476191	2
284	Bảo hiểm tử kỳ	1	0	44	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	476191	2
285	Bảo hiểm tử kỳ	1	0	45	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	408164	2
286	Bảo hiểm tử kỳ	1	0	46	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	408164	2
287	Bảo hiểm tử kỳ	1	0	47	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	408164	2
288	Bảo hiểm tử kỳ	1	0	48	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	408164	2
289	Bảo hiểm tử kỳ	1	0	49	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	408164	2
290	Bảo hiểm tử kỳ	1	0	50	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	317461	2
291	Bảo hiểm tử kỳ	1	0	51	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	317461	2
292	Bảo hiểm tử kỳ	1	0	52	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	317461	2
293	Bảo hiểm tử kỳ	1	0	53	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	317461	2
294	Bảo hiểm tử kỳ	1	0	54	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	317461	2
295	Bảo hiểm tử kỳ	1	0	6	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
296	Bảo hiểm tử kỳ	1	0	7	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
297	Bảo hiểm tử kỳ	1	0	8	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
298	Bảo hiểm tử kỳ	1	0	9	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
299	Bảo hiểm tử kỳ	1	0	10	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
300	Bảo hiểm tử kỳ	1	0	11	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
301	Bảo hiểm tử kỳ	1	0	12	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
302	Bảo hiểm tử kỳ	1	0	13	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
303	Bảo hiểm tử kỳ	1	0	14	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
304	Bảo hiểm tử kỳ	1	0	15	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
305	Bảo hiểm tử kỳ	1	0	16	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
306	Bảo hiểm tử kỳ	1	0	17	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
307	Bảo hiểm tử kỳ	1	0	18	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
308	Bảo hiểm tử kỳ	1	0	19	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
309	Bảo hiểm tử kỳ	1	0	20	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
310	Bảo hiểm tử kỳ	1	0	21	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
311	Bảo hiểm tử kỳ	1	0	22	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
312	Bảo hiểm tử kỳ	1	0	23	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
313	Bảo hiểm tử kỳ	1	0	24	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
314	Bảo hiểm tử kỳ	1	0	25	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
315	Bảo hiểm tử kỳ	1	0	26	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
316	Bảo hiểm tử kỳ	1	0	27	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
317	Bảo hiểm tử kỳ	1	0	28	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
318	Bảo hiểm tử kỳ	1	0	29	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
319	Bảo hiểm tử kỳ	1	0	30	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
320	Bảo hiểm tử kỳ	1	0	31	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
321	Bảo hiểm tử kỳ	1	0	32	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
322	Bảo hiểm tử kỳ	1	0	33	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
323	Bảo hiểm tử kỳ	1	0	34	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
324	Bảo hiểm tử kỳ	1	0	35	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	875000	2
325	Bảo hiểm tử kỳ	1	0	36	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	875000	2
326	Bảo hiểm tử kỳ	1	0	37	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	875000	2
327	Bảo hiểm tử kỳ	1	0	38	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	875000	2
328	Bảo hiểm tử kỳ	1	0	39	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	875000	2
329	Bảo hiểm tử kỳ	1	0	40	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	833334	2
330	Bảo hiểm tử kỳ	1	0	41	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	833334	2
331	Bảo hiểm tử kỳ	1	0	42	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	833334	2
332	Bảo hiểm tử kỳ	1	0	43	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	833334	2
333	Bảo hiểm tử kỳ	1	0	44	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	833334	2
334	Bảo hiểm tử kỳ	1	0	45	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	714286	2
335	Bảo hiểm tử kỳ	1	0	46	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	714286	2
336	Bảo hiểm tử kỳ	1	0	47	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	714286	2
337	Bảo hiểm tử kỳ	1	0	48	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	714286	2
338	Bảo hiểm tử kỳ	1	0	49	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	714286	2
339	Bảo hiểm tử kỳ	1	0	50	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	555556	2
340	Bảo hiểm tử kỳ	1	0	51	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	555556	2
341	Bảo hiểm tử kỳ	1	0	52	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	555556	2
342	Bảo hiểm tử kỳ	1	0	53	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	555556	2
343	Bảo hiểm tử kỳ	1	0	54	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	555556	2
344	Bảo hiểm tử kỳ	1	0	6	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
345	Bảo hiểm tử kỳ	1	0	7	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
346	Bảo hiểm tử kỳ	1	0	8	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
347	Bảo hiểm tử kỳ	1	0	9	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
348	Bảo hiểm tử kỳ	1	0	10	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
349	Bảo hiểm tử kỳ	1	0	11	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
350	Bảo hiểm tử kỳ	1	0	12	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
351	Bảo hiểm tử kỳ	1	0	13	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
352	Bảo hiểm tử kỳ	1	0	14	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
353	Bảo hiểm tử kỳ	1	0	15	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
354	Bảo hiểm tử kỳ	1	0	16	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
355	Bảo hiểm tử kỳ	1	0	17	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
356	Bảo hiểm tử kỳ	1	0	18	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
357	Bảo hiểm tử kỳ	1	0	19	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
358	Bảo hiểm tử kỳ	1	0	20	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
359	Bảo hiểm tử kỳ	1	0	21	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
360	Bảo hiểm tử kỳ	1	0	22	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
361	Bảo hiểm tử kỳ	1	0	23	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
362	Bảo hiểm tử kỳ	1	0	24	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
363	Bảo hiểm tử kỳ	1	0	25	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
364	Bảo hiểm tử kỳ	1	0	26	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
365	Bảo hiểm tử kỳ	1	0	27	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
366	Bảo hiểm tử kỳ	1	0	28	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
367	Bảo hiểm tử kỳ	1	0	29	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
368	Bảo hiểm tử kỳ	1	0	30	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
369	Bảo hiểm tử kỳ	1	0	31	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
370	Bảo hiểm tử kỳ	1	0	32	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
371	Bảo hiểm tử kỳ	1	0	33	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
372	Bảo hiểm tử kỳ	1	0	34	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
373	Bảo hiểm tử kỳ	1	0	35	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1250000	2
374	Bảo hiểm tử kỳ	1	0	36	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1250000	2
375	Bảo hiểm tử kỳ	1	0	37	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1250000	2
376	Bảo hiểm tử kỳ	1	0	38	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1250000	2
377	Bảo hiểm tử kỳ	1	0	39	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1250000	2
378	Bảo hiểm tử kỳ	1	0	40	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1190477	2
379	Bảo hiểm tử kỳ	1	0	41	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1190477	2
380	Bảo hiểm tử kỳ	1	0	42	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1190477	2
381	Bảo hiểm tử kỳ	1	0	43	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1190477	2
382	Bảo hiểm tử kỳ	1	0	44	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1190477	2
383	Bảo hiểm tử kỳ	1	0	45	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1020409	2
384	Bảo hiểm tử kỳ	1	0	46	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1020409	2
385	Bảo hiểm tử kỳ	1	0	47	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1020409	2
386	Bảo hiểm tử kỳ	1	0	48	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1020409	2
387	Bảo hiểm tử kỳ	1	0	49	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1020409	2
388	Bảo hiểm tử kỳ	1	0	50	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	793651	2
389	Bảo hiểm tử kỳ	1	0	51	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	793651	2
390	Bảo hiểm tử kỳ	1	0	52	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	793651	2
391	Bảo hiểm tử kỳ	1	0	53	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	793651	2
392	Bảo hiểm tử kỳ	1	0	54	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	793651	2
393	Bảo hiểm tử kỳ	1	0	6	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
394	Bảo hiểm tử kỳ	1	0	7	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
395	Bảo hiểm tử kỳ	1	0	8	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
396	Bảo hiểm tử kỳ	1	0	9	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
397	Bảo hiểm tử kỳ	1	0	10	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
398	Bảo hiểm tử kỳ	1	0	11	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
399	Bảo hiểm tử kỳ	1	0	12	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
400	Bảo hiểm tử kỳ	1	0	13	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
401	Bảo hiểm tử kỳ	1	0	14	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
402	Bảo hiểm tử kỳ	1	0	15	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
403	Bảo hiểm tử kỳ	1	0	16	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
404	Bảo hiểm tử kỳ	1	0	17	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
405	Bảo hiểm tử kỳ	1	0	18	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
406	Bảo hiểm tử kỳ	1	0	19	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
407	Bảo hiểm tử kỳ	1	0	20	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
408	Bảo hiểm tử kỳ	1	0	21	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
409	Bảo hiểm tử kỳ	1	0	22	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
410	Bảo hiểm tử kỳ	1	0	23	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
411	Bảo hiểm tử kỳ	1	0	24	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
412	Bảo hiểm tử kỳ	1	0	25	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
413	Bảo hiểm tử kỳ	1	0	26	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
414	Bảo hiểm tử kỳ	1	0	27	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
415	Bảo hiểm tử kỳ	1	0	28	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
416	Bảo hiểm tử kỳ	1	0	29	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
417	Bảo hiểm tử kỳ	1	0	30	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
418	Bảo hiểm tử kỳ	1	0	31	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
419	Bảo hiểm tử kỳ	1	0	32	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
420	Bảo hiểm tử kỳ	1	0	33	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
421	Bảo hiểm tử kỳ	1	0	34	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
422	Bảo hiểm tử kỳ	1	0	35	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2500000	2
423	Bảo hiểm tử kỳ	1	0	36	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2500000	2
424	Bảo hiểm tử kỳ	1	0	37	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2500000	2
425	Bảo hiểm tử kỳ	1	0	38	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2500000	2
426	Bảo hiểm tử kỳ	1	0	39	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2500000	2
427	Bảo hiểm tử kỳ	1	0	40	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2380953	2
428	Bảo hiểm tử kỳ	1	0	41	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2380953	2
429	Bảo hiểm tử kỳ	1	0	42	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2380953	2
430	Bảo hiểm tử kỳ	1	0	43	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2380953	2
431	Bảo hiểm tử kỳ	1	0	44	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2380953	2
432	Bảo hiểm tử kỳ	1	0	45	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2040817	2
433	Bảo hiểm tử kỳ	1	0	46	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2040817	2
434	Bảo hiểm tử kỳ	1	0	47	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2040817	2
435	Bảo hiểm tử kỳ	1	0	48	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2040817	2
436	Bảo hiểm tử kỳ	1	0	49	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2040817	2
437	Bảo hiểm tử kỳ	1	0	50	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	1587302	2
438	Bảo hiểm tử kỳ	1	0	51	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	1587302	2
439	Bảo hiểm tử kỳ	1	0	52	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	1587302	2
440	Bảo hiểm tử kỳ	1	0	53	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	1587302	2
441	Bảo hiểm tử kỳ	1	0	54	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	1587302	2
442	Bảo hiểm tử kỳ	1	0	6	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
443	Bảo hiểm tử kỳ	1	0	7	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
444	Bảo hiểm tử kỳ	1	0	8	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
445	Bảo hiểm tử kỳ	1	0	9	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
446	Bảo hiểm tử kỳ	1	0	10	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
447	Bảo hiểm tử kỳ	1	0	11	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
448	Bảo hiểm tử kỳ	1	0	12	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
449	Bảo hiểm tử kỳ	1	0	13	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
450	Bảo hiểm tử kỳ	1	0	14	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
451	Bảo hiểm tử kỳ	1	0	15	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
452	Bảo hiểm tử kỳ	1	0	16	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
453	Bảo hiểm tử kỳ	1	0	17	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
454	Bảo hiểm tử kỳ	1	0	18	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
455	Bảo hiểm tử kỳ	1	0	19	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
456	Bảo hiểm tử kỳ	1	0	20	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
457	Bảo hiểm tử kỳ	1	0	21	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
458	Bảo hiểm tử kỳ	1	0	22	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
459	Bảo hiểm tử kỳ	1	0	23	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
460	Bảo hiểm tử kỳ	1	0	24	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
461	Bảo hiểm tử kỳ	1	0	25	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
462	Bảo hiểm tử kỳ	1	0	26	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
463	Bảo hiểm tử kỳ	1	0	27	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
464	Bảo hiểm tử kỳ	1	0	28	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
465	Bảo hiểm tử kỳ	1	0	29	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
466	Bảo hiểm tử kỳ	1	0	30	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
467	Bảo hiểm tử kỳ	1	0	31	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
468	Bảo hiểm tử kỳ	1	0	32	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
469	Bảo hiểm tử kỳ	1	0	33	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
470	Bảo hiểm tử kỳ	1	0	34	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
471	Bảo hiểm tử kỳ	1	0	35	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3750000	2
472	Bảo hiểm tử kỳ	1	0	36	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3750000	2
473	Bảo hiểm tử kỳ	1	0	37	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3750000	2
474	Bảo hiểm tử kỳ	1	0	38	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3750000	2
475	Bảo hiểm tử kỳ	1	0	39	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3750000	2
476	Bảo hiểm tử kỳ	1	0	40	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3571429	2
477	Bảo hiểm tử kỳ	1	0	41	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3571429	2
478	Bảo hiểm tử kỳ	1	0	42	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3571429	2
479	Bảo hiểm tử kỳ	1	0	43	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3571429	2
480	Bảo hiểm tử kỳ	1	0	44	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3571429	2
481	Bảo hiểm tử kỳ	1	0	45	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3061225	2
482	Bảo hiểm tử kỳ	1	0	46	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3061225	2
483	Bảo hiểm tử kỳ	1	0	47	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3061225	2
484	Bảo hiểm tử kỳ	1	0	48	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3061225	2
485	Bảo hiểm tử kỳ	1	0	49	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3061225	2
486	Bảo hiểm tử kỳ	1	0	50	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	2380953	2
487	Bảo hiểm tử kỳ	1	0	51	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	2380953	2
488	Bảo hiểm tử kỳ	1	0	52	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	2380953	2
489	Bảo hiểm tử kỳ	1	0	53	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	2380953	2
490	Bảo hiểm tử kỳ	1	0	54	1	1	1	Truyền thống	2	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	2380953	2
491	Bảo hiểm tử kỳ	1	0	6	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
492	Bảo hiểm tử kỳ	1	0	7	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
493	Bảo hiểm tử kỳ	1	0	8	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
494	Bảo hiểm tử kỳ	1	0	9	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
495	Bảo hiểm tử kỳ	1	0	10	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
496	Bảo hiểm tử kỳ	1	0	11	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
497	Bảo hiểm tử kỳ	1	0	12	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
498	Bảo hiểm tử kỳ	1	0	13	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
499	Bảo hiểm tử kỳ	1	0	14	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
500	Bảo hiểm tử kỳ	1	0	15	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
501	Bảo hiểm tử kỳ	1	0	16	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
502	Bảo hiểm tử kỳ	1	0	17	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
503	Bảo hiểm tử kỳ	1	0	18	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
504	Bảo hiểm tử kỳ	1	0	19	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
505	Bảo hiểm tử kỳ	1	0	20	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
506	Bảo hiểm tử kỳ	1	0	21	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
507	Bảo hiểm tử kỳ	1	0	22	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
508	Bảo hiểm tử kỳ	1	0	23	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
509	Bảo hiểm tử kỳ	1	0	24	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	816327	2
510	Bảo hiểm tử kỳ	1	0	25	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
511	Bảo hiểm tử kỳ	1	0	26	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
512	Bảo hiểm tử kỳ	1	0	27	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
513	Bảo hiểm tử kỳ	1	0	28	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
514	Bảo hiểm tử kỳ	1	0	29	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
515	Bảo hiểm tử kỳ	1	0	30	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
516	Bảo hiểm tử kỳ	1	0	31	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
517	Bảo hiểm tử kỳ	1	0	32	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
518	Bảo hiểm tử kỳ	1	0	33	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
519	Bảo hiểm tử kỳ	1	0	34	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	645162	2
520	Bảo hiểm tử kỳ	1	0	35	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	500000	2
521	Bảo hiểm tử kỳ	1	0	36	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	500000	2
522	Bảo hiểm tử kỳ	1	0	37	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	500000	2
523	Bảo hiểm tử kỳ	1	0	38	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	500000	2
524	Bảo hiểm tử kỳ	1	0	39	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	500000	2
525	Bảo hiểm tử kỳ	1	0	40	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	476191	2
526	Bảo hiểm tử kỳ	1	0	41	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	476191	2
527	Bảo hiểm tử kỳ	1	0	42	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	476191	2
528	Bảo hiểm tử kỳ	1	0	43	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	476191	2
529	Bảo hiểm tử kỳ	1	0	44	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	476191	2
530	Bảo hiểm tử kỳ	1	0	45	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	408164	2
531	Bảo hiểm tử kỳ	1	0	46	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	408164	2
532	Bảo hiểm tử kỳ	1	0	47	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	408164	2
533	Bảo hiểm tử kỳ	1	0	48	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	408164	2
534	Bảo hiểm tử kỳ	1	0	49	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	408164	2
535	Bảo hiểm tử kỳ	1	0	50	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	317461	2
536	Bảo hiểm tử kỳ	1	0	51	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	317461	2
537	Bảo hiểm tử kỳ	1	0	52	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	317461	2
538	Bảo hiểm tử kỳ	1	0	53	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	317461	2
539	Bảo hiểm tử kỳ	1	0	54	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	2000000	317461	2
540	Bảo hiểm tử kỳ	1	0	6	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
541	Bảo hiểm tử kỳ	1	0	7	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
542	Bảo hiểm tử kỳ	1	0	8	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
543	Bảo hiểm tử kỳ	1	0	9	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
544	Bảo hiểm tử kỳ	1	0	10	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
545	Bảo hiểm tử kỳ	1	0	11	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
546	Bảo hiểm tử kỳ	1	0	12	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
547	Bảo hiểm tử kỳ	1	0	13	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
548	Bảo hiểm tử kỳ	1	0	14	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
549	Bảo hiểm tử kỳ	1	0	15	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
550	Bảo hiểm tử kỳ	1	0	16	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
551	Bảo hiểm tử kỳ	1	0	17	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
552	Bảo hiểm tử kỳ	1	0	18	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
553	Bảo hiểm tử kỳ	1	0	19	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
554	Bảo hiểm tử kỳ	1	0	20	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
555	Bảo hiểm tử kỳ	1	0	21	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
556	Bảo hiểm tử kỳ	1	0	22	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
557	Bảo hiểm tử kỳ	1	0	23	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
558	Bảo hiểm tử kỳ	1	0	24	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1428572	2
559	Bảo hiểm tử kỳ	1	0	25	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
560	Bảo hiểm tử kỳ	1	0	26	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
561	Bảo hiểm tử kỳ	1	0	27	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
562	Bảo hiểm tử kỳ	1	0	28	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
563	Bảo hiểm tử kỳ	1	0	29	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
564	Bảo hiểm tử kỳ	1	0	30	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
565	Bảo hiểm tử kỳ	1	0	31	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
566	Bảo hiểm tử kỳ	1	0	32	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
567	Bảo hiểm tử kỳ	1	0	33	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
568	Bảo hiểm tử kỳ	1	0	34	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	1129033	2
569	Bảo hiểm tử kỳ	1	0	35	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	875000	2
570	Bảo hiểm tử kỳ	1	0	36	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	875000	2
571	Bảo hiểm tử kỳ	1	0	37	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	875000	2
572	Bảo hiểm tử kỳ	1	0	38	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	875000	2
573	Bảo hiểm tử kỳ	1	0	39	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	875000	2
574	Bảo hiểm tử kỳ	1	0	40	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	833334	2
575	Bảo hiểm tử kỳ	1	0	41	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	833334	2
576	Bảo hiểm tử kỳ	1	0	42	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	833334	2
577	Bảo hiểm tử kỳ	1	0	43	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	833334	2
578	Bảo hiểm tử kỳ	1	0	44	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	833334	2
579	Bảo hiểm tử kỳ	1	0	45	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	714286	2
580	Bảo hiểm tử kỳ	1	0	46	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	714286	2
581	Bảo hiểm tử kỳ	1	0	47	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	714286	2
582	Bảo hiểm tử kỳ	1	0	48	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	714286	2
583	Bảo hiểm tử kỳ	1	0	49	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	714286	2
584	Bảo hiểm tử kỳ	1	0	50	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	555556	2
585	Bảo hiểm tử kỳ	1	0	51	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	555556	2
586	Bảo hiểm tử kỳ	1	0	52	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	555556	2
587	Bảo hiểm tử kỳ	1	0	53	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	555556	2
588	Bảo hiểm tử kỳ	1	0	54	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	3500000	555556	2
589	Bảo hiểm tử kỳ	1	0	6	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
590	Bảo hiểm tử kỳ	1	0	7	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
591	Bảo hiểm tử kỳ	1	0	8	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
592	Bảo hiểm tử kỳ	1	0	9	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
593	Bảo hiểm tử kỳ	1	0	10	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
594	Bảo hiểm tử kỳ	1	0	11	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
595	Bảo hiểm tử kỳ	1	0	12	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
596	Bảo hiểm tử kỳ	1	0	13	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
597	Bảo hiểm tử kỳ	1	0	14	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
598	Bảo hiểm tử kỳ	1	0	15	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
599	Bảo hiểm tử kỳ	1	0	16	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
600	Bảo hiểm tử kỳ	1	0	17	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
601	Bảo hiểm tử kỳ	1	0	18	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
602	Bảo hiểm tử kỳ	1	0	19	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
603	Bảo hiểm tử kỳ	1	0	20	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
604	Bảo hiểm tử kỳ	1	0	21	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
605	Bảo hiểm tử kỳ	1	0	22	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
606	Bảo hiểm tử kỳ	1	0	23	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
607	Bảo hiểm tử kỳ	1	0	24	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	2040817	2
608	Bảo hiểm tử kỳ	1	0	25	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
609	Bảo hiểm tử kỳ	1	0	26	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
610	Bảo hiểm tử kỳ	1	0	27	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
611	Bảo hiểm tử kỳ	1	0	28	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
612	Bảo hiểm tử kỳ	1	0	29	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
613	Bảo hiểm tử kỳ	1	0	30	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
614	Bảo hiểm tử kỳ	1	0	31	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
615	Bảo hiểm tử kỳ	1	0	32	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
616	Bảo hiểm tử kỳ	1	0	33	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
617	Bảo hiểm tử kỳ	1	0	34	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1612904	2
618	Bảo hiểm tử kỳ	1	0	35	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1250000	2
619	Bảo hiểm tử kỳ	1	0	36	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1250000	2
620	Bảo hiểm tử kỳ	1	0	37	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1250000	2
621	Bảo hiểm tử kỳ	1	0	38	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1250000	2
622	Bảo hiểm tử kỳ	1	0	39	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1250000	2
623	Bảo hiểm tử kỳ	1	0	40	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1190477	2
624	Bảo hiểm tử kỳ	1	0	41	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1190477	2
625	Bảo hiểm tử kỳ	1	0	42	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1190477	2
626	Bảo hiểm tử kỳ	1	0	43	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1190477	2
627	Bảo hiểm tử kỳ	1	0	44	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1190477	2
628	Bảo hiểm tử kỳ	1	0	45	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1020409	2
629	Bảo hiểm tử kỳ	1	0	46	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1020409	2
630	Bảo hiểm tử kỳ	1	0	47	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1020409	2
631	Bảo hiểm tử kỳ	1	0	48	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1020409	2
632	Bảo hiểm tử kỳ	1	0	49	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	1020409	2
633	Bảo hiểm tử kỳ	1	0	50	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	793651	2
634	Bảo hiểm tử kỳ	1	0	51	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	793651	2
635	Bảo hiểm tử kỳ	1	0	52	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	793651	2
636	Bảo hiểm tử kỳ	1	0	53	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	793651	2
637	Bảo hiểm tử kỳ	1	0	54	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	5000000	793651	2
638	Bảo hiểm tử kỳ	1	0	6	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
639	Bảo hiểm tử kỳ	1	0	7	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
640	Bảo hiểm tử kỳ	1	0	8	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
641	Bảo hiểm tử kỳ	1	0	9	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
642	Bảo hiểm tử kỳ	1	0	10	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
643	Bảo hiểm tử kỳ	1	0	11	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
644	Bảo hiểm tử kỳ	1	0	12	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
645	Bảo hiểm tử kỳ	1	0	13	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
646	Bảo hiểm tử kỳ	1	0	14	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
647	Bảo hiểm tử kỳ	1	0	15	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
648	Bảo hiểm tử kỳ	1	0	16	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
649	Bảo hiểm tử kỳ	1	0	17	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
650	Bảo hiểm tử kỳ	1	0	18	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
651	Bảo hiểm tử kỳ	1	0	19	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
652	Bảo hiểm tử kỳ	1	0	20	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
653	Bảo hiểm tử kỳ	1	0	21	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
654	Bảo hiểm tử kỳ	1	0	22	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
655	Bảo hiểm tử kỳ	1	0	23	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
656	Bảo hiểm tử kỳ	1	0	24	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	4081633	2
657	Bảo hiểm tử kỳ	1	0	25	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
658	Bảo hiểm tử kỳ	1	0	26	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
659	Bảo hiểm tử kỳ	1	0	27	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
660	Bảo hiểm tử kỳ	1	0	28	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
661	Bảo hiểm tử kỳ	1	0	29	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
662	Bảo hiểm tử kỳ	1	0	30	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
663	Bảo hiểm tử kỳ	1	0	31	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
664	Bảo hiểm tử kỳ	1	0	32	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
665	Bảo hiểm tử kỳ	1	0	33	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
666	Bảo hiểm tử kỳ	1	0	34	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	3225807	2
667	Bảo hiểm tử kỳ	1	0	35	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2500000	2
668	Bảo hiểm tử kỳ	1	0	36	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2500000	2
669	Bảo hiểm tử kỳ	1	0	37	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2500000	2
670	Bảo hiểm tử kỳ	1	0	38	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2500000	2
671	Bảo hiểm tử kỳ	1	0	39	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2500000	2
672	Bảo hiểm tử kỳ	1	0	40	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2380953	2
673	Bảo hiểm tử kỳ	1	0	41	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2380953	2
674	Bảo hiểm tử kỳ	1	0	42	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2380953	2
675	Bảo hiểm tử kỳ	1	0	43	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2380953	2
676	Bảo hiểm tử kỳ	1	0	44	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2380953	2
677	Bảo hiểm tử kỳ	1	0	45	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2040817	2
678	Bảo hiểm tử kỳ	1	0	46	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2040817	2
679	Bảo hiểm tử kỳ	1	0	47	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2040817	2
680	Bảo hiểm tử kỳ	1	0	48	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2040817	2
681	Bảo hiểm tử kỳ	1	0	49	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	2040817	2
682	Bảo hiểm tử kỳ	1	0	50	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	1587302	2
683	Bảo hiểm tử kỳ	1	0	51	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	1587302	2
684	Bảo hiểm tử kỳ	1	0	52	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	1587302	2
685	Bảo hiểm tử kỳ	1	0	53	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	1587302	2
686	Bảo hiểm tử kỳ	1	0	54	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	10000000	1587302	2
687	Bảo hiểm tử kỳ	1	0	6	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
688	Bảo hiểm tử kỳ	1	0	7	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
689	Bảo hiểm tử kỳ	1	0	8	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
690	Bảo hiểm tử kỳ	1	0	9	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
691	Bảo hiểm tử kỳ	1	0	10	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
692	Bảo hiểm tử kỳ	1	0	11	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
693	Bảo hiểm tử kỳ	1	0	12	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
694	Bảo hiểm tử kỳ	1	0	13	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
695	Bảo hiểm tử kỳ	1	0	14	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
696	Bảo hiểm tử kỳ	1	0	15	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
697	Bảo hiểm tử kỳ	1	0	16	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
698	Bảo hiểm tử kỳ	1	0	17	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
699	Bảo hiểm tử kỳ	1	0	18	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
700	Bảo hiểm tử kỳ	1	0	19	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
701	Bảo hiểm tử kỳ	1	0	20	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
702	Bảo hiểm tử kỳ	1	0	21	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
703	Bảo hiểm tử kỳ	1	0	22	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
704	Bảo hiểm tử kỳ	1	0	23	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
705	Bảo hiểm tử kỳ	1	0	24	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	6122449	2
706	Bảo hiểm tử kỳ	1	0	25	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
707	Bảo hiểm tử kỳ	1	0	26	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
708	Bảo hiểm tử kỳ	1	0	27	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
709	Bảo hiểm tử kỳ	1	0	28	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
710	Bảo hiểm tử kỳ	1	0	29	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
711	Bảo hiểm tử kỳ	1	0	30	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
712	Bảo hiểm tử kỳ	1	0	31	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
713	Bảo hiểm tử kỳ	1	0	32	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
714	Bảo hiểm tử kỳ	1	0	33	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
715	Bảo hiểm tử kỳ	1	0	34	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	4838710	2
716	Bảo hiểm tử kỳ	1	0	35	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3750000	2
717	Bảo hiểm tử kỳ	1	0	36	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3750000	2
718	Bảo hiểm tử kỳ	1	0	37	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3750000	2
719	Bảo hiểm tử kỳ	1	0	38	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3750000	2
720	Bảo hiểm tử kỳ	1	0	39	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3750000	2
721	Bảo hiểm tử kỳ	1	0	40	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3571429	2
722	Bảo hiểm tử kỳ	1	0	41	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3571429	2
723	Bảo hiểm tử kỳ	1	0	42	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3571429	2
724	Bảo hiểm tử kỳ	1	0	43	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3571429	2
725	Bảo hiểm tử kỳ	1	0	44	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3571429	2
726	Bảo hiểm tử kỳ	1	0	45	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3061225	2
727	Bảo hiểm tử kỳ	1	0	46	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3061225	2
728	Bảo hiểm tử kỳ	1	0	47	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3061225	2
729	Bảo hiểm tử kỳ	1	0	48	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3061225	2
730	Bảo hiểm tử kỳ	1	0	49	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	3061225	2
731	Bảo hiểm tử kỳ	1	0	50	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	2380953	2
732	Bảo hiểm tử kỳ	1	0	51	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	2380953	2
733	Bảo hiểm tử kỳ	1	0	52	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	2380953	2
734	Bảo hiểm tử kỳ	1	0	53	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	2380953	2
735	Bảo hiểm tử kỳ	1	0	54	1	1	1	Thai sản	3	Phúc bảo bổ trợ nằm viện và phẫu thuật	1	15000000	2380953	2
736	Bảo hiểm tử kỳ	1	1	6	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	420000	2
737	Bảo hiểm tử kỳ	1	1	7	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	420000	2
738	Bảo hiểm tử kỳ	1	1	8	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	430000	2
739	Bảo hiểm tử kỳ	1	1	9	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	440000	2
740	Bảo hiểm tử kỳ	1	1	10	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	460000	2
741	Bảo hiểm tử kỳ	1	1	11	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	470000	2
742	Bảo hiểm tử kỳ	1	1	12	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	480000	2
743	Bảo hiểm tử kỳ	1	1	13	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	480000	2
744	Bảo hiểm tử kỳ	1	1	14	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	480000	2
745	Bảo hiểm tử kỳ	1	1	15	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	480000	2
746	Bảo hiểm tử kỳ	1	1	16	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	480000	2
747	Bảo hiểm tử kỳ	1	1	17	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	480000	2
748	Bảo hiểm tử kỳ	1	1	18	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	520000	2
749	Bảo hiểm tử kỳ	1	1	19	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	560000	2
750	Bảo hiểm tử kỳ	1	1	20	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	570000	2
751	Bảo hiểm tử kỳ	1	1	21	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	600000	2
752	Bảo hiểm tử kỳ	1	1	22	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	620000	2
753	Bảo hiểm tử kỳ	1	1	23	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	660000	2
754	Bảo hiểm tử kỳ	1	1	24	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	700000	2
755	Bảo hiểm tử kỳ	1	1	25	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	760000	2
756	Bảo hiểm tử kỳ	1	1	26	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	840000	2
757	Bảo hiểm tử kỳ	1	1	27	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	920000	2
758	Bảo hiểm tử kỳ	1	1	28	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1000000	2
759	Bảo hiểm tử kỳ	1	1	29	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1080000	2
760	Bảo hiểm tử kỳ	1	1	30	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1180000	2
761	Bảo hiểm tử kỳ	1	1	31	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1260000	2
762	Bảo hiểm tử kỳ	1	1	32	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1340000	2
763	Bảo hiểm tử kỳ	1	1	33	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1460000	2
764	Bảo hiểm tử kỳ	1	1	34	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1580000	2
765	Bảo hiểm tử kỳ	1	1	35	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1740000	2
766	Bảo hiểm tử kỳ	1	1	36	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1900000	2
767	Bảo hiểm tử kỳ	1	1	37	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2120000	2
768	Bảo hiểm tử kỳ	1	1	38	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2340000	2
769	Bảo hiểm tử kỳ	1	1	39	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2560000	2
770	Bảo hiểm tử kỳ	1	1	40	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2800000	2
771	Bảo hiểm tử kỳ	1	1	41	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3060000	2
772	Bảo hiểm tử kỳ	1	1	42	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3300000	2
773	Bảo hiểm tử kỳ	1	1	43	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3540000	2
774	Bảo hiểm tử kỳ	1	1	44	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3780000	2
775	Bảo hiểm tử kỳ	1	1	45	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4000000	2
776	Bảo hiểm tử kỳ	1	1	46	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4240000	2
777	Bảo hiểm tử kỳ	1	1	47	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4500000	2
778	Bảo hiểm tử kỳ	1	1	48	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4720000	2
779	Bảo hiểm tử kỳ	1	1	49	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4980000	2
780	Bảo hiểm tử kỳ	1	1	50	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5300000	2
781	Bảo hiểm tử kỳ	1	1	51	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5640000	2
782	Bảo hiểm tử kỳ	1	1	52	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5980000	2
783	Bảo hiểm tử kỳ	1	1	53	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6360000	2
784	Bảo hiểm tử kỳ	1	1	54	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6700000	2
785	Bảo hiểm tử kỳ	1	1	55	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7000000	2
786	Bảo hiểm tử kỳ	1	1	56	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7400000	2
787	Bảo hiểm tử kỳ	1	1	57	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7600000	2
788	Bảo hiểm tử kỳ	1	1	58	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7700000	2
789	Bảo hiểm tử kỳ	1	1	59	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7760000	2
790	Bảo hiểm tử kỳ	1	1	60	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7800000	2
791	Bảo hiểm tử kỳ	1	1	6	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	630000	2
792	Bảo hiểm tử kỳ	1	1	7	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	630000	2
793	Bảo hiểm tử kỳ	1	1	8	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	645000	2
794	Bảo hiểm tử kỳ	1	1	9	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	660000	2
795	Bảo hiểm tử kỳ	1	1	10	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	690000	2
796	Bảo hiểm tử kỳ	1	1	11	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	705000	2
797	Bảo hiểm tử kỳ	1	1	12	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	720000	2
798	Bảo hiểm tử kỳ	1	1	13	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	720000	2
799	Bảo hiểm tử kỳ	1	1	14	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	720000	2
800	Bảo hiểm tử kỳ	1	1	15	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	720000	2
801	Bảo hiểm tử kỳ	1	1	16	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	720000	2
802	Bảo hiểm tử kỳ	1	1	17	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	720000	2
803	Bảo hiểm tử kỳ	1	1	18	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	780000	2
804	Bảo hiểm tử kỳ	1	1	19	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	840000	2
805	Bảo hiểm tử kỳ	1	1	20	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	855000	2
806	Bảo hiểm tử kỳ	1	1	21	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	900000	2
807	Bảo hiểm tử kỳ	1	1	22	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	930000	2
808	Bảo hiểm tử kỳ	1	1	23	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	990000	2
809	Bảo hiểm tử kỳ	1	1	24	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1050000	2
810	Bảo hiểm tử kỳ	1	1	25	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1140000	2
811	Bảo hiểm tử kỳ	1	1	26	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1260000	2
812	Bảo hiểm tử kỳ	1	1	27	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1380000	2
813	Bảo hiểm tử kỳ	1	1	28	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1500000	2
814	Bảo hiểm tử kỳ	1	1	29	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1620000	2
815	Bảo hiểm tử kỳ	1	1	30	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1770000	2
816	Bảo hiểm tử kỳ	1	1	31	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1890000	2
817	Bảo hiểm tử kỳ	1	1	32	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2010000	2
818	Bảo hiểm tử kỳ	1	1	33	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2190000	2
819	Bảo hiểm tử kỳ	1	1	34	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2370000	2
820	Bảo hiểm tử kỳ	1	1	35	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2610000	2
821	Bảo hiểm tử kỳ	1	1	36	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2850000	2
822	Bảo hiểm tử kỳ	1	1	37	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3180000	2
823	Bảo hiểm tử kỳ	1	1	38	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3510000	2
824	Bảo hiểm tử kỳ	1	1	39	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3840000	2
825	Bảo hiểm tử kỳ	1	1	40	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4200000	2
826	Bảo hiểm tử kỳ	1	1	41	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4590000	2
827	Bảo hiểm tử kỳ	1	1	42	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4950000	2
828	Bảo hiểm tử kỳ	1	1	43	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5310000	2
829	Bảo hiểm tử kỳ	1	1	44	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5670000	2
830	Bảo hiểm tử kỳ	1	1	45	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6000000	2
831	Bảo hiểm tử kỳ	1	1	46	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6360000	2
832	Bảo hiểm tử kỳ	1	1	47	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6750000	2
833	Bảo hiểm tử kỳ	1	1	48	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7080000	2
834	Bảo hiểm tử kỳ	1	1	49	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7470000	2
835	Bảo hiểm tử kỳ	1	1	50	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7950000	2
836	Bảo hiểm tử kỳ	1	1	51	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	8460000	2
837	Bảo hiểm tử kỳ	1	1	52	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	8970000	2
838	Bảo hiểm tử kỳ	1	1	53	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	9540000	2
839	Bảo hiểm tử kỳ	1	1	54	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	10050000	2
840	Bảo hiểm tử kỳ	1	1	55	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	10500000	2
841	Bảo hiểm tử kỳ	1	1	56	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11100000	2
842	Bảo hiểm tử kỳ	1	1	57	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11400000	2
843	Bảo hiểm tử kỳ	1	1	58	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11550000	2
844	Bảo hiểm tử kỳ	1	1	59	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11640000	2
845	Bảo hiểm tử kỳ	1	1	60	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11700000	2
846	Bảo hiểm tử kỳ	1	1	6	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1050000	2
847	Bảo hiểm tử kỳ	1	1	7	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1050000	2
848	Bảo hiểm tử kỳ	1	1	8	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1075000	2
849	Bảo hiểm tử kỳ	1	1	9	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1100000	2
850	Bảo hiểm tử kỳ	1	1	10	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1150000	2
851	Bảo hiểm tử kỳ	1	1	11	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1175000	2
852	Bảo hiểm tử kỳ	1	1	12	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1200000	2
853	Bảo hiểm tử kỳ	1	1	13	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1200000	2
854	Bảo hiểm tử kỳ	1	1	14	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1200000	2
855	Bảo hiểm tử kỳ	1	1	15	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1200000	2
856	Bảo hiểm tử kỳ	1	1	16	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1200000	2
857	Bảo hiểm tử kỳ	1	1	17	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1200000	2
858	Bảo hiểm tử kỳ	1	1	18	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1300000	2
859	Bảo hiểm tử kỳ	1	1	19	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1400000	2
860	Bảo hiểm tử kỳ	1	1	20	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1425000	2
861	Bảo hiểm tử kỳ	1	1	21	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1500000	2
862	Bảo hiểm tử kỳ	1	1	22	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1550000	2
863	Bảo hiểm tử kỳ	1	1	23	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1650000	2
864	Bảo hiểm tử kỳ	1	1	24	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1750000	2
865	Bảo hiểm tử kỳ	1	1	25	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1900000	2
866	Bảo hiểm tử kỳ	1	1	26	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2100000	2
867	Bảo hiểm tử kỳ	1	1	27	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2300000	2
868	Bảo hiểm tử kỳ	1	1	28	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2500000	2
869	Bảo hiểm tử kỳ	1	1	29	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2700000	2
870	Bảo hiểm tử kỳ	1	1	30	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2950000	2
871	Bảo hiểm tử kỳ	1	1	31	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3150000	2
872	Bảo hiểm tử kỳ	1	1	32	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3350000	2
873	Bảo hiểm tử kỳ	1	1	33	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3650000	2
874	Bảo hiểm tử kỳ	1	1	34	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3950000	2
875	Bảo hiểm tử kỳ	1	1	35	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4350000	2
876	Bảo hiểm tử kỳ	1	1	36	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4750000	2
877	Bảo hiểm tử kỳ	1	1	37	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5300000	2
878	Bảo hiểm tử kỳ	1	1	38	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5850000	2
879	Bảo hiểm tử kỳ	1	1	39	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	6400000	2
880	Bảo hiểm tử kỳ	1	1	40	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	7000000	2
881	Bảo hiểm tử kỳ	1	1	41	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	7650000	2
882	Bảo hiểm tử kỳ	1	1	42	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	8250000	2
883	Bảo hiểm tử kỳ	1	1	43	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	8850000	2
884	Bảo hiểm tử kỳ	1	1	44	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	9450000	2
885	Bảo hiểm tử kỳ	1	1	45	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	10000000	2
886	Bảo hiểm tử kỳ	1	1	46	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	10600000	2
887	Bảo hiểm tử kỳ	1	1	47	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	11250000	2
888	Bảo hiểm tử kỳ	1	1	48	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	11800000	2
889	Bảo hiểm tử kỳ	1	1	49	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	12450000	2
890	Bảo hiểm tử kỳ	1	1	50	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	13250000	2
891	Bảo hiểm tử kỳ	1	1	51	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	14100000	2
892	Bảo hiểm tử kỳ	1	1	52	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	14950000	2
893	Bảo hiểm tử kỳ	1	1	53	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	15900000	2
894	Bảo hiểm tử kỳ	1	1	54	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	16750000	2
895	Bảo hiểm tử kỳ	1	1	55	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	17500000	2
896	Bảo hiểm tử kỳ	1	1	56	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	18500000	2
897	Bảo hiểm tử kỳ	1	1	57	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	19000000	2
898	Bảo hiểm tử kỳ	1	1	58	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	19250000	2
899	Bảo hiểm tử kỳ	1	1	59	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	19400000	2
900	Bảo hiểm tử kỳ	1	1	60	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	19500000	2
901	Bảo hiểm tử kỳ	1	1	6	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2100000	2
902	Bảo hiểm tử kỳ	1	1	7	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2100000	2
903	Bảo hiểm tử kỳ	1	1	8	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2150000	2
904	Bảo hiểm tử kỳ	1	1	9	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2200000	2
905	Bảo hiểm tử kỳ	1	1	10	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2300000	2
906	Bảo hiểm tử kỳ	1	1	11	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2350000	2
907	Bảo hiểm tử kỳ	1	1	12	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2400000	2
908	Bảo hiểm tử kỳ	1	1	13	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2400000	2
909	Bảo hiểm tử kỳ	1	1	14	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2400000	2
910	Bảo hiểm tử kỳ	1	1	15	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2400000	2
911	Bảo hiểm tử kỳ	1	1	16	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2400000	2
912	Bảo hiểm tử kỳ	1	1	17	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2400000	2
913	Bảo hiểm tử kỳ	1	1	18	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2600000	2
914	Bảo hiểm tử kỳ	1	1	19	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2800000	2
915	Bảo hiểm tử kỳ	1	1	20	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2850000	2
916	Bảo hiểm tử kỳ	1	1	21	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3000000	2
917	Bảo hiểm tử kỳ	1	1	22	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3100000	2
918	Bảo hiểm tử kỳ	1	1	23	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3300000	2
919	Bảo hiểm tử kỳ	1	1	24	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3500000	2
920	Bảo hiểm tử kỳ	1	1	25	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3800000	2
921	Bảo hiểm tử kỳ	1	1	26	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4200000	2
922	Bảo hiểm tử kỳ	1	1	27	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4600000	2
923	Bảo hiểm tử kỳ	1	1	28	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	5000000	2
924	Bảo hiểm tử kỳ	1	1	29	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	5400000	2
925	Bảo hiểm tử kỳ	1	1	30	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	5900000	2
926	Bảo hiểm tử kỳ	1	1	31	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	6300000	2
927	Bảo hiểm tử kỳ	1	1	32	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	6700000	2
928	Bảo hiểm tử kỳ	1	1	33	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	7300000	2
929	Bảo hiểm tử kỳ	1	1	34	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	7900000	2
930	Bảo hiểm tử kỳ	1	1	35	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	8700000	2
931	Bảo hiểm tử kỳ	1	1	36	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	9500000	2
932	Bảo hiểm tử kỳ	1	1	37	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	10600000	2
933	Bảo hiểm tử kỳ	1	1	38	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	11700000	2
934	Bảo hiểm tử kỳ	1	1	39	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	12800000	2
935	Bảo hiểm tử kỳ	1	1	40	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	14000000	2
936	Bảo hiểm tử kỳ	1	1	41	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	15300000	2
937	Bảo hiểm tử kỳ	1	1	42	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	16500000	2
938	Bảo hiểm tử kỳ	1	1	43	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	17700000	2
939	Bảo hiểm tử kỳ	1	1	44	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	18900000	2
940	Bảo hiểm tử kỳ	1	1	45	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	20000000	2
941	Bảo hiểm tử kỳ	1	1	46	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	21200000	2
942	Bảo hiểm tử kỳ	1	1	47	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	22500000	2
943	Bảo hiểm tử kỳ	1	1	48	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	23600000	2
944	Bảo hiểm tử kỳ	1	1	49	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	24900000	2
945	Bảo hiểm tử kỳ	1	1	50	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	26500000	2
946	Bảo hiểm tử kỳ	1	1	51	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	28200000	2
947	Bảo hiểm tử kỳ	1	1	52	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	29900000	2
948	Bảo hiểm tử kỳ	1	1	53	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	31800000	2
949	Bảo hiểm tử kỳ	1	1	54	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	33500000	2
950	Bảo hiểm tử kỳ	1	1	55	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	35000000	2
951	Bảo hiểm tử kỳ	1	1	56	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	37000000	2
952	Bảo hiểm tử kỳ	1	1	57	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	38000000	2
953	Bảo hiểm tử kỳ	1	1	58	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	38500000	2
954	Bảo hiểm tử kỳ	1	1	59	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	38800000	2
955	Bảo hiểm tử kỳ	1	1	60	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	39000000	2
956	Bảo hiểm tử kỳ	1	1	6	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	420000	2
957	Bảo hiểm tử kỳ	1	1	7	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	420000	2
958	Bảo hiểm tử kỳ	1	1	8	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	430000	2
959	Bảo hiểm tử kỳ	1	1	9	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	440000	2
960	Bảo hiểm tử kỳ	1	1	10	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	460000	2
961	Bảo hiểm tử kỳ	1	1	11	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	470000	2
962	Bảo hiểm tử kỳ	1	1	12	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	480000	2
963	Bảo hiểm tử kỳ	1	1	13	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	490000	2
964	Bảo hiểm tử kỳ	1	1	14	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	490000	2
965	Bảo hiểm tử kỳ	1	1	15	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	490000	2
966	Bảo hiểm tử kỳ	1	1	16	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	490000	2
967	Bảo hiểm tử kỳ	1	1	17	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	500000	2
968	Bảo hiểm tử kỳ	1	1	18	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	520000	2
969	Bảo hiểm tử kỳ	1	1	19	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	570000	2
970	Bảo hiểm tử kỳ	1	1	20	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	580000	2
971	Bảo hiểm tử kỳ	1	1	21	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	620000	2
972	Bảo hiểm tử kỳ	1	1	22	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	650000	2
973	Bảo hiểm tử kỳ	1	1	23	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	660000	2
974	Bảo hiểm tử kỳ	1	1	24	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	740000	2
975	Bảo hiểm tử kỳ	1	1	25	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	800000	2
976	Bảo hiểm tử kỳ	1	1	26	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	840000	2
977	Bảo hiểm tử kỳ	1	1	27	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	920000	2
978	Bảo hiểm tử kỳ	1	1	28	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1000000	2
979	Bảo hiểm tử kỳ	1	1	29	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1080000	2
980	Bảo hiểm tử kỳ	1	1	30	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1200000	2
981	Bảo hiểm tử kỳ	1	1	31	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1260000	2
982	Bảo hiểm tử kỳ	1	1	32	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1380000	2
983	Bảo hiểm tử kỳ	1	1	33	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1500000	2
984	Bảo hiểm tử kỳ	1	1	34	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1640000	2
985	Bảo hiểm tử kỳ	1	1	35	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1800000	2
986	Bảo hiểm tử kỳ	1	1	36	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1980000	2
987	Bảo hiểm tử kỳ	1	1	37	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2180000	2
988	Bảo hiểm tử kỳ	1	1	38	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2400000	2
989	Bảo hiểm tử kỳ	1	1	39	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2620000	2
990	Bảo hiểm tử kỳ	1	1	40	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2860000	2
991	Bảo hiểm tử kỳ	1	1	41	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3080000	2
992	Bảo hiểm tử kỳ	1	1	42	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3320000	2
993	Bảo hiểm tử kỳ	1	1	43	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3540000	2
994	Bảo hiểm tử kỳ	1	1	44	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3860000	2
995	Bảo hiểm tử kỳ	1	1	45	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4120000	2
996	Bảo hiểm tử kỳ	1	1	46	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4400000	2
997	Bảo hiểm tử kỳ	1	1	47	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4660000	2
998	Bảo hiểm tử kỳ	1	1	48	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4880000	2
999	Bảo hiểm tử kỳ	1	1	49	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5180000	2
1000	Bảo hiểm tử kỳ	1	1	50	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5300000	2
1001	Bảo hiểm tử kỳ	1	1	51	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5760000	2
1002	Bảo hiểm tử kỳ	1	1	52	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6060000	2
1003	Bảo hiểm tử kỳ	1	1	53	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6440000	2
1004	Bảo hiểm tử kỳ	1	1	54	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6780000	2
1005	Bảo hiểm tử kỳ	1	1	55	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7080000	2
1006	Bảo hiểm tử kỳ	1	1	56	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7420000	2
1007	Bảo hiểm tử kỳ	1	1	57	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7640000	2
1008	Bảo hiểm tử kỳ	1	1	58	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7780000	2
1009	Bảo hiểm tử kỳ	1	1	59	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7860000	2
1010	Bảo hiểm tử kỳ	1	1	60	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7880000	2
1011	Bảo hiểm tử kỳ	1	1	6	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	630000	2
1012	Bảo hiểm tử kỳ	1	1	7	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	630000	2
1013	Bảo hiểm tử kỳ	1	1	8	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	645000	2
1014	Bảo hiểm tử kỳ	1	1	9	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	660000	2
1015	Bảo hiểm tử kỳ	1	1	10	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	690000	2
1016	Bảo hiểm tử kỳ	1	1	11	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	705000	2
1017	Bảo hiểm tử kỳ	1	1	12	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	720000	2
1018	Bảo hiểm tử kỳ	1	1	13	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	735000	2
1019	Bảo hiểm tử kỳ	1	1	14	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	735000	2
1020	Bảo hiểm tử kỳ	1	1	15	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	735000	2
1021	Bảo hiểm tử kỳ	1	1	16	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	735000	2
1022	Bảo hiểm tử kỳ	1	1	17	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	750000	2
1023	Bảo hiểm tử kỳ	1	1	18	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	780000	2
1024	Bảo hiểm tử kỳ	1	1	19	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	855000	2
1025	Bảo hiểm tử kỳ	1	1	20	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	870000	2
1026	Bảo hiểm tử kỳ	1	1	21	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	930000	2
1027	Bảo hiểm tử kỳ	1	1	22	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	975000	2
1028	Bảo hiểm tử kỳ	1	1	23	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	990000	2
1029	Bảo hiểm tử kỳ	1	1	24	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1110000	2
1030	Bảo hiểm tử kỳ	1	1	25	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1200000	2
1031	Bảo hiểm tử kỳ	1	1	26	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1260000	2
1032	Bảo hiểm tử kỳ	1	1	27	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1380000	2
1033	Bảo hiểm tử kỳ	1	1	28	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1500000	2
1034	Bảo hiểm tử kỳ	1	1	29	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1620000	2
1035	Bảo hiểm tử kỳ	1	1	30	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1800000	2
1036	Bảo hiểm tử kỳ	1	1	31	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1890000	2
1037	Bảo hiểm tử kỳ	1	1	32	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2070000	2
1038	Bảo hiểm tử kỳ	1	1	33	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2250000	2
1039	Bảo hiểm tử kỳ	1	1	34	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2460000	2
1040	Bảo hiểm tử kỳ	1	1	35	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2700000	2
1041	Bảo hiểm tử kỳ	1	1	36	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2970000	2
1042	Bảo hiểm tử kỳ	1	1	37	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3270000	2
1043	Bảo hiểm tử kỳ	1	1	38	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3600000	2
1044	Bảo hiểm tử kỳ	1	1	39	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3930000	2
1045	Bảo hiểm tử kỳ	1	1	40	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4290000	2
1046	Bảo hiểm tử kỳ	1	1	41	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4620000	2
1047	Bảo hiểm tử kỳ	1	1	42	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4980000	2
1048	Bảo hiểm tử kỳ	1	1	43	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5310000	2
1049	Bảo hiểm tử kỳ	1	1	44	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5790000	2
1050	Bảo hiểm tử kỳ	1	1	45	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6180000	2
1051	Bảo hiểm tử kỳ	1	1	46	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6600000	2
1052	Bảo hiểm tử kỳ	1	1	47	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6990000	2
1053	Bảo hiểm tử kỳ	1	1	48	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7320000	2
1054	Bảo hiểm tử kỳ	1	1	49	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7770000	2
1055	Bảo hiểm tử kỳ	1	1	50	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7950000	2
1056	Bảo hiểm tử kỳ	1	1	51	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	8640000	2
1057	Bảo hiểm tử kỳ	1	1	52	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	9090000	2
1058	Bảo hiểm tử kỳ	1	1	53	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	9660000	2
1059	Bảo hiểm tử kỳ	1	1	54	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	10170000	2
1060	Bảo hiểm tử kỳ	1	1	55	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	10620000	2
1061	Bảo hiểm tử kỳ	1	1	56	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11130000	2
1062	Bảo hiểm tử kỳ	1	1	57	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11460000	2
1063	Bảo hiểm tử kỳ	1	1	58	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11670000	2
1064	Bảo hiểm tử kỳ	1	1	59	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11790000	2
1065	Bảo hiểm tử kỳ	1	1	60	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11820000	2
1066	Bảo hiểm tử kỳ	1	1	6	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1050000	2
1067	Bảo hiểm tử kỳ	1	1	7	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1050000	2
1068	Bảo hiểm tử kỳ	1	1	8	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1075000	2
1069	Bảo hiểm tử kỳ	1	1	9	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1100000	2
1070	Bảo hiểm tử kỳ	1	1	10	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1150000	2
1071	Bảo hiểm tử kỳ	1	1	11	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1175000	2
1072	Bảo hiểm tử kỳ	1	1	12	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1200000	2
1073	Bảo hiểm tử kỳ	1	1	13	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1225000	2
1074	Bảo hiểm tử kỳ	1	1	14	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1225000	2
1075	Bảo hiểm tử kỳ	1	1	15	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1225000	2
1076	Bảo hiểm tử kỳ	1	1	16	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1225000	2
1077	Bảo hiểm tử kỳ	1	1	17	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1250000	2
1078	Bảo hiểm tử kỳ	1	1	18	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1300000	2
1079	Bảo hiểm tử kỳ	1	1	19	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1425000	2
1080	Bảo hiểm tử kỳ	1	1	20	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1450000	2
1081	Bảo hiểm tử kỳ	1	1	21	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1550000	2
1082	Bảo hiểm tử kỳ	1	1	22	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1625000	2
1083	Bảo hiểm tử kỳ	1	1	23	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1650000	2
1084	Bảo hiểm tử kỳ	1	1	24	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1850000	2
1085	Bảo hiểm tử kỳ	1	1	25	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2000000	2
1086	Bảo hiểm tử kỳ	1	1	26	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2100000	2
1087	Bảo hiểm tử kỳ	1	1	27	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2300000	2
1088	Bảo hiểm tử kỳ	1	1	28	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2500000	2
1089	Bảo hiểm tử kỳ	1	1	29	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2700000	2
1090	Bảo hiểm tử kỳ	1	1	30	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3000000	2
1091	Bảo hiểm tử kỳ	1	1	31	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3150000	2
1092	Bảo hiểm tử kỳ	1	1	32	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3450000	2
1093	Bảo hiểm tử kỳ	1	1	33	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3750000	2
1094	Bảo hiểm tử kỳ	1	1	34	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4100000	2
1095	Bảo hiểm tử kỳ	1	1	35	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4500000	2
1096	Bảo hiểm tử kỳ	1	1	36	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4950000	2
1097	Bảo hiểm tử kỳ	1	1	37	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5450000	2
1098	Bảo hiểm tử kỳ	1	1	38	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	6000000	2
1099	Bảo hiểm tử kỳ	1	1	39	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	6550000	2
1100	Bảo hiểm tử kỳ	1	1	40	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	7150000	2
1101	Bảo hiểm tử kỳ	1	1	41	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	7700000	2
1102	Bảo hiểm tử kỳ	1	1	42	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	8300000	2
1103	Bảo hiểm tử kỳ	1	1	43	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	8850000	2
1104	Bảo hiểm tử kỳ	1	1	44	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	9650000	2
1105	Bảo hiểm tử kỳ	1	1	45	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	10300000	2
1106	Bảo hiểm tử kỳ	1	1	46	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	11000000	2
1107	Bảo hiểm tử kỳ	1	1	47	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	11650000	2
1108	Bảo hiểm tử kỳ	1	1	48	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	12200000	2
1109	Bảo hiểm tử kỳ	1	1	49	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	12950000	2
1110	Bảo hiểm tử kỳ	1	1	50	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	13250000	2
1111	Bảo hiểm tử kỳ	1	1	51	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	14400000	2
1112	Bảo hiểm tử kỳ	1	1	52	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	15150000	2
1113	Bảo hiểm tử kỳ	1	1	53	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	16100000	2
1114	Bảo hiểm tử kỳ	1	1	54	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	16950000	2
1115	Bảo hiểm tử kỳ	1	1	55	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	17700000	2
1116	Bảo hiểm tử kỳ	1	1	56	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	18550000	2
1117	Bảo hiểm tử kỳ	1	1	57	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	19100000	2
1118	Bảo hiểm tử kỳ	1	1	58	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	19450000	2
1119	Bảo hiểm tử kỳ	1	1	59	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	19650000	2
1120	Bảo hiểm tử kỳ	1	1	60	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	19700000	2
1121	Bảo hiểm tử kỳ	1	1	6	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2100000	2
1122	Bảo hiểm tử kỳ	1	1	7	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2100000	2
1123	Bảo hiểm tử kỳ	1	1	8	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2150000	2
1124	Bảo hiểm tử kỳ	1	1	9	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2200000	2
1125	Bảo hiểm tử kỳ	1	1	10	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2300000	2
1126	Bảo hiểm tử kỳ	1	1	11	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2350000	2
1127	Bảo hiểm tử kỳ	1	1	12	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2400000	2
1128	Bảo hiểm tử kỳ	1	1	13	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2450000	2
1129	Bảo hiểm tử kỳ	1	1	14	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2450000	2
1130	Bảo hiểm tử kỳ	1	1	15	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2450000	2
1131	Bảo hiểm tử kỳ	1	1	16	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2450000	2
1132	Bảo hiểm tử kỳ	1	1	17	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2500000	2
1133	Bảo hiểm tử kỳ	1	1	18	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2600000	2
1134	Bảo hiểm tử kỳ	1	1	19	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2850000	2
1135	Bảo hiểm tử kỳ	1	1	20	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2900000	2
1136	Bảo hiểm tử kỳ	1	1	21	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3100000	2
1137	Bảo hiểm tử kỳ	1	1	22	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3250000	2
1138	Bảo hiểm tử kỳ	1	1	23	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3300000	2
1139	Bảo hiểm tử kỳ	1	1	24	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3700000	2
1140	Bảo hiểm tử kỳ	1	1	25	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4000000	2
1141	Bảo hiểm tử kỳ	1	1	26	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4200000	2
1142	Bảo hiểm tử kỳ	1	1	27	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4600000	2
1143	Bảo hiểm tử kỳ	1	1	28	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	5000000	2
1144	Bảo hiểm tử kỳ	1	1	29	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	5400000	2
1145	Bảo hiểm tử kỳ	1	1	30	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	6000000	2
1146	Bảo hiểm tử kỳ	1	1	31	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	6300000	2
1147	Bảo hiểm tử kỳ	1	1	32	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	6900000	2
1148	Bảo hiểm tử kỳ	1	1	33	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	7500000	2
1149	Bảo hiểm tử kỳ	1	1	34	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	8200000	2
1150	Bảo hiểm tử kỳ	1	1	35	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	9000000	2
1151	Bảo hiểm tử kỳ	1	1	36	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	9900000	2
1152	Bảo hiểm tử kỳ	1	1	37	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	10900000	2
1153	Bảo hiểm tử kỳ	1	1	38	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	12000000	2
1154	Bảo hiểm tử kỳ	1	1	39	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	13100000	2
1155	Bảo hiểm tử kỳ	1	1	40	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	14300000	2
1156	Bảo hiểm tử kỳ	1	1	41	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	15400000	2
1157	Bảo hiểm tử kỳ	1	1	42	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	16600000	2
1158	Bảo hiểm tử kỳ	1	1	43	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	17700000	2
1159	Bảo hiểm tử kỳ	1	1	44	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	19300000	2
1160	Bảo hiểm tử kỳ	1	1	45	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	20600000	2
1161	Bảo hiểm tử kỳ	1	1	46	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	22000000	2
1162	Bảo hiểm tử kỳ	1	1	47	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	23300000	2
1163	Bảo hiểm tử kỳ	1	1	48	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	24400000	2
1164	Bảo hiểm tử kỳ	1	1	49	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	25900000	2
1165	Bảo hiểm tử kỳ	1	1	50	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	26500000	2
1166	Bảo hiểm tử kỳ	1	1	51	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	28800000	2
1167	Bảo hiểm tử kỳ	1	1	52	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	30300000	2
1168	Bảo hiểm tử kỳ	1	1	53	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	32200000	2
1169	Bảo hiểm tử kỳ	1	1	54	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	33900000	2
1170	Bảo hiểm tử kỳ	1	1	55	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	35400000	2
1171	Bảo hiểm tử kỳ	1	1	56	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	37100000	2
1172	Bảo hiểm tử kỳ	1	1	57	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	38200000	2
1173	Bảo hiểm tử kỳ	1	1	58	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	38900000	2
1174	Bảo hiểm tử kỳ	1	1	59	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	39300000	2
1175	Bảo hiểm tử kỳ	1	1	60	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	39400000	2
1176	Bảo hiểm tử kỳ	1	1	6	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	420000	2
1177	Bảo hiểm tử kỳ	1	1	7	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	420000	2
1178	Bảo hiểm tử kỳ	1	1	8	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	430000	2
1179	Bảo hiểm tử kỳ	1	1	9	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	440000	2
1180	Bảo hiểm tử kỳ	1	1	10	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	460000	2
1181	Bảo hiểm tử kỳ	1	1	11	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	470000	2
1182	Bảo hiểm tử kỳ	1	1	12	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	480000	2
1183	Bảo hiểm tử kỳ	1	1	13	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	490000	2
1184	Bảo hiểm tử kỳ	1	1	14	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	490000	2
1185	Bảo hiểm tử kỳ	1	1	15	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	490000	2
1186	Bảo hiểm tử kỳ	1	1	16	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	490000	2
1187	Bảo hiểm tử kỳ	1	1	17	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	540000	2
1188	Bảo hiểm tử kỳ	1	1	18	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	560000	2
1189	Bảo hiểm tử kỳ	1	1	19	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	580000	2
1190	Bảo hiểm tử kỳ	1	1	20	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	610000	2
1191	Bảo hiểm tử kỳ	1	1	21	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	660000	2
1192	Bảo hiểm tử kỳ	1	1	22	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	700000	2
1193	Bảo hiểm tử kỳ	1	1	23	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	740000	2
1194	Bảo hiểm tử kỳ	1	1	24	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	800000	2
1195	Bảo hiểm tử kỳ	1	1	25	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	880000	2
1196	Bảo hiểm tử kỳ	1	1	26	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	940000	2
1197	Bảo hiểm tử kỳ	1	1	27	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1020000	2
1198	Bảo hiểm tử kỳ	1	1	28	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1120000	2
1199	Bảo hiểm tử kỳ	1	1	29	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1220000	2
1200	Bảo hiểm tử kỳ	1	1	30	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1330000	2
1201	Bảo hiểm tử kỳ	1	1	31	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1440000	2
1202	Bảo hiểm tử kỳ	1	1	32	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1560000	2
1203	Bảo hiểm tử kỳ	1	1	33	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1720000	2
1204	Bảo hiểm tử kỳ	1	1	34	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1880000	2
1205	Bảo hiểm tử kỳ	1	1	35	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2060000	2
1206	Bảo hiểm tử kỳ	1	1	36	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2260000	2
1207	Bảo hiểm tử kỳ	1	1	37	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2480000	2
1208	Bảo hiểm tử kỳ	1	1	38	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2700000	2
1209	Bảo hiểm tử kỳ	1	1	39	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2920000	2
1210	Bảo hiểm tử kỳ	1	1	40	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3160000	2
1211	Bảo hiểm tử kỳ	1	1	41	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3400000	2
1212	Bảo hiểm tử kỳ	1	1	42	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3640000	2
1213	Bảo hiểm tử kỳ	1	1	43	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3860000	2
1214	Bảo hiểm tử kỳ	1	1	44	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4100000	2
1215	Bảo hiểm tử kỳ	1	1	45	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4360000	2
1216	Bảo hiểm tử kỳ	1	1	46	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4640000	2
1217	Bảo hiểm tử kỳ	1	1	47	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4900000	2
1218	Bảo hiểm tử kỳ	1	1	48	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5180000	2
1219	Bảo hiểm tử kỳ	1	1	49	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5460000	2
1220	Bảo hiểm tử kỳ	1	1	50	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5800000	2
1221	Bảo hiểm tử kỳ	1	1	51	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6200000	2
1222	Bảo hiểm tử kỳ	1	1	52	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6460000	2
1223	Bảo hiểm tử kỳ	1	1	53	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6740000	2
1224	Bảo hiểm tử kỳ	1	1	54	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7000000	2
1225	Bảo hiểm tử kỳ	1	1	55	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7200000	2
1226	Bảo hiểm tử kỳ	1	1	56	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7460000	2
1227	Bảo hiểm tử kỳ	1	1	57	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7700000	2
1228	Bảo hiểm tử kỳ	1	1	58	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7920000	2
1229	Bảo hiểm tử kỳ	1	1	59	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7960000	2
1230	Bảo hiểm tử kỳ	1	1	60	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	8000000	2
1231	Bảo hiểm tử kỳ	1	1	6	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	630000	2
1232	Bảo hiểm tử kỳ	1	1	7	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	630000	2
1233	Bảo hiểm tử kỳ	1	1	8	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	645000	2
1234	Bảo hiểm tử kỳ	1	1	9	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	660000	2
1235	Bảo hiểm tử kỳ	1	1	10	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	690000	2
1236	Bảo hiểm tử kỳ	1	1	11	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	705000	2
1237	Bảo hiểm tử kỳ	1	1	12	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	720000	2
1238	Bảo hiểm tử kỳ	1	1	13	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	735000	2
1239	Bảo hiểm tử kỳ	1	1	14	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	735000	2
1240	Bảo hiểm tử kỳ	1	1	15	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	735000	2
1241	Bảo hiểm tử kỳ	1	1	16	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	735000	2
1242	Bảo hiểm tử kỳ	1	1	17	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	810000	2
1243	Bảo hiểm tử kỳ	1	1	18	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	840000	2
1244	Bảo hiểm tử kỳ	1	1	19	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	870000	2
1245	Bảo hiểm tử kỳ	1	1	20	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	915000	2
1246	Bảo hiểm tử kỳ	1	1	21	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	990000	2
1247	Bảo hiểm tử kỳ	1	1	22	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1050000	2
1248	Bảo hiểm tử kỳ	1	1	23	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1110000	2
1249	Bảo hiểm tử kỳ	1	1	24	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1200000	2
1250	Bảo hiểm tử kỳ	1	1	25	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1320000	2
1251	Bảo hiểm tử kỳ	1	1	26	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1410000	2
1252	Bảo hiểm tử kỳ	1	1	27	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1530000	2
1253	Bảo hiểm tử kỳ	1	1	28	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1680000	2
1254	Bảo hiểm tử kỳ	1	1	29	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1830000	2
1255	Bảo hiểm tử kỳ	1	1	30	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1995000	2
1256	Bảo hiểm tử kỳ	1	1	31	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2160000	2
1257	Bảo hiểm tử kỳ	1	1	32	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2340000	2
1258	Bảo hiểm tử kỳ	1	1	33	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2580000	2
1259	Bảo hiểm tử kỳ	1	1	34	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2820000	2
1260	Bảo hiểm tử kỳ	1	1	35	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3090000	2
1261	Bảo hiểm tử kỳ	1	1	36	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3390000	2
1262	Bảo hiểm tử kỳ	1	1	37	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3720000	2
1263	Bảo hiểm tử kỳ	1	1	38	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4050000	2
1264	Bảo hiểm tử kỳ	1	1	39	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4380000	2
1265	Bảo hiểm tử kỳ	1	1	40	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4740000	2
1266	Bảo hiểm tử kỳ	1	1	41	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5100000	2
1267	Bảo hiểm tử kỳ	1	1	42	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5460000	2
1268	Bảo hiểm tử kỳ	1	1	43	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5790000	2
1269	Bảo hiểm tử kỳ	1	1	44	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6150000	2
1270	Bảo hiểm tử kỳ	1	1	45	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6540000	2
1271	Bảo hiểm tử kỳ	1	1	46	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6960000	2
1272	Bảo hiểm tử kỳ	1	1	47	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7350000	2
1273	Bảo hiểm tử kỳ	1	1	48	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7770000	2
1274	Bảo hiểm tử kỳ	1	1	49	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	8190000	2
1275	Bảo hiểm tử kỳ	1	1	50	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	8700000	2
1276	Bảo hiểm tử kỳ	1	1	51	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	9300000	2
1277	Bảo hiểm tử kỳ	1	1	52	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	9690000	2
1278	Bảo hiểm tử kỳ	1	1	53	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	10110000	2
1279	Bảo hiểm tử kỳ	1	1	54	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	10500000	2
1280	Bảo hiểm tử kỳ	1	1	55	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	10800000	2
1281	Bảo hiểm tử kỳ	1	1	56	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11190000	2
1282	Bảo hiểm tử kỳ	1	1	57	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11550000	2
1283	Bảo hiểm tử kỳ	1	1	58	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11880000	2
1284	Bảo hiểm tử kỳ	1	1	59	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11940000	2
1285	Bảo hiểm tử kỳ	1	1	60	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	12000000	2
1286	Bảo hiểm tử kỳ	1	1	6	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1050000	2
1287	Bảo hiểm tử kỳ	1	1	7	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1050000	2
1288	Bảo hiểm tử kỳ	1	1	8	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1075000	2
1289	Bảo hiểm tử kỳ	1	1	9	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1100000	2
1290	Bảo hiểm tử kỳ	1	1	10	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1150000	2
1291	Bảo hiểm tử kỳ	1	1	11	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1175000	2
1292	Bảo hiểm tử kỳ	1	1	12	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1200000	2
1293	Bảo hiểm tử kỳ	1	1	13	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1225000	2
1294	Bảo hiểm tử kỳ	1	1	14	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1225000	2
1295	Bảo hiểm tử kỳ	1	1	15	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1225000	2
1296	Bảo hiểm tử kỳ	1	1	16	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1225000	2
1297	Bảo hiểm tử kỳ	1	1	17	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1350000	2
1298	Bảo hiểm tử kỳ	1	1	18	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1400000	2
1299	Bảo hiểm tử kỳ	1	1	19	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1450000	2
1300	Bảo hiểm tử kỳ	1	1	20	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1525000	2
1301	Bảo hiểm tử kỳ	1	1	21	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1650000	2
1302	Bảo hiểm tử kỳ	1	1	22	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1750000	2
1303	Bảo hiểm tử kỳ	1	1	23	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1850000	2
1304	Bảo hiểm tử kỳ	1	1	24	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2000000	2
1305	Bảo hiểm tử kỳ	1	1	25	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2200000	2
1306	Bảo hiểm tử kỳ	1	1	26	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2350000	2
1307	Bảo hiểm tử kỳ	1	1	27	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2550000	2
1308	Bảo hiểm tử kỳ	1	1	28	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2800000	2
1309	Bảo hiểm tử kỳ	1	1	29	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3050000	2
1310	Bảo hiểm tử kỳ	1	1	30	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3325000	2
1311	Bảo hiểm tử kỳ	1	1	31	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3600000	2
1312	Bảo hiểm tử kỳ	1	1	32	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3900000	2
1313	Bảo hiểm tử kỳ	1	1	33	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4300000	2
1314	Bảo hiểm tử kỳ	1	1	34	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4700000	2
1315	Bảo hiểm tử kỳ	1	1	35	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5150000	2
1316	Bảo hiểm tử kỳ	1	1	36	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5650000	2
1317	Bảo hiểm tử kỳ	1	1	37	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	6200000	2
1318	Bảo hiểm tử kỳ	1	1	38	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	6750000	2
1319	Bảo hiểm tử kỳ	1	1	39	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	7300000	2
1320	Bảo hiểm tử kỳ	1	1	40	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	7900000	2
1321	Bảo hiểm tử kỳ	1	1	41	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	8500000	2
1322	Bảo hiểm tử kỳ	1	1	42	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	9100000	2
1323	Bảo hiểm tử kỳ	1	1	43	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	9650000	2
1324	Bảo hiểm tử kỳ	1	1	44	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	10250000	2
1325	Bảo hiểm tử kỳ	1	1	45	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	10900000	2
1326	Bảo hiểm tử kỳ	1	1	46	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	11600000	2
1327	Bảo hiểm tử kỳ	1	1	47	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	12250000	2
1328	Bảo hiểm tử kỳ	1	1	48	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	12950000	2
1329	Bảo hiểm tử kỳ	1	1	49	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	13650000	2
1330	Bảo hiểm tử kỳ	1	1	50	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	14500000	2
1331	Bảo hiểm tử kỳ	1	1	51	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	15500000	2
1332	Bảo hiểm tử kỳ	1	1	52	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	16150000	2
1333	Bảo hiểm tử kỳ	1	1	53	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	16850000	2
1334	Bảo hiểm tử kỳ	1	1	54	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	17500000	2
1335	Bảo hiểm tử kỳ	1	1	55	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	18000000	2
1336	Bảo hiểm tử kỳ	1	1	56	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	18650000	2
1337	Bảo hiểm tử kỳ	1	1	57	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	19250000	2
1338	Bảo hiểm tử kỳ	1	1	58	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	19800000	2
1339	Bảo hiểm tử kỳ	1	1	59	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	19900000	2
1340	Bảo hiểm tử kỳ	1	1	60	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	20000000	2
1341	Bảo hiểm tử kỳ	1	1	6	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2100000	2
1342	Bảo hiểm tử kỳ	1	1	7	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2100000	2
1343	Bảo hiểm tử kỳ	1	1	8	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2150000	2
1344	Bảo hiểm tử kỳ	1	1	9	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2200000	2
1345	Bảo hiểm tử kỳ	1	1	10	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2300000	2
1346	Bảo hiểm tử kỳ	1	1	11	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2350000	2
1347	Bảo hiểm tử kỳ	1	1	12	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2400000	2
1348	Bảo hiểm tử kỳ	1	1	13	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2450000	2
1349	Bảo hiểm tử kỳ	1	1	14	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2450000	2
1350	Bảo hiểm tử kỳ	1	1	15	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2450000	2
1351	Bảo hiểm tử kỳ	1	1	16	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2450000	2
1352	Bảo hiểm tử kỳ	1	1	17	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2700000	2
1353	Bảo hiểm tử kỳ	1	1	18	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2800000	2
1354	Bảo hiểm tử kỳ	1	1	19	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2900000	2
1355	Bảo hiểm tử kỳ	1	1	20	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3050000	2
1356	Bảo hiểm tử kỳ	1	1	21	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3300000	2
1357	Bảo hiểm tử kỳ	1	1	22	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3500000	2
1358	Bảo hiểm tử kỳ	1	1	23	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3700000	2
1359	Bảo hiểm tử kỳ	1	1	24	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4000000	2
1360	Bảo hiểm tử kỳ	1	1	25	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4400000	2
1361	Bảo hiểm tử kỳ	1	1	26	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4700000	2
1362	Bảo hiểm tử kỳ	1	1	27	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	5100000	2
1363	Bảo hiểm tử kỳ	1	1	28	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	5600000	2
1364	Bảo hiểm tử kỳ	1	1	29	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	6100000	2
1365	Bảo hiểm tử kỳ	1	1	30	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	6650000	2
1366	Bảo hiểm tử kỳ	1	1	31	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	7200000	2
1367	Bảo hiểm tử kỳ	1	1	32	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	7800000	2
1368	Bảo hiểm tử kỳ	1	1	33	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	8600000	2
1369	Bảo hiểm tử kỳ	1	1	34	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	9400000	2
1370	Bảo hiểm tử kỳ	1	1	35	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	10300000	2
1371	Bảo hiểm tử kỳ	1	1	36	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	11300000	2
1372	Bảo hiểm tử kỳ	1	1	37	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	12400000	2
1373	Bảo hiểm tử kỳ	1	1	38	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	13500000	2
1374	Bảo hiểm tử kỳ	1	1	39	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	14600000	2
1375	Bảo hiểm tử kỳ	1	1	40	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	15800000	2
1376	Bảo hiểm tử kỳ	1	1	41	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	17000000	2
1377	Bảo hiểm tử kỳ	1	1	42	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	18200000	2
1378	Bảo hiểm tử kỳ	1	1	43	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	19300000	2
1379	Bảo hiểm tử kỳ	1	1	44	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	20500000	2
1380	Bảo hiểm tử kỳ	1	1	45	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	21800000	2
1381	Bảo hiểm tử kỳ	1	1	46	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	23200000	2
1382	Bảo hiểm tử kỳ	1	1	47	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	24500000	2
1383	Bảo hiểm tử kỳ	1	1	48	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	25900000	2
1384	Bảo hiểm tử kỳ	1	1	49	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	27300000	2
1385	Bảo hiểm tử kỳ	1	1	50	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	29000000	2
1386	Bảo hiểm tử kỳ	1	1	51	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	31000000	2
1387	Bảo hiểm tử kỳ	1	1	52	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	32300000	2
1388	Bảo hiểm tử kỳ	1	1	53	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	33700000	2
1389	Bảo hiểm tử kỳ	1	1	54	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	35000000	2
1390	Bảo hiểm tử kỳ	1	1	55	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	36000000	2
1391	Bảo hiểm tử kỳ	1	1	56	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	37300000	2
1392	Bảo hiểm tử kỳ	1	1	57	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	38500000	2
1393	Bảo hiểm tử kỳ	1	1	58	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	39600000	2
1394	Bảo hiểm tử kỳ	1	1	59	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	39800000	2
1395	Bảo hiểm tử kỳ	1	1	60	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	40000000	2
1396	Bảo hiểm tử kỳ	1	1	6	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	420000	2
1397	Bảo hiểm tử kỳ	1	1	7	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	420000	2
1398	Bảo hiểm tử kỳ	1	1	8	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	430000	2
1399	Bảo hiểm tử kỳ	1	1	9	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	440000	2
1400	Bảo hiểm tử kỳ	1	1	10	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	460000	2
1401	Bảo hiểm tử kỳ	1	1	11	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	470000	2
1402	Bảo hiểm tử kỳ	1	1	12	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	480000	2
1403	Bảo hiểm tử kỳ	1	1	13	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	490000	2
1404	Bảo hiểm tử kỳ	1	1	14	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	490000	2
1405	Bảo hiểm tử kỳ	1	1	15	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	490000	2
1406	Bảo hiểm tử kỳ	1	1	16	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	490000	2
1407	Bảo hiểm tử kỳ	1	1	17	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	540000	2
1408	Bảo hiểm tử kỳ	1	1	18	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	560000	2
1409	Bảo hiểm tử kỳ	1	1	19	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	580000	2
1410	Bảo hiểm tử kỳ	1	1	20	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	610000	2
1411	Bảo hiểm tử kỳ	1	1	21	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	660000	2
1412	Bảo hiểm tử kỳ	1	1	22	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	700000	2
1413	Bảo hiểm tử kỳ	1	1	23	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	740000	2
1414	Bảo hiểm tử kỳ	1	1	24	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	800000	2
1415	Bảo hiểm tử kỳ	1	1	25	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	880000	2
1416	Bảo hiểm tử kỳ	1	1	26	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	940000	2
1417	Bảo hiểm tử kỳ	1	1	27	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1020000	2
1418	Bảo hiểm tử kỳ	1	1	28	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1120000	2
1419	Bảo hiểm tử kỳ	1	1	29	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1220000	2
1420	Bảo hiểm tử kỳ	1	1	30	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1330000	2
1421	Bảo hiểm tử kỳ	1	1	31	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1440000	2
1422	Bảo hiểm tử kỳ	1	1	32	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1560000	2
1423	Bảo hiểm tử kỳ	1	1	33	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1720000	2
1424	Bảo hiểm tử kỳ	1	1	34	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1880000	2
1425	Bảo hiểm tử kỳ	1	1	35	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2060000	2
1426	Bảo hiểm tử kỳ	1	1	36	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2260000	2
1427	Bảo hiểm tử kỳ	1	1	37	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2480000	2
1428	Bảo hiểm tử kỳ	1	1	38	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2700000	2
1429	Bảo hiểm tử kỳ	1	1	39	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2920000	2
1430	Bảo hiểm tử kỳ	1	1	40	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3160000	2
1431	Bảo hiểm tử kỳ	1	1	41	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3400000	2
1432	Bảo hiểm tử kỳ	1	1	42	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3640000	2
1433	Bảo hiểm tử kỳ	1	1	43	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3860000	2
1434	Bảo hiểm tử kỳ	1	1	44	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4100000	2
1435	Bảo hiểm tử kỳ	1	1	45	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4360000	2
1436	Bảo hiểm tử kỳ	1	1	46	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4640000	2
1437	Bảo hiểm tử kỳ	1	1	47	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4900000	2
1438	Bảo hiểm tử kỳ	1	1	48	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5180000	2
1439	Bảo hiểm tử kỳ	1	1	49	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5460000	2
1440	Bảo hiểm tử kỳ	1	1	50	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5800000	2
1441	Bảo hiểm tử kỳ	1	1	51	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6200000	2
1442	Bảo hiểm tử kỳ	1	1	52	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6460000	2
1443	Bảo hiểm tử kỳ	1	1	53	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6740000	2
1444	Bảo hiểm tử kỳ	1	1	54	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7000000	2
1445	Bảo hiểm tử kỳ	1	1	55	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7200000	2
1446	Bảo hiểm tử kỳ	1	1	56	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7460000	2
1447	Bảo hiểm tử kỳ	1	1	57	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7700000	2
1448	Bảo hiểm tử kỳ	1	1	58	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7920000	2
1449	Bảo hiểm tử kỳ	1	1	59	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7960000	2
1450	Bảo hiểm tử kỳ	1	1	60	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	8000000	2
1451	Bảo hiểm tử kỳ	1	1	6	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	630000	2
1452	Bảo hiểm tử kỳ	1	1	7	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	630000	2
1453	Bảo hiểm tử kỳ	1	1	8	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	645000	2
1454	Bảo hiểm tử kỳ	1	1	9	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	660000	2
1455	Bảo hiểm tử kỳ	1	1	10	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	690000	2
1456	Bảo hiểm tử kỳ	1	1	11	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	705000	2
1457	Bảo hiểm tử kỳ	1	1	12	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	720000	2
1458	Bảo hiểm tử kỳ	1	1	13	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	735000	2
1459	Bảo hiểm tử kỳ	1	1	14	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	735000	2
1460	Bảo hiểm tử kỳ	1	1	15	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	735000	2
1461	Bảo hiểm tử kỳ	1	1	16	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	735000	2
1462	Bảo hiểm tử kỳ	1	1	17	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	810000	2
1463	Bảo hiểm tử kỳ	1	1	18	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	840000	2
1464	Bảo hiểm tử kỳ	1	1	19	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	870000	2
1465	Bảo hiểm tử kỳ	1	1	20	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	915000	2
1466	Bảo hiểm tử kỳ	1	1	21	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	990000	2
1467	Bảo hiểm tử kỳ	1	1	22	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1050000	2
1468	Bảo hiểm tử kỳ	1	1	23	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1110000	2
1469	Bảo hiểm tử kỳ	1	1	24	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1200000	2
1470	Bảo hiểm tử kỳ	1	1	25	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1320000	2
1471	Bảo hiểm tử kỳ	1	1	26	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1410000	2
1472	Bảo hiểm tử kỳ	1	1	27	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1530000	2
1473	Bảo hiểm tử kỳ	1	1	28	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1680000	2
1474	Bảo hiểm tử kỳ	1	1	29	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1830000	2
1475	Bảo hiểm tử kỳ	1	1	30	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1995000	2
1476	Bảo hiểm tử kỳ	1	1	31	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2160000	2
1477	Bảo hiểm tử kỳ	1	1	32	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2340000	2
1478	Bảo hiểm tử kỳ	1	1	33	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2580000	2
1479	Bảo hiểm tử kỳ	1	1	34	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2820000	2
1480	Bảo hiểm tử kỳ	1	1	35	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3090000	2
1481	Bảo hiểm tử kỳ	1	1	36	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3390000	2
1482	Bảo hiểm tử kỳ	1	1	37	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3720000	2
1483	Bảo hiểm tử kỳ	1	1	38	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4050000	2
1484	Bảo hiểm tử kỳ	1	1	39	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4380000	2
1485	Bảo hiểm tử kỳ	1	1	40	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4740000	2
1486	Bảo hiểm tử kỳ	1	1	41	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5100000	2
1487	Bảo hiểm tử kỳ	1	1	42	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5460000	2
1488	Bảo hiểm tử kỳ	1	1	43	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5790000	2
1489	Bảo hiểm tử kỳ	1	1	44	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6150000	2
1490	Bảo hiểm tử kỳ	1	1	45	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6540000	2
1491	Bảo hiểm tử kỳ	1	1	46	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6960000	2
1492	Bảo hiểm tử kỳ	1	1	47	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7350000	2
1493	Bảo hiểm tử kỳ	1	1	48	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7770000	2
1494	Bảo hiểm tử kỳ	1	1	49	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	8190000	2
1495	Bảo hiểm tử kỳ	1	1	50	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	8700000	2
1496	Bảo hiểm tử kỳ	1	1	51	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	9300000	2
1497	Bảo hiểm tử kỳ	1	1	52	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	9690000	2
1498	Bảo hiểm tử kỳ	1	1	53	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	10110000	2
1499	Bảo hiểm tử kỳ	1	1	54	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	10500000	2
1500	Bảo hiểm tử kỳ	1	1	55	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	10800000	2
1501	Bảo hiểm tử kỳ	1	1	56	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11190000	2
1502	Bảo hiểm tử kỳ	1	1	57	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11550000	2
1503	Bảo hiểm tử kỳ	1	1	58	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11880000	2
1504	Bảo hiểm tử kỳ	1	1	59	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11940000	2
1505	Bảo hiểm tử kỳ	1	1	60	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	12000000	2
1506	Bảo hiểm tử kỳ	1	1	6	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1050000	2
1507	Bảo hiểm tử kỳ	1	1	7	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1050000	2
1508	Bảo hiểm tử kỳ	1	1	8	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1075000	2
1509	Bảo hiểm tử kỳ	1	1	9	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1100000	2
1510	Bảo hiểm tử kỳ	1	1	10	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1150000	2
1511	Bảo hiểm tử kỳ	1	1	11	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1175000	2
1512	Bảo hiểm tử kỳ	1	1	12	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1200000	2
1513	Bảo hiểm tử kỳ	1	1	13	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1225000	2
1514	Bảo hiểm tử kỳ	1	1	14	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1225000	2
1515	Bảo hiểm tử kỳ	1	1	15	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1225000	2
1516	Bảo hiểm tử kỳ	1	1	16	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1225000	2
1517	Bảo hiểm tử kỳ	1	1	17	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1350000	2
1518	Bảo hiểm tử kỳ	1	1	18	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1400000	2
1519	Bảo hiểm tử kỳ	1	1	19	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1450000	2
1520	Bảo hiểm tử kỳ	1	1	20	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1525000	2
1521	Bảo hiểm tử kỳ	1	1	21	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1650000	2
1522	Bảo hiểm tử kỳ	1	1	22	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1750000	2
1523	Bảo hiểm tử kỳ	1	1	23	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1850000	2
1524	Bảo hiểm tử kỳ	1	1	24	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2000000	2
1525	Bảo hiểm tử kỳ	1	1	25	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2200000	2
1526	Bảo hiểm tử kỳ	1	1	26	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2350000	2
1527	Bảo hiểm tử kỳ	1	1	27	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2550000	2
1528	Bảo hiểm tử kỳ	1	1	28	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2800000	2
1529	Bảo hiểm tử kỳ	1	1	29	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3050000	2
1530	Bảo hiểm tử kỳ	1	1	30	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3325000	2
1531	Bảo hiểm tử kỳ	1	1	31	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3600000	2
1532	Bảo hiểm tử kỳ	1	1	32	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3900000	2
1533	Bảo hiểm tử kỳ	1	1	33	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4300000	2
1534	Bảo hiểm tử kỳ	1	1	34	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4700000	2
1535	Bảo hiểm tử kỳ	1	1	35	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5150000	2
1536	Bảo hiểm tử kỳ	1	1	36	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5650000	2
1537	Bảo hiểm tử kỳ	1	1	37	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	6200000	2
1538	Bảo hiểm tử kỳ	1	1	38	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	6750000	2
1539	Bảo hiểm tử kỳ	1	1	39	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	7300000	2
1540	Bảo hiểm tử kỳ	1	1	40	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	7900000	2
1541	Bảo hiểm tử kỳ	1	1	41	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	8500000	2
1542	Bảo hiểm tử kỳ	1	1	42	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	9100000	2
1543	Bảo hiểm tử kỳ	1	1	43	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	9650000	2
1544	Bảo hiểm tử kỳ	1	1	44	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	10250000	2
1545	Bảo hiểm tử kỳ	1	1	45	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	10900000	2
1546	Bảo hiểm tử kỳ	1	1	46	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	11600000	2
1547	Bảo hiểm tử kỳ	1	1	47	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	12250000	2
1548	Bảo hiểm tử kỳ	1	1	48	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	12950000	2
1549	Bảo hiểm tử kỳ	1	1	49	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	13650000	2
1550	Bảo hiểm tử kỳ	1	1	50	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	14500000	2
1551	Bảo hiểm tử kỳ	1	1	51	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	15500000	2
1552	Bảo hiểm tử kỳ	1	1	52	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	16150000	2
1553	Bảo hiểm tử kỳ	1	1	53	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	16850000	2
1554	Bảo hiểm tử kỳ	1	1	54	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	17500000	2
1555	Bảo hiểm tử kỳ	1	1	55	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	18000000	2
1556	Bảo hiểm tử kỳ	1	1	56	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	18650000	2
1557	Bảo hiểm tử kỳ	1	1	57	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	19250000	2
1558	Bảo hiểm tử kỳ	1	1	58	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	19800000	2
1559	Bảo hiểm tử kỳ	1	1	59	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	19900000	2
1560	Bảo hiểm tử kỳ	1	1	60	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	20000000	2
1561	Bảo hiểm tử kỳ	1	1	6	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2100000	2
1562	Bảo hiểm tử kỳ	1	1	7	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2100000	2
1563	Bảo hiểm tử kỳ	1	1	8	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2150000	2
1564	Bảo hiểm tử kỳ	1	1	9	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2200000	2
1565	Bảo hiểm tử kỳ	1	1	10	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2300000	2
1566	Bảo hiểm tử kỳ	1	1	11	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2350000	2
1567	Bảo hiểm tử kỳ	1	1	12	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2400000	2
1568	Bảo hiểm tử kỳ	1	1	13	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2450000	2
1569	Bảo hiểm tử kỳ	1	1	14	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2450000	2
1570	Bảo hiểm tử kỳ	1	1	15	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2450000	2
1571	Bảo hiểm tử kỳ	1	1	16	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2450000	2
1572	Bảo hiểm tử kỳ	1	1	17	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2700000	2
1573	Bảo hiểm tử kỳ	1	1	18	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2800000	2
1574	Bảo hiểm tử kỳ	1	1	19	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2900000	2
1575	Bảo hiểm tử kỳ	1	1	20	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3050000	2
1576	Bảo hiểm tử kỳ	1	1	21	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3300000	2
1577	Bảo hiểm tử kỳ	1	1	22	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3500000	2
1578	Bảo hiểm tử kỳ	1	1	23	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3700000	2
1579	Bảo hiểm tử kỳ	1	1	24	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4000000	2
1580	Bảo hiểm tử kỳ	1	1	25	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4400000	2
1581	Bảo hiểm tử kỳ	1	1	26	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4700000	2
1582	Bảo hiểm tử kỳ	1	1	27	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	5100000	2
1583	Bảo hiểm tử kỳ	1	1	28	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	5600000	2
1584	Bảo hiểm tử kỳ	1	1	29	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	6100000	2
1585	Bảo hiểm tử kỳ	1	1	30	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	6650000	2
1586	Bảo hiểm tử kỳ	1	1	31	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	7200000	2
1587	Bảo hiểm tử kỳ	1	1	32	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	7800000	2
1588	Bảo hiểm tử kỳ	1	1	33	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	8600000	2
1589	Bảo hiểm tử kỳ	1	1	34	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	9400000	2
1590	Bảo hiểm tử kỳ	1	1	35	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	10300000	2
1591	Bảo hiểm tử kỳ	1	1	36	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	11300000	2
1592	Bảo hiểm tử kỳ	1	1	37	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	12400000	2
1593	Bảo hiểm tử kỳ	1	1	38	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	13500000	2
1594	Bảo hiểm tử kỳ	1	1	39	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	14600000	2
1595	Bảo hiểm tử kỳ	1	1	40	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	15800000	2
1596	Bảo hiểm tử kỳ	1	1	41	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	17000000	2
1597	Bảo hiểm tử kỳ	1	1	42	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	18200000	2
1598	Bảo hiểm tử kỳ	1	1	43	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	19300000	2
1599	Bảo hiểm tử kỳ	1	1	44	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	20500000	2
1600	Bảo hiểm tử kỳ	1	1	45	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	21800000	2
1601	Bảo hiểm tử kỳ	1	1	46	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	23200000	2
1602	Bảo hiểm tử kỳ	1	1	47	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	24500000	2
1603	Bảo hiểm tử kỳ	1	1	48	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	25900000	2
1604	Bảo hiểm tử kỳ	1	1	49	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	27300000	2
1605	Bảo hiểm tử kỳ	1	1	50	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	29000000	2
1606	Bảo hiểm tử kỳ	1	1	51	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	31000000	2
1607	Bảo hiểm tử kỳ	1	1	52	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	32300000	2
1608	Bảo hiểm tử kỳ	1	1	53	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	33700000	2
1609	Bảo hiểm tử kỳ	1	1	54	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	35000000	2
1610	Bảo hiểm tử kỳ	1	1	55	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	36000000	2
1611	Bảo hiểm tử kỳ	1	1	56	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	37300000	2
1612	Bảo hiểm tử kỳ	1	1	57	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	38500000	2
1613	Bảo hiểm tử kỳ	1	1	58	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	39600000	2
1614	Bảo hiểm tử kỳ	1	1	59	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	39800000	2
1615	Bảo hiểm tử kỳ	1	1	60	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	40000000	2
1616	Bảo hiểm tử kỳ	1	1	6	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	420000	2
1617	Bảo hiểm tử kỳ	1	1	7	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	440000	2
1618	Bảo hiểm tử kỳ	1	1	8	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	440000	2
1619	Bảo hiểm tử kỳ	1	1	9	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	450000	2
1620	Bảo hiểm tử kỳ	1	1	10	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	460000	2
1621	Bảo hiểm tử kỳ	1	1	11	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	470000	2
1622	Bảo hiểm tử kỳ	1	1	12	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	480000	2
1623	Bảo hiểm tử kỳ	1	1	13	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	490000	2
1624	Bảo hiểm tử kỳ	1	1	14	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	500000	2
1625	Bảo hiểm tử kỳ	1	1	15	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	500000	2
1626	Bảo hiểm tử kỳ	1	1	16	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	540000	2
1627	Bảo hiểm tử kỳ	1	1	17	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	560000	2
1628	Bảo hiểm tử kỳ	1	1	18	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	600000	2
1629	Bảo hiểm tử kỳ	1	1	19	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	640000	2
1630	Bảo hiểm tử kỳ	1	1	20	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	680000	2
1631	Bảo hiểm tử kỳ	1	1	21	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	740000	2
1632	Bảo hiểm tử kỳ	1	1	22	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	780000	2
1633	Bảo hiểm tử kỳ	1	1	23	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	860000	2
1634	Bảo hiểm tử kỳ	1	1	24	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	920000	2
1635	Bảo hiểm tử kỳ	1	1	25	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1020000	2
1636	Bảo hiểm tử kỳ	1	1	26	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1100000	2
1637	Bảo hiểm tử kỳ	1	1	27	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1220000	2
1638	Bảo hiểm tử kỳ	1	1	28	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1320000	2
1639	Bảo hiểm tử kỳ	1	1	29	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1440000	2
1640	Bảo hiểm tử kỳ	1	1	30	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1580000	2
1641	Bảo hiểm tử kỳ	1	1	31	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1720000	2
1642	Bảo hiểm tử kỳ	1	1	32	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1880000	2
1643	Bảo hiểm tử kỳ	1	1	33	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2040000	2
1644	Bảo hiểm tử kỳ	1	1	34	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2200000	2
1645	Bảo hiểm tử kỳ	1	1	35	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2380000	2
1646	Bảo hiểm tử kỳ	1	1	36	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2580000	2
1647	Bảo hiểm tử kỳ	1	1	37	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2800000	2
1648	Bảo hiểm tử kỳ	1	1	38	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3020000	2
1649	Bảo hiểm tử kỳ	1	1	39	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3240000	2
1650	Bảo hiểm tử kỳ	1	1	40	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3480000	2
1651	Bảo hiểm tử kỳ	1	1	41	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3740000	2
1652	Bảo hiểm tử kỳ	1	1	42	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3980000	2
1653	Bảo hiểm tử kỳ	1	1	43	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4240000	2
1654	Bảo hiểm tử kỳ	1	1	44	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4480000	2
1655	Bảo hiểm tử kỳ	1	1	45	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4740000	2
1656	Bảo hiểm tử kỳ	1	1	46	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5080000	2
1657	Bảo hiểm tử kỳ	1	1	47	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5300000	2
1658	Bảo hiểm tử kỳ	1	1	48	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5520000	2
1659	Bảo hiểm tử kỳ	1	1	49	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5760000	2
1660	Bảo hiểm tử kỳ	1	1	50	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6000000	2
1661	Bảo hiểm tử kỳ	1	1	51	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6400000	2
1662	Bảo hiểm tử kỳ	1	1	52	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6700000	2
1663	Bảo hiểm tử kỳ	1	1	53	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7000000	2
1664	Bảo hiểm tử kỳ	1	1	54	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7200000	2
1665	Bảo hiểm tử kỳ	1	1	55	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7240000	2
1666	Bảo hiểm tử kỳ	1	1	6	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	630000	2
1667	Bảo hiểm tử kỳ	1	1	7	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	660000	2
1668	Bảo hiểm tử kỳ	1	1	8	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	660000	2
1669	Bảo hiểm tử kỳ	1	1	9	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	675000	2
1670	Bảo hiểm tử kỳ	1	1	10	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	690000	2
1671	Bảo hiểm tử kỳ	1	1	11	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	705000	2
1672	Bảo hiểm tử kỳ	1	1	12	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	720000	2
1673	Bảo hiểm tử kỳ	1	1	13	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	735000	2
1674	Bảo hiểm tử kỳ	1	1	14	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	750000	2
1675	Bảo hiểm tử kỳ	1	1	15	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	750000	2
1676	Bảo hiểm tử kỳ	1	1	16	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	810000	2
1677	Bảo hiểm tử kỳ	1	1	17	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	840000	2
1678	Bảo hiểm tử kỳ	1	1	18	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	900000	2
1679	Bảo hiểm tử kỳ	1	1	19	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	960000	2
1680	Bảo hiểm tử kỳ	1	1	20	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1020000	2
1681	Bảo hiểm tử kỳ	1	1	21	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1110000	2
1682	Bảo hiểm tử kỳ	1	1	22	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1170000	2
1683	Bảo hiểm tử kỳ	1	1	23	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1290000	2
1684	Bảo hiểm tử kỳ	1	1	24	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1380000	2
1685	Bảo hiểm tử kỳ	1	1	25	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1530000	2
1686	Bảo hiểm tử kỳ	1	1	26	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1650000	2
1687	Bảo hiểm tử kỳ	1	1	27	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1830000	2
1688	Bảo hiểm tử kỳ	1	1	28	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1980000	2
1689	Bảo hiểm tử kỳ	1	1	29	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2160000	2
1690	Bảo hiểm tử kỳ	1	1	30	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2370000	2
1691	Bảo hiểm tử kỳ	1	1	31	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2580000	2
1692	Bảo hiểm tử kỳ	1	1	32	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2820000	2
1693	Bảo hiểm tử kỳ	1	1	33	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3060000	2
1694	Bảo hiểm tử kỳ	1	1	34	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3300000	2
1695	Bảo hiểm tử kỳ	1	1	35	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3570000	2
1696	Bảo hiểm tử kỳ	1	1	36	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3870000	2
1697	Bảo hiểm tử kỳ	1	1	37	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4200000	2
1698	Bảo hiểm tử kỳ	1	1	38	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4530000	2
1699	Bảo hiểm tử kỳ	1	1	39	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4860000	2
1700	Bảo hiểm tử kỳ	1	1	40	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5220000	2
1701	Bảo hiểm tử kỳ	1	1	41	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5610000	2
1702	Bảo hiểm tử kỳ	1	1	42	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5970000	2
1703	Bảo hiểm tử kỳ	1	1	43	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6360000	2
1704	Bảo hiểm tử kỳ	1	1	44	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6720000	2
1705	Bảo hiểm tử kỳ	1	1	45	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7110000	2
1706	Bảo hiểm tử kỳ	1	1	46	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7620000	2
1707	Bảo hiểm tử kỳ	1	1	47	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7950000	2
1708	Bảo hiểm tử kỳ	1	1	48	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	8280000	2
1709	Bảo hiểm tử kỳ	1	1	49	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	8640000	2
1710	Bảo hiểm tử kỳ	1	1	50	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	9000000	2
1711	Bảo hiểm tử kỳ	1	1	51	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	9600000	2
1712	Bảo hiểm tử kỳ	1	1	52	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	10050000	2
1713	Bảo hiểm tử kỳ	1	1	53	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	10500000	2
1714	Bảo hiểm tử kỳ	1	1	54	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	10800000	2
1715	Bảo hiểm tử kỳ	1	1	55	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	10860000	2
1716	Bảo hiểm tử kỳ	1	1	6	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1050000	2
1717	Bảo hiểm tử kỳ	1	1	7	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1100000	2
1718	Bảo hiểm tử kỳ	1	1	8	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1100000	2
1719	Bảo hiểm tử kỳ	1	1	9	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1125000	2
1720	Bảo hiểm tử kỳ	1	1	10	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1150000	2
1721	Bảo hiểm tử kỳ	1	1	11	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1175000	2
1722	Bảo hiểm tử kỳ	1	1	12	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1200000	2
1723	Bảo hiểm tử kỳ	1	1	13	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1225000	2
1724	Bảo hiểm tử kỳ	1	1	14	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1250000	2
1725	Bảo hiểm tử kỳ	1	1	15	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1250000	2
1726	Bảo hiểm tử kỳ	1	1	16	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1350000	2
1727	Bảo hiểm tử kỳ	1	1	17	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1400000	2
1728	Bảo hiểm tử kỳ	1	1	18	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1500000	2
1729	Bảo hiểm tử kỳ	1	1	19	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1600000	2
1730	Bảo hiểm tử kỳ	1	1	20	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1700000	2
1731	Bảo hiểm tử kỳ	1	1	21	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1850000	2
1732	Bảo hiểm tử kỳ	1	1	22	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1950000	2
1733	Bảo hiểm tử kỳ	1	1	23	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2150000	2
1734	Bảo hiểm tử kỳ	1	1	24	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2300000	2
1735	Bảo hiểm tử kỳ	1	1	25	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2550000	2
1736	Bảo hiểm tử kỳ	1	1	26	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2750000	2
1737	Bảo hiểm tử kỳ	1	1	27	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3050000	2
1738	Bảo hiểm tử kỳ	1	1	28	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3300000	2
1739	Bảo hiểm tử kỳ	1	1	29	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3600000	2
1740	Bảo hiểm tử kỳ	1	1	30	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3950000	2
1741	Bảo hiểm tử kỳ	1	1	31	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4300000	2
1742	Bảo hiểm tử kỳ	1	1	32	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4700000	2
1743	Bảo hiểm tử kỳ	1	1	33	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5100000	2
1744	Bảo hiểm tử kỳ	1	1	34	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5500000	2
1745	Bảo hiểm tử kỳ	1	1	35	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5950000	2
1746	Bảo hiểm tử kỳ	1	1	36	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	6450000	2
1747	Bảo hiểm tử kỳ	1	1	37	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	7000000	2
1748	Bảo hiểm tử kỳ	1	1	38	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	7550000	2
1749	Bảo hiểm tử kỳ	1	1	39	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	8100000	2
1750	Bảo hiểm tử kỳ	1	1	40	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	8700000	2
1751	Bảo hiểm tử kỳ	1	1	41	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	9350000	2
1752	Bảo hiểm tử kỳ	1	1	42	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	9950000	2
1753	Bảo hiểm tử kỳ	1	1	43	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	10600000	2
1754	Bảo hiểm tử kỳ	1	1	44	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	11200000	2
1755	Bảo hiểm tử kỳ	1	1	45	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	11850000	2
1756	Bảo hiểm tử kỳ	1	1	46	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	12700000	2
1757	Bảo hiểm tử kỳ	1	1	47	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	13250000	2
1758	Bảo hiểm tử kỳ	1	1	48	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	13800000	2
1759	Bảo hiểm tử kỳ	1	1	49	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	14400000	2
1760	Bảo hiểm tử kỳ	1	1	50	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	15000000	2
1761	Bảo hiểm tử kỳ	1	1	51	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	16000000	2
1762	Bảo hiểm tử kỳ	1	1	52	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	16750000	2
1763	Bảo hiểm tử kỳ	1	1	53	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	17500000	2
1764	Bảo hiểm tử kỳ	1	1	54	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	18000000	2
1765	Bảo hiểm tử kỳ	1	1	55	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	18100000	2
1766	Bảo hiểm tử kỳ	1	1	6	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2100000	2
1767	Bảo hiểm tử kỳ	1	1	7	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2200000	2
1768	Bảo hiểm tử kỳ	1	1	8	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2200000	2
1769	Bảo hiểm tử kỳ	1	1	9	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2250000	2
1770	Bảo hiểm tử kỳ	1	1	10	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2300000	2
1771	Bảo hiểm tử kỳ	1	1	11	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2350000	2
1772	Bảo hiểm tử kỳ	1	1	12	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2400000	2
1773	Bảo hiểm tử kỳ	1	1	13	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2450000	2
1774	Bảo hiểm tử kỳ	1	1	14	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2500000	2
1775	Bảo hiểm tử kỳ	1	1	15	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2500000	2
1776	Bảo hiểm tử kỳ	1	1	16	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2700000	2
1777	Bảo hiểm tử kỳ	1	1	17	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2800000	2
1778	Bảo hiểm tử kỳ	1	1	18	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3000000	2
1779	Bảo hiểm tử kỳ	1	1	19	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3200000	2
1780	Bảo hiểm tử kỳ	1	1	20	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3400000	2
1781	Bảo hiểm tử kỳ	1	1	21	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3700000	2
1782	Bảo hiểm tử kỳ	1	1	22	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3900000	2
1783	Bảo hiểm tử kỳ	1	1	23	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4300000	2
1784	Bảo hiểm tử kỳ	1	1	24	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4600000	2
1785	Bảo hiểm tử kỳ	1	1	25	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	5100000	2
1786	Bảo hiểm tử kỳ	1	1	26	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	5500000	2
1787	Bảo hiểm tử kỳ	1	1	27	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	6100000	2
1788	Bảo hiểm tử kỳ	1	1	28	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	6600000	2
1789	Bảo hiểm tử kỳ	1	1	29	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	7200000	2
1790	Bảo hiểm tử kỳ	1	1	30	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	7900000	2
1791	Bảo hiểm tử kỳ	1	1	31	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	8600000	2
1792	Bảo hiểm tử kỳ	1	1	32	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	9400000	2
1793	Bảo hiểm tử kỳ	1	1	33	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	10200000	2
1794	Bảo hiểm tử kỳ	1	1	34	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	11000000	2
1795	Bảo hiểm tử kỳ	1	1	35	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	11900000	2
1796	Bảo hiểm tử kỳ	1	1	36	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	12900000	2
1797	Bảo hiểm tử kỳ	1	1	37	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	14000000	2
1798	Bảo hiểm tử kỳ	1	1	38	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	15100000	2
1799	Bảo hiểm tử kỳ	1	1	39	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	16200000	2
1800	Bảo hiểm tử kỳ	1	1	40	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	17400000	2
1801	Bảo hiểm tử kỳ	1	1	41	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	18700000	2
1802	Bảo hiểm tử kỳ	1	1	42	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	19900000	2
1803	Bảo hiểm tử kỳ	1	1	43	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	21200000	2
1804	Bảo hiểm tử kỳ	1	1	44	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	22400000	2
1805	Bảo hiểm tử kỳ	1	1	45	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	23700000	2
1806	Bảo hiểm tử kỳ	1	1	46	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	25400000	2
1807	Bảo hiểm tử kỳ	1	1	47	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	26500000	2
1808	Bảo hiểm tử kỳ	1	1	48	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	27600000	2
1809	Bảo hiểm tử kỳ	1	1	49	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	28800000	2
1810	Bảo hiểm tử kỳ	1	1	50	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	30000000	2
1811	Bảo hiểm tử kỳ	1	1	51	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	32000000	2
1812	Bảo hiểm tử kỳ	1	1	52	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	33500000	2
1813	Bảo hiểm tử kỳ	1	1	53	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	35000000	2
1814	Bảo hiểm tử kỳ	1	1	54	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	36000000	2
1815	Bảo hiểm tử kỳ	1	1	55	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	36200000	2
1816	Bảo hiểm tử kỳ	1	1	6	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	440000	2
1817	Bảo hiểm tử kỳ	1	1	7	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	440000	2
1818	Bảo hiểm tử kỳ	1	1	8	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	450000	2
1819	Bảo hiểm tử kỳ	1	1	9	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	460000	2
1820	Bảo hiểm tử kỳ	1	1	10	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	500000	2
1821	Bảo hiểm tử kỳ	1	1	11	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	520000	2
1822	Bảo hiểm tử kỳ	1	1	12	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	540000	2
1823	Bảo hiểm tử kỳ	1	1	13	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	560000	2
1824	Bảo hiểm tử kỳ	1	1	14	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	580000	2
1825	Bảo hiểm tử kỳ	1	1	15	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	600000	2
1826	Bảo hiểm tử kỳ	1	1	16	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	620000	2
1827	Bảo hiểm tử kỳ	1	1	17	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	660000	2
1828	Bảo hiểm tử kỳ	1	1	18	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	700000	2
1829	Bảo hiểm tử kỳ	1	1	19	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	760000	2
1830	Bảo hiểm tử kỳ	1	1	20	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	820000	2
1831	Bảo hiểm tử kỳ	1	1	21	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	900000	2
1832	Bảo hiểm tử kỳ	1	1	22	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	960000	2
1833	Bảo hiểm tử kỳ	1	1	23	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1060000	2
1834	Bảo hiểm tử kỳ	1	1	24	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1140000	2
1835	Bảo hiểm tử kỳ	1	1	25	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1260000	2
1836	Bảo hiểm tử kỳ	1	1	26	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1360000	2
1837	Bảo hiểm tử kỳ	1	1	27	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1500000	2
1838	Bảo hiểm tử kỳ	1	1	28	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1640000	2
1839	Bảo hiểm tử kỳ	1	1	29	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1760000	2
1840	Bảo hiểm tử kỳ	1	1	30	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1920000	2
1841	Bảo hiểm tử kỳ	1	1	31	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2080000	2
1842	Bảo hiểm tử kỳ	1	1	32	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2240000	2
1843	Bảo hiểm tử kỳ	1	1	33	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2400000	2
1844	Bảo hiểm tử kỳ	1	1	34	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2580000	2
1845	Bảo hiểm tử kỳ	1	1	35	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2800000	2
1846	Bảo hiểm tử kỳ	1	1	36	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3020000	2
1847	Bảo hiểm tử kỳ	1	1	37	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3240000	2
1848	Bảo hiểm tử kỳ	1	1	38	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3480000	2
1849	Bảo hiểm tử kỳ	1	1	39	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3720000	2
1850	Bảo hiểm tử kỳ	1	1	40	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3960000	2
1851	Bảo hiểm tử kỳ	1	1	41	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4280000	2
1852	Bảo hiểm tử kỳ	1	1	42	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4520000	2
1853	Bảo hiểm tử kỳ	1	1	43	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4740000	2
1854	Bảo hiểm tử kỳ	1	1	44	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4960000	2
1855	Bảo hiểm tử kỳ	1	1	45	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5180000	2
1856	Bảo hiểm tử kỳ	1	1	46	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5420000	2
1857	Bảo hiểm tử kỳ	1	1	47	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5660000	2
1858	Bảo hiểm tử kỳ	1	1	48	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5900000	2
1859	Bảo hiểm tử kỳ	1	1	49	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6140000	2
1860	Bảo hiểm tử kỳ	1	1	50	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6400000	2
1861	Bảo hiểm tử kỳ	1	1	6	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	660000	2
1862	Bảo hiểm tử kỳ	1	1	7	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	660000	2
1863	Bảo hiểm tử kỳ	1	1	8	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	675000	2
1864	Bảo hiểm tử kỳ	1	1	9	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	690000	2
1865	Bảo hiểm tử kỳ	1	1	10	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	750000	2
1866	Bảo hiểm tử kỳ	1	1	11	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	780000	2
1867	Bảo hiểm tử kỳ	1	1	12	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	810000	2
1868	Bảo hiểm tử kỳ	1	1	13	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	840000	2
1869	Bảo hiểm tử kỳ	1	1	14	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	870000	2
1870	Bảo hiểm tử kỳ	1	1	15	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	900000	2
1871	Bảo hiểm tử kỳ	1	1	16	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	930000	2
1872	Bảo hiểm tử kỳ	1	1	17	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	990000	2
1873	Bảo hiểm tử kỳ	1	1	18	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1050000	2
1874	Bảo hiểm tử kỳ	1	1	19	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1140000	2
1875	Bảo hiểm tử kỳ	1	1	20	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1230000	2
1876	Bảo hiểm tử kỳ	1	1	21	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1350000	2
1877	Bảo hiểm tử kỳ	1	1	22	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1440000	2
1878	Bảo hiểm tử kỳ	1	1	23	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1590000	2
1879	Bảo hiểm tử kỳ	1	1	24	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1710000	2
1880	Bảo hiểm tử kỳ	1	1	25	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1890000	2
1881	Bảo hiểm tử kỳ	1	1	26	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2040000	2
1882	Bảo hiểm tử kỳ	1	1	27	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2250000	2
1883	Bảo hiểm tử kỳ	1	1	28	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2460000	2
1884	Bảo hiểm tử kỳ	1	1	29	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2640000	2
1885	Bảo hiểm tử kỳ	1	1	30	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2880000	2
1886	Bảo hiểm tử kỳ	1	1	31	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3120000	2
1887	Bảo hiểm tử kỳ	1	1	32	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3360000	2
1888	Bảo hiểm tử kỳ	1	1	33	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3600000	2
1889	Bảo hiểm tử kỳ	1	1	34	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3870000	2
1890	Bảo hiểm tử kỳ	1	1	35	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4200000	2
1891	Bảo hiểm tử kỳ	1	1	36	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4530000	2
1892	Bảo hiểm tử kỳ	1	1	37	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4860000	2
1893	Bảo hiểm tử kỳ	1	1	38	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5220000	2
1894	Bảo hiểm tử kỳ	1	1	39	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5580000	2
1895	Bảo hiểm tử kỳ	1	1	40	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5940000	2
1896	Bảo hiểm tử kỳ	1	1	41	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6420000	2
1897	Bảo hiểm tử kỳ	1	1	42	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6780000	2
1898	Bảo hiểm tử kỳ	1	1	43	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7110000	2
1899	Bảo hiểm tử kỳ	1	1	44	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7440000	2
1900	Bảo hiểm tử kỳ	1	1	45	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7770000	2
1901	Bảo hiểm tử kỳ	1	1	46	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	8130000	2
1902	Bảo hiểm tử kỳ	1	1	47	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	8490000	2
1903	Bảo hiểm tử kỳ	1	1	48	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	8850000	2
1904	Bảo hiểm tử kỳ	1	1	49	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	9210000	2
1905	Bảo hiểm tử kỳ	1	1	50	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	9600000	2
1906	Bảo hiểm tử kỳ	1	1	6	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1100000	2
1907	Bảo hiểm tử kỳ	1	1	7	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1100000	2
1908	Bảo hiểm tử kỳ	1	1	8	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1125000	2
1909	Bảo hiểm tử kỳ	1	1	9	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1150000	2
1910	Bảo hiểm tử kỳ	1	1	10	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1250000	2
1911	Bảo hiểm tử kỳ	1	1	11	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1300000	2
1912	Bảo hiểm tử kỳ	1	1	12	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1350000	2
1913	Bảo hiểm tử kỳ	1	1	13	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1400000	2
1914	Bảo hiểm tử kỳ	1	1	14	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1450000	2
1915	Bảo hiểm tử kỳ	1	1	15	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1500000	2
1916	Bảo hiểm tử kỳ	1	1	16	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1550000	2
1917	Bảo hiểm tử kỳ	1	1	17	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1650000	2
1918	Bảo hiểm tử kỳ	1	1	18	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1750000	2
1919	Bảo hiểm tử kỳ	1	1	19	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1900000	2
1920	Bảo hiểm tử kỳ	1	1	20	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2050000	2
1921	Bảo hiểm tử kỳ	1	1	21	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2250000	2
1922	Bảo hiểm tử kỳ	1	1	22	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2400000	2
1923	Bảo hiểm tử kỳ	1	1	23	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2650000	2
1924	Bảo hiểm tử kỳ	1	1	24	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2850000	2
1925	Bảo hiểm tử kỳ	1	1	25	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3150000	2
1926	Bảo hiểm tử kỳ	1	1	26	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3400000	2
1927	Bảo hiểm tử kỳ	1	1	27	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3750000	2
1928	Bảo hiểm tử kỳ	1	1	28	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4100000	2
1929	Bảo hiểm tử kỳ	1	1	29	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4400000	2
1930	Bảo hiểm tử kỳ	1	1	30	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4800000	2
1931	Bảo hiểm tử kỳ	1	1	31	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5200000	2
1932	Bảo hiểm tử kỳ	1	1	32	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5600000	2
1933	Bảo hiểm tử kỳ	1	1	33	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	6000000	2
1934	Bảo hiểm tử kỳ	1	1	34	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	6450000	2
1935	Bảo hiểm tử kỳ	1	1	35	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	7000000	2
1936	Bảo hiểm tử kỳ	1	1	36	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	7550000	2
1937	Bảo hiểm tử kỳ	1	1	37	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	8100000	2
1938	Bảo hiểm tử kỳ	1	1	38	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	8700000	2
1939	Bảo hiểm tử kỳ	1	1	39	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	9300000	2
1940	Bảo hiểm tử kỳ	1	1	40	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	9900000	2
1941	Bảo hiểm tử kỳ	1	1	41	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	10700000	2
1942	Bảo hiểm tử kỳ	1	1	42	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	11300000	2
1943	Bảo hiểm tử kỳ	1	1	43	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	11850000	2
1944	Bảo hiểm tử kỳ	1	1	44	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	12400000	2
1945	Bảo hiểm tử kỳ	1	1	45	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	12950000	2
1946	Bảo hiểm tử kỳ	1	1	46	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	13550000	2
1947	Bảo hiểm tử kỳ	1	1	47	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	14150000	2
1948	Bảo hiểm tử kỳ	1	1	48	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	14750000	2
1949	Bảo hiểm tử kỳ	1	1	49	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	15350000	2
1950	Bảo hiểm tử kỳ	1	1	50	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	16000000	2
1951	Bảo hiểm tử kỳ	1	1	6	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2200000	2
1952	Bảo hiểm tử kỳ	1	1	7	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2200000	2
1953	Bảo hiểm tử kỳ	1	1	8	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2250000	2
1954	Bảo hiểm tử kỳ	1	1	9	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2300000	2
1955	Bảo hiểm tử kỳ	1	1	10	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2500000	2
1956	Bảo hiểm tử kỳ	1	1	11	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2600000	2
1957	Bảo hiểm tử kỳ	1	1	12	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2700000	2
1958	Bảo hiểm tử kỳ	1	1	13	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2800000	2
1959	Bảo hiểm tử kỳ	1	1	14	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2900000	2
1960	Bảo hiểm tử kỳ	1	1	15	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3000000	2
1961	Bảo hiểm tử kỳ	1	1	16	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3100000	2
1962	Bảo hiểm tử kỳ	1	1	17	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3300000	2
1963	Bảo hiểm tử kỳ	1	1	18	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3500000	2
1964	Bảo hiểm tử kỳ	1	1	19	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3800000	2
1965	Bảo hiểm tử kỳ	1	1	20	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4100000	2
1966	Bảo hiểm tử kỳ	1	1	21	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4500000	2
1967	Bảo hiểm tử kỳ	1	1	22	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4800000	2
1968	Bảo hiểm tử kỳ	1	1	23	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	5300000	2
1969	Bảo hiểm tử kỳ	1	1	24	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	5700000	2
1970	Bảo hiểm tử kỳ	1	1	25	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	6300000	2
1971	Bảo hiểm tử kỳ	1	1	26	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	6800000	2
1972	Bảo hiểm tử kỳ	1	1	27	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	7500000	2
1973	Bảo hiểm tử kỳ	1	1	28	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	8200000	2
1974	Bảo hiểm tử kỳ	1	1	29	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	8800000	2
1975	Bảo hiểm tử kỳ	1	1	30	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	9600000	2
1976	Bảo hiểm tử kỳ	1	1	31	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	10400000	2
1977	Bảo hiểm tử kỳ	1	1	32	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	11200000	2
1978	Bảo hiểm tử kỳ	1	1	33	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	12000000	2
1979	Bảo hiểm tử kỳ	1	1	34	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	12900000	2
1980	Bảo hiểm tử kỳ	1	1	35	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	14000000	2
1981	Bảo hiểm tử kỳ	1	1	36	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	15100000	2
1982	Bảo hiểm tử kỳ	1	1	37	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	16200000	2
1983	Bảo hiểm tử kỳ	1	1	38	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	17400000	2
1984	Bảo hiểm tử kỳ	1	1	39	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	18600000	2
1985	Bảo hiểm tử kỳ	1	1	40	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	19800000	2
1986	Bảo hiểm tử kỳ	1	1	41	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	21400000	2
1987	Bảo hiểm tử kỳ	1	1	42	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	22600000	2
1988	Bảo hiểm tử kỳ	1	1	43	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	23700000	2
1989	Bảo hiểm tử kỳ	1	1	44	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	24800000	2
1990	Bảo hiểm tử kỳ	1	1	45	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	25900000	2
1991	Bảo hiểm tử kỳ	1	1	46	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	27100000	2
1992	Bảo hiểm tử kỳ	1	1	47	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	28300000	2
1993	Bảo hiểm tử kỳ	1	1	48	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	29500000	2
1994	Bảo hiểm tử kỳ	1	1	49	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	30700000	2
1995	Bảo hiểm tử kỳ	1	1	50	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	32000000	2
1996	Bảo hiểm tử kỳ	1	1	6	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	420000	2
1997	Bảo hiểm tử kỳ	1	1	7	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	420000	2
1998	Bảo hiểm tử kỳ	1	1	8	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	430000	2
1999	Bảo hiểm tử kỳ	1	1	9	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	440000	2
2000	Bảo hiểm tử kỳ	1	1	10	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	460000	2
2001	Bảo hiểm tử kỳ	1	1	11	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	470000	2
2002	Bảo hiểm tử kỳ	1	1	12	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	480000	2
2003	Bảo hiểm tử kỳ	1	1	13	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	480000	2
2004	Bảo hiểm tử kỳ	1	1	14	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	480000	2
2005	Bảo hiểm tử kỳ	1	1	15	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	480000	2
2006	Bảo hiểm tử kỳ	1	1	16	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	480000	2
2007	Bảo hiểm tử kỳ	1	1	17	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	480000	2
2008	Bảo hiểm tử kỳ	1	1	18	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	520000	2
2009	Bảo hiểm tử kỳ	1	1	19	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	560000	2
2010	Bảo hiểm tử kỳ	1	1	20	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	570000	2
2011	Bảo hiểm tử kỳ	1	1	21	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	600000	2
2012	Bảo hiểm tử kỳ	1	1	22	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	620000	2
2013	Bảo hiểm tử kỳ	1	1	23	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	660000	2
2014	Bảo hiểm tử kỳ	1	1	24	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	700000	2
2015	Bảo hiểm tử kỳ	1	1	25	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	760000	2
2016	Bảo hiểm tử kỳ	1	1	26	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	840000	2
2017	Bảo hiểm tử kỳ	1	1	27	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	920000	2
2018	Bảo hiểm tử kỳ	1	1	28	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1000000	2
2019	Bảo hiểm tử kỳ	1	1	29	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1080000	2
2020	Bảo hiểm tử kỳ	1	1	30	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1180000	2
2021	Bảo hiểm tử kỳ	1	1	31	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1260000	2
2022	Bảo hiểm tử kỳ	1	1	32	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1340000	2
2023	Bảo hiểm tử kỳ	1	1	33	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1460000	2
2024	Bảo hiểm tử kỳ	1	1	34	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1580000	2
2025	Bảo hiểm tử kỳ	1	1	35	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1740000	2
2026	Bảo hiểm tử kỳ	1	1	36	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1900000	2
2027	Bảo hiểm tử kỳ	1	1	37	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2120000	2
2028	Bảo hiểm tử kỳ	1	1	38	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2340000	2
2029	Bảo hiểm tử kỳ	1	1	39	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2560000	2
2030	Bảo hiểm tử kỳ	1	1	40	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2800000	2
2031	Bảo hiểm tử kỳ	1	1	41	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3060000	2
2032	Bảo hiểm tử kỳ	1	1	42	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3300000	2
2033	Bảo hiểm tử kỳ	1	1	43	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3540000	2
2034	Bảo hiểm tử kỳ	1	1	44	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3780000	2
2035	Bảo hiểm tử kỳ	1	1	45	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4000000	2
2036	Bảo hiểm tử kỳ	1	1	46	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4240000	2
2037	Bảo hiểm tử kỳ	1	1	47	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4500000	2
2038	Bảo hiểm tử kỳ	1	1	48	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4720000	2
2039	Bảo hiểm tử kỳ	1	1	49	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4980000	2
2040	Bảo hiểm tử kỳ	1	1	50	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5300000	2
2041	Bảo hiểm tử kỳ	1	1	51	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5640000	2
2042	Bảo hiểm tử kỳ	1	1	52	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5980000	2
2043	Bảo hiểm tử kỳ	1	1	53	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6360000	2
2044	Bảo hiểm tử kỳ	1	1	54	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6700000	2
2045	Bảo hiểm tử kỳ	1	1	55	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7000000	2
2046	Bảo hiểm tử kỳ	1	1	56	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7400000	2
2047	Bảo hiểm tử kỳ	1	1	57	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7600000	2
2048	Bảo hiểm tử kỳ	1	1	58	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7700000	2
2049	Bảo hiểm tử kỳ	1	1	59	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7760000	2
2050	Bảo hiểm tử kỳ	1	1	60	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7800000	2
2051	Bảo hiểm tử kỳ	1	1	6	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	630000	2
2052	Bảo hiểm tử kỳ	1	1	7	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	630000	2
2053	Bảo hiểm tử kỳ	1	1	8	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	645000	2
2054	Bảo hiểm tử kỳ	1	1	9	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	660000	2
2055	Bảo hiểm tử kỳ	1	1	10	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	690000	2
2056	Bảo hiểm tử kỳ	1	1	11	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	705000	2
2057	Bảo hiểm tử kỳ	1	1	12	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	720000	2
2058	Bảo hiểm tử kỳ	1	1	13	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	720000	2
2059	Bảo hiểm tử kỳ	1	1	14	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	720000	2
2060	Bảo hiểm tử kỳ	1	1	15	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	720000	2
2061	Bảo hiểm tử kỳ	1	1	16	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	720000	2
2062	Bảo hiểm tử kỳ	1	1	17	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	720000	2
2063	Bảo hiểm tử kỳ	1	1	18	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	780000	2
2064	Bảo hiểm tử kỳ	1	1	19	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	840000	2
2065	Bảo hiểm tử kỳ	1	1	20	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	855000	2
2066	Bảo hiểm tử kỳ	1	1	21	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	900000	2
2067	Bảo hiểm tử kỳ	1	1	22	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	930000	2
2068	Bảo hiểm tử kỳ	1	1	23	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	990000	2
2069	Bảo hiểm tử kỳ	1	1	24	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1050000	2
2070	Bảo hiểm tử kỳ	1	1	25	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1140000	2
2071	Bảo hiểm tử kỳ	1	1	26	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1260000	2
2072	Bảo hiểm tử kỳ	1	1	27	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1380000	2
2073	Bảo hiểm tử kỳ	1	1	28	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1500000	2
2074	Bảo hiểm tử kỳ	1	1	29	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1620000	2
2075	Bảo hiểm tử kỳ	1	1	30	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1770000	2
2076	Bảo hiểm tử kỳ	1	1	31	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1890000	2
2077	Bảo hiểm tử kỳ	1	1	32	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2010000	2
2078	Bảo hiểm tử kỳ	1	1	33	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2190000	2
2079	Bảo hiểm tử kỳ	1	1	34	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2370000	2
2080	Bảo hiểm tử kỳ	1	1	35	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2610000	2
2081	Bảo hiểm tử kỳ	1	1	36	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2850000	2
2082	Bảo hiểm tử kỳ	1	1	37	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3180000	2
2083	Bảo hiểm tử kỳ	1	1	38	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3510000	2
2084	Bảo hiểm tử kỳ	1	1	39	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3840000	2
2085	Bảo hiểm tử kỳ	1	1	40	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4200000	2
2086	Bảo hiểm tử kỳ	1	1	41	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4590000	2
2087	Bảo hiểm tử kỳ	1	1	42	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4950000	2
2088	Bảo hiểm tử kỳ	1	1	43	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5310000	2
2089	Bảo hiểm tử kỳ	1	1	44	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5670000	2
2090	Bảo hiểm tử kỳ	1	1	45	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6000000	2
2091	Bảo hiểm tử kỳ	1	1	46	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6360000	2
2092	Bảo hiểm tử kỳ	1	1	47	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6750000	2
2093	Bảo hiểm tử kỳ	1	1	48	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7080000	2
2094	Bảo hiểm tử kỳ	1	1	49	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7470000	2
2095	Bảo hiểm tử kỳ	1	1	50	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7950000	2
2096	Bảo hiểm tử kỳ	1	1	51	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	8460000	2
2097	Bảo hiểm tử kỳ	1	1	52	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	8970000	2
2098	Bảo hiểm tử kỳ	1	1	53	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	9540000	2
2099	Bảo hiểm tử kỳ	1	1	54	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	10050000	2
2100	Bảo hiểm tử kỳ	1	1	55	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	10500000	2
2101	Bảo hiểm tử kỳ	1	1	56	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11100000	2
2102	Bảo hiểm tử kỳ	1	1	57	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11400000	2
2103	Bảo hiểm tử kỳ	1	1	58	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11550000	2
2104	Bảo hiểm tử kỳ	1	1	59	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11640000	2
2105	Bảo hiểm tử kỳ	1	1	60	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11700000	2
2106	Bảo hiểm tử kỳ	1	1	6	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1050000	2
2107	Bảo hiểm tử kỳ	1	1	7	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1050000	2
2108	Bảo hiểm tử kỳ	1	1	8	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1075000	2
2109	Bảo hiểm tử kỳ	1	1	9	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1100000	2
2110	Bảo hiểm tử kỳ	1	1	10	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1150000	2
2111	Bảo hiểm tử kỳ	1	1	11	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1175000	2
2112	Bảo hiểm tử kỳ	1	1	12	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1200000	2
2113	Bảo hiểm tử kỳ	1	1	13	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1200000	2
2114	Bảo hiểm tử kỳ	1	1	14	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1200000	2
2115	Bảo hiểm tử kỳ	1	1	15	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1200000	2
2116	Bảo hiểm tử kỳ	1	1	16	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1200000	2
2117	Bảo hiểm tử kỳ	1	1	17	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1200000	2
2118	Bảo hiểm tử kỳ	1	1	18	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1300000	2
2119	Bảo hiểm tử kỳ	1	1	19	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1400000	2
2120	Bảo hiểm tử kỳ	1	1	20	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1425000	2
2121	Bảo hiểm tử kỳ	1	1	21	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1500000	2
2122	Bảo hiểm tử kỳ	1	1	22	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1550000	2
2123	Bảo hiểm tử kỳ	1	1	23	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1650000	2
2124	Bảo hiểm tử kỳ	1	1	24	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1750000	2
2125	Bảo hiểm tử kỳ	1	1	25	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1900000	2
2126	Bảo hiểm tử kỳ	1	1	26	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2100000	2
2127	Bảo hiểm tử kỳ	1	1	27	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2300000	2
2128	Bảo hiểm tử kỳ	1	1	28	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2500000	2
2129	Bảo hiểm tử kỳ	1	1	29	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2700000	2
2130	Bảo hiểm tử kỳ	1	1	30	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2950000	2
2131	Bảo hiểm tử kỳ	1	1	31	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3150000	2
2132	Bảo hiểm tử kỳ	1	1	32	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3350000	2
2133	Bảo hiểm tử kỳ	1	1	33	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3650000	2
2134	Bảo hiểm tử kỳ	1	1	34	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3950000	2
2135	Bảo hiểm tử kỳ	1	1	35	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4350000	2
2136	Bảo hiểm tử kỳ	1	1	36	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4750000	2
2137	Bảo hiểm tử kỳ	1	1	37	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5300000	2
2138	Bảo hiểm tử kỳ	1	1	38	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5850000	2
2139	Bảo hiểm tử kỳ	1	1	39	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	6400000	2
2140	Bảo hiểm tử kỳ	1	1	40	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	7000000	2
2141	Bảo hiểm tử kỳ	1	1	41	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	7650000	2
2142	Bảo hiểm tử kỳ	1	1	42	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	8250000	2
2143	Bảo hiểm tử kỳ	1	1	43	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	8850000	2
2144	Bảo hiểm tử kỳ	1	1	44	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	9450000	2
2145	Bảo hiểm tử kỳ	1	1	45	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	10000000	2
2146	Bảo hiểm tử kỳ	1	1	46	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	10600000	2
2147	Bảo hiểm tử kỳ	1	1	47	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	11250000	2
2148	Bảo hiểm tử kỳ	1	1	48	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	11800000	2
2149	Bảo hiểm tử kỳ	1	1	49	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	12450000	2
2150	Bảo hiểm tử kỳ	1	1	50	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	13250000	2
2151	Bảo hiểm tử kỳ	1	1	51	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	14100000	2
2152	Bảo hiểm tử kỳ	1	1	52	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	14950000	2
2153	Bảo hiểm tử kỳ	1	1	53	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	15900000	2
2154	Bảo hiểm tử kỳ	1	1	54	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	16750000	2
2155	Bảo hiểm tử kỳ	1	1	55	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	17500000	2
2156	Bảo hiểm tử kỳ	1	1	56	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	18500000	2
2157	Bảo hiểm tử kỳ	1	1	57	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	19000000	2
2158	Bảo hiểm tử kỳ	1	1	58	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	19250000	2
2159	Bảo hiểm tử kỳ	1	1	59	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	19400000	2
2160	Bảo hiểm tử kỳ	1	1	60	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	19500000	2
2161	Bảo hiểm tử kỳ	1	1	6	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2100000	2
2162	Bảo hiểm tử kỳ	1	1	7	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2100000	2
2163	Bảo hiểm tử kỳ	1	1	8	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2150000	2
2164	Bảo hiểm tử kỳ	1	1	9	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2200000	2
2165	Bảo hiểm tử kỳ	1	1	10	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2300000	2
2166	Bảo hiểm tử kỳ	1	1	11	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2350000	2
2167	Bảo hiểm tử kỳ	1	1	12	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2400000	2
2168	Bảo hiểm tử kỳ	1	1	13	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2400000	2
2169	Bảo hiểm tử kỳ	1	1	14	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2400000	2
2170	Bảo hiểm tử kỳ	1	1	15	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2400000	2
2171	Bảo hiểm tử kỳ	1	1	16	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2400000	2
2172	Bảo hiểm tử kỳ	1	1	17	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2400000	2
2173	Bảo hiểm tử kỳ	1	1	18	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2600000	2
2174	Bảo hiểm tử kỳ	1	1	19	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2800000	2
2175	Bảo hiểm tử kỳ	1	1	20	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2850000	2
2176	Bảo hiểm tử kỳ	1	1	21	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3000000	2
2177	Bảo hiểm tử kỳ	1	1	22	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3100000	2
2178	Bảo hiểm tử kỳ	1	1	23	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3300000	2
2179	Bảo hiểm tử kỳ	1	1	24	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3500000	2
2180	Bảo hiểm tử kỳ	1	1	25	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3800000	2
2181	Bảo hiểm tử kỳ	1	1	26	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4200000	2
2182	Bảo hiểm tử kỳ	1	1	27	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4600000	2
2183	Bảo hiểm tử kỳ	1	1	28	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	5000000	2
2184	Bảo hiểm tử kỳ	1	1	29	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	5400000	2
2185	Bảo hiểm tử kỳ	1	1	30	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	5900000	2
2186	Bảo hiểm tử kỳ	1	1	31	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	6300000	2
2187	Bảo hiểm tử kỳ	1	1	32	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	6700000	2
2188	Bảo hiểm tử kỳ	1	1	33	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	7300000	2
2189	Bảo hiểm tử kỳ	1	1	34	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	7900000	2
2190	Bảo hiểm tử kỳ	1	1	35	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	8700000	2
2191	Bảo hiểm tử kỳ	1	1	36	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	9500000	2
2192	Bảo hiểm tử kỳ	1	1	37	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	10600000	2
2193	Bảo hiểm tử kỳ	1	1	38	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	11700000	2
2194	Bảo hiểm tử kỳ	1	1	39	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	12800000	2
2195	Bảo hiểm tử kỳ	1	1	40	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	14000000	2
2196	Bảo hiểm tử kỳ	1	1	41	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	15300000	2
2197	Bảo hiểm tử kỳ	1	1	42	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	16500000	2
2198	Bảo hiểm tử kỳ	1	1	43	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	17700000	2
2199	Bảo hiểm tử kỳ	1	1	44	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	18900000	2
2200	Bảo hiểm tử kỳ	1	1	45	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	20000000	2
2201	Bảo hiểm tử kỳ	1	1	46	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	21200000	2
2202	Bảo hiểm tử kỳ	1	1	47	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	22500000	2
2203	Bảo hiểm tử kỳ	1	1	48	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	23600000	2
2204	Bảo hiểm tử kỳ	1	1	49	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	24900000	2
2205	Bảo hiểm tử kỳ	1	1	50	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	26500000	2
2206	Bảo hiểm tử kỳ	1	1	51	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	28200000	2
2207	Bảo hiểm tử kỳ	1	1	52	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	29900000	2
2208	Bảo hiểm tử kỳ	1	1	53	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	31800000	2
2209	Bảo hiểm tử kỳ	1	1	54	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	33500000	2
2210	Bảo hiểm tử kỳ	1	1	55	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	35000000	2
2211	Bảo hiểm tử kỳ	1	1	56	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	37000000	2
2212	Bảo hiểm tử kỳ	1	1	57	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	38000000	2
2213	Bảo hiểm tử kỳ	1	1	58	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	38500000	2
2214	Bảo hiểm tử kỳ	1	1	59	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	38800000	2
2215	Bảo hiểm tử kỳ	1	1	60	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	39000000	2
2216	Bảo hiểm tử kỳ	1	2	6	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	500000	2
2217	Bảo hiểm tử kỳ	1	2	7	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	500000	2
2218	Bảo hiểm tử kỳ	1	2	8	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	510000	2
2219	Bảo hiểm tử kỳ	1	2	9	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	510000	2
2220	Bảo hiểm tử kỳ	1	2	10	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	526000	2
2221	Bảo hiểm tử kỳ	1	2	11	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	530000	2
2222	Bảo hiểm tử kỳ	1	2	12	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	530000	2
2223	Bảo hiểm tử kỳ	1	2	13	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	530000	2
2224	Bảo hiểm tử kỳ	1	2	14	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	540000	2
2225	Bảo hiểm tử kỳ	1	2	15	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	550000	2
2226	Bảo hiểm tử kỳ	1	2	16	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	560000	2
2227	Bảo hiểm tử kỳ	1	2	17	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	570000	2
2228	Bảo hiểm tử kỳ	1	2	18	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	580000	2
2229	Bảo hiểm tử kỳ	1	2	19	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	600000	2
2230	Bảo hiểm tử kỳ	1	2	20	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	640000	2
2231	Bảo hiểm tử kỳ	1	2	21	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	660000	2
2232	Bảo hiểm tử kỳ	1	2	22	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	680000	2
2233	Bảo hiểm tử kỳ	1	2	23	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	700000	2
2234	Bảo hiểm tử kỳ	1	2	24	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	700000	2
2235	Bảo hiểm tử kỳ	1	2	25	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	740000	2
2236	Bảo hiểm tử kỳ	1	2	26	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	760000	2
2237	Bảo hiểm tử kỳ	1	2	27	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	780000	2
2238	Bảo hiểm tử kỳ	1	2	28	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	800000	2
2239	Bảo hiểm tử kỳ	1	2	29	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	820000	2
2240	Bảo hiểm tử kỳ	1	2	30	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	840000	2
2241	Bảo hiểm tử kỳ	1	2	31	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	960000	2
2242	Bảo hiểm tử kỳ	1	2	32	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1100000	2
2243	Bảo hiểm tử kỳ	1	2	33	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1200000	2
2244	Bảo hiểm tử kỳ	1	2	34	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1400000	2
2245	Bảo hiểm tử kỳ	1	2	35	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1600000	2
2246	Bảo hiểm tử kỳ	1	2	36	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1800000	2
2247	Bảo hiểm tử kỳ	1	2	37	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2000000	2
2248	Bảo hiểm tử kỳ	1	2	38	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2100000	2
2249	Bảo hiểm tử kỳ	1	2	39	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2300000	2
2250	Bảo hiểm tử kỳ	1	2	40	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2440000	2
2251	Bảo hiểm tử kỳ	1	2	41	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2700000	2
2252	Bảo hiểm tử kỳ	1	2	42	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2900000	2
2253	Bảo hiểm tử kỳ	1	2	43	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3200000	2
2254	Bảo hiểm tử kỳ	1	2	44	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3400000	2
2255	Bảo hiểm tử kỳ	1	2	45	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3700000	2
2256	Bảo hiểm tử kỳ	1	2	46	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4000000	2
2257	Bảo hiểm tử kỳ	1	2	47	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4400000	2
2258	Bảo hiểm tử kỳ	1	2	48	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4700000	2
2259	Bảo hiểm tử kỳ	1	2	49	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5000000	2
2260	Bảo hiểm tử kỳ	1	2	50	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5400000	2
2261	Bảo hiểm tử kỳ	1	2	51	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5800000	2
2262	Bảo hiểm tử kỳ	1	2	52	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6240000	2
2263	Bảo hiểm tử kỳ	1	2	53	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6700000	2
2264	Bảo hiểm tử kỳ	1	2	54	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7200000	2
2265	Bảo hiểm tử kỳ	1	2	55	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7800000	2
2266	Bảo hiểm tử kỳ	1	2	56	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	8700000	2
2267	Bảo hiểm tử kỳ	1	2	57	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	9300000	2
2268	Bảo hiểm tử kỳ	1	2	58	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	9900000	2
2269	Bảo hiểm tử kỳ	1	2	59	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	10720000	2
2270	Bảo hiểm tử kỳ	1	2	60	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	11200000	2
2271	Bảo hiểm tử kỳ	1	2	6	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	750000	2
2272	Bảo hiểm tử kỳ	1	2	7	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	750000	2
2273	Bảo hiểm tử kỳ	1	2	8	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	765000	2
2274	Bảo hiểm tử kỳ	1	2	9	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	765000	2
2275	Bảo hiểm tử kỳ	1	2	10	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	789000	2
2276	Bảo hiểm tử kỳ	1	2	11	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	795000	2
2277	Bảo hiểm tử kỳ	1	2	12	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	795000	2
2278	Bảo hiểm tử kỳ	1	2	13	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	795000	2
2279	Bảo hiểm tử kỳ	1	2	14	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	810000	2
2280	Bảo hiểm tử kỳ	1	2	15	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	825000	2
2281	Bảo hiểm tử kỳ	1	2	16	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	840000	2
2282	Bảo hiểm tử kỳ	1	2	17	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	855000	2
2283	Bảo hiểm tử kỳ	1	2	18	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	870000	2
2284	Bảo hiểm tử kỳ	1	2	19	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	900000	2
2285	Bảo hiểm tử kỳ	1	2	20	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	960000	2
2286	Bảo hiểm tử kỳ	1	2	21	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	990000	2
2287	Bảo hiểm tử kỳ	1	2	22	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1020000	2
2288	Bảo hiểm tử kỳ	1	2	23	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1050000	2
2289	Bảo hiểm tử kỳ	1	2	24	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1050000	2
2290	Bảo hiểm tử kỳ	1	2	25	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1110000	2
2291	Bảo hiểm tử kỳ	1	2	26	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1140000	2
2292	Bảo hiểm tử kỳ	1	2	27	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1170000	2
2293	Bảo hiểm tử kỳ	1	2	28	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1200000	2
2294	Bảo hiểm tử kỳ	1	2	29	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1230000	2
2295	Bảo hiểm tử kỳ	1	2	30	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1260000	2
2296	Bảo hiểm tử kỳ	1	2	31	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1440000	2
2297	Bảo hiểm tử kỳ	1	2	32	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1650000	2
2298	Bảo hiểm tử kỳ	1	2	33	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1800000	2
2299	Bảo hiểm tử kỳ	1	2	34	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2100000	2
2300	Bảo hiểm tử kỳ	1	2	35	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2400000	2
2301	Bảo hiểm tử kỳ	1	2	36	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2700000	2
2302	Bảo hiểm tử kỳ	1	2	37	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3000000	2
2303	Bảo hiểm tử kỳ	1	2	38	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3150000	2
2304	Bảo hiểm tử kỳ	1	2	39	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3450000	2
2305	Bảo hiểm tử kỳ	1	2	40	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3660000	2
2306	Bảo hiểm tử kỳ	1	2	41	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4050000	2
2307	Bảo hiểm tử kỳ	1	2	42	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4350000	2
2308	Bảo hiểm tử kỳ	1	2	43	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4800000	2
2309	Bảo hiểm tử kỳ	1	2	44	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5100000	2
2310	Bảo hiểm tử kỳ	1	2	45	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5550000	2
2311	Bảo hiểm tử kỳ	1	2	46	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6000000	2
2312	Bảo hiểm tử kỳ	1	2	47	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6600000	2
2313	Bảo hiểm tử kỳ	1	2	48	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7050000	2
2314	Bảo hiểm tử kỳ	1	2	49	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7500000	2
2315	Bảo hiểm tử kỳ	1	2	50	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	8100000	2
2316	Bảo hiểm tử kỳ	1	2	51	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	8700000	2
2317	Bảo hiểm tử kỳ	1	2	52	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	9360000	2
2318	Bảo hiểm tử kỳ	1	2	53	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	10050000	2
2319	Bảo hiểm tử kỳ	1	2	54	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	10800000	2
2320	Bảo hiểm tử kỳ	1	2	55	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11700000	2
2321	Bảo hiểm tử kỳ	1	2	56	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	13050000	2
2322	Bảo hiểm tử kỳ	1	2	57	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	13950000	2
2323	Bảo hiểm tử kỳ	1	2	58	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	14850000	2
2324	Bảo hiểm tử kỳ	1	2	59	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	16080000	2
2325	Bảo hiểm tử kỳ	1	2	60	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	16800000	2
2326	Bảo hiểm tử kỳ	1	2	6	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1250000	2
2327	Bảo hiểm tử kỳ	1	2	7	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1250000	2
2328	Bảo hiểm tử kỳ	1	2	8	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1275000	2
2329	Bảo hiểm tử kỳ	1	2	9	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1275000	2
2330	Bảo hiểm tử kỳ	1	2	10	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1315000	2
2331	Bảo hiểm tử kỳ	1	2	11	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1325000	2
2332	Bảo hiểm tử kỳ	1	2	12	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1325000	2
2333	Bảo hiểm tử kỳ	1	2	13	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1325000	2
2334	Bảo hiểm tử kỳ	1	2	14	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1350000	2
2335	Bảo hiểm tử kỳ	1	2	15	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1375000	2
2336	Bảo hiểm tử kỳ	1	2	16	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1400000	2
2337	Bảo hiểm tử kỳ	1	2	17	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1425000	2
2338	Bảo hiểm tử kỳ	1	2	18	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1450000	2
2339	Bảo hiểm tử kỳ	1	2	19	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1500000	2
2340	Bảo hiểm tử kỳ	1	2	20	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1600000	2
2341	Bảo hiểm tử kỳ	1	2	21	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1650000	2
2342	Bảo hiểm tử kỳ	1	2	22	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1700000	2
2343	Bảo hiểm tử kỳ	1	2	23	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1750000	2
2344	Bảo hiểm tử kỳ	1	2	24	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1750000	2
2345	Bảo hiểm tử kỳ	1	2	25	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1850000	2
2346	Bảo hiểm tử kỳ	1	2	26	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1900000	2
2347	Bảo hiểm tử kỳ	1	2	27	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1950000	2
2348	Bảo hiểm tử kỳ	1	2	28	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2000000	2
2349	Bảo hiểm tử kỳ	1	2	29	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2050000	2
2350	Bảo hiểm tử kỳ	1	2	30	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2100000	2
2351	Bảo hiểm tử kỳ	1	2	31	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2400000	2
2352	Bảo hiểm tử kỳ	1	2	32	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2750000	2
2353	Bảo hiểm tử kỳ	1	2	33	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3000000	2
2354	Bảo hiểm tử kỳ	1	2	34	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3500000	2
2355	Bảo hiểm tử kỳ	1	2	35	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4000000	2
2356	Bảo hiểm tử kỳ	1	2	36	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4500000	2
2357	Bảo hiểm tử kỳ	1	2	37	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5000000	2
2358	Bảo hiểm tử kỳ	1	2	38	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5250000	2
2359	Bảo hiểm tử kỳ	1	2	39	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5750000	2
2360	Bảo hiểm tử kỳ	1	2	40	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	6100000	2
2361	Bảo hiểm tử kỳ	1	2	41	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	6750000	2
2362	Bảo hiểm tử kỳ	1	2	42	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	7250000	2
2363	Bảo hiểm tử kỳ	1	2	43	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	8000000	2
2364	Bảo hiểm tử kỳ	1	2	44	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	8500000	2
2365	Bảo hiểm tử kỳ	1	2	45	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	9250000	2
2366	Bảo hiểm tử kỳ	1	2	46	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	10000000	2
2367	Bảo hiểm tử kỳ	1	2	47	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	11000000	2
2368	Bảo hiểm tử kỳ	1	2	48	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	11750000	2
2369	Bảo hiểm tử kỳ	1	2	49	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	12500000	2
2370	Bảo hiểm tử kỳ	1	2	50	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	13500000	2
2371	Bảo hiểm tử kỳ	1	2	51	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	14500000	2
2372	Bảo hiểm tử kỳ	1	2	52	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	15600000	2
2373	Bảo hiểm tử kỳ	1	2	53	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	16750000	2
2374	Bảo hiểm tử kỳ	1	2	54	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	18000000	2
2375	Bảo hiểm tử kỳ	1	2	55	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	19500000	2
2376	Bảo hiểm tử kỳ	1	2	56	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	21750000	2
2377	Bảo hiểm tử kỳ	1	2	57	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	23250000	2
2378	Bảo hiểm tử kỳ	1	2	58	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	24750000	2
2379	Bảo hiểm tử kỳ	1	2	59	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	26800000	2
2380	Bảo hiểm tử kỳ	1	2	60	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	28000000	2
2381	Bảo hiểm tử kỳ	1	2	6	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2500000	2
2382	Bảo hiểm tử kỳ	1	2	7	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2500000	2
2383	Bảo hiểm tử kỳ	1	2	8	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2550000	2
2384	Bảo hiểm tử kỳ	1	2	9	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2550000	2
2385	Bảo hiểm tử kỳ	1	2	10	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2630000	2
2386	Bảo hiểm tử kỳ	1	2	11	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2650000	2
2387	Bảo hiểm tử kỳ	1	2	12	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2650000	2
2388	Bảo hiểm tử kỳ	1	2	13	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2650000	2
2389	Bảo hiểm tử kỳ	1	2	14	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2700000	2
2390	Bảo hiểm tử kỳ	1	2	15	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2750000	2
2391	Bảo hiểm tử kỳ	1	2	16	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2800000	2
2392	Bảo hiểm tử kỳ	1	2	17	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2850000	2
2393	Bảo hiểm tử kỳ	1	2	18	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2900000	2
2394	Bảo hiểm tử kỳ	1	2	19	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3000000	2
2395	Bảo hiểm tử kỳ	1	2	20	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3200000	2
2396	Bảo hiểm tử kỳ	1	2	21	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3300000	2
2397	Bảo hiểm tử kỳ	1	2	22	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3400000	2
2398	Bảo hiểm tử kỳ	1	2	23	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3500000	2
2399	Bảo hiểm tử kỳ	1	2	24	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3500000	2
2400	Bảo hiểm tử kỳ	1	2	25	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3700000	2
2401	Bảo hiểm tử kỳ	1	2	26	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3800000	2
2402	Bảo hiểm tử kỳ	1	2	27	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3900000	2
2403	Bảo hiểm tử kỳ	1	2	28	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4000000	2
2404	Bảo hiểm tử kỳ	1	2	29	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4100000	2
2405	Bảo hiểm tử kỳ	1	2	30	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4200000	2
2406	Bảo hiểm tử kỳ	1	2	31	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4800000	2
2407	Bảo hiểm tử kỳ	1	2	32	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	5500000	2
2408	Bảo hiểm tử kỳ	1	2	33	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	6000000	2
2409	Bảo hiểm tử kỳ	1	2	34	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	7000000	2
2410	Bảo hiểm tử kỳ	1	2	35	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	8000000	2
2411	Bảo hiểm tử kỳ	1	2	36	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	9000000	2
2412	Bảo hiểm tử kỳ	1	2	37	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	10000000	2
2413	Bảo hiểm tử kỳ	1	2	38	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	10500000	2
2414	Bảo hiểm tử kỳ	1	2	39	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	11500000	2
2415	Bảo hiểm tử kỳ	1	2	40	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	12200000	2
2416	Bảo hiểm tử kỳ	1	2	41	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	13500000	2
2417	Bảo hiểm tử kỳ	1	2	42	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	14500000	2
2418	Bảo hiểm tử kỳ	1	2	43	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	16000000	2
2419	Bảo hiểm tử kỳ	1	2	44	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	17000000	2
2420	Bảo hiểm tử kỳ	1	2	45	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	18500000	2
2421	Bảo hiểm tử kỳ	1	2	46	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	20000000	2
2422	Bảo hiểm tử kỳ	1	2	47	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	22000000	2
2423	Bảo hiểm tử kỳ	1	2	48	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	23500000	2
2424	Bảo hiểm tử kỳ	1	2	49	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	25000000	2
2425	Bảo hiểm tử kỳ	1	2	50	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	27000000	2
2426	Bảo hiểm tử kỳ	1	2	51	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	29000000	2
2427	Bảo hiểm tử kỳ	1	2	52	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	31200000	2
2428	Bảo hiểm tử kỳ	1	2	53	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	33500000	2
2429	Bảo hiểm tử kỳ	1	2	54	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	36000000	2
2430	Bảo hiểm tử kỳ	1	2	55	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	39000000	2
2431	Bảo hiểm tử kỳ	1	2	56	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	43500000	2
2432	Bảo hiểm tử kỳ	1	2	57	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	46500000	2
2433	Bảo hiểm tử kỳ	1	2	58	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	49500000	2
2434	Bảo hiểm tử kỳ	1	2	59	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	53600000	2
2435	Bảo hiểm tử kỳ	1	2	60	5	5	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	56000000	2
2436	Bảo hiểm tử kỳ	1	2	6	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	500000	2
2437	Bảo hiểm tử kỳ	1	2	7	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	500000	2
2438	Bảo hiểm tử kỳ	1	2	8	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	510000	2
2439	Bảo hiểm tử kỳ	1	2	9	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	510000	2
2440	Bảo hiểm tử kỳ	1	2	10	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	526000	2
2441	Bảo hiểm tử kỳ	1	2	11	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	530000	2
2442	Bảo hiểm tử kỳ	1	2	12	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	530000	2
2443	Bảo hiểm tử kỳ	1	2	13	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	530000	2
2444	Bảo hiểm tử kỳ	1	2	14	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	540000	2
2445	Bảo hiểm tử kỳ	1	2	15	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	550000	2
2446	Bảo hiểm tử kỳ	1	2	16	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	560000	2
2447	Bảo hiểm tử kỳ	1	2	17	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	570000	2
2448	Bảo hiểm tử kỳ	1	2	18	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	580000	2
2449	Bảo hiểm tử kỳ	1	2	19	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	600000	2
2450	Bảo hiểm tử kỳ	1	2	20	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	640000	2
2451	Bảo hiểm tử kỳ	1	2	21	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	660000	2
2452	Bảo hiểm tử kỳ	1	2	22	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	680000	2
2453	Bảo hiểm tử kỳ	1	2	23	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	700000	2
2454	Bảo hiểm tử kỳ	1	2	24	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	720000	2
2455	Bảo hiểm tử kỳ	1	2	25	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	740000	2
2456	Bảo hiểm tử kỳ	1	2	26	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	760000	2
2457	Bảo hiểm tử kỳ	1	2	27	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	780000	2
2458	Bảo hiểm tử kỳ	1	2	28	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	800000	2
2459	Bảo hiểm tử kỳ	1	2	29	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	840000	2
2460	Bảo hiểm tử kỳ	1	2	30	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	920000	2
2461	Bảo hiểm tử kỳ	1	2	31	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1040000	2
2462	Bảo hiểm tử kỳ	1	2	32	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1220000	2
2463	Bảo hiểm tử kỳ	1	2	33	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1360000	2
2464	Bảo hiểm tử kỳ	1	2	34	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1560000	2
2465	Bảo hiểm tử kỳ	1	2	35	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1760000	2
2466	Bảo hiểm tử kỳ	1	2	36	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1960000	2
2467	Bảo hiểm tử kỳ	1	2	37	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2120000	2
2468	Bảo hiểm tử kỳ	1	2	38	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2260000	2
2469	Bảo hiểm tử kỳ	1	2	39	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2460000	2
2470	Bảo hiểm tử kỳ	1	2	40	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2600000	2
2471	Bảo hiểm tử kỳ	1	2	41	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2800000	2
2472	Bảo hiểm tử kỳ	1	2	42	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3060000	2
2473	Bảo hiểm tử kỳ	1	2	43	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3360000	2
2474	Bảo hiểm tử kỳ	1	2	44	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3560000	2
2475	Bảo hiểm tử kỳ	1	2	45	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3860000	2
2476	Bảo hiểm tử kỳ	1	2	46	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4160000	2
2477	Bảo hiểm tử kỳ	1	2	47	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4560000	2
2478	Bảo hiểm tử kỳ	1	2	48	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4860000	2
2479	Bảo hiểm tử kỳ	1	2	49	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5200000	2
2480	Bảo hiểm tử kỳ	1	2	50	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5600000	2
2481	Bảo hiểm tử kỳ	1	2	51	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6000000	2
2482	Bảo hiểm tử kỳ	1	2	52	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6440000	2
2483	Bảo hiểm tử kỳ	1	2	53	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6900000	2
2484	Bảo hiểm tử kỳ	1	2	54	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7600000	2
2485	Bảo hiểm tử kỳ	1	2	55	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	8200000	2
2486	Bảo hiểm tử kỳ	1	2	56	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	8900000	2
2487	Bảo hiểm tử kỳ	1	2	57	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	9500000	2
2488	Bảo hiểm tử kỳ	1	2	58	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	10100000	2
2489	Bảo hiểm tử kỳ	1	2	59	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	10900000	2
2490	Bảo hiểm tử kỳ	1	2	60	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	11600000	2
2491	Bảo hiểm tử kỳ	1	2	6	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	750000	2
2492	Bảo hiểm tử kỳ	1	2	7	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	750000	2
2493	Bảo hiểm tử kỳ	1	2	8	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	765000	2
2494	Bảo hiểm tử kỳ	1	2	9	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	765000	2
2495	Bảo hiểm tử kỳ	1	2	10	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	789000	2
2496	Bảo hiểm tử kỳ	1	2	11	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	795000	2
2497	Bảo hiểm tử kỳ	1	2	12	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	795000	2
2498	Bảo hiểm tử kỳ	1	2	13	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	795000	2
2499	Bảo hiểm tử kỳ	1	2	14	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	810000	2
2500	Bảo hiểm tử kỳ	1	2	15	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	825000	2
2501	Bảo hiểm tử kỳ	1	2	16	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	840000	2
2502	Bảo hiểm tử kỳ	1	2	17	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	855000	2
2503	Bảo hiểm tử kỳ	1	2	18	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	870000	2
2504	Bảo hiểm tử kỳ	1	2	19	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	900000	2
2505	Bảo hiểm tử kỳ	1	2	20	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	960000	2
2506	Bảo hiểm tử kỳ	1	2	21	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	990000	2
2507	Bảo hiểm tử kỳ	1	2	22	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1020000	2
2508	Bảo hiểm tử kỳ	1	2	23	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1050000	2
2509	Bảo hiểm tử kỳ	1	2	24	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1080000	2
2510	Bảo hiểm tử kỳ	1	2	25	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1110000	2
2511	Bảo hiểm tử kỳ	1	2	26	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1140000	2
2512	Bảo hiểm tử kỳ	1	2	27	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1170000	2
2513	Bảo hiểm tử kỳ	1	2	28	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1200000	2
2514	Bảo hiểm tử kỳ	1	2	29	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1260000	2
2515	Bảo hiểm tử kỳ	1	2	30	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1380000	2
2516	Bảo hiểm tử kỳ	1	2	31	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1560000	2
2517	Bảo hiểm tử kỳ	1	2	32	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1830000	2
2518	Bảo hiểm tử kỳ	1	2	33	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2040000	2
2519	Bảo hiểm tử kỳ	1	2	34	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2340000	2
2520	Bảo hiểm tử kỳ	1	2	35	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2640000	2
2521	Bảo hiểm tử kỳ	1	2	36	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2940000	2
2522	Bảo hiểm tử kỳ	1	2	37	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3180000	2
2523	Bảo hiểm tử kỳ	1	2	38	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3390000	2
2524	Bảo hiểm tử kỳ	1	2	39	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3690000	2
2525	Bảo hiểm tử kỳ	1	2	40	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3900000	2
2526	Bảo hiểm tử kỳ	1	2	41	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4200000	2
2527	Bảo hiểm tử kỳ	1	2	42	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4590000	2
2528	Bảo hiểm tử kỳ	1	2	43	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5040000	2
2529	Bảo hiểm tử kỳ	1	2	44	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5340000	2
2530	Bảo hiểm tử kỳ	1	2	45	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5790000	2
2531	Bảo hiểm tử kỳ	1	2	46	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6240000	2
2532	Bảo hiểm tử kỳ	1	2	47	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6840000	2
2533	Bảo hiểm tử kỳ	1	2	48	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7290000	2
2534	Bảo hiểm tử kỳ	1	2	49	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7800000	2
2535	Bảo hiểm tử kỳ	1	2	50	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	8400000	2
2536	Bảo hiểm tử kỳ	1	2	51	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	9000000	2
2537	Bảo hiểm tử kỳ	1	2	52	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	9660000	2
2538	Bảo hiểm tử kỳ	1	2	53	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	10350000	2
2539	Bảo hiểm tử kỳ	1	2	54	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11400000	2
2540	Bảo hiểm tử kỳ	1	2	55	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	12300000	2
2541	Bảo hiểm tử kỳ	1	2	56	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	13350000	2
2542	Bảo hiểm tử kỳ	1	2	57	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	14250000	2
2543	Bảo hiểm tử kỳ	1	2	58	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	15150000	2
2544	Bảo hiểm tử kỳ	1	2	59	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	16350000	2
2545	Bảo hiểm tử kỳ	1	2	60	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	17400000	2
2546	Bảo hiểm tử kỳ	1	2	6	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1250000	2
2547	Bảo hiểm tử kỳ	1	2	7	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1250000	2
2548	Bảo hiểm tử kỳ	1	2	8	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1275000	2
2549	Bảo hiểm tử kỳ	1	2	9	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1275000	2
2550	Bảo hiểm tử kỳ	1	2	10	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1315000	2
2551	Bảo hiểm tử kỳ	1	2	11	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1325000	2
2552	Bảo hiểm tử kỳ	1	2	12	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1325000	2
2553	Bảo hiểm tử kỳ	1	2	13	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1325000	2
2554	Bảo hiểm tử kỳ	1	2	14	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1350000	2
2555	Bảo hiểm tử kỳ	1	2	15	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1375000	2
2556	Bảo hiểm tử kỳ	1	2	16	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1400000	2
2557	Bảo hiểm tử kỳ	1	2	17	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1425000	2
2558	Bảo hiểm tử kỳ	1	2	18	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1450000	2
2559	Bảo hiểm tử kỳ	1	2	19	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1500000	2
2560	Bảo hiểm tử kỳ	1	2	20	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1600000	2
2561	Bảo hiểm tử kỳ	1	2	21	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1650000	2
2562	Bảo hiểm tử kỳ	1	2	22	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1700000	2
2563	Bảo hiểm tử kỳ	1	2	23	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1750000	2
2564	Bảo hiểm tử kỳ	1	2	24	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1800000	2
2565	Bảo hiểm tử kỳ	1	2	25	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1850000	2
2566	Bảo hiểm tử kỳ	1	2	26	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1900000	2
2567	Bảo hiểm tử kỳ	1	2	27	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1950000	2
2568	Bảo hiểm tử kỳ	1	2	28	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2000000	2
2569	Bảo hiểm tử kỳ	1	2	29	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2100000	2
2570	Bảo hiểm tử kỳ	1	2	30	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2300000	2
2571	Bảo hiểm tử kỳ	1	2	31	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2600000	2
2572	Bảo hiểm tử kỳ	1	2	32	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3050000	2
2573	Bảo hiểm tử kỳ	1	2	33	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3400000	2
2574	Bảo hiểm tử kỳ	1	2	34	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3900000	2
2575	Bảo hiểm tử kỳ	1	2	35	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4400000	2
2576	Bảo hiểm tử kỳ	1	2	36	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4900000	2
2577	Bảo hiểm tử kỳ	1	2	37	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5300000	2
2578	Bảo hiểm tử kỳ	1	2	38	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5650000	2
2579	Bảo hiểm tử kỳ	1	2	39	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	6150000	2
2580	Bảo hiểm tử kỳ	1	2	40	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	6500000	2
2581	Bảo hiểm tử kỳ	1	2	41	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	7000000	2
2582	Bảo hiểm tử kỳ	1	2	42	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	7650000	2
2583	Bảo hiểm tử kỳ	1	2	43	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	8400000	2
2584	Bảo hiểm tử kỳ	1	2	44	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	8900000	2
2585	Bảo hiểm tử kỳ	1	2	45	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	9650000	2
2586	Bảo hiểm tử kỳ	1	2	46	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	10400000	2
2587	Bảo hiểm tử kỳ	1	2	47	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	11400000	2
2588	Bảo hiểm tử kỳ	1	2	48	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	12150000	2
2589	Bảo hiểm tử kỳ	1	2	49	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	13000000	2
2590	Bảo hiểm tử kỳ	1	2	50	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	14000000	2
2591	Bảo hiểm tử kỳ	1	2	51	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	15000000	2
2592	Bảo hiểm tử kỳ	1	2	52	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	16100000	2
2593	Bảo hiểm tử kỳ	1	2	53	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	17250000	2
2594	Bảo hiểm tử kỳ	1	2	54	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	19000000	2
2595	Bảo hiểm tử kỳ	1	2	55	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	20500000	2
2596	Bảo hiểm tử kỳ	1	2	56	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	22250000	2
2597	Bảo hiểm tử kỳ	1	2	57	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	23750000	2
2598	Bảo hiểm tử kỳ	1	2	58	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	25250000	2
2599	Bảo hiểm tử kỳ	1	2	59	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	27250000	2
2600	Bảo hiểm tử kỳ	1	2	60	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	29000000	2
2601	Bảo hiểm tử kỳ	1	2	6	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2500000	2
2602	Bảo hiểm tử kỳ	1	2	7	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2500000	2
2603	Bảo hiểm tử kỳ	1	2	8	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2550000	2
2604	Bảo hiểm tử kỳ	1	2	9	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2550000	2
2605	Bảo hiểm tử kỳ	1	2	10	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2630000	2
2606	Bảo hiểm tử kỳ	1	2	11	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2650000	2
2607	Bảo hiểm tử kỳ	1	2	12	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2650000	2
2608	Bảo hiểm tử kỳ	1	2	13	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2650000	2
2609	Bảo hiểm tử kỳ	1	2	14	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2700000	2
2610	Bảo hiểm tử kỳ	1	2	15	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2750000	2
2611	Bảo hiểm tử kỳ	1	2	16	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2800000	2
2612	Bảo hiểm tử kỳ	1	2	17	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2850000	2
2613	Bảo hiểm tử kỳ	1	2	18	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2900000	2
2614	Bảo hiểm tử kỳ	1	2	19	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3000000	2
2615	Bảo hiểm tử kỳ	1	2	20	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3200000	2
2616	Bảo hiểm tử kỳ	1	2	21	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3300000	2
2617	Bảo hiểm tử kỳ	1	2	22	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3400000	2
2618	Bảo hiểm tử kỳ	1	2	23	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3500000	2
2619	Bảo hiểm tử kỳ	1	2	24	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3600000	2
2620	Bảo hiểm tử kỳ	1	2	25	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3700000	2
2621	Bảo hiểm tử kỳ	1	2	26	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3800000	2
2622	Bảo hiểm tử kỳ	1	2	27	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3900000	2
2623	Bảo hiểm tử kỳ	1	2	28	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4000000	2
2624	Bảo hiểm tử kỳ	1	2	29	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4200000	2
2625	Bảo hiểm tử kỳ	1	2	30	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4600000	2
2626	Bảo hiểm tử kỳ	1	2	31	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	5200000	2
2627	Bảo hiểm tử kỳ	1	2	32	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	6100000	2
2628	Bảo hiểm tử kỳ	1	2	33	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	6800000	2
2629	Bảo hiểm tử kỳ	1	2	34	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	7800000	2
2630	Bảo hiểm tử kỳ	1	2	35	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	8800000	2
2631	Bảo hiểm tử kỳ	1	2	36	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	9800000	2
2632	Bảo hiểm tử kỳ	1	2	37	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	10600000	2
2633	Bảo hiểm tử kỳ	1	2	38	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	11300000	2
2634	Bảo hiểm tử kỳ	1	2	39	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	12300000	2
2635	Bảo hiểm tử kỳ	1	2	40	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	13000000	2
2636	Bảo hiểm tử kỳ	1	2	41	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	14000000	2
2637	Bảo hiểm tử kỳ	1	2	42	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	15300000	2
2638	Bảo hiểm tử kỳ	1	2	43	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	16800000	2
2639	Bảo hiểm tử kỳ	1	2	44	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	17800000	2
2640	Bảo hiểm tử kỳ	1	2	45	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	19300000	2
2641	Bảo hiểm tử kỳ	1	2	46	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	20800000	2
2642	Bảo hiểm tử kỳ	1	2	47	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	22800000	2
2643	Bảo hiểm tử kỳ	1	2	48	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	24300000	2
2644	Bảo hiểm tử kỳ	1	2	49	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	26000000	2
2645	Bảo hiểm tử kỳ	1	2	50	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	28000000	2
2646	Bảo hiểm tử kỳ	1	2	51	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	30000000	2
2647	Bảo hiểm tử kỳ	1	2	52	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	32200000	2
2648	Bảo hiểm tử kỳ	1	2	53	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	34500000	2
2649	Bảo hiểm tử kỳ	1	2	54	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	38000000	2
2650	Bảo hiểm tử kỳ	1	2	55	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	41000000	2
2651	Bảo hiểm tử kỳ	1	2	56	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	44500000	2
2652	Bảo hiểm tử kỳ	1	2	57	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	47500000	2
2653	Bảo hiểm tử kỳ	1	2	58	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	50500000	2
2654	Bảo hiểm tử kỳ	1	2	59	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	54500000	2
2655	Bảo hiểm tử kỳ	1	2	60	7	7	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	58000000	2
2656	Bảo hiểm tử kỳ	1	2	6	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	500000	2
2657	Bảo hiểm tử kỳ	1	2	7	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	500000	2
2658	Bảo hiểm tử kỳ	1	2	8	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	510000	2
2659	Bảo hiểm tử kỳ	1	2	9	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	510000	2
2660	Bảo hiểm tử kỳ	1	2	10	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	526000	2
2661	Bảo hiểm tử kỳ	1	2	11	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	530000	2
2662	Bảo hiểm tử kỳ	1	2	12	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	530000	2
2663	Bảo hiểm tử kỳ	1	2	13	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	540000	2
2664	Bảo hiểm tử kỳ	1	2	14	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	550000	2
2665	Bảo hiểm tử kỳ	1	2	15	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	560000	2
2666	Bảo hiểm tử kỳ	1	2	16	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	570000	2
2667	Bảo hiểm tử kỳ	1	2	17	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	580000	2
2668	Bảo hiểm tử kỳ	1	2	18	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	590000	2
2669	Bảo hiểm tử kỳ	1	2	19	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	610000	2
2670	Bảo hiểm tử kỳ	1	2	20	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	640000	2
2671	Bảo hiểm tử kỳ	1	2	21	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	660000	2
2672	Bảo hiểm tử kỳ	1	2	22	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	680000	2
2673	Bảo hiểm tử kỳ	1	2	23	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	700000	2
2674	Bảo hiểm tử kỳ	1	2	24	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	720000	2
2675	Bảo hiểm tử kỳ	1	2	25	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	760000	2
2676	Bảo hiểm tử kỳ	1	2	26	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	780000	2
2677	Bảo hiểm tử kỳ	1	2	27	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	800000	2
2678	Bảo hiểm tử kỳ	1	2	28	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	860000	2
2679	Bảo hiểm tử kỳ	1	2	29	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	940000	2
2680	Bảo hiểm tử kỳ	1	2	30	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1034000	2
2681	Bảo hiểm tử kỳ	1	2	31	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1200000	2
2682	Bảo hiểm tử kỳ	1	2	32	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1400000	2
2683	Bảo hiểm tử kỳ	1	2	33	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1600000	2
2684	Bảo hiểm tử kỳ	1	2	34	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1800000	2
2685	Bảo hiểm tử kỳ	1	2	35	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2000000	2
2686	Bảo hiểm tử kỳ	1	2	36	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2200000	2
2687	Bảo hiểm tử kỳ	1	2	37	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2300000	2
2688	Bảo hiểm tử kỳ	1	2	38	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2500000	2
2689	Bảo hiểm tử kỳ	1	2	39	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2700000	2
2690	Bảo hiểm tử kỳ	1	2	40	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2820000	2
2691	Bảo hiểm tử kỳ	1	2	41	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3060000	2
2692	Bảo hiểm tử kỳ	1	2	42	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3320000	2
2693	Bảo hiểm tử kỳ	1	2	43	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3580000	2
2694	Bảo hiểm tử kỳ	1	2	44	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3880000	2
2695	Bảo hiểm tử kỳ	1	2	45	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4200000	2
2696	Bảo hiểm tử kỳ	1	2	46	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4540000	2
2697	Bảo hiểm tử kỳ	1	2	47	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4880000	2
2698	Bảo hiểm tử kỳ	1	2	48	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5220000	2
2699	Bảo hiểm tử kỳ	1	2	49	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5780000	2
2700	Bảo hiểm tử kỳ	1	2	50	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6140000	2
2701	Bảo hiểm tử kỳ	1	2	51	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6740000	2
2702	Bảo hiểm tử kỳ	1	2	52	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7260000	2
2703	Bảo hiểm tử kỳ	1	2	53	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7700000	2
2704	Bảo hiểm tử kỳ	1	2	54	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	8260000	2
2705	Bảo hiểm tử kỳ	1	2	55	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	8840000	2
2706	Bảo hiểm tử kỳ	1	2	56	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	9600000	2
2707	Bảo hiểm tử kỳ	1	2	57	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	10120000	2
2708	Bảo hiểm tử kỳ	1	2	58	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	10840000	2
2709	Bảo hiểm tử kỳ	1	2	59	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	11660000	2
2710	Bảo hiểm tử kỳ	1	2	60	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	12000000	2
2711	Bảo hiểm tử kỳ	1	2	6	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	750000	2
2712	Bảo hiểm tử kỳ	1	2	7	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	750000	2
2713	Bảo hiểm tử kỳ	1	2	8	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	765000	2
2714	Bảo hiểm tử kỳ	1	2	9	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	765000	2
2715	Bảo hiểm tử kỳ	1	2	10	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	789000	2
2716	Bảo hiểm tử kỳ	1	2	11	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	795000	2
2717	Bảo hiểm tử kỳ	1	2	12	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	795000	2
2718	Bảo hiểm tử kỳ	1	2	13	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	810000	2
2719	Bảo hiểm tử kỳ	1	2	14	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	825000	2
2720	Bảo hiểm tử kỳ	1	2	15	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	840000	2
2721	Bảo hiểm tử kỳ	1	2	16	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	855000	2
2722	Bảo hiểm tử kỳ	1	2	17	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	870000	2
2723	Bảo hiểm tử kỳ	1	2	18	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	885000	2
2724	Bảo hiểm tử kỳ	1	2	19	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	915000	2
2725	Bảo hiểm tử kỳ	1	2	20	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	960000	2
2726	Bảo hiểm tử kỳ	1	2	21	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	990000	2
2727	Bảo hiểm tử kỳ	1	2	22	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1020000	2
2728	Bảo hiểm tử kỳ	1	2	23	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1050000	2
2729	Bảo hiểm tử kỳ	1	2	24	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1080000	2
2730	Bảo hiểm tử kỳ	1	2	25	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1140000	2
2731	Bảo hiểm tử kỳ	1	2	26	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1170000	2
2732	Bảo hiểm tử kỳ	1	2	27	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1200000	2
2733	Bảo hiểm tử kỳ	1	2	28	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1290000	2
2734	Bảo hiểm tử kỳ	1	2	29	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1410000	2
2735	Bảo hiểm tử kỳ	1	2	30	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1551000	2
2736	Bảo hiểm tử kỳ	1	2	31	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1800000	2
2737	Bảo hiểm tử kỳ	1	2	32	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2100000	2
2738	Bảo hiểm tử kỳ	1	2	33	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2400000	2
2739	Bảo hiểm tử kỳ	1	2	34	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2700000	2
2740	Bảo hiểm tử kỳ	1	2	35	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3000000	2
2741	Bảo hiểm tử kỳ	1	2	36	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3300000	2
2742	Bảo hiểm tử kỳ	1	2	37	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3450000	2
2743	Bảo hiểm tử kỳ	1	2	38	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3750000	2
2744	Bảo hiểm tử kỳ	1	2	39	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4050000	2
2745	Bảo hiểm tử kỳ	1	2	40	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4230000	2
2746	Bảo hiểm tử kỳ	1	2	41	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4590000	2
2747	Bảo hiểm tử kỳ	1	2	42	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4980000	2
2748	Bảo hiểm tử kỳ	1	2	43	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5370000	2
2749	Bảo hiểm tử kỳ	1	2	44	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5820000	2
2750	Bảo hiểm tử kỳ	1	2	45	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6300000	2
2751	Bảo hiểm tử kỳ	1	2	46	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6810000	2
2752	Bảo hiểm tử kỳ	1	2	47	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7320000	2
2753	Bảo hiểm tử kỳ	1	2	48	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7830000	2
2754	Bảo hiểm tử kỳ	1	2	49	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	8670000	2
2755	Bảo hiểm tử kỳ	1	2	50	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	9210000	2
2756	Bảo hiểm tử kỳ	1	2	51	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	10110000	2
2757	Bảo hiểm tử kỳ	1	2	52	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	10890000	2
2758	Bảo hiểm tử kỳ	1	2	53	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11550000	2
2759	Bảo hiểm tử kỳ	1	2	54	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	12390000	2
2760	Bảo hiểm tử kỳ	1	2	55	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	13260000	2
2761	Bảo hiểm tử kỳ	1	2	56	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	14400000	2
2762	Bảo hiểm tử kỳ	1	2	57	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	15180000	2
2763	Bảo hiểm tử kỳ	1	2	58	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	16260000	2
2764	Bảo hiểm tử kỳ	1	2	59	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	17490000	2
2765	Bảo hiểm tử kỳ	1	2	60	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	18000000	2
2766	Bảo hiểm tử kỳ	1	2	6	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1250000	2
2767	Bảo hiểm tử kỳ	1	2	7	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1250000	2
2768	Bảo hiểm tử kỳ	1	2	8	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1275000	2
2769	Bảo hiểm tử kỳ	1	2	9	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1275000	2
2770	Bảo hiểm tử kỳ	1	2	10	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1315000	2
2771	Bảo hiểm tử kỳ	1	2	11	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1325000	2
2772	Bảo hiểm tử kỳ	1	2	12	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1325000	2
2773	Bảo hiểm tử kỳ	1	2	13	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1350000	2
2774	Bảo hiểm tử kỳ	1	2	14	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1375000	2
2775	Bảo hiểm tử kỳ	1	2	15	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1400000	2
2776	Bảo hiểm tử kỳ	1	2	16	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1425000	2
2777	Bảo hiểm tử kỳ	1	2	17	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1450000	2
2778	Bảo hiểm tử kỳ	1	2	18	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1475000	2
2779	Bảo hiểm tử kỳ	1	2	19	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1525000	2
2780	Bảo hiểm tử kỳ	1	2	20	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1600000	2
2781	Bảo hiểm tử kỳ	1	2	21	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1650000	2
2782	Bảo hiểm tử kỳ	1	2	22	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1700000	2
2783	Bảo hiểm tử kỳ	1	2	23	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1750000	2
2784	Bảo hiểm tử kỳ	1	2	24	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1800000	2
2785	Bảo hiểm tử kỳ	1	2	25	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1900000	2
2786	Bảo hiểm tử kỳ	1	2	26	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1950000	2
2787	Bảo hiểm tử kỳ	1	2	27	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2000000	2
2788	Bảo hiểm tử kỳ	1	2	28	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2150000	2
2789	Bảo hiểm tử kỳ	1	2	29	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2350000	2
2790	Bảo hiểm tử kỳ	1	2	30	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2585000	2
2791	Bảo hiểm tử kỳ	1	2	31	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3000000	2
2792	Bảo hiểm tử kỳ	1	2	32	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3500000	2
2793	Bảo hiểm tử kỳ	1	2	33	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4000000	2
2794	Bảo hiểm tử kỳ	1	2	34	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4500000	2
2795	Bảo hiểm tử kỳ	1	2	35	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5000000	2
2796	Bảo hiểm tử kỳ	1	2	36	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5500000	2
2797	Bảo hiểm tử kỳ	1	2	37	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5750000	2
2798	Bảo hiểm tử kỳ	1	2	38	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	6250000	2
2799	Bảo hiểm tử kỳ	1	2	39	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	6750000	2
2800	Bảo hiểm tử kỳ	1	2	40	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	7050000	2
2801	Bảo hiểm tử kỳ	1	2	41	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	7650000	2
2802	Bảo hiểm tử kỳ	1	2	42	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	8300000	2
2803	Bảo hiểm tử kỳ	1	2	43	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	8950000	2
2804	Bảo hiểm tử kỳ	1	2	44	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	9700000	2
2805	Bảo hiểm tử kỳ	1	2	45	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	10500000	2
2806	Bảo hiểm tử kỳ	1	2	46	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	11350000	2
2807	Bảo hiểm tử kỳ	1	2	47	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	12200000	2
2808	Bảo hiểm tử kỳ	1	2	48	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	13050000	2
2809	Bảo hiểm tử kỳ	1	2	49	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	14450000	2
2810	Bảo hiểm tử kỳ	1	2	50	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	15350000	2
2811	Bảo hiểm tử kỳ	1	2	51	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	16850000	2
2812	Bảo hiểm tử kỳ	1	2	52	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	18150000	2
2813	Bảo hiểm tử kỳ	1	2	53	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	19250000	2
2814	Bảo hiểm tử kỳ	1	2	54	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	20650000	2
2815	Bảo hiểm tử kỳ	1	2	55	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	22100000	2
2816	Bảo hiểm tử kỳ	1	2	56	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	24000000	2
2817	Bảo hiểm tử kỳ	1	2	57	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	25300000	2
2818	Bảo hiểm tử kỳ	1	2	58	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	27100000	2
2819	Bảo hiểm tử kỳ	1	2	59	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	29150000	2
2820	Bảo hiểm tử kỳ	1	2	60	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	30000000	2
2821	Bảo hiểm tử kỳ	1	2	6	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2500000	2
2822	Bảo hiểm tử kỳ	1	2	7	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2500000	2
2823	Bảo hiểm tử kỳ	1	2	8	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2550000	2
2824	Bảo hiểm tử kỳ	1	2	9	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2550000	2
2825	Bảo hiểm tử kỳ	1	2	10	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2630000	2
2826	Bảo hiểm tử kỳ	1	2	11	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2650000	2
2827	Bảo hiểm tử kỳ	1	2	12	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2650000	2
2828	Bảo hiểm tử kỳ	1	2	13	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2700000	2
2829	Bảo hiểm tử kỳ	1	2	14	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2750000	2
2830	Bảo hiểm tử kỳ	1	2	15	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2800000	2
2831	Bảo hiểm tử kỳ	1	2	16	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2850000	2
2832	Bảo hiểm tử kỳ	1	2	17	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2900000	2
2833	Bảo hiểm tử kỳ	1	2	18	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2950000	2
2834	Bảo hiểm tử kỳ	1	2	19	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3050000	2
2835	Bảo hiểm tử kỳ	1	2	20	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3200000	2
2836	Bảo hiểm tử kỳ	1	2	21	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3300000	2
2837	Bảo hiểm tử kỳ	1	2	22	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3400000	2
2838	Bảo hiểm tử kỳ	1	2	23	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3500000	2
2839	Bảo hiểm tử kỳ	1	2	24	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3600000	2
2840	Bảo hiểm tử kỳ	1	2	25	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3800000	2
2841	Bảo hiểm tử kỳ	1	2	26	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3900000	2
2842	Bảo hiểm tử kỳ	1	2	27	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4000000	2
2843	Bảo hiểm tử kỳ	1	2	28	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4300000	2
2844	Bảo hiểm tử kỳ	1	2	29	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4700000	2
2845	Bảo hiểm tử kỳ	1	2	30	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	5170000	2
2846	Bảo hiểm tử kỳ	1	2	31	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	6000000	2
2847	Bảo hiểm tử kỳ	1	2	32	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	7000000	2
2848	Bảo hiểm tử kỳ	1	2	33	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	8000000	2
2849	Bảo hiểm tử kỳ	1	2	34	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	9000000	2
2850	Bảo hiểm tử kỳ	1	2	35	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	10000000	2
2851	Bảo hiểm tử kỳ	1	2	36	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	11000000	2
2852	Bảo hiểm tử kỳ	1	2	37	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	11500000	2
2853	Bảo hiểm tử kỳ	1	2	38	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	12500000	2
2854	Bảo hiểm tử kỳ	1	2	39	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	13500000	2
2855	Bảo hiểm tử kỳ	1	2	40	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	14100000	2
2856	Bảo hiểm tử kỳ	1	2	41	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	15300000	2
2857	Bảo hiểm tử kỳ	1	2	42	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	16600000	2
2858	Bảo hiểm tử kỳ	1	2	43	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	17900000	2
2859	Bảo hiểm tử kỳ	1	2	44	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	19400000	2
2860	Bảo hiểm tử kỳ	1	2	45	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	21000000	2
2861	Bảo hiểm tử kỳ	1	2	46	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	22700000	2
2862	Bảo hiểm tử kỳ	1	2	47	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	24400000	2
2863	Bảo hiểm tử kỳ	1	2	48	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	26100000	2
2864	Bảo hiểm tử kỳ	1	2	49	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	28900000	2
2865	Bảo hiểm tử kỳ	1	2	50	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	30700000	2
2866	Bảo hiểm tử kỳ	1	2	51	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	33700000	2
2867	Bảo hiểm tử kỳ	1	2	52	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	36300000	2
2868	Bảo hiểm tử kỳ	1	2	53	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	38500000	2
2869	Bảo hiểm tử kỳ	1	2	54	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	41300000	2
2870	Bảo hiểm tử kỳ	1	2	55	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	44200000	2
2871	Bảo hiểm tử kỳ	1	2	56	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	48000000	2
2872	Bảo hiểm tử kỳ	1	2	57	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	50600000	2
2873	Bảo hiểm tử kỳ	1	2	58	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	54200000	2
2874	Bảo hiểm tử kỳ	1	2	59	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	58300000	2
2875	Bảo hiểm tử kỳ	1	2	60	10	10	2	Hoàn lại phí đóng	1	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	60000000	2
2876	Bảo hiểm tử kỳ	1	2	6	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	500000	2
2877	Bảo hiểm tử kỳ	1	2	7	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	500000	2
2878	Bảo hiểm tử kỳ	1	2	8	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	510000	2
2879	Bảo hiểm tử kỳ	1	2	9	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	510000	2
2880	Bảo hiểm tử kỳ	1	2	10	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	526000	2
2881	Bảo hiểm tử kỳ	1	2	11	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	530000	2
2882	Bảo hiểm tử kỳ	1	2	12	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	530000	2
2883	Bảo hiểm tử kỳ	1	2	13	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	540000	2
2884	Bảo hiểm tử kỳ	1	2	14	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	550000	2
2885	Bảo hiểm tử kỳ	1	2	15	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	560000	2
2886	Bảo hiểm tử kỳ	1	2	16	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	570000	2
2887	Bảo hiểm tử kỳ	1	2	17	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	580000	2
2888	Bảo hiểm tử kỳ	1	2	18	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	590000	2
2889	Bảo hiểm tử kỳ	1	2	19	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	610000	2
2890	Bảo hiểm tử kỳ	1	2	20	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	640000	2
2891	Bảo hiểm tử kỳ	1	2	21	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	660000	2
2892	Bảo hiểm tử kỳ	1	2	22	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	680000	2
2893	Bảo hiểm tử kỳ	1	2	23	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	700000	2
2894	Bảo hiểm tử kỳ	1	2	24	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	720000	2
2895	Bảo hiểm tử kỳ	1	2	25	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	760000	2
2896	Bảo hiểm tử kỳ	1	2	26	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	780000	2
2897	Bảo hiểm tử kỳ	1	2	27	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	800000	2
2898	Bảo hiểm tử kỳ	1	2	28	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	860000	2
2899	Bảo hiểm tử kỳ	1	2	29	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	940000	2
2900	Bảo hiểm tử kỳ	1	2	30	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1034000	2
2901	Bảo hiểm tử kỳ	1	2	31	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1200000	2
2902	Bảo hiểm tử kỳ	1	2	32	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1400000	2
2903	Bảo hiểm tử kỳ	1	2	33	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1600000	2
2904	Bảo hiểm tử kỳ	1	2	34	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1800000	2
2905	Bảo hiểm tử kỳ	1	2	35	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2000000	2
2906	Bảo hiểm tử kỳ	1	2	36	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2200000	2
2907	Bảo hiểm tử kỳ	1	2	37	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2300000	2
2908	Bảo hiểm tử kỳ	1	2	38	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2500000	2
2909	Bảo hiểm tử kỳ	1	2	39	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2700000	2
2910	Bảo hiểm tử kỳ	1	2	40	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2820000	2
2911	Bảo hiểm tử kỳ	1	2	41	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3060000	2
2912	Bảo hiểm tử kỳ	1	2	42	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3320000	2
2913	Bảo hiểm tử kỳ	1	2	43	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3580000	2
2914	Bảo hiểm tử kỳ	1	2	44	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3880000	2
2915	Bảo hiểm tử kỳ	1	2	45	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4200000	2
2916	Bảo hiểm tử kỳ	1	2	46	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4540000	2
2917	Bảo hiểm tử kỳ	1	2	47	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4880000	2
2918	Bảo hiểm tử kỳ	1	2	48	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5220000	2
2919	Bảo hiểm tử kỳ	1	2	49	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5780000	2
2920	Bảo hiểm tử kỳ	1	2	50	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6140000	2
2921	Bảo hiểm tử kỳ	1	2	51	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6740000	2
2922	Bảo hiểm tử kỳ	1	2	52	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7260000	2
2923	Bảo hiểm tử kỳ	1	2	53	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7700000	2
2924	Bảo hiểm tử kỳ	1	2	54	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	8260000	2
2925	Bảo hiểm tử kỳ	1	2	55	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	8840000	2
2926	Bảo hiểm tử kỳ	1	2	56	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	9600000	2
2927	Bảo hiểm tử kỳ	1	2	57	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	10120000	2
2928	Bảo hiểm tử kỳ	1	2	58	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	10840000	2
2929	Bảo hiểm tử kỳ	1	2	59	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	11660000	2
2930	Bảo hiểm tử kỳ	1	2	60	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	12000000	2
2931	Bảo hiểm tử kỳ	1	2	6	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	750000	2
2932	Bảo hiểm tử kỳ	1	2	7	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	750000	2
2933	Bảo hiểm tử kỳ	1	2	8	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	765000	2
2934	Bảo hiểm tử kỳ	1	2	9	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	765000	2
2935	Bảo hiểm tử kỳ	1	2	10	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	789000	2
2936	Bảo hiểm tử kỳ	1	2	11	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	795000	2
2937	Bảo hiểm tử kỳ	1	2	12	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	795000	2
2938	Bảo hiểm tử kỳ	1	2	13	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	810000	2
2939	Bảo hiểm tử kỳ	1	2	14	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	825000	2
2940	Bảo hiểm tử kỳ	1	2	15	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	840000	2
2941	Bảo hiểm tử kỳ	1	2	16	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	855000	2
2942	Bảo hiểm tử kỳ	1	2	17	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	870000	2
2943	Bảo hiểm tử kỳ	1	2	18	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	885000	2
2944	Bảo hiểm tử kỳ	1	2	19	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	915000	2
2945	Bảo hiểm tử kỳ	1	2	20	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	960000	2
2946	Bảo hiểm tử kỳ	1	2	21	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	990000	2
2947	Bảo hiểm tử kỳ	1	2	22	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1020000	2
2948	Bảo hiểm tử kỳ	1	2	23	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1050000	2
2949	Bảo hiểm tử kỳ	1	2	24	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1080000	2
2950	Bảo hiểm tử kỳ	1	2	25	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1140000	2
2951	Bảo hiểm tử kỳ	1	2	26	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1170000	2
2952	Bảo hiểm tử kỳ	1	2	27	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1200000	2
2953	Bảo hiểm tử kỳ	1	2	28	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1290000	2
2954	Bảo hiểm tử kỳ	1	2	29	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1410000	2
2955	Bảo hiểm tử kỳ	1	2	30	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1551000	2
2956	Bảo hiểm tử kỳ	1	2	31	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1800000	2
2957	Bảo hiểm tử kỳ	1	2	32	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2100000	2
2958	Bảo hiểm tử kỳ	1	2	33	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2400000	2
2959	Bảo hiểm tử kỳ	1	2	34	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2700000	2
2960	Bảo hiểm tử kỳ	1	2	35	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3000000	2
2961	Bảo hiểm tử kỳ	1	2	36	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3300000	2
2962	Bảo hiểm tử kỳ	1	2	37	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3450000	2
2963	Bảo hiểm tử kỳ	1	2	38	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3750000	2
2964	Bảo hiểm tử kỳ	1	2	39	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4050000	2
2965	Bảo hiểm tử kỳ	1	2	40	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4230000	2
2966	Bảo hiểm tử kỳ	1	2	41	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4590000	2
2967	Bảo hiểm tử kỳ	1	2	42	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4980000	2
2968	Bảo hiểm tử kỳ	1	2	43	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5370000	2
2969	Bảo hiểm tử kỳ	1	2	44	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5820000	2
2970	Bảo hiểm tử kỳ	1	2	45	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6300000	2
2971	Bảo hiểm tử kỳ	1	2	46	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6810000	2
2972	Bảo hiểm tử kỳ	1	2	47	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7320000	2
2973	Bảo hiểm tử kỳ	1	2	48	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7830000	2
2974	Bảo hiểm tử kỳ	1	2	49	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	8670000	2
2975	Bảo hiểm tử kỳ	1	2	50	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	9210000	2
2976	Bảo hiểm tử kỳ	1	2	51	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	10110000	2
2977	Bảo hiểm tử kỳ	1	2	52	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	10890000	2
2978	Bảo hiểm tử kỳ	1	2	53	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11550000	2
2979	Bảo hiểm tử kỳ	1	2	54	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	12390000	2
2980	Bảo hiểm tử kỳ	1	2	55	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	13260000	2
2981	Bảo hiểm tử kỳ	1	2	56	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	14400000	2
2982	Bảo hiểm tử kỳ	1	2	57	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	15180000	2
2983	Bảo hiểm tử kỳ	1	2	58	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	16260000	2
2984	Bảo hiểm tử kỳ	1	2	59	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	17490000	2
2985	Bảo hiểm tử kỳ	1	2	60	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	18000000	2
2986	Bảo hiểm tử kỳ	1	2	6	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1250000	2
2987	Bảo hiểm tử kỳ	1	2	7	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1250000	2
2988	Bảo hiểm tử kỳ	1	2	8	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1275000	2
2989	Bảo hiểm tử kỳ	1	2	9	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1275000	2
2990	Bảo hiểm tử kỳ	1	2	10	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1315000	2
2991	Bảo hiểm tử kỳ	1	2	11	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1325000	2
2992	Bảo hiểm tử kỳ	1	2	12	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1325000	2
2993	Bảo hiểm tử kỳ	1	2	13	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1350000	2
2994	Bảo hiểm tử kỳ	1	2	14	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1375000	2
2995	Bảo hiểm tử kỳ	1	2	15	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1400000	2
2996	Bảo hiểm tử kỳ	1	2	16	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1425000	2
2997	Bảo hiểm tử kỳ	1	2	17	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1450000	2
2998	Bảo hiểm tử kỳ	1	2	18	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1475000	2
2999	Bảo hiểm tử kỳ	1	2	19	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1525000	2
3000	Bảo hiểm tử kỳ	1	2	20	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1600000	2
3001	Bảo hiểm tử kỳ	1	2	21	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1650000	2
3002	Bảo hiểm tử kỳ	1	2	22	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1700000	2
3003	Bảo hiểm tử kỳ	1	2	23	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1750000	2
3004	Bảo hiểm tử kỳ	1	2	24	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1800000	2
3005	Bảo hiểm tử kỳ	1	2	25	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1900000	2
3006	Bảo hiểm tử kỳ	1	2	26	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1950000	2
3007	Bảo hiểm tử kỳ	1	2	27	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2000000	2
3008	Bảo hiểm tử kỳ	1	2	28	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2150000	2
3009	Bảo hiểm tử kỳ	1	2	29	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2350000	2
3010	Bảo hiểm tử kỳ	1	2	30	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2585000	2
3011	Bảo hiểm tử kỳ	1	2	31	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3000000	2
3012	Bảo hiểm tử kỳ	1	2	32	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3500000	2
3013	Bảo hiểm tử kỳ	1	2	33	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4000000	2
3014	Bảo hiểm tử kỳ	1	2	34	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4500000	2
3015	Bảo hiểm tử kỳ	1	2	35	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5000000	2
3016	Bảo hiểm tử kỳ	1	2	36	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5500000	2
3017	Bảo hiểm tử kỳ	1	2	37	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5750000	2
3018	Bảo hiểm tử kỳ	1	2	38	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	6250000	2
3019	Bảo hiểm tử kỳ	1	2	39	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	6750000	2
3020	Bảo hiểm tử kỳ	1	2	40	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	7050000	2
3021	Bảo hiểm tử kỳ	1	2	41	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	7650000	2
3022	Bảo hiểm tử kỳ	1	2	42	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	8300000	2
3023	Bảo hiểm tử kỳ	1	2	43	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	8950000	2
3024	Bảo hiểm tử kỳ	1	2	44	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	9700000	2
3025	Bảo hiểm tử kỳ	1	2	45	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	10500000	2
3026	Bảo hiểm tử kỳ	1	2	46	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	11350000	2
3027	Bảo hiểm tử kỳ	1	2	47	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	12200000	2
3028	Bảo hiểm tử kỳ	1	2	48	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	13050000	2
3029	Bảo hiểm tử kỳ	1	2	49	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	14450000	2
3030	Bảo hiểm tử kỳ	1	2	50	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	15350000	2
3031	Bảo hiểm tử kỳ	1	2	51	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	16850000	2
3032	Bảo hiểm tử kỳ	1	2	52	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	18150000	2
3033	Bảo hiểm tử kỳ	1	2	53	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	19250000	2
3034	Bảo hiểm tử kỳ	1	2	54	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	20650000	2
3035	Bảo hiểm tử kỳ	1	2	55	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	22100000	2
3036	Bảo hiểm tử kỳ	1	2	56	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	24000000	2
3037	Bảo hiểm tử kỳ	1	2	57	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	25300000	2
3038	Bảo hiểm tử kỳ	1	2	58	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	27100000	2
3039	Bảo hiểm tử kỳ	1	2	59	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	29150000	2
3040	Bảo hiểm tử kỳ	1	2	60	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	30000000	2
3041	Bảo hiểm tử kỳ	1	2	6	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2500000	2
3042	Bảo hiểm tử kỳ	1	2	7	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2500000	2
3043	Bảo hiểm tử kỳ	1	2	8	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2550000	2
3044	Bảo hiểm tử kỳ	1	2	9	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2550000	2
3045	Bảo hiểm tử kỳ	1	2	10	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2630000	2
3046	Bảo hiểm tử kỳ	1	2	11	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2650000	2
3047	Bảo hiểm tử kỳ	1	2	12	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2650000	2
3048	Bảo hiểm tử kỳ	1	2	13	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2700000	2
3049	Bảo hiểm tử kỳ	1	2	14	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2750000	2
3050	Bảo hiểm tử kỳ	1	2	15	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2800000	2
3051	Bảo hiểm tử kỳ	1	2	16	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2850000	2
3052	Bảo hiểm tử kỳ	1	2	17	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2900000	2
3053	Bảo hiểm tử kỳ	1	2	18	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2950000	2
3054	Bảo hiểm tử kỳ	1	2	19	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3050000	2
3055	Bảo hiểm tử kỳ	1	2	20	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3200000	2
3056	Bảo hiểm tử kỳ	1	2	21	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3300000	2
3057	Bảo hiểm tử kỳ	1	2	22	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3400000	2
3058	Bảo hiểm tử kỳ	1	2	23	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3500000	2
3059	Bảo hiểm tử kỳ	1	2	24	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3600000	2
3060	Bảo hiểm tử kỳ	1	2	25	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3800000	2
3061	Bảo hiểm tử kỳ	1	2	26	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3900000	2
3062	Bảo hiểm tử kỳ	1	2	27	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4000000	2
3063	Bảo hiểm tử kỳ	1	2	28	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4300000	2
3064	Bảo hiểm tử kỳ	1	2	29	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4700000	2
3065	Bảo hiểm tử kỳ	1	2	30	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	5170000	2
3066	Bảo hiểm tử kỳ	1	2	31	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	6000000	2
3067	Bảo hiểm tử kỳ	1	2	32	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	7000000	2
3068	Bảo hiểm tử kỳ	1	2	33	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	8000000	2
3069	Bảo hiểm tử kỳ	1	2	34	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	9000000	2
3070	Bảo hiểm tử kỳ	1	2	35	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	10000000	2
3071	Bảo hiểm tử kỳ	1	2	36	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	11000000	2
3072	Bảo hiểm tử kỳ	1	2	37	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	11500000	2
3073	Bảo hiểm tử kỳ	1	2	38	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	12500000	2
3074	Bảo hiểm tử kỳ	1	2	39	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	13500000	2
3075	Bảo hiểm tử kỳ	1	2	40	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	14100000	2
3076	Bảo hiểm tử kỳ	1	2	41	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	15300000	2
3077	Bảo hiểm tử kỳ	1	2	42	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	16600000	2
3078	Bảo hiểm tử kỳ	1	2	43	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	17900000	2
3079	Bảo hiểm tử kỳ	1	2	44	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	19400000	2
3080	Bảo hiểm tử kỳ	1	2	45	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	21000000	2
3081	Bảo hiểm tử kỳ	1	2	46	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	22700000	2
3082	Bảo hiểm tử kỳ	1	2	47	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	24400000	2
3083	Bảo hiểm tử kỳ	1	2	48	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	26100000	2
3084	Bảo hiểm tử kỳ	1	2	49	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	28900000	2
3085	Bảo hiểm tử kỳ	1	2	50	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	30700000	2
3086	Bảo hiểm tử kỳ	1	2	51	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	33700000	2
3087	Bảo hiểm tử kỳ	1	2	52	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	36300000	2
3088	Bảo hiểm tử kỳ	1	2	53	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	38500000	2
3089	Bảo hiểm tử kỳ	1	2	54	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	41300000	2
3090	Bảo hiểm tử kỳ	1	2	55	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	44200000	2
3091	Bảo hiểm tử kỳ	1	2	56	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	48000000	2
3092	Bảo hiểm tử kỳ	1	2	57	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	50600000	2
3093	Bảo hiểm tử kỳ	1	2	58	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	54200000	2
3094	Bảo hiểm tử kỳ	1	2	59	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	58300000	2
3095	Bảo hiểm tử kỳ	1	2	60	10	10	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	60000000	2
3096	Bảo hiểm tử kỳ	1	2	6	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	500000	2
3097	Bảo hiểm tử kỳ	1	2	7	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	500000	2
3098	Bảo hiểm tử kỳ	1	2	8	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	510000	2
3099	Bảo hiểm tử kỳ	1	2	9	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	510000	2
3100	Bảo hiểm tử kỳ	1	2	10	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	526000	2
3101	Bảo hiểm tử kỳ	1	2	11	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	530000	2
3102	Bảo hiểm tử kỳ	1	2	12	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	540000	2
3103	Bảo hiểm tử kỳ	1	2	13	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	550000	2
3104	Bảo hiểm tử kỳ	1	2	14	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	560000	2
3105	Bảo hiểm tử kỳ	1	2	15	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	580000	2
3106	Bảo hiểm tử kỳ	1	2	16	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	580000	2
3107	Bảo hiểm tử kỳ	1	2	17	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	600000	2
3108	Bảo hiểm tử kỳ	1	2	18	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	610000	2
3109	Bảo hiểm tử kỳ	1	2	19	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	620000	2
3110	Bảo hiểm tử kỳ	1	2	20	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	640000	2
3111	Bảo hiểm tử kỳ	1	2	21	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	680000	2
3112	Bảo hiểm tử kỳ	1	2	22	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	700000	2
3113	Bảo hiểm tử kỳ	1	2	23	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	740000	2
3114	Bảo hiểm tử kỳ	1	2	24	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	780000	2
3115	Bảo hiểm tử kỳ	1	2	25	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	820000	2
3116	Bảo hiểm tử kỳ	1	2	26	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	880000	2
3117	Bảo hiểm tử kỳ	1	2	27	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	960000	2
3118	Bảo hiểm tử kỳ	1	2	28	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1100000	2
3119	Bảo hiểm tử kỳ	1	2	29	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1200000	2
3120	Bảo hiểm tử kỳ	1	2	30	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1280000	2
3121	Bảo hiểm tử kỳ	1	2	31	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1400000	2
3122	Bảo hiểm tử kỳ	1	2	32	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1600000	2
3123	Bảo hiểm tử kỳ	1	2	33	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1800000	2
3124	Bảo hiểm tử kỳ	1	2	34	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2000000	2
3125	Bảo hiểm tử kỳ	1	2	35	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2200000	2
3126	Bảo hiểm tử kỳ	1	2	36	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2400000	2
3127	Bảo hiểm tử kỳ	1	2	37	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2600000	2
3128	Bảo hiểm tử kỳ	1	2	38	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2800000	2
3129	Bảo hiểm tử kỳ	1	2	39	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3000000	2
3130	Bảo hiểm tử kỳ	1	2	40	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3240000	2
3131	Bảo hiểm tử kỳ	1	2	41	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3520000	2
3132	Bảo hiểm tử kỳ	1	2	42	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3820000	2
3133	Bảo hiểm tử kỳ	1	2	43	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4120000	2
3134	Bảo hiểm tử kỳ	1	2	44	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4440000	2
3135	Bảo hiểm tử kỳ	1	2	45	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4780000	2
3136	Bảo hiểm tử kỳ	1	2	46	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5260000	2
3137	Bảo hiểm tử kỳ	1	2	47	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5640000	2
3138	Bảo hiểm tử kỳ	1	2	48	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6040000	2
3139	Bảo hiểm tử kỳ	1	2	49	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6480000	2
3140	Bảo hiểm tử kỳ	1	2	50	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6900000	2
3141	Bảo hiểm tử kỳ	1	2	51	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7840000	2
3142	Bảo hiểm tử kỳ	1	2	52	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7960000	2
3143	Bảo hiểm tử kỳ	1	2	53	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	8520000	2
3144	Bảo hiểm tử kỳ	1	2	54	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	9120000	2
3145	Bảo hiểm tử kỳ	1	2	55	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	9700000	2
3146	Bảo hiểm tử kỳ	1	2	6	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	750000	2
3147	Bảo hiểm tử kỳ	1	2	7	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	750000	2
3148	Bảo hiểm tử kỳ	1	2	8	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	765000	2
3149	Bảo hiểm tử kỳ	1	2	9	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	765000	2
3150	Bảo hiểm tử kỳ	1	2	10	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	789000	2
3151	Bảo hiểm tử kỳ	1	2	11	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	795000	2
3152	Bảo hiểm tử kỳ	1	2	12	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	810000	2
3153	Bảo hiểm tử kỳ	1	2	13	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	825000	2
3154	Bảo hiểm tử kỳ	1	2	14	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	840000	2
3155	Bảo hiểm tử kỳ	1	2	15	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	870000	2
3156	Bảo hiểm tử kỳ	1	2	16	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	870000	2
3157	Bảo hiểm tử kỳ	1	2	17	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	900000	2
3158	Bảo hiểm tử kỳ	1	2	18	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	915000	2
3159	Bảo hiểm tử kỳ	1	2	19	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	930000	2
3160	Bảo hiểm tử kỳ	1	2	20	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	960000	2
3161	Bảo hiểm tử kỳ	1	2	21	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1020000	2
3162	Bảo hiểm tử kỳ	1	2	22	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1050000	2
3163	Bảo hiểm tử kỳ	1	2	23	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1110000	2
3164	Bảo hiểm tử kỳ	1	2	24	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1170000	2
3165	Bảo hiểm tử kỳ	1	2	25	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1230000	2
3166	Bảo hiểm tử kỳ	1	2	26	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1320000	2
3167	Bảo hiểm tử kỳ	1	2	27	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1440000	2
3168	Bảo hiểm tử kỳ	1	2	28	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1650000	2
3169	Bảo hiểm tử kỳ	1	2	29	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1800000	2
3170	Bảo hiểm tử kỳ	1	2	30	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1920000	2
3171	Bảo hiểm tử kỳ	1	2	31	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2100000	2
3172	Bảo hiểm tử kỳ	1	2	32	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2400000	2
3173	Bảo hiểm tử kỳ	1	2	33	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2700000	2
3174	Bảo hiểm tử kỳ	1	2	34	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3000000	2
3175	Bảo hiểm tử kỳ	1	2	35	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3300000	2
3176	Bảo hiểm tử kỳ	1	2	36	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3600000	2
3177	Bảo hiểm tử kỳ	1	2	37	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3900000	2
3178	Bảo hiểm tử kỳ	1	2	38	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4200000	2
3179	Bảo hiểm tử kỳ	1	2	39	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4500000	2
3180	Bảo hiểm tử kỳ	1	2	40	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4860000	2
3181	Bảo hiểm tử kỳ	1	2	41	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5280000	2
3182	Bảo hiểm tử kỳ	1	2	42	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5730000	2
3183	Bảo hiểm tử kỳ	1	2	43	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6180000	2
3184	Bảo hiểm tử kỳ	1	2	44	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6660000	2
3185	Bảo hiểm tử kỳ	1	2	45	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7170000	2
3186	Bảo hiểm tử kỳ	1	2	46	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7890000	2
3187	Bảo hiểm tử kỳ	1	2	47	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	8460000	2
3188	Bảo hiểm tử kỳ	1	2	48	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	9060000	2
3189	Bảo hiểm tử kỳ	1	2	49	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	9720000	2
3190	Bảo hiểm tử kỳ	1	2	50	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	10350000	2
3191	Bảo hiểm tử kỳ	1	2	51	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11760000	2
3192	Bảo hiểm tử kỳ	1	2	52	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11940000	2
3193	Bảo hiểm tử kỳ	1	2	53	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	12780000	2
3194	Bảo hiểm tử kỳ	1	2	54	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	13680000	2
3195	Bảo hiểm tử kỳ	1	2	55	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	14550000	2
3196	Bảo hiểm tử kỳ	1	2	6	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1250000	2
3197	Bảo hiểm tử kỳ	1	2	7	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1250000	2
3198	Bảo hiểm tử kỳ	1	2	8	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1275000	2
3199	Bảo hiểm tử kỳ	1	2	9	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1275000	2
3200	Bảo hiểm tử kỳ	1	2	10	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1315000	2
3201	Bảo hiểm tử kỳ	1	2	11	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1325000	2
3202	Bảo hiểm tử kỳ	1	2	12	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1350000	2
3203	Bảo hiểm tử kỳ	1	2	13	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1375000	2
3204	Bảo hiểm tử kỳ	1	2	14	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1400000	2
3205	Bảo hiểm tử kỳ	1	2	15	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1450000	2
3206	Bảo hiểm tử kỳ	1	2	16	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1450000	2
3207	Bảo hiểm tử kỳ	1	2	17	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1500000	2
3208	Bảo hiểm tử kỳ	1	2	18	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1525000	2
3209	Bảo hiểm tử kỳ	1	2	19	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1550000	2
3210	Bảo hiểm tử kỳ	1	2	20	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1600000	2
3211	Bảo hiểm tử kỳ	1	2	21	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1700000	2
3212	Bảo hiểm tử kỳ	1	2	22	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1750000	2
3213	Bảo hiểm tử kỳ	1	2	23	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1850000	2
3214	Bảo hiểm tử kỳ	1	2	24	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1950000	2
3215	Bảo hiểm tử kỳ	1	2	25	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2050000	2
3216	Bảo hiểm tử kỳ	1	2	26	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2200000	2
3217	Bảo hiểm tử kỳ	1	2	27	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2400000	2
3218	Bảo hiểm tử kỳ	1	2	28	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2750000	2
3219	Bảo hiểm tử kỳ	1	2	29	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3000000	2
3220	Bảo hiểm tử kỳ	1	2	30	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3200000	2
3221	Bảo hiểm tử kỳ	1	2	31	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3500000	2
3222	Bảo hiểm tử kỳ	1	2	32	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4000000	2
3223	Bảo hiểm tử kỳ	1	2	33	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4500000	2
3224	Bảo hiểm tử kỳ	1	2	34	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5000000	2
3225	Bảo hiểm tử kỳ	1	2	35	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5500000	2
3226	Bảo hiểm tử kỳ	1	2	36	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	6000000	2
3227	Bảo hiểm tử kỳ	1	2	37	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	6500000	2
3228	Bảo hiểm tử kỳ	1	2	38	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	7000000	2
3229	Bảo hiểm tử kỳ	1	2	39	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	7500000	2
3230	Bảo hiểm tử kỳ	1	2	40	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	8100000	2
3231	Bảo hiểm tử kỳ	1	2	41	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	8800000	2
3232	Bảo hiểm tử kỳ	1	2	42	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	9550000	2
3233	Bảo hiểm tử kỳ	1	2	43	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	10300000	2
3234	Bảo hiểm tử kỳ	1	2	44	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	11100000	2
3235	Bảo hiểm tử kỳ	1	2	45	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	11950000	2
3236	Bảo hiểm tử kỳ	1	2	46	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	13150000	2
3237	Bảo hiểm tử kỳ	1	2	47	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	14100000	2
3238	Bảo hiểm tử kỳ	1	2	48	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	15100000	2
3239	Bảo hiểm tử kỳ	1	2	49	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	16200000	2
3240	Bảo hiểm tử kỳ	1	2	50	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	17250000	2
3241	Bảo hiểm tử kỳ	1	2	51	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	19600000	2
3242	Bảo hiểm tử kỳ	1	2	52	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	19900000	2
3243	Bảo hiểm tử kỳ	1	2	53	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	21300000	2
3244	Bảo hiểm tử kỳ	1	2	54	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	22800000	2
3245	Bảo hiểm tử kỳ	1	2	55	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	24250000	2
3246	Bảo hiểm tử kỳ	1	2	6	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2500000	2
3247	Bảo hiểm tử kỳ	1	2	7	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2500000	2
3248	Bảo hiểm tử kỳ	1	2	8	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2550000	2
3249	Bảo hiểm tử kỳ	1	2	9	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2550000	2
3250	Bảo hiểm tử kỳ	1	2	10	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2630000	2
3251	Bảo hiểm tử kỳ	1	2	11	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2650000	2
3252	Bảo hiểm tử kỳ	1	2	12	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2700000	2
3253	Bảo hiểm tử kỳ	1	2	13	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2750000	2
3254	Bảo hiểm tử kỳ	1	2	14	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2800000	2
3255	Bảo hiểm tử kỳ	1	2	15	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2900000	2
3256	Bảo hiểm tử kỳ	1	2	16	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2900000	2
3257	Bảo hiểm tử kỳ	1	2	17	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3000000	2
3258	Bảo hiểm tử kỳ	1	2	18	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3050000	2
3259	Bảo hiểm tử kỳ	1	2	19	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3100000	2
3260	Bảo hiểm tử kỳ	1	2	20	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3200000	2
3261	Bảo hiểm tử kỳ	1	2	21	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3400000	2
3262	Bảo hiểm tử kỳ	1	2	22	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3500000	2
3263	Bảo hiểm tử kỳ	1	2	23	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3700000	2
3264	Bảo hiểm tử kỳ	1	2	24	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3900000	2
3265	Bảo hiểm tử kỳ	1	2	25	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4100000	2
3266	Bảo hiểm tử kỳ	1	2	26	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4400000	2
3267	Bảo hiểm tử kỳ	1	2	27	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4800000	2
3268	Bảo hiểm tử kỳ	1	2	28	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	5500000	2
3269	Bảo hiểm tử kỳ	1	2	29	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	6000000	2
3270	Bảo hiểm tử kỳ	1	2	30	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	6400000	2
3271	Bảo hiểm tử kỳ	1	2	31	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	7000000	2
3272	Bảo hiểm tử kỳ	1	2	32	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	8000000	2
3273	Bảo hiểm tử kỳ	1	2	33	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	9000000	2
3274	Bảo hiểm tử kỳ	1	2	34	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	10000000	2
3275	Bảo hiểm tử kỳ	1	2	35	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	11000000	2
3276	Bảo hiểm tử kỳ	1	2	36	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	12000000	2
3277	Bảo hiểm tử kỳ	1	2	37	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	13000000	2
3278	Bảo hiểm tử kỳ	1	2	38	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	14000000	2
3279	Bảo hiểm tử kỳ	1	2	39	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	15000000	2
3280	Bảo hiểm tử kỳ	1	2	40	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	16200000	2
3281	Bảo hiểm tử kỳ	1	2	41	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	17600000	2
3282	Bảo hiểm tử kỳ	1	2	42	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	19100000	2
3283	Bảo hiểm tử kỳ	1	2	43	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	20600000	2
3284	Bảo hiểm tử kỳ	1	2	44	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	22200000	2
3285	Bảo hiểm tử kỳ	1	2	45	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	23900000	2
3286	Bảo hiểm tử kỳ	1	2	46	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	26300000	2
3287	Bảo hiểm tử kỳ	1	2	47	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	28200000	2
3288	Bảo hiểm tử kỳ	1	2	48	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	30200000	2
3289	Bảo hiểm tử kỳ	1	2	49	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	32400000	2
3290	Bảo hiểm tử kỳ	1	2	50	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	34500000	2
3291	Bảo hiểm tử kỳ	1	2	51	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	39200000	2
3292	Bảo hiểm tử kỳ	1	2	52	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	39800000	2
3293	Bảo hiểm tử kỳ	1	2	53	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	42600000	2
3294	Bảo hiểm tử kỳ	1	2	54	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	45600000	2
3295	Bảo hiểm tử kỳ	1	2	55	15	15	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	48500000	2
3296	Bảo hiểm tử kỳ	1	2	6	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	520000	2
3297	Bảo hiểm tử kỳ	1	2	7	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	520000	2
3298	Bảo hiểm tử kỳ	1	2	8	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	520000	2
3299	Bảo hiểm tử kỳ	1	2	9	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	530000	2
3300	Bảo hiểm tử kỳ	1	2	10	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	540000	2
3301	Bảo hiểm tử kỳ	1	2	11	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	550000	2
3302	Bảo hiểm tử kỳ	1	2	12	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	560000	2
3303	Bảo hiểm tử kỳ	1	2	13	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	560000	2
3304	Bảo hiểm tử kỳ	1	2	14	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	580000	2
3305	Bảo hiểm tử kỳ	1	2	15	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	600000	2
3306	Bảo hiểm tử kỳ	1	2	16	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	600000	2
3307	Bảo hiểm tử kỳ	1	2	17	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	630000	2
3308	Bảo hiểm tử kỳ	1	2	18	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	650000	2
3309	Bảo hiểm tử kỳ	1	2	19	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	680000	2
3310	Bảo hiểm tử kỳ	1	2	20	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	720000	2
3311	Bảo hiểm tử kỳ	1	2	21	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	760000	2
3312	Bảo hiểm tử kỳ	1	2	22	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	800000	2
3313	Bảo hiểm tử kỳ	1	2	23	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	840000	2
3314	Bảo hiểm tử kỳ	1	2	24	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	900000	2
3315	Bảo hiểm tử kỳ	1	2	25	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1000000	2
3316	Bảo hiểm tử kỳ	1	2	26	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1100000	2
3317	Bảo hiểm tử kỳ	1	2	27	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1200000	2
3318	Bảo hiểm tử kỳ	1	2	28	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1300000	2
3319	Bảo hiểm tử kỳ	1	2	29	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1400000	2
3320	Bảo hiểm tử kỳ	1	2	30	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1600000	2
3321	Bảo hiểm tử kỳ	1	2	31	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1800000	2
3322	Bảo hiểm tử kỳ	1	2	32	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2000000	2
3323	Bảo hiểm tử kỳ	1	2	33	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2200000	2
3324	Bảo hiểm tử kỳ	1	2	34	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2400000	2
3325	Bảo hiểm tử kỳ	1	2	35	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2600000	2
3326	Bảo hiểm tử kỳ	1	2	36	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2800000	2
3327	Bảo hiểm tử kỳ	1	2	37	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3000000	2
3328	Bảo hiểm tử kỳ	1	2	38	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3300000	2
3329	Bảo hiểm tử kỳ	1	2	39	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3600000	2
3330	Bảo hiểm tử kỳ	1	2	40	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3860000	2
3331	Bảo hiểm tử kỳ	1	2	41	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4240000	2
3332	Bảo hiểm tử kỳ	1	2	42	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4560000	2
3333	Bảo hiểm tử kỳ	1	2	43	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4900000	2
3334	Bảo hiểm tử kỳ	1	2	44	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5280000	2
3335	Bảo hiểm tử kỳ	1	2	45	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5660000	2
3336	Bảo hiểm tử kỳ	1	2	46	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6060000	2
3337	Bảo hiểm tử kỳ	1	2	47	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6500000	2
3338	Bảo hiểm tử kỳ	1	2	48	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6960000	2
3339	Bảo hiểm tử kỳ	1	2	49	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7460000	2
3340	Bảo hiểm tử kỳ	1	2	50	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	8000000	2
3341	Bảo hiểm tử kỳ	1	2	6	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	780000	2
3342	Bảo hiểm tử kỳ	1	2	7	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	780000	2
3343	Bảo hiểm tử kỳ	1	2	8	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	780000	2
3344	Bảo hiểm tử kỳ	1	2	9	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	795000	2
3345	Bảo hiểm tử kỳ	1	2	10	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	810000	2
3346	Bảo hiểm tử kỳ	1	2	11	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	825000	2
3347	Bảo hiểm tử kỳ	1	2	12	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	840000	2
3348	Bảo hiểm tử kỳ	1	2	13	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	840000	2
3349	Bảo hiểm tử kỳ	1	2	14	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	870000	2
3350	Bảo hiểm tử kỳ	1	2	15	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	900000	2
3351	Bảo hiểm tử kỳ	1	2	16	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	900000	2
3352	Bảo hiểm tử kỳ	1	2	17	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	945000	2
3353	Bảo hiểm tử kỳ	1	2	18	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	975000	2
3354	Bảo hiểm tử kỳ	1	2	19	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1020000	2
3355	Bảo hiểm tử kỳ	1	2	20	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1080000	2
3356	Bảo hiểm tử kỳ	1	2	21	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1140000	2
3357	Bảo hiểm tử kỳ	1	2	22	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1200000	2
3358	Bảo hiểm tử kỳ	1	2	23	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1260000	2
3359	Bảo hiểm tử kỳ	1	2	24	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1350000	2
3360	Bảo hiểm tử kỳ	1	2	25	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1500000	2
3361	Bảo hiểm tử kỳ	1	2	26	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1650000	2
3362	Bảo hiểm tử kỳ	1	2	27	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1800000	2
3363	Bảo hiểm tử kỳ	1	2	28	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1950000	2
3364	Bảo hiểm tử kỳ	1	2	29	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2100000	2
3365	Bảo hiểm tử kỳ	1	2	30	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2400000	2
3366	Bảo hiểm tử kỳ	1	2	31	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2700000	2
3367	Bảo hiểm tử kỳ	1	2	32	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3000000	2
3368	Bảo hiểm tử kỳ	1	2	33	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3300000	2
3369	Bảo hiểm tử kỳ	1	2	34	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3600000	2
3370	Bảo hiểm tử kỳ	1	2	35	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3900000	2
3371	Bảo hiểm tử kỳ	1	2	36	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4200000	2
3372	Bảo hiểm tử kỳ	1	2	37	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4500000	2
3373	Bảo hiểm tử kỳ	1	2	38	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4950000	2
3374	Bảo hiểm tử kỳ	1	2	39	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5400000	2
3375	Bảo hiểm tử kỳ	1	2	40	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5790000	2
3376	Bảo hiểm tử kỳ	1	2	41	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6360000	2
3377	Bảo hiểm tử kỳ	1	2	42	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6840000	2
3378	Bảo hiểm tử kỳ	1	2	43	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7350000	2
3379	Bảo hiểm tử kỳ	1	2	44	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7920000	2
3380	Bảo hiểm tử kỳ	1	2	45	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	8490000	2
3381	Bảo hiểm tử kỳ	1	2	46	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	9090000	2
3382	Bảo hiểm tử kỳ	1	2	47	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	9750000	2
3383	Bảo hiểm tử kỳ	1	2	48	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	10440000	2
3384	Bảo hiểm tử kỳ	1	2	49	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11190000	2
3385	Bảo hiểm tử kỳ	1	2	50	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	12000000	2
3386	Bảo hiểm tử kỳ	1	2	6	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1300000	2
3387	Bảo hiểm tử kỳ	1	2	7	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1300000	2
3388	Bảo hiểm tử kỳ	1	2	8	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1300000	2
3389	Bảo hiểm tử kỳ	1	2	9	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1325000	2
3390	Bảo hiểm tử kỳ	1	2	10	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1350000	2
3391	Bảo hiểm tử kỳ	1	2	11	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1375000	2
3392	Bảo hiểm tử kỳ	1	2	12	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1400000	2
3393	Bảo hiểm tử kỳ	1	2	13	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1400000	2
3394	Bảo hiểm tử kỳ	1	2	14	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1450000	2
3395	Bảo hiểm tử kỳ	1	2	15	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1500000	2
3396	Bảo hiểm tử kỳ	1	2	16	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1500000	2
3397	Bảo hiểm tử kỳ	1	2	17	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1575000	2
3398	Bảo hiểm tử kỳ	1	2	18	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1625000	2
3399	Bảo hiểm tử kỳ	1	2	19	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1700000	2
3400	Bảo hiểm tử kỳ	1	2	20	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1800000	2
3401	Bảo hiểm tử kỳ	1	2	21	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1900000	2
3402	Bảo hiểm tử kỳ	1	2	22	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2000000	2
3403	Bảo hiểm tử kỳ	1	2	23	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2100000	2
3404	Bảo hiểm tử kỳ	1	2	24	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2250000	2
3405	Bảo hiểm tử kỳ	1	2	25	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2500000	2
3406	Bảo hiểm tử kỳ	1	2	26	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2750000	2
3407	Bảo hiểm tử kỳ	1	2	27	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3000000	2
3408	Bảo hiểm tử kỳ	1	2	28	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3250000	2
3409	Bảo hiểm tử kỳ	1	2	29	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3500000	2
3410	Bảo hiểm tử kỳ	1	2	30	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4000000	2
3411	Bảo hiểm tử kỳ	1	2	31	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4500000	2
3412	Bảo hiểm tử kỳ	1	2	32	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5000000	2
3413	Bảo hiểm tử kỳ	1	2	33	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5500000	2
3414	Bảo hiểm tử kỳ	1	2	34	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	6000000	2
3415	Bảo hiểm tử kỳ	1	2	35	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	6500000	2
3416	Bảo hiểm tử kỳ	1	2	36	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	7000000	2
3417	Bảo hiểm tử kỳ	1	2	37	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	7500000	2
3418	Bảo hiểm tử kỳ	1	2	38	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	8250000	2
3419	Bảo hiểm tử kỳ	1	2	39	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	9000000	2
3420	Bảo hiểm tử kỳ	1	2	40	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	9650000	2
3421	Bảo hiểm tử kỳ	1	2	41	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	10600000	2
3422	Bảo hiểm tử kỳ	1	2	42	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	11400000	2
3423	Bảo hiểm tử kỳ	1	2	43	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	12250000	2
3424	Bảo hiểm tử kỳ	1	2	44	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	13200000	2
3425	Bảo hiểm tử kỳ	1	2	45	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	14150000	2
3426	Bảo hiểm tử kỳ	1	2	46	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	15150000	2
3427	Bảo hiểm tử kỳ	1	2	47	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	16250000	2
3428	Bảo hiểm tử kỳ	1	2	48	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	17400000	2
3429	Bảo hiểm tử kỳ	1	2	49	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	18650000	2
3430	Bảo hiểm tử kỳ	1	2	50	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	20000000	2
3431	Bảo hiểm tử kỳ	1	2	6	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2600000	2
3432	Bảo hiểm tử kỳ	1	2	7	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2600000	2
3433	Bảo hiểm tử kỳ	1	2	8	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2600000	2
3434	Bảo hiểm tử kỳ	1	2	9	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2650000	2
3435	Bảo hiểm tử kỳ	1	2	10	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2700000	2
3436	Bảo hiểm tử kỳ	1	2	11	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2750000	2
3437	Bảo hiểm tử kỳ	1	2	12	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2800000	2
3438	Bảo hiểm tử kỳ	1	2	13	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2800000	2
3439	Bảo hiểm tử kỳ	1	2	14	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2900000	2
3440	Bảo hiểm tử kỳ	1	2	15	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3000000	2
3441	Bảo hiểm tử kỳ	1	2	16	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3000000	2
3442	Bảo hiểm tử kỳ	1	2	17	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3150000	2
3443	Bảo hiểm tử kỳ	1	2	18	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3250000	2
3444	Bảo hiểm tử kỳ	1	2	19	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3400000	2
3445	Bảo hiểm tử kỳ	1	2	20	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3600000	2
3446	Bảo hiểm tử kỳ	1	2	21	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3800000	2
3447	Bảo hiểm tử kỳ	1	2	22	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4000000	2
3448	Bảo hiểm tử kỳ	1	2	23	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4200000	2
3449	Bảo hiểm tử kỳ	1	2	24	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4500000	2
3450	Bảo hiểm tử kỳ	1	2	25	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	5000000	2
3451	Bảo hiểm tử kỳ	1	2	26	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	5500000	2
3452	Bảo hiểm tử kỳ	1	2	27	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	6000000	2
3453	Bảo hiểm tử kỳ	1	2	28	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	6500000	2
3454	Bảo hiểm tử kỳ	1	2	29	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	7000000	2
3455	Bảo hiểm tử kỳ	1	2	30	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	8000000	2
3456	Bảo hiểm tử kỳ	1	2	31	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	9000000	2
3457	Bảo hiểm tử kỳ	1	2	32	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	10000000	2
3458	Bảo hiểm tử kỳ	1	2	33	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	11000000	2
3459	Bảo hiểm tử kỳ	1	2	34	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	12000000	2
3460	Bảo hiểm tử kỳ	1	2	35	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	13000000	2
3461	Bảo hiểm tử kỳ	1	2	36	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	14000000	2
3462	Bảo hiểm tử kỳ	1	2	37	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	15000000	2
3463	Bảo hiểm tử kỳ	1	2	38	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	16500000	2
3464	Bảo hiểm tử kỳ	1	2	39	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	18000000	2
3465	Bảo hiểm tử kỳ	1	2	40	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	19300000	2
3466	Bảo hiểm tử kỳ	1	2	41	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	21200000	2
3467	Bảo hiểm tử kỳ	1	2	42	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	22800000	2
3468	Bảo hiểm tử kỳ	1	2	43	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	24500000	2
3469	Bảo hiểm tử kỳ	1	2	44	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	26400000	2
3470	Bảo hiểm tử kỳ	1	2	45	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	28300000	2
3471	Bảo hiểm tử kỳ	1	2	46	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	30300000	2
3472	Bảo hiểm tử kỳ	1	2	47	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	32500000	2
3473	Bảo hiểm tử kỳ	1	2	48	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	34800000	2
3474	Bảo hiểm tử kỳ	1	2	49	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	37300000	2
3475	Bảo hiểm tử kỳ	1	2	50	20	20	2	Truyền thống	2	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	40000000	2
3476	Bảo hiểm tử kỳ	1	2	6	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	500000	2
3477	Bảo hiểm tử kỳ	1	2	7	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	500000	2
3478	Bảo hiểm tử kỳ	1	2	8	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	510000	2
3479	Bảo hiểm tử kỳ	1	2	9	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	510000	2
3480	Bảo hiểm tử kỳ	1	2	10	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	526000	2
3481	Bảo hiểm tử kỳ	1	2	11	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	530000	2
3482	Bảo hiểm tử kỳ	1	2	12	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	530000	2
3483	Bảo hiểm tử kỳ	1	2	13	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	530000	2
3484	Bảo hiểm tử kỳ	1	2	14	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	540000	2
3485	Bảo hiểm tử kỳ	1	2	15	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	550000	2
3486	Bảo hiểm tử kỳ	1	2	16	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	560000	2
3487	Bảo hiểm tử kỳ	1	2	17	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	570000	2
3488	Bảo hiểm tử kỳ	1	2	18	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	580000	2
3489	Bảo hiểm tử kỳ	1	2	19	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	600000	2
3490	Bảo hiểm tử kỳ	1	2	20	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	640000	2
3491	Bảo hiểm tử kỳ	1	2	21	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	660000	2
3492	Bảo hiểm tử kỳ	1	2	22	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	680000	2
3493	Bảo hiểm tử kỳ	1	2	23	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	700000	2
3494	Bảo hiểm tử kỳ	1	2	24	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	700000	2
3495	Bảo hiểm tử kỳ	1	2	25	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	740000	2
3496	Bảo hiểm tử kỳ	1	2	26	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	760000	2
3497	Bảo hiểm tử kỳ	1	2	27	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	780000	2
3498	Bảo hiểm tử kỳ	1	2	28	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	800000	2
3499	Bảo hiểm tử kỳ	1	2	29	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	820000	2
3500	Bảo hiểm tử kỳ	1	2	30	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	840000	2
3501	Bảo hiểm tử kỳ	1	2	31	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	960000	2
3502	Bảo hiểm tử kỳ	1	2	32	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1100000	2
3503	Bảo hiểm tử kỳ	1	2	33	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1200000	2
3504	Bảo hiểm tử kỳ	1	2	34	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1400000	2
3505	Bảo hiểm tử kỳ	1	2	35	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1600000	2
3506	Bảo hiểm tử kỳ	1	2	36	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	1800000	2
3507	Bảo hiểm tử kỳ	1	2	37	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2000000	2
3508	Bảo hiểm tử kỳ	1	2	38	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2100000	2
3509	Bảo hiểm tử kỳ	1	2	39	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2300000	2
3510	Bảo hiểm tử kỳ	1	2	40	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2440000	2
3511	Bảo hiểm tử kỳ	1	2	41	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2700000	2
3512	Bảo hiểm tử kỳ	1	2	42	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	2900000	2
3513	Bảo hiểm tử kỳ	1	2	43	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3200000	2
3514	Bảo hiểm tử kỳ	1	2	44	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3400000	2
3515	Bảo hiểm tử kỳ	1	2	45	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	3700000	2
3516	Bảo hiểm tử kỳ	1	2	46	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4000000	2
3517	Bảo hiểm tử kỳ	1	2	47	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4400000	2
3518	Bảo hiểm tử kỳ	1	2	48	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	4700000	2
3519	Bảo hiểm tử kỳ	1	2	49	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5000000	2
3520	Bảo hiểm tử kỳ	1	2	50	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5400000	2
3521	Bảo hiểm tử kỳ	1	2	51	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	5800000	2
3522	Bảo hiểm tử kỳ	1	2	52	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6240000	2
3523	Bảo hiểm tử kỳ	1	2	53	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	6700000	2
3524	Bảo hiểm tử kỳ	1	2	54	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7200000	2
3525	Bảo hiểm tử kỳ	1	2	55	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	7800000	2
3526	Bảo hiểm tử kỳ	1	2	56	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	8700000	2
3527	Bảo hiểm tử kỳ	1	2	57	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	9300000	2
3528	Bảo hiểm tử kỳ	1	2	58	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	9900000	2
3529	Bảo hiểm tử kỳ	1	2	59	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	10720000	2
3530	Bảo hiểm tử kỳ	1	2	60	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	200000000	11200000	2
3531	Bảo hiểm tử kỳ	1	2	6	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	750000	2
3532	Bảo hiểm tử kỳ	1	2	7	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	750000	2
3533	Bảo hiểm tử kỳ	1	2	8	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	765000	2
3534	Bảo hiểm tử kỳ	1	2	9	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	765000	2
3535	Bảo hiểm tử kỳ	1	2	10	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	789000	2
3536	Bảo hiểm tử kỳ	1	2	11	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	795000	2
3537	Bảo hiểm tử kỳ	1	2	12	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	795000	2
3538	Bảo hiểm tử kỳ	1	2	13	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	795000	2
3539	Bảo hiểm tử kỳ	1	2	14	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	810000	2
3540	Bảo hiểm tử kỳ	1	2	15	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	825000	2
3541	Bảo hiểm tử kỳ	1	2	16	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	840000	2
3542	Bảo hiểm tử kỳ	1	2	17	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	855000	2
3543	Bảo hiểm tử kỳ	1	2	18	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	870000	2
3544	Bảo hiểm tử kỳ	1	2	19	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	900000	2
3545	Bảo hiểm tử kỳ	1	2	20	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	960000	2
3546	Bảo hiểm tử kỳ	1	2	21	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	990000	2
3547	Bảo hiểm tử kỳ	1	2	22	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1020000	2
3548	Bảo hiểm tử kỳ	1	2	23	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1050000	2
3549	Bảo hiểm tử kỳ	1	2	24	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1050000	2
3550	Bảo hiểm tử kỳ	1	2	25	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1110000	2
3551	Bảo hiểm tử kỳ	1	2	26	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1140000	2
3552	Bảo hiểm tử kỳ	1	2	27	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1170000	2
3553	Bảo hiểm tử kỳ	1	2	28	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1200000	2
3554	Bảo hiểm tử kỳ	1	2	29	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1230000	2
3555	Bảo hiểm tử kỳ	1	2	30	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1260000	2
3556	Bảo hiểm tử kỳ	1	2	31	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1440000	2
3557	Bảo hiểm tử kỳ	1	2	32	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1650000	2
3558	Bảo hiểm tử kỳ	1	2	33	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	1800000	2
3559	Bảo hiểm tử kỳ	1	2	34	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2100000	2
3560	Bảo hiểm tử kỳ	1	2	35	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2400000	2
3561	Bảo hiểm tử kỳ	1	2	36	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	2700000	2
3562	Bảo hiểm tử kỳ	1	2	37	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3000000	2
3563	Bảo hiểm tử kỳ	1	2	38	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3150000	2
3564	Bảo hiểm tử kỳ	1	2	39	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3450000	2
3565	Bảo hiểm tử kỳ	1	2	40	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	3660000	2
3566	Bảo hiểm tử kỳ	1	2	41	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4050000	2
3567	Bảo hiểm tử kỳ	1	2	42	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4350000	2
3568	Bảo hiểm tử kỳ	1	2	43	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	4800000	2
3569	Bảo hiểm tử kỳ	1	2	44	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5100000	2
3570	Bảo hiểm tử kỳ	1	2	45	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	5550000	2
3571	Bảo hiểm tử kỳ	1	2	46	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6000000	2
3572	Bảo hiểm tử kỳ	1	2	47	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	6600000	2
3573	Bảo hiểm tử kỳ	1	2	48	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7050000	2
3574	Bảo hiểm tử kỳ	1	2	49	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	7500000	2
3575	Bảo hiểm tử kỳ	1	2	50	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	8100000	2
3576	Bảo hiểm tử kỳ	1	2	51	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	8700000	2
3577	Bảo hiểm tử kỳ	1	2	52	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	9360000	2
3578	Bảo hiểm tử kỳ	1	2	53	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	10050000	2
3579	Bảo hiểm tử kỳ	1	2	54	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	10800000	2
3580	Bảo hiểm tử kỳ	1	2	55	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	11700000	2
3581	Bảo hiểm tử kỳ	1	2	56	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	13050000	2
3582	Bảo hiểm tử kỳ	1	2	57	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	13950000	2
3583	Bảo hiểm tử kỳ	1	2	58	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	14850000	2
3584	Bảo hiểm tử kỳ	1	2	59	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	16080000	2
3585	Bảo hiểm tử kỳ	1	2	60	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	300000000	16800000	2
3586	Bảo hiểm tử kỳ	1	2	6	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1250000	2
3587	Bảo hiểm tử kỳ	1	2	7	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1250000	2
3588	Bảo hiểm tử kỳ	1	2	8	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1275000	2
3589	Bảo hiểm tử kỳ	1	2	9	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1275000	2
3590	Bảo hiểm tử kỳ	1	2	10	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1315000	2
3591	Bảo hiểm tử kỳ	1	2	11	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1325000	2
3592	Bảo hiểm tử kỳ	1	2	12	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1325000	2
3593	Bảo hiểm tử kỳ	1	2	13	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1325000	2
3594	Bảo hiểm tử kỳ	1	2	14	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1350000	2
3595	Bảo hiểm tử kỳ	1	2	15	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1375000	2
3596	Bảo hiểm tử kỳ	1	2	16	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1400000	2
3597	Bảo hiểm tử kỳ	1	2	17	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1425000	2
3598	Bảo hiểm tử kỳ	1	2	18	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1450000	2
3599	Bảo hiểm tử kỳ	1	2	19	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1500000	2
3600	Bảo hiểm tử kỳ	1	2	20	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1600000	2
3601	Bảo hiểm tử kỳ	1	2	21	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1650000	2
3602	Bảo hiểm tử kỳ	1	2	22	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1700000	2
3603	Bảo hiểm tử kỳ	1	2	23	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1750000	2
3604	Bảo hiểm tử kỳ	1	2	24	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1750000	2
3605	Bảo hiểm tử kỳ	1	2	25	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1850000	2
3606	Bảo hiểm tử kỳ	1	2	26	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1900000	2
3607	Bảo hiểm tử kỳ	1	2	27	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	1950000	2
3608	Bảo hiểm tử kỳ	1	2	28	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2000000	2
3609	Bảo hiểm tử kỳ	1	2	29	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2050000	2
3610	Bảo hiểm tử kỳ	1	2	30	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2100000	2
3611	Bảo hiểm tử kỳ	1	2	31	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2400000	2
3612	Bảo hiểm tử kỳ	1	2	32	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	2750000	2
3613	Bảo hiểm tử kỳ	1	2	33	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3000000	2
3614	Bảo hiểm tử kỳ	1	2	34	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	3500000	2
3615	Bảo hiểm tử kỳ	1	2	35	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4000000	2
3616	Bảo hiểm tử kỳ	1	2	36	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	4500000	2
3617	Bảo hiểm tử kỳ	1	2	37	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5000000	2
3618	Bảo hiểm tử kỳ	1	2	38	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5250000	2
3619	Bảo hiểm tử kỳ	1	2	39	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	5750000	2
3620	Bảo hiểm tử kỳ	1	2	40	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	6100000	2
3621	Bảo hiểm tử kỳ	1	2	41	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	6750000	2
3622	Bảo hiểm tử kỳ	1	2	42	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	7250000	2
3623	Bảo hiểm tử kỳ	1	2	43	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	8000000	2
3624	Bảo hiểm tử kỳ	1	2	44	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	8500000	2
3625	Bảo hiểm tử kỳ	1	2	45	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	9250000	2
3626	Bảo hiểm tử kỳ	1	2	46	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	10000000	2
3627	Bảo hiểm tử kỳ	1	2	47	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	11000000	2
3628	Bảo hiểm tử kỳ	1	2	48	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	11750000	2
3629	Bảo hiểm tử kỳ	1	2	49	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	12500000	2
3630	Bảo hiểm tử kỳ	1	2	50	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	13500000	2
3631	Bảo hiểm tử kỳ	1	2	51	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	14500000	2
3632	Bảo hiểm tử kỳ	1	2	52	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	15600000	2
3633	Bảo hiểm tử kỳ	1	2	53	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	16750000	2
3634	Bảo hiểm tử kỳ	1	2	54	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	18000000	2
3635	Bảo hiểm tử kỳ	1	2	55	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	19500000	2
3636	Bảo hiểm tử kỳ	1	2	56	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	21750000	2
3637	Bảo hiểm tử kỳ	1	2	57	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	23250000	2
3638	Bảo hiểm tử kỳ	1	2	58	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	24750000	2
3639	Bảo hiểm tử kỳ	1	2	59	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	26800000	2
3640	Bảo hiểm tử kỳ	1	2	60	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	500000000	28000000	2
3641	Bảo hiểm tử kỳ	1	2	6	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2500000	2
3642	Bảo hiểm tử kỳ	1	2	7	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2500000	2
3643	Bảo hiểm tử kỳ	1	2	8	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2550000	2
3644	Bảo hiểm tử kỳ	1	2	9	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2550000	2
3645	Bảo hiểm tử kỳ	1	2	10	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2630000	2
3646	Bảo hiểm tử kỳ	1	2	11	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2650000	2
3647	Bảo hiểm tử kỳ	1	2	12	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2650000	2
3648	Bảo hiểm tử kỳ	1	2	13	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2650000	2
3649	Bảo hiểm tử kỳ	1	2	14	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2700000	2
3650	Bảo hiểm tử kỳ	1	2	15	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2750000	2
3651	Bảo hiểm tử kỳ	1	2	16	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2800000	2
3652	Bảo hiểm tử kỳ	1	2	17	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2850000	2
3653	Bảo hiểm tử kỳ	1	2	18	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	2900000	2
3654	Bảo hiểm tử kỳ	1	2	19	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3000000	2
3655	Bảo hiểm tử kỳ	1	2	20	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3200000	2
3656	Bảo hiểm tử kỳ	1	2	21	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3300000	2
3657	Bảo hiểm tử kỳ	1	2	22	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3400000	2
3658	Bảo hiểm tử kỳ	1	2	23	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3500000	2
3659	Bảo hiểm tử kỳ	1	2	24	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3500000	2
3660	Bảo hiểm tử kỳ	1	2	25	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3700000	2
3661	Bảo hiểm tử kỳ	1	2	26	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3800000	2
3662	Bảo hiểm tử kỳ	1	2	27	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	3900000	2
3663	Bảo hiểm tử kỳ	1	2	28	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4000000	2
3664	Bảo hiểm tử kỳ	1	2	29	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4100000	2
3665	Bảo hiểm tử kỳ	1	2	30	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4200000	2
3666	Bảo hiểm tử kỳ	1	2	31	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	4800000	2
3667	Bảo hiểm tử kỳ	1	2	32	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	5500000	2
3668	Bảo hiểm tử kỳ	1	2	33	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	6000000	2
3669	Bảo hiểm tử kỳ	1	2	34	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	7000000	2
3670	Bảo hiểm tử kỳ	1	2	35	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	8000000	2
3671	Bảo hiểm tử kỳ	1	2	36	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	9000000	2
3672	Bảo hiểm tử kỳ	1	2	37	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	10000000	2
3673	Bảo hiểm tử kỳ	1	2	38	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	10500000	2
3674	Bảo hiểm tử kỳ	1	2	39	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	11500000	2
3675	Bảo hiểm tử kỳ	1	2	40	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	12200000	2
3676	Bảo hiểm tử kỳ	1	2	41	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	13500000	2
3677	Bảo hiểm tử kỳ	1	2	42	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	14500000	2
3678	Bảo hiểm tử kỳ	1	2	43	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	16000000	2
3679	Bảo hiểm tử kỳ	1	2	44	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	17000000	2
3680	Bảo hiểm tử kỳ	1	2	45	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	18500000	2
3681	Bảo hiểm tử kỳ	1	2	46	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	20000000	2
3682	Bảo hiểm tử kỳ	1	2	47	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	22000000	2
3683	Bảo hiểm tử kỳ	1	2	48	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	23500000	2
3684	Bảo hiểm tử kỳ	1	2	49	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	25000000	2
3685	Bảo hiểm tử kỳ	1	2	50	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	27000000	2
3686	Bảo hiểm tử kỳ	1	2	51	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	29000000	2
3687	Bảo hiểm tử kỳ	1	2	52	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	31200000	2
3688	Bảo hiểm tử kỳ	1	2	53	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	33500000	2
3689	Bảo hiểm tử kỳ	1	2	54	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	36000000	2
3690	Bảo hiểm tử kỳ	1	2	55	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	39000000	2
3691	Bảo hiểm tử kỳ	1	2	56	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	43500000	2
3692	Bảo hiểm tử kỳ	1	2	57	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	46500000	2
3693	Bảo hiểm tử kỳ	1	2	58	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	49500000	2
3694	Bảo hiểm tử kỳ	1	2	59	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	53600000	2
3695	Bảo hiểm tử kỳ	1	2	60	5	5	2	Thai sản	3	Phúc bảo bổ trợ bệnh hiểm nghèo	2	1000000000	56000000	2
\.


--
-- Data for Name: termlife_nguoiduocbaohiem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.termlife_nguoiduocbaohiem (id, ma_don_hang_bihama, username, fullname, birth_day, birth_month, birth_year, gioi_tinh, email, dia_chi_tinh_thanh_pho, dia_chi_quan_huyen, dia_chi_chi_tiet, so_cmnd, images_cmt_mattruoc, images_cmt_matsau, cmt_ngay_cap, cmt_noi_cap, ngay_hieu_luc, ngay_ket_thuc, cau_hoi_suc_khoe_1, cau_hoi_suc_khoe_2, cau_hoi_suc_khoe_3, cau_hoi_suc_khoe_4, cau_hoi_suc_khoe_5, cau_hoi_suc_khoe_6, cau_hoi_suc_khoe_7, cau_hoi_suc_khoe_8, status_marriage, so_tien_bao_hiem, so_nam_hop_dong, so_nam_dong_phi, cach_tra_phi, dinh_ky_dong_phi, job, weight, height, nationality, nationality_paper, is_smoke, relationship, created_at, nguoimuabaohiem_id) FROM stdin;
\.


--
-- Data for Name: termlife_nguoiduocbaohiemtam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.termlife_nguoiduocbaohiemtam (id, username, fullname, birth_day, birth_month, birth_year, gioi_tinh, email, dia_chi_tinh_thanh_pho, dia_chi_quan_huyen, dia_chi_chi_tiet, so_cmnd, images_cmt_mattruoc, images_cmt_matsau, cmt_ngay_cap, cmt_noi_cap, ngay_hieu_luc, ngay_ket_thuc, cau_hoi_suc_khoe_1, cau_hoi_suc_khoe_2, cau_hoi_suc_khoe_3, cau_hoi_suc_khoe_4, cau_hoi_suc_khoe_5, cau_hoi_suc_khoe_6, cau_hoi_suc_khoe_7, cau_hoi_suc_khoe_8, status_marriage, so_tien_bao_hiem, so_nam_hop_dong, so_nam_dong_phi, cach_tra_phi, dinh_ky_dong_phi, job, weight, height, nationality, nationality_paper, is_smoke, relationship, created_at, nguoimuabaohiemtam_id) FROM stdin;
\.


--
-- Data for Name: termlife_nguoithuhuong; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.termlife_nguoithuhuong (id, fullname, birth_day, birth_month, birth_year, gioi_tinh, so_cmnd, images_cmt_mattruoc, images_cmt_matsau, cmt_ngay_cap, cmt_noi_cap, relationship, ty_le_thu_huong, nguoiduocbaohiem_id) FROM stdin;
\.


--
-- Data for Name: termlife_nguoithuhuongtam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.termlife_nguoithuhuongtam (id, fullname, birth_day, birth_month, birth_year, gioi_tinh, so_cmnd, images_cmt_mattruoc, images_cmt_matsau, cmt_ngay_cap, cmt_noi_cap, relationship, ty_le_thu_huong, nguoiduocbaohiemtam_id) FROM stdin;
\.


--
-- Data for Name: tndsoto_goisanphamchinh; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tndsoto_goisanphamchinh (id, ten_loai_hinh_bao_hiem, id_loai_hinh_bao_hiem, ten_trong_tai, id_trong_tai, so_phi_chinh, company_id) FROM stdin;
1	Bảo hiểm TNDS ô tô	13	Xe ô tô dưới 6 chỗ ngồi	1	480000	3
2	Bảo hiểm TNDS ô tô	13	Xe ô tô từ 6 chỗ đến 9 chỗ ngồi	2	873000	3
3	Bảo hiểm TNDS ô tô	13	Xe ô tô từ 10 đến 11 chỗ ngồi	3	873000	3
4	Bảo hiểm TNDS ô tô	13	Xe ô tô từ 12 đến 24 chỗ ngồi	4	1397000	3
5	Bảo hiểm TNDS ô tô	13	Xe ô tô trên 24 chỗ ngồi	5	2007000	3
\.


--
-- Data for Name: tndsoto_goisanphamphu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tndsoto_goisanphamphu (id, ten_loai_hinh_bao_hiem, id_loai_hinh_bao_hiem, ten_goi_san_pham_phu, id_goi_san_pham_phu, so_phi_phu, company_id) FROM stdin;
\.


--
-- Data for Name: tndsoto_nguoiduocbaohiem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tndsoto_nguoiduocbaohiem (id, ma_don_hang_bihama, bien_so_xe, loai_nguoi_mua, muc_dich_su_dung, trong_tai, so_tien_bao_hiem_tnds_tu_nguyen, images_dangky_mattruoc, images_dangky_matsau, ngay_hieu_luc, ngay_ket_thuc, created_at, nguoimuabaohiem_id) FROM stdin;
\.


--
-- Data for Name: tndsoto_nguoiduocbaohiemtam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tndsoto_nguoiduocbaohiemtam (id, bien_so_xe, loai_nguoi_mua, muc_dich_su_dung, trong_tai, so_tien_bao_hiem_tnds_tu_nguyen, images_dangky_mattruoc, images_dangky_matsau, ngay_hieu_luc, ngay_ket_thuc, created_at, nguoimuabaohiemtam_id) FROM stdin;
\.


--
-- Data for Name: tndsxemay_goisanphamchinh; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tndsxemay_goisanphamchinh (id, ten_loai_hinh_bao_hiem, id_loai_hinh_bao_hiem, ten_loai_xe, id_loai_xe, so_phi_chinh, company_id) FROM stdin;
1	Bảo hiểm TNDS xe máy	15	Xe Mô tô dung tích trên 50cc	1	60000	3
2	Bảo hiểm TNDS xe máy	15	Xe Mô tô dung tích từ 50cc trở xuống	2	55000	3
\.


--
-- Data for Name: tndsxemay_goisanphamphu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tndsxemay_goisanphamphu (id, ten_loai_hinh_bao_hiem, id_loai_hinh_bao_hiem, ten_goi_san_pham_phu, id_goi_san_pham_phu, so_phi_phu, company_id) FROM stdin;
\.


--
-- Data for Name: tndsxemay_nguoiduocbaohiem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tndsxemay_nguoiduocbaohiem (id, ma_don_hang_bihama, bien_so_xe, loai_xe, so_tien_bao_hiem_tnds_tu_nguyen, so_cho_tai_nan_nguoi_tren_xe, so_tien_bao_hiem_tai_nan_nguoi_tren_xe, so_tien_bao_hiem_chay_no, images_dangky_mattruoc, images_dangky_matsau, ngay_hieu_luc, ngay_ket_thuc, created_at, nguoimuabaohiem_id) FROM stdin;
\.


--
-- Data for Name: tndsxemay_nguoiduocbaohiemtam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tndsxemay_nguoiduocbaohiemtam (id, bien_so_xe, loai_xe, so_tien_bao_hiem_tnds_tu_nguyen, so_cho_tai_nan_nguoi_tren_xe, so_tien_bao_hiem_tai_nan_nguoi_tren_xe, so_tien_bao_hiem_chay_no, images_dangky_mattruoc, images_dangky_matsau, ngay_hieu_luc, ngay_ket_thuc, created_at, nguoimuabaohiemtam_id) FROM stdin;
\.


--
-- Data for Name: token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: user_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_notification (id, is_read, created_at, notification_id, user_id) FROM stdin;
\.


--
-- Data for Name: users_bankaccount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_bankaccount (id, bank_name, fullname, bank_number, branch, created_at, ctv_id) FROM stdin;
\.


--
-- Data for Name: users_countotp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_countotp (id, ip_client, count_otp, phone_otp, create_at) FROM stdin;
\.


--
-- Data for Name: users_forgotpassword; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_forgotpassword (id, forgot_pass, ngay_thay_doi, user_id) FROM stdin;
\.


--
-- Data for Name: users_lenhruttien; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_lenhruttien (id, amount_withdraw, is_da_gui_mana, is_da_gui_ctv, created_at, status, bank_account_id) FROM stdin;
\.


--
-- Data for Name: users_loginhistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_loginhistory (id, start_date, end_date, num_date, user_id) FROM stdin;
\.


--
-- Data for Name: users_odertutorial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_odertutorial (id, title, content, people_post, total_view, created_at) FROM stdin;
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, fullname, images_user, gender, birth_day, birth_month, birth_year, link_info, code_invite, register_ctv, loai_hinh_muon_hop_tac, dia_chi_tinh_thanh_pho, dia_chi_quan_huyen, dia_chi_chi_tiet, chung_chi_dai_ly, so_chung_chi, loai_hinh_bao_hiem_cua_chung_chi, is_gui_register, created_at) FROM stdin;
1	pbkdf2_sha256$150000$VnIjUYTFxy73$BpS4pmRYv1k6pxbBTgWNkLvmRuHy6EgmbPCivDradLI=	2020-08-11 08:49:15.670306+00	t	0964348800				t	t	2020-08-11 08:48:52.650909+00	\N	\N	0	0	0	0	\N	\N	f	0	\N	\N	\N	f	\N	0	f	2020-08-11 08:48:52.734526+00
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: article_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.article_article_id_seq', 15, true);


--
-- Name: article_gioithieuloaihinhbh_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.article_gioithieuloaihinhbh_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 296, true);


--
-- Name: claim_yeucaubaolanhvienphi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.claim_yeucaubaolanhvienphi_id_seq', 1, false);


--
-- Name: claim_yeucauchung_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.claim_yeucauchung_id_seq', 1, false);


--
-- Name: claim_yeucaunhatunhan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.claim_yeucaunhatunhan_id_seq', 1, false);


--
-- Name: claim_yeucauoto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.claim_yeucauoto_id_seq', 1, false);


--
-- Name: claim_yeucausuckhoe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.claim_yeucausuckhoe_id_seq', 1, false);


--
-- Name: claim_yeucautainancanhan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.claim_yeucautainancanhan_id_seq', 1, false);


--
-- Name: claim_yeucautuky_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.claim_yeucautuky_id_seq', 1, false);


--
-- Name: core_chitietcongviec_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_chitietcongviec_id_seq', 71, true);


--
-- Name: core_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_company_id_seq', 3, true);


--
-- Name: core_district_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_district_id_seq', 707, true);


--
-- Name: core_googlevision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_googlevision_id_seq', 1, false);


--
-- Name: core_linhvunghenghiep_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_linhvunghenghiep_id_seq', 18, true);


--
-- Name: core_nguoimuabaohiem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_nguoimuabaohiem_id_seq', 1, false);


--
-- Name: core_nguoimuabaohiemtam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_nguoimuabaohiemtam_id_seq', 1, false);


--
-- Name: core_noidungnghenghiep_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_noidungnghenghiep_id_seq', 472, true);


--
-- Name: core_provincial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_provincial_id_seq', 63, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 74, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 32, true);


--
-- Name: homeinsurance_goisanphamchinh_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.homeinsurance_goisanphamchinh_id_seq', 2, true);


--
-- Name: homeinsurance_goisanphamphu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.homeinsurance_goisanphamphu_id_seq', 8, true);


--
-- Name: homeinsurance_nguoiduocbaohiem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.homeinsurance_nguoiduocbaohiem_id_seq', 1, false);


--
-- Name: homeinsurance_nguoiduocbaohiemtam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.homeinsurance_nguoiduocbaohiemtam_id_seq', 1, false);


--
-- Name: homeinsurance_nguoithuhuong_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.homeinsurance_nguoithuhuong_id_seq', 1, false);


--
-- Name: insurancecompany_insurancecompany_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.insurancecompany_insurancecompany_id_seq', 19, true);


--
-- Name: investment_giatridautu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.investment_giatridautu_id_seq', 1, false);


--
-- Name: investment_goisanphamchinh_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.investment_goisanphamchinh_id_seq', 200, true);


--
-- Name: investment_goisanphamphu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.investment_goisanphamphu_id_seq', 12, true);


--
-- Name: investment_laisuatthitruong_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.investment_laisuatthitruong_id_seq', 10, true);


--
-- Name: investment_nguoiduocbaohiem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.investment_nguoiduocbaohiem_id_seq', 1, false);


--
-- Name: investment_nguoiduocbaohiemtam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.investment_nguoiduocbaohiemtam_id_seq', 1, false);


--
-- Name: investment_nguoithuhuong_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.investment_nguoithuhuong_id_seq', 1, false);


--
-- Name: investment_nguoithuhuongtam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.investment_nguoithuhuongtam_id_seq', 1, false);


--
-- Name: kienthuc_kienthuccategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kienthuc_kienthuccategory_id_seq', 5, true);


--
-- Name: kienthuc_kienthucmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kienthuc_kienthucmodel_id_seq', 23, true);


--
-- Name: notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notification_id_seq', 1, false);


--
-- Name: payment_dondathang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_dondathang_id_seq', 1, false);


--
-- Name: payment_magiamgia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_magiamgia_id_seq', 1, false);


--
-- Name: payment_taituc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_taituc_id_seq', 1, false);


--
-- Name: personalhealth_goisanphamchinh_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personalhealth_goisanphamchinh_id_seq', 396, true);


--
-- Name: personalhealth_goisanphamphu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personalhealth_goisanphamphu_id_seq', 1584, true);


--
-- Name: personalhealth_nguoiduocbaohiem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personalhealth_nguoiduocbaohiem_id_seq', 1, false);


--
-- Name: personalhealth_nguoiduocbaohiemtam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personalhealth_nguoiduocbaohiemtam_id_seq', 1, false);


--
-- Name: robot_robot1dautu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.robot_robot1dautu_id_seq', 1, false);


--
-- Name: robot_robotchung_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.robot_robotchung_id_seq', 1, false);


--
-- Name: termlife_goisanphamchinh_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.termlife_goisanphamchinh_id_seq', 748, true);


--
-- Name: termlife_goisanphamphu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.termlife_goisanphamphu_id_seq', 3695, true);


--
-- Name: termlife_nguoiduocbaohiem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.termlife_nguoiduocbaohiem_id_seq', 1, false);


--
-- Name: termlife_nguoiduocbaohiemtam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.termlife_nguoiduocbaohiemtam_id_seq', 1, false);


--
-- Name: termlife_nguoithuhuong_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.termlife_nguoithuhuong_id_seq', 1, false);


--
-- Name: termlife_nguoithuhuongtam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.termlife_nguoithuhuongtam_id_seq', 1, false);


--
-- Name: tndsoto_goisanphamchinh_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tndsoto_goisanphamchinh_id_seq', 5, true);


--
-- Name: tndsoto_goisanphamphu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tndsoto_goisanphamphu_id_seq', 1, false);


--
-- Name: tndsoto_nguoiduocbaohiem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tndsoto_nguoiduocbaohiem_id_seq', 1, false);


--
-- Name: tndsoto_nguoiduocbaohiemtam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tndsoto_nguoiduocbaohiemtam_id_seq', 1, false);


--
-- Name: tndsxemay_goisanphamchinh_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tndsxemay_goisanphamchinh_id_seq', 2, true);


--
-- Name: tndsxemay_goisanphamphu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tndsxemay_goisanphamphu_id_seq', 1, false);


--
-- Name: tndsxemay_nguoiduocbaohiem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tndsxemay_nguoiduocbaohiem_id_seq', 1, false);


--
-- Name: tndsxemay_nguoiduocbaohiemtam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tndsxemay_nguoiduocbaohiemtam_id_seq', 1, false);


--
-- Name: user_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_notification_id_seq', 1, false);


--
-- Name: users_bankaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_bankaccount_id_seq', 1, false);


--
-- Name: users_countotp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_countotp_id_seq', 1, false);


--
-- Name: users_forgotpassword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_forgotpassword_id_seq', 1, false);


--
-- Name: users_lenhruttien_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_lenhruttien_id_seq', 1, false);


--
-- Name: users_loginhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_loginhistory_id_seq', 1, false);


--
-- Name: users_odertutorial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_odertutorial_id_seq', 1, false);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, true);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- Name: article_article article_article_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_article
    ADD CONSTRAINT article_article_pkey PRIMARY KEY (id);


--
-- Name: article_gioithieuloaihinhbh article_gioithieuloaihinhbh_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_gioithieuloaihinhbh
    ADD CONSTRAINT article_gioithieuloaihinhbh_pkey PRIMARY KEY (id);


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
-- Name: claim_yeucaubaolanhvienphi claim_yeucaubaolanhvienphi_ho_ten_nguoi_khai_bao_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucaubaolanhvienphi
    ADD CONSTRAINT claim_yeucaubaolanhvienphi_ho_ten_nguoi_khai_bao_key UNIQUE (ho_ten_nguoi_khai_bao);


--
-- Name: claim_yeucaubaolanhvienphi claim_yeucaubaolanhvienphi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucaubaolanhvienphi
    ADD CONSTRAINT claim_yeucaubaolanhvienphi_pkey PRIMARY KEY (id);


--
-- Name: claim_yeucaubaolanhvienphi claim_yeucaubaolanhvienphi_so_dien_thoai_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucaubaolanhvienphi
    ADD CONSTRAINT claim_yeucaubaolanhvienphi_so_dien_thoai_key UNIQUE (so_dien_thoai);


--
-- Name: claim_yeucaubaolanhvienphi claim_yeucaubaolanhvienphi_so_hop_dong_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucaubaolanhvienphi
    ADD CONSTRAINT claim_yeucaubaolanhvienphi_so_hop_dong_key UNIQUE (so_hop_dong);


--
-- Name: claim_yeucaubaolanhvienphi claim_yeucaubaolanhvienphi_so_the_bao_hiem_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucaubaolanhvienphi
    ADD CONSTRAINT claim_yeucaubaolanhvienphi_so_the_bao_hiem_key UNIQUE (so_the_bao_hiem);


--
-- Name: claim_yeucauchung claim_yeucauchung_nguoi_khai_bao_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucauchung
    ADD CONSTRAINT claim_yeucauchung_nguoi_khai_bao_key UNIQUE (nguoi_khai_bao);


--
-- Name: claim_yeucauchung claim_yeucauchung_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucauchung
    ADD CONSTRAINT claim_yeucauchung_pkey PRIMARY KEY (id);


--
-- Name: claim_yeucauchung claim_yeucauchung_so_dien_thoai_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucauchung
    ADD CONSTRAINT claim_yeucauchung_so_dien_thoai_key UNIQUE (so_dien_thoai);


--
-- Name: claim_yeucauchung claim_yeucauchung_so_giay_chung_nhan_bao_hiem_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucauchung
    ADD CONSTRAINT claim_yeucauchung_so_giay_chung_nhan_bao_hiem_key UNIQUE (so_giay_chung_nhan_bao_hiem);


--
-- Name: claim_yeucaunhatunhan claim_yeucaunhatunhan_chon_phuong_thuc_nhan_tien_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucaunhatunhan
    ADD CONSTRAINT claim_yeucaunhatunhan_chon_phuong_thuc_nhan_tien_key UNIQUE (chon_phuong_thuc_nhan_tien);


--
-- Name: claim_yeucaunhatunhan claim_yeucaunhatunhan_dia_chi_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucaunhatunhan
    ADD CONSTRAINT claim_yeucaunhatunhan_dia_chi_key UNIQUE (dia_chi);


--
-- Name: claim_yeucaunhatunhan claim_yeucaunhatunhan_dia_chi_ton_that_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucaunhatunhan
    ADD CONSTRAINT claim_yeucaunhatunhan_dia_chi_ton_that_key UNIQUE (dia_chi_ton_that);


--
-- Name: claim_yeucaunhatunhan claim_yeucaunhatunhan_ho_ten_nguoi_khai_bao_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucaunhatunhan
    ADD CONSTRAINT claim_yeucaunhatunhan_ho_ten_nguoi_khai_bao_key UNIQUE (ho_ten_nguoi_khai_bao);


--
-- Name: claim_yeucaunhatunhan claim_yeucaunhatunhan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucaunhatunhan
    ADD CONSTRAINT claim_yeucaunhatunhan_pkey PRIMARY KEY (id);


--
-- Name: claim_yeucaunhatunhan claim_yeucaunhatunhan_so_dien_thoai_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucaunhatunhan
    ADD CONSTRAINT claim_yeucaunhatunhan_so_dien_thoai_key UNIQUE (so_dien_thoai);


--
-- Name: claim_yeucaunhatunhan claim_yeucaunhatunhan_so_hop_dong_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucaunhatunhan
    ADD CONSTRAINT claim_yeucaunhatunhan_so_hop_dong_key UNIQUE (so_hop_dong);


--
-- Name: claim_yeucauoto claim_yeucauoto_dia_chi_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucauoto
    ADD CONSTRAINT claim_yeucauoto_dia_chi_key UNIQUE (dia_chi);


--
-- Name: claim_yeucauoto claim_yeucauoto_ho_ten_nguoi_khai_bao_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucauoto
    ADD CONSTRAINT claim_yeucauoto_ho_ten_nguoi_khai_bao_key UNIQUE (ho_ten_nguoi_khai_bao);


--
-- Name: claim_yeucauoto claim_yeucauoto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucauoto
    ADD CONSTRAINT claim_yeucauoto_pkey PRIMARY KEY (id);


--
-- Name: claim_yeucauoto claim_yeucauoto_so_dien_thoai_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucauoto
    ADD CONSTRAINT claim_yeucauoto_so_dien_thoai_key UNIQUE (so_dien_thoai);


--
-- Name: claim_yeucauoto claim_yeucauoto_so_hop_dong_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucauoto
    ADD CONSTRAINT claim_yeucauoto_so_hop_dong_key UNIQUE (so_hop_dong);


--
-- Name: claim_yeucausuckhoe claim_yeucausuckhoe_ho_ten_nguoi_khai_bao_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucausuckhoe
    ADD CONSTRAINT claim_yeucausuckhoe_ho_ten_nguoi_khai_bao_key UNIQUE (ho_ten_nguoi_khai_bao);


--
-- Name: claim_yeucausuckhoe claim_yeucausuckhoe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucausuckhoe
    ADD CONSTRAINT claim_yeucausuckhoe_pkey PRIMARY KEY (id);


--
-- Name: claim_yeucausuckhoe claim_yeucausuckhoe_so_dien_thoai_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucausuckhoe
    ADD CONSTRAINT claim_yeucausuckhoe_so_dien_thoai_key UNIQUE (so_dien_thoai);


--
-- Name: claim_yeucausuckhoe claim_yeucausuckhoe_so_hop_dong_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucausuckhoe
    ADD CONSTRAINT claim_yeucausuckhoe_so_hop_dong_key UNIQUE (so_hop_dong);


--
-- Name: claim_yeucausuckhoe claim_yeucausuckhoe_so_the_bao_hiem_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucausuckhoe
    ADD CONSTRAINT claim_yeucausuckhoe_so_the_bao_hiem_key UNIQUE (so_the_bao_hiem);


--
-- Name: claim_yeucautainancanhan claim_yeucautainancanhan_ho_ten_nguoi_khai_bao_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucautainancanhan
    ADD CONSTRAINT claim_yeucautainancanhan_ho_ten_nguoi_khai_bao_key UNIQUE (ho_ten_nguoi_khai_bao);


--
-- Name: claim_yeucautainancanhan claim_yeucautainancanhan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucautainancanhan
    ADD CONSTRAINT claim_yeucautainancanhan_pkey PRIMARY KEY (id);


--
-- Name: claim_yeucautainancanhan claim_yeucautainancanhan_so_dien_thoai_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucautainancanhan
    ADD CONSTRAINT claim_yeucautainancanhan_so_dien_thoai_key UNIQUE (so_dien_thoai);


--
-- Name: claim_yeucautainancanhan claim_yeucautainancanhan_so_hop_dong_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucautainancanhan
    ADD CONSTRAINT claim_yeucautainancanhan_so_hop_dong_key UNIQUE (so_hop_dong);


--
-- Name: claim_yeucautainancanhan claim_yeucautainancanhan_so_the_bao_hiem_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucautainancanhan
    ADD CONSTRAINT claim_yeucautainancanhan_so_the_bao_hiem_key UNIQUE (so_the_bao_hiem);


--
-- Name: claim_yeucautuky claim_yeucautuky_dia_chi_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucautuky
    ADD CONSTRAINT claim_yeucautuky_dia_chi_key UNIQUE (dia_chi);


--
-- Name: claim_yeucautuky claim_yeucautuky_ho_ten_nguoi_khai_bao_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucautuky
    ADD CONSTRAINT claim_yeucautuky_ho_ten_nguoi_khai_bao_key UNIQUE (ho_ten_nguoi_khai_bao);


--
-- Name: claim_yeucautuky claim_yeucautuky_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucautuky
    ADD CONSTRAINT claim_yeucautuky_pkey PRIMARY KEY (id);


--
-- Name: claim_yeucautuky claim_yeucautuky_so_dien_thoai_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucautuky
    ADD CONSTRAINT claim_yeucautuky_so_dien_thoai_key UNIQUE (so_dien_thoai);


--
-- Name: claim_yeucautuky claim_yeucautuky_so_hop_dong_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_yeucautuky
    ADD CONSTRAINT claim_yeucautuky_so_hop_dong_key UNIQUE (so_hop_dong);


--
-- Name: confirm_email_token confirm_email_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.confirm_email_token
    ADD CONSTRAINT confirm_email_token_pkey PRIMARY KEY (token);


--
-- Name: core_chitietcongviec core_chitietcongviec_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_chitietcongviec
    ADD CONSTRAINT core_chitietcongviec_pkey PRIMARY KEY (id);


--
-- Name: core_company core_company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_company
    ADD CONSTRAINT core_company_pkey PRIMARY KEY (id);


--
-- Name: core_district core_district_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_district
    ADD CONSTRAINT core_district_pkey PRIMARY KEY (id);


--
-- Name: core_googlevision core_googlevision_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_googlevision
    ADD CONSTRAINT core_googlevision_pkey PRIMARY KEY (id);


--
-- Name: core_linhvunghenghiep core_linhvunghenghiep_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_linhvunghenghiep
    ADD CONSTRAINT core_linhvunghenghiep_pkey PRIMARY KEY (id);


--
-- Name: core_nguoimuabaohiem core_nguoimuabaohiem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_nguoimuabaohiem
    ADD CONSTRAINT core_nguoimuabaohiem_pkey PRIMARY KEY (id);


--
-- Name: core_nguoimuabaohiemtam core_nguoimuabaohiemtam_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_nguoimuabaohiemtam
    ADD CONSTRAINT core_nguoimuabaohiemtam_pkey PRIMARY KEY (id);


--
-- Name: core_noidungnghenghiep core_noidungnghenghiep_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_noidungnghenghiep
    ADD CONSTRAINT core_noidungnghenghiep_pkey PRIMARY KEY (id);


--
-- Name: core_provincial core_provincial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_provincial
    ADD CONSTRAINT core_provincial_pkey PRIMARY KEY (id);


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
-- Name: homeinsurance_goisanphamchinh homeinsurance_goisanphamchinh_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homeinsurance_goisanphamchinh
    ADD CONSTRAINT homeinsurance_goisanphamchinh_pkey PRIMARY KEY (id);


--
-- Name: homeinsurance_goisanphamphu homeinsurance_goisanphamphu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homeinsurance_goisanphamphu
    ADD CONSTRAINT homeinsurance_goisanphamphu_pkey PRIMARY KEY (id);


--
-- Name: homeinsurance_nguoiduocbaohiem homeinsurance_nguoiduocbaohiem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homeinsurance_nguoiduocbaohiem
    ADD CONSTRAINT homeinsurance_nguoiduocbaohiem_pkey PRIMARY KEY (id);


--
-- Name: homeinsurance_nguoiduocbaohiemtam homeinsurance_nguoiduocbaohiemtam_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homeinsurance_nguoiduocbaohiemtam
    ADD CONSTRAINT homeinsurance_nguoiduocbaohiemtam_pkey PRIMARY KEY (id);


--
-- Name: homeinsurance_nguoithuhuong homeinsurance_nguoithuhuong_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homeinsurance_nguoithuhuong
    ADD CONSTRAINT homeinsurance_nguoithuhuong_pkey PRIMARY KEY (id);


--
-- Name: insurancecompany_insurancecompany insurancecompany_insurancecompany_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insurancecompany_insurancecompany
    ADD CONSTRAINT insurancecompany_insurancecompany_pkey PRIMARY KEY (id);


--
-- Name: investment_giatridautu investment_giatridautu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investment_giatridautu
    ADD CONSTRAINT investment_giatridautu_pkey PRIMARY KEY (id);


--
-- Name: investment_goisanphamchinh investment_goisanphamchinh_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investment_goisanphamchinh
    ADD CONSTRAINT investment_goisanphamchinh_pkey PRIMARY KEY (id);


--
-- Name: investment_goisanphamphu investment_goisanphamphu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investment_goisanphamphu
    ADD CONSTRAINT investment_goisanphamphu_pkey PRIMARY KEY (id);


--
-- Name: investment_laisuatthitruong investment_laisuatthitruong_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investment_laisuatthitruong
    ADD CONSTRAINT investment_laisuatthitruong_pkey PRIMARY KEY (id);


--
-- Name: investment_nguoiduocbaohiem investment_nguoiduocbaohiem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investment_nguoiduocbaohiem
    ADD CONSTRAINT investment_nguoiduocbaohiem_pkey PRIMARY KEY (id);


--
-- Name: investment_nguoiduocbaohiemtam investment_nguoiduocbaohiemtam_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investment_nguoiduocbaohiemtam
    ADD CONSTRAINT investment_nguoiduocbaohiemtam_pkey PRIMARY KEY (id);


--
-- Name: investment_nguoithuhuong investment_nguoithuhuong_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investment_nguoithuhuong
    ADD CONSTRAINT investment_nguoithuhuong_pkey PRIMARY KEY (id);


--
-- Name: investment_nguoithuhuongtam investment_nguoithuhuongtam_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investment_nguoithuhuongtam
    ADD CONSTRAINT investment_nguoithuhuongtam_pkey PRIMARY KEY (id);


--
-- Name: kienthuc_kienthuccategory kienthuc_kienthuccategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kienthuc_kienthuccategory
    ADD CONSTRAINT kienthuc_kienthuccategory_pkey PRIMARY KEY (id);


--
-- Name: kienthuc_kienthuccategory kienthuc_kienthuccategory_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kienthuc_kienthuccategory
    ADD CONSTRAINT kienthuc_kienthuccategory_slug_key UNIQUE (slug);


--
-- Name: kienthuc_kienthucmodel kienthuc_kienthucmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kienthuc_kienthucmodel
    ADD CONSTRAINT kienthuc_kienthucmodel_pkey PRIMARY KEY (id);


--
-- Name: kienthuc_kienthucmodel kienthuc_kienthucmodel_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kienthuc_kienthucmodel
    ADD CONSTRAINT kienthuc_kienthucmodel_slug_key UNIQUE (slug);


--
-- Name: notification notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (id);


--
-- Name: payment_dondathang payment_dondathang_ma_don_hang_bihama_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_dondathang
    ADD CONSTRAINT payment_dondathang_ma_don_hang_bihama_key UNIQUE (ma_don_hang_bihama);


--
-- Name: payment_dondathang payment_dondathang_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_dondathang
    ADD CONSTRAINT payment_dondathang_pkey PRIMARY KEY (id);


--
-- Name: payment_magiamgia payment_magiamgia_code_ma_giam_gia_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_magiamgia
    ADD CONSTRAINT payment_magiamgia_code_ma_giam_gia_key UNIQUE (code_ma_giam_gia);


--
-- Name: payment_magiamgia payment_magiamgia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_magiamgia
    ADD CONSTRAINT payment_magiamgia_pkey PRIMARY KEY (id);


--
-- Name: payment_taituc payment_taituc_ma_tai_tuc_bihama_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_taituc
    ADD CONSTRAINT payment_taituc_ma_tai_tuc_bihama_key UNIQUE (ma_tai_tuc_bihama);


--
-- Name: payment_taituc payment_taituc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_taituc
    ADD CONSTRAINT payment_taituc_pkey PRIMARY KEY (id);


--
-- Name: personalhealth_goisanphamchinh personalhealth_goisanphamchinh_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personalhealth_goisanphamchinh
    ADD CONSTRAINT personalhealth_goisanphamchinh_pkey PRIMARY KEY (id);


--
-- Name: personalhealth_goisanphamphu personalhealth_goisanphamphu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personalhealth_goisanphamphu
    ADD CONSTRAINT personalhealth_goisanphamphu_pkey PRIMARY KEY (id);


--
-- Name: personalhealth_nguoiduocbaohiem personalhealth_nguoiduocbaohiem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personalhealth_nguoiduocbaohiem
    ADD CONSTRAINT personalhealth_nguoiduocbaohiem_pkey PRIMARY KEY (id);


--
-- Name: personalhealth_nguoiduocbaohiemtam personalhealth_nguoiduocbaohiemtam_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personalhealth_nguoiduocbaohiemtam
    ADD CONSTRAINT personalhealth_nguoiduocbaohiemtam_pkey PRIMARY KEY (id);


--
-- Name: reset_token reset_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reset_token
    ADD CONSTRAINT reset_token_pkey PRIMARY KEY (reset_token);


--
-- Name: robot_robot1dautu robot_robot1dautu_ma_don_hang_bihama_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.robot_robot1dautu
    ADD CONSTRAINT robot_robot1dautu_ma_don_hang_bihama_key UNIQUE (ma_don_hang_bihama);


--
-- Name: robot_robot1dautu robot_robot1dautu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.robot_robot1dautu
    ADD CONSTRAINT robot_robot1dautu_pkey PRIMARY KEY (id);


--
-- Name: robot_robotchung robot_robotchung_ma_don_hang_bihama_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.robot_robotchung
    ADD CONSTRAINT robot_robotchung_ma_don_hang_bihama_key UNIQUE (ma_don_hang_bihama);


--
-- Name: robot_robotchung robot_robotchung_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.robot_robotchung
    ADD CONSTRAINT robot_robotchung_pkey PRIMARY KEY (id);


--
-- Name: termlife_goisanphamchinh termlife_goisanphamchinh_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termlife_goisanphamchinh
    ADD CONSTRAINT termlife_goisanphamchinh_pkey PRIMARY KEY (id);


--
-- Name: termlife_goisanphamphu termlife_goisanphamphu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termlife_goisanphamphu
    ADD CONSTRAINT termlife_goisanphamphu_pkey PRIMARY KEY (id);


--
-- Name: termlife_nguoiduocbaohiem termlife_nguoiduocbaohiem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termlife_nguoiduocbaohiem
    ADD CONSTRAINT termlife_nguoiduocbaohiem_pkey PRIMARY KEY (id);


--
-- Name: termlife_nguoiduocbaohiemtam termlife_nguoiduocbaohiemtam_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termlife_nguoiduocbaohiemtam
    ADD CONSTRAINT termlife_nguoiduocbaohiemtam_pkey PRIMARY KEY (id);


--
-- Name: termlife_nguoithuhuong termlife_nguoithuhuong_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termlife_nguoithuhuong
    ADD CONSTRAINT termlife_nguoithuhuong_pkey PRIMARY KEY (id);


--
-- Name: termlife_nguoithuhuongtam termlife_nguoithuhuongtam_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termlife_nguoithuhuongtam
    ADD CONSTRAINT termlife_nguoithuhuongtam_pkey PRIMARY KEY (id);


--
-- Name: tndsoto_goisanphamchinh tndsoto_goisanphamchinh_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tndsoto_goisanphamchinh
    ADD CONSTRAINT tndsoto_goisanphamchinh_pkey PRIMARY KEY (id);


--
-- Name: tndsoto_goisanphamphu tndsoto_goisanphamphu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tndsoto_goisanphamphu
    ADD CONSTRAINT tndsoto_goisanphamphu_pkey PRIMARY KEY (id);


--
-- Name: tndsoto_nguoiduocbaohiem tndsoto_nguoiduocbaohiem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tndsoto_nguoiduocbaohiem
    ADD CONSTRAINT tndsoto_nguoiduocbaohiem_pkey PRIMARY KEY (id);


--
-- Name: tndsoto_nguoiduocbaohiemtam tndsoto_nguoiduocbaohiemtam_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tndsoto_nguoiduocbaohiemtam
    ADD CONSTRAINT tndsoto_nguoiduocbaohiemtam_pkey PRIMARY KEY (id);


--
-- Name: tndsxemay_goisanphamchinh tndsxemay_goisanphamchinh_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tndsxemay_goisanphamchinh
    ADD CONSTRAINT tndsxemay_goisanphamchinh_pkey PRIMARY KEY (id);


--
-- Name: tndsxemay_goisanphamphu tndsxemay_goisanphamphu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tndsxemay_goisanphamphu
    ADD CONSTRAINT tndsxemay_goisanphamphu_pkey PRIMARY KEY (id);


--
-- Name: tndsxemay_nguoiduocbaohiem tndsxemay_nguoiduocbaohiem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tndsxemay_nguoiduocbaohiem
    ADD CONSTRAINT tndsxemay_nguoiduocbaohiem_pkey PRIMARY KEY (id);


--
-- Name: tndsxemay_nguoiduocbaohiemtam tndsxemay_nguoiduocbaohiemtam_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tndsxemay_nguoiduocbaohiemtam
    ADD CONSTRAINT tndsxemay_nguoiduocbaohiemtam_pkey PRIMARY KEY (id);


--
-- Name: token token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token
    ADD CONSTRAINT token_pkey PRIMARY KEY (key);


--
-- Name: user_notification user_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_notification
    ADD CONSTRAINT user_notification_pkey PRIMARY KEY (id);


--
-- Name: users_bankaccount users_bankaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_bankaccount
    ADD CONSTRAINT users_bankaccount_pkey PRIMARY KEY (id);


--
-- Name: users_countotp users_countotp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_countotp
    ADD CONSTRAINT users_countotp_pkey PRIMARY KEY (id);


--
-- Name: users_forgotpassword users_forgotpassword_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_forgotpassword
    ADD CONSTRAINT users_forgotpassword_pkey PRIMARY KEY (id);


--
-- Name: users_lenhruttien users_lenhruttien_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_lenhruttien
    ADD CONSTRAINT users_lenhruttien_pkey PRIMARY KEY (id);


--
-- Name: users_loginhistory users_loginhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_loginhistory
    ADD CONSTRAINT users_loginhistory_pkey PRIMARY KEY (id);


--
-- Name: users_odertutorial users_odertutorial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_odertutorial
    ADD CONSTRAINT users_odertutorial_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: users_user users_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);


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
-- Name: claim_yeucaubaolanhvienphi_ho_ten_nguoi_khai_bao_dbf2eafa_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucaubaolanhvienphi_ho_ten_nguoi_khai_bao_dbf2eafa_like ON public.claim_yeucaubaolanhvienphi USING btree (ho_ten_nguoi_khai_bao varchar_pattern_ops);


--
-- Name: claim_yeucaubaolanhvienphi_so_dien_thoai_83530ee1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucaubaolanhvienphi_so_dien_thoai_83530ee1_like ON public.claim_yeucaubaolanhvienphi USING btree (so_dien_thoai varchar_pattern_ops);


--
-- Name: claim_yeucaubaolanhvienphi_so_hop_dong_09449df5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucaubaolanhvienphi_so_hop_dong_09449df5_like ON public.claim_yeucaubaolanhvienphi USING btree (so_hop_dong varchar_pattern_ops);


--
-- Name: claim_yeucaubaolanhvienphi_so_the_bao_hiem_787902c5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucaubaolanhvienphi_so_the_bao_hiem_787902c5_like ON public.claim_yeucaubaolanhvienphi USING btree (so_the_bao_hiem varchar_pattern_ops);


--
-- Name: claim_yeucauchung_nguoi_khai_bao_9113982b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucauchung_nguoi_khai_bao_9113982b_like ON public.claim_yeucauchung USING btree (nguoi_khai_bao varchar_pattern_ops);


--
-- Name: claim_yeucauchung_so_dien_thoai_5e7f56e7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucauchung_so_dien_thoai_5e7f56e7_like ON public.claim_yeucauchung USING btree (so_dien_thoai varchar_pattern_ops);


--
-- Name: claim_yeucauchung_so_giay_chung_nhan_bao_hiem_3893aed1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucauchung_so_giay_chung_nhan_bao_hiem_3893aed1_like ON public.claim_yeucauchung USING btree (so_giay_chung_nhan_bao_hiem varchar_pattern_ops);


--
-- Name: claim_yeucaunhatunhan_chon_phuong_thuc_nhan_tien_0111738e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucaunhatunhan_chon_phuong_thuc_nhan_tien_0111738e_like ON public.claim_yeucaunhatunhan USING btree (chon_phuong_thuc_nhan_tien varchar_pattern_ops);


--
-- Name: claim_yeucaunhatunhan_dia_chi_90aad5df_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucaunhatunhan_dia_chi_90aad5df_like ON public.claim_yeucaunhatunhan USING btree (dia_chi varchar_pattern_ops);


--
-- Name: claim_yeucaunhatunhan_dia_chi_ton_that_5e534c71_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucaunhatunhan_dia_chi_ton_that_5e534c71_like ON public.claim_yeucaunhatunhan USING btree (dia_chi_ton_that varchar_pattern_ops);


--
-- Name: claim_yeucaunhatunhan_ho_ten_nguoi_khai_bao_d290121e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucaunhatunhan_ho_ten_nguoi_khai_bao_d290121e_like ON public.claim_yeucaunhatunhan USING btree (ho_ten_nguoi_khai_bao varchar_pattern_ops);


--
-- Name: claim_yeucaunhatunhan_so_dien_thoai_08dcdf12_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucaunhatunhan_so_dien_thoai_08dcdf12_like ON public.claim_yeucaunhatunhan USING btree (so_dien_thoai varchar_pattern_ops);


--
-- Name: claim_yeucaunhatunhan_so_hop_dong_25d4026d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucaunhatunhan_so_hop_dong_25d4026d_like ON public.claim_yeucaunhatunhan USING btree (so_hop_dong varchar_pattern_ops);


--
-- Name: claim_yeucauoto_dia_chi_c79a3791_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucauoto_dia_chi_c79a3791_like ON public.claim_yeucauoto USING btree (dia_chi varchar_pattern_ops);


--
-- Name: claim_yeucauoto_ho_ten_nguoi_khai_bao_8958c9ad_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucauoto_ho_ten_nguoi_khai_bao_8958c9ad_like ON public.claim_yeucauoto USING btree (ho_ten_nguoi_khai_bao varchar_pattern_ops);


--
-- Name: claim_yeucauoto_so_dien_thoai_ebb486f7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucauoto_so_dien_thoai_ebb486f7_like ON public.claim_yeucauoto USING btree (so_dien_thoai varchar_pattern_ops);


--
-- Name: claim_yeucauoto_so_hop_dong_5cba8d89_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucauoto_so_hop_dong_5cba8d89_like ON public.claim_yeucauoto USING btree (so_hop_dong varchar_pattern_ops);


--
-- Name: claim_yeucausuckhoe_ho_ten_nguoi_khai_bao_b867fcdf_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucausuckhoe_ho_ten_nguoi_khai_bao_b867fcdf_like ON public.claim_yeucausuckhoe USING btree (ho_ten_nguoi_khai_bao varchar_pattern_ops);


--
-- Name: claim_yeucausuckhoe_so_dien_thoai_9c323730_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucausuckhoe_so_dien_thoai_9c323730_like ON public.claim_yeucausuckhoe USING btree (so_dien_thoai varchar_pattern_ops);


--
-- Name: claim_yeucausuckhoe_so_hop_dong_009bcfe6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucausuckhoe_so_hop_dong_009bcfe6_like ON public.claim_yeucausuckhoe USING btree (so_hop_dong varchar_pattern_ops);


--
-- Name: claim_yeucausuckhoe_so_the_bao_hiem_72a8f62a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucausuckhoe_so_the_bao_hiem_72a8f62a_like ON public.claim_yeucausuckhoe USING btree (so_the_bao_hiem varchar_pattern_ops);


--
-- Name: claim_yeucautainancanhan_ho_ten_nguoi_khai_bao_ac1a0962_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucautainancanhan_ho_ten_nguoi_khai_bao_ac1a0962_like ON public.claim_yeucautainancanhan USING btree (ho_ten_nguoi_khai_bao varchar_pattern_ops);


--
-- Name: claim_yeucautainancanhan_so_dien_thoai_eff3359c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucautainancanhan_so_dien_thoai_eff3359c_like ON public.claim_yeucautainancanhan USING btree (so_dien_thoai varchar_pattern_ops);


--
-- Name: claim_yeucautainancanhan_so_hop_dong_c4d5754e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucautainancanhan_so_hop_dong_c4d5754e_like ON public.claim_yeucautainancanhan USING btree (so_hop_dong varchar_pattern_ops);


--
-- Name: claim_yeucautainancanhan_so_the_bao_hiem_e3f6adb1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucautainancanhan_so_the_bao_hiem_e3f6adb1_like ON public.claim_yeucautainancanhan USING btree (so_the_bao_hiem varchar_pattern_ops);


--
-- Name: claim_yeucautuky_dia_chi_f856526a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucautuky_dia_chi_f856526a_like ON public.claim_yeucautuky USING btree (dia_chi varchar_pattern_ops);


--
-- Name: claim_yeucautuky_ho_ten_nguoi_khai_bao_1cc4e523_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucautuky_ho_ten_nguoi_khai_bao_1cc4e523_like ON public.claim_yeucautuky USING btree (ho_ten_nguoi_khai_bao varchar_pattern_ops);


--
-- Name: claim_yeucautuky_so_dien_thoai_893b74d9_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucautuky_so_dien_thoai_893b74d9_like ON public.claim_yeucautuky USING btree (so_dien_thoai varchar_pattern_ops);


--
-- Name: claim_yeucautuky_so_hop_dong_3c819856_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX claim_yeucautuky_so_hop_dong_3c819856_like ON public.claim_yeucautuky USING btree (so_hop_dong varchar_pattern_ops);


--
-- Name: confirm_email_token_token_5b011d0e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX confirm_email_token_token_5b011d0e_like ON public.confirm_email_token USING btree (token varchar_pattern_ops);


--
-- Name: confirm_email_token_user_id_a738242a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX confirm_email_token_user_id_a738242a ON public.confirm_email_token USING btree (user_id);


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
-- Name: homeinsurance_goisanphamchinh_company_id_6ed982ca; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX homeinsurance_goisanphamchinh_company_id_6ed982ca ON public.homeinsurance_goisanphamchinh USING btree (company_id);


--
-- Name: homeinsurance_goisanphamphu_company_id_bbcdc8a9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX homeinsurance_goisanphamphu_company_id_bbcdc8a9 ON public.homeinsurance_goisanphamphu USING btree (company_id);


--
-- Name: homeinsurance_nguoiduocbao_nguoimuabaohiemtam_id_736a7bcf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX homeinsurance_nguoiduocbao_nguoimuabaohiemtam_id_736a7bcf ON public.homeinsurance_nguoiduocbaohiemtam USING btree (nguoimuabaohiemtam_id);


--
-- Name: homeinsurance_nguoiduocbaohiem_nguoimuabaohiem_id_1c9c4238; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX homeinsurance_nguoiduocbaohiem_nguoimuabaohiem_id_1c9c4238 ON public.homeinsurance_nguoiduocbaohiem USING btree (nguoimuabaohiem_id);


--
-- Name: homeinsurance_nguoithuhuong_nguoiduocbaohiem_id_a7034773; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX homeinsurance_nguoithuhuong_nguoiduocbaohiem_id_a7034773 ON public.homeinsurance_nguoithuhuong USING btree (nguoiduocbaohiem_id);


--
-- Name: investment_goisanphamchinh_company_id_4b0f8e3c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX investment_goisanphamchinh_company_id_4b0f8e3c ON public.investment_goisanphamchinh USING btree (company_id);


--
-- Name: investment_goisanphamphu_company_id_efb31671; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX investment_goisanphamphu_company_id_efb31671 ON public.investment_goisanphamphu USING btree (company_id);


--
-- Name: investment_nguoiduocbaohiem_nguoimuabaohiem_id_bf1c2183; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX investment_nguoiduocbaohiem_nguoimuabaohiem_id_bf1c2183 ON public.investment_nguoiduocbaohiem USING btree (nguoimuabaohiem_id);


--
-- Name: investment_nguoiduocbaohiemtam_nguoimuabaohiemtam_id_fc0b98c6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX investment_nguoiduocbaohiemtam_nguoimuabaohiemtam_id_fc0b98c6 ON public.investment_nguoiduocbaohiemtam USING btree (nguoimuabaohiemtam_id);


--
-- Name: investment_nguoithuhuong_nguoiduocbaohiem_id_96976c0b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX investment_nguoithuhuong_nguoiduocbaohiem_id_96976c0b ON public.investment_nguoithuhuong USING btree (nguoiduocbaohiem_id);


--
-- Name: investment_nguoithuhuongtam_nguoiduocbaohiemtam_id_6f8af1f9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX investment_nguoithuhuongtam_nguoiduocbaohiemtam_id_6f8af1f9 ON public.investment_nguoithuhuongtam USING btree (nguoiduocbaohiemtam_id);


--
-- Name: kienthuc_kienthuccategory_slug_26cf1fbf_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kienthuc_kienthuccategory_slug_26cf1fbf_like ON public.kienthuc_kienthuccategory USING btree (slug varchar_pattern_ops);


--
-- Name: kienthuc_kienthucmodel_category_id_8fb30942; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kienthuc_kienthucmodel_category_id_8fb30942 ON public.kienthuc_kienthucmodel USING btree (category_id);


--
-- Name: kienthuc_kienthucmodel_slug_121c7b22_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kienthuc_kienthucmodel_slug_121c7b22_like ON public.kienthuc_kienthucmodel USING btree (slug varchar_pattern_ops);


--
-- Name: payment_dondathang_ma_don_hang_bihama_53585625_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payment_dondathang_ma_don_hang_bihama_53585625_like ON public.payment_dondathang USING btree (ma_don_hang_bihama varchar_pattern_ops);


--
-- Name: payment_dondathang_nguoimuabaohiem_id_1b441728; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payment_dondathang_nguoimuabaohiem_id_1b441728 ON public.payment_dondathang USING btree (nguoimuabaohiem_id);


--
-- Name: payment_dondathang_user_id_4bb43c9e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payment_dondathang_user_id_4bb43c9e ON public.payment_dondathang USING btree (user_id);


--
-- Name: payment_magiamgia_code_ma_giam_gia_06357485_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payment_magiamgia_code_ma_giam_gia_06357485_like ON public.payment_magiamgia USING btree (code_ma_giam_gia varchar_pattern_ops);


--
-- Name: payment_taituc_dondathang_id_2a971f47; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payment_taituc_dondathang_id_2a971f47 ON public.payment_taituc USING btree (dondathang_id);


--
-- Name: payment_taituc_ma_tai_tuc_bihama_070859f4_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payment_taituc_ma_tai_tuc_bihama_070859f4_like ON public.payment_taituc USING btree (ma_tai_tuc_bihama varchar_pattern_ops);


--
-- Name: personalhealth_goisanphamchinh_company_id_babf05cb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personalhealth_goisanphamchinh_company_id_babf05cb ON public.personalhealth_goisanphamchinh USING btree (company_id);


--
-- Name: personalhealth_goisanphamphu_company_id_0b31f8e7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personalhealth_goisanphamphu_company_id_0b31f8e7 ON public.personalhealth_goisanphamphu USING btree (company_id);


--
-- Name: personalhealth_nguoiduocba_nguoimuabaohiemtam_id_7b7cb92f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personalhealth_nguoiduocba_nguoimuabaohiemtam_id_7b7cb92f ON public.personalhealth_nguoiduocbaohiemtam USING btree (nguoimuabaohiemtam_id);


--
-- Name: personalhealth_nguoiduocbaohiem_nguoimuabaohiem_id_b60f933a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personalhealth_nguoiduocbaohiem_nguoimuabaohiem_id_b60f933a ON public.personalhealth_nguoiduocbaohiem USING btree (nguoimuabaohiem_id);


--
-- Name: reset_token_reset_token_23a1de31_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reset_token_reset_token_23a1de31_like ON public.reset_token USING btree (reset_token varchar_pattern_ops);


--
-- Name: reset_token_user_id_aae5d20a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reset_token_user_id_aae5d20a ON public.reset_token USING btree (user_id);


--
-- Name: robot_robot1dautu_ma_don_hang_bihama_0ea17a20_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX robot_robot1dautu_ma_don_hang_bihama_0ea17a20_like ON public.robot_robot1dautu USING btree (ma_don_hang_bihama varchar_pattern_ops);


--
-- Name: robot_robotchung_ma_don_hang_bihama_b84967de_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX robot_robotchung_ma_don_hang_bihama_b84967de_like ON public.robot_robotchung USING btree (ma_don_hang_bihama varchar_pattern_ops);


--
-- Name: termlife_goisanphamchinh_company_id_8b6deac0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX termlife_goisanphamchinh_company_id_8b6deac0 ON public.termlife_goisanphamchinh USING btree (company_id);


--
-- Name: termlife_goisanphamphu_company_id_cf225ec9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX termlife_goisanphamphu_company_id_cf225ec9 ON public.termlife_goisanphamphu USING btree (company_id);


--
-- Name: termlife_nguoiduocbaohiem_nguoimuabaohiem_id_1189152d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX termlife_nguoiduocbaohiem_nguoimuabaohiem_id_1189152d ON public.termlife_nguoiduocbaohiem USING btree (nguoimuabaohiem_id);


--
-- Name: termlife_nguoiduocbaohiemtam_nguoimuabaohiemtam_id_8f7e0688; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX termlife_nguoiduocbaohiemtam_nguoimuabaohiemtam_id_8f7e0688 ON public.termlife_nguoiduocbaohiemtam USING btree (nguoimuabaohiemtam_id);


--
-- Name: termlife_nguoithuhuong_nguoiduocbaohiem_id_ae13bb79; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX termlife_nguoithuhuong_nguoiduocbaohiem_id_ae13bb79 ON public.termlife_nguoithuhuong USING btree (nguoiduocbaohiem_id);


--
-- Name: termlife_nguoithuhuongtam_nguoiduocbaohiemtam_id_79e052ef; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX termlife_nguoithuhuongtam_nguoiduocbaohiemtam_id_79e052ef ON public.termlife_nguoithuhuongtam USING btree (nguoiduocbaohiemtam_id);


--
-- Name: tndsoto_goisanphamchinh_company_id_0a47f06c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tndsoto_goisanphamchinh_company_id_0a47f06c ON public.tndsoto_goisanphamchinh USING btree (company_id);


--
-- Name: tndsoto_goisanphamphu_company_id_fd854b4e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tndsoto_goisanphamphu_company_id_fd854b4e ON public.tndsoto_goisanphamphu USING btree (company_id);


--
-- Name: tndsoto_nguoiduocbaohiem_nguoimuabaohiem_id_7ca949ba; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tndsoto_nguoiduocbaohiem_nguoimuabaohiem_id_7ca949ba ON public.tndsoto_nguoiduocbaohiem USING btree (nguoimuabaohiem_id);


--
-- Name: tndsoto_nguoiduocbaohiemtam_nguoimuabaohiemtam_id_4c05a41a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tndsoto_nguoiduocbaohiemtam_nguoimuabaohiemtam_id_4c05a41a ON public.tndsoto_nguoiduocbaohiemtam USING btree (nguoimuabaohiemtam_id);


--
-- Name: tndsxemay_goisanphamchinh_company_id_76631f68; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tndsxemay_goisanphamchinh_company_id_76631f68 ON public.tndsxemay_goisanphamchinh USING btree (company_id);


--
-- Name: tndsxemay_goisanphamphu_company_id_bc899751; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tndsxemay_goisanphamphu_company_id_bc899751 ON public.tndsxemay_goisanphamphu USING btree (company_id);


--
-- Name: tndsxemay_nguoiduocbaohiem_nguoimuabaohiem_id_39904c5f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tndsxemay_nguoiduocbaohiem_nguoimuabaohiem_id_39904c5f ON public.tndsxemay_nguoiduocbaohiem USING btree (nguoimuabaohiem_id);


--
-- Name: tndsxemay_nguoiduocbaohiemtam_nguoimuabaohiemtam_id_91244fe5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tndsxemay_nguoiduocbaohiemtam_nguoimuabaohiemtam_id_91244fe5 ON public.tndsxemay_nguoiduocbaohiemtam USING btree (nguoimuabaohiemtam_id);


--
-- Name: token_key_86d3c722_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX token_key_86d3c722_like ON public.token USING btree (key varchar_pattern_ops);


--
-- Name: token_user_id_1c65fba4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX token_user_id_1c65fba4 ON public.token USING btree (user_id);


--
-- Name: user_notification_notification_id_02fe6489; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_notification_notification_id_02fe6489 ON public.user_notification USING btree (notification_id);


--
-- Name: user_notification_user_id_66a31b4a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_notification_user_id_66a31b4a ON public.user_notification USING btree (user_id);


--
-- Name: users_bankaccount_ctv_id_54a3f3da; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_bankaccount_ctv_id_54a3f3da ON public.users_bankaccount USING btree (ctv_id);


--
-- Name: users_forgotpassword_user_id_c1001e05; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_forgotpassword_user_id_c1001e05 ON public.users_forgotpassword USING btree (user_id);


--
-- Name: users_lenhruttien_bank_account_id_5b96f45c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_lenhruttien_bank_account_id_5b96f45c ON public.users_lenhruttien USING btree (bank_account_id);


--
-- Name: users_loginhistory_user_id_9e68879b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_loginhistory_user_id_9e68879b ON public.users_loginhistory USING btree (user_id);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: users_user_username_06e46fe6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_username_06e46fe6_like ON public.users_user USING btree (username varchar_pattern_ops);


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
-- Name: confirm_email_token confirm_email_token_user_id_a738242a_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.confirm_email_token
    ADD CONSTRAINT confirm_email_token_user_id_a738242a_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: homeinsurance_goisanphamchinh homeinsurance_goisan_company_id_6ed982ca_fk_core_comp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homeinsurance_goisanphamchinh
    ADD CONSTRAINT homeinsurance_goisan_company_id_6ed982ca_fk_core_comp FOREIGN KEY (company_id) REFERENCES public.core_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: homeinsurance_goisanphamphu homeinsurance_goisan_company_id_bbcdc8a9_fk_core_comp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homeinsurance_goisanphamphu
    ADD CONSTRAINT homeinsurance_goisan_company_id_bbcdc8a9_fk_core_comp FOREIGN KEY (company_id) REFERENCES public.core_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: homeinsurance_nguoiduocbaohiem homeinsurance_nguoid_nguoimuabaohiem_id_1c9c4238_fk_core_nguo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homeinsurance_nguoiduocbaohiem
    ADD CONSTRAINT homeinsurance_nguoid_nguoimuabaohiem_id_1c9c4238_fk_core_nguo FOREIGN KEY (nguoimuabaohiem_id) REFERENCES public.core_nguoimuabaohiem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: homeinsurance_nguoiduocbaohiemtam homeinsurance_nguoid_nguoimuabaohiemtam_i_736a7bcf_fk_core_nguo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homeinsurance_nguoiduocbaohiemtam
    ADD CONSTRAINT homeinsurance_nguoid_nguoimuabaohiemtam_i_736a7bcf_fk_core_nguo FOREIGN KEY (nguoimuabaohiemtam_id) REFERENCES public.core_nguoimuabaohiemtam(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: homeinsurance_nguoithuhuong homeinsurance_nguoit_nguoiduocbaohiem_id_a7034773_fk_homeinsur; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homeinsurance_nguoithuhuong
    ADD CONSTRAINT homeinsurance_nguoit_nguoiduocbaohiem_id_a7034773_fk_homeinsur FOREIGN KEY (nguoiduocbaohiem_id) REFERENCES public.homeinsurance_nguoiduocbaohiem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: investment_goisanphamchinh investment_goisanpha_company_id_4b0f8e3c_fk_core_comp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investment_goisanphamchinh
    ADD CONSTRAINT investment_goisanpha_company_id_4b0f8e3c_fk_core_comp FOREIGN KEY (company_id) REFERENCES public.core_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: investment_goisanphamphu investment_goisanphamphu_company_id_efb31671_fk_core_company_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investment_goisanphamphu
    ADD CONSTRAINT investment_goisanphamphu_company_id_efb31671_fk_core_company_id FOREIGN KEY (company_id) REFERENCES public.core_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: investment_nguoiduocbaohiem investment_nguoiduoc_nguoimuabaohiem_id_bf1c2183_fk_core_nguo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investment_nguoiduocbaohiem
    ADD CONSTRAINT investment_nguoiduoc_nguoimuabaohiem_id_bf1c2183_fk_core_nguo FOREIGN KEY (nguoimuabaohiem_id) REFERENCES public.core_nguoimuabaohiem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: investment_nguoiduocbaohiemtam investment_nguoiduoc_nguoimuabaohiemtam_i_fc0b98c6_fk_core_nguo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investment_nguoiduocbaohiemtam
    ADD CONSTRAINT investment_nguoiduoc_nguoimuabaohiemtam_i_fc0b98c6_fk_core_nguo FOREIGN KEY (nguoimuabaohiemtam_id) REFERENCES public.core_nguoimuabaohiemtam(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: investment_nguoithuhuong investment_nguoithuh_nguoiduocbaohiem_id_96976c0b_fk_investmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investment_nguoithuhuong
    ADD CONSTRAINT investment_nguoithuh_nguoiduocbaohiem_id_96976c0b_fk_investmen FOREIGN KEY (nguoiduocbaohiem_id) REFERENCES public.investment_nguoiduocbaohiem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: investment_nguoithuhuongtam investment_nguoithuh_nguoiduocbaohiemtam__6f8af1f9_fk_investmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investment_nguoithuhuongtam
    ADD CONSTRAINT investment_nguoithuh_nguoiduocbaohiemtam__6f8af1f9_fk_investmen FOREIGN KEY (nguoiduocbaohiemtam_id) REFERENCES public.investment_nguoiduocbaohiemtam(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kienthuc_kienthucmodel kienthuc_kienthucmod_category_id_8fb30942_fk_kienthuc_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kienthuc_kienthucmodel
    ADD CONSTRAINT kienthuc_kienthucmod_category_id_8fb30942_fk_kienthuc_ FOREIGN KEY (category_id) REFERENCES public.kienthuc_kienthuccategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payment_dondathang payment_dondathang_nguoimuabaohiem_id_1b441728_fk_core_nguo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_dondathang
    ADD CONSTRAINT payment_dondathang_nguoimuabaohiem_id_1b441728_fk_core_nguo FOREIGN KEY (nguoimuabaohiem_id) REFERENCES public.core_nguoimuabaohiem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payment_dondathang payment_dondathang_user_id_4bb43c9e_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_dondathang
    ADD CONSTRAINT payment_dondathang_user_id_4bb43c9e_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payment_taituc payment_taituc_dondathang_id_2a971f47_fk_payment_dondathang_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_taituc
    ADD CONSTRAINT payment_taituc_dondathang_id_2a971f47_fk_payment_dondathang_id FOREIGN KEY (dondathang_id) REFERENCES public.payment_dondathang(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: personalhealth_goisanphamphu personalhealth_goisa_company_id_0b31f8e7_fk_core_comp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personalhealth_goisanphamphu
    ADD CONSTRAINT personalhealth_goisa_company_id_0b31f8e7_fk_core_comp FOREIGN KEY (company_id) REFERENCES public.core_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: personalhealth_goisanphamchinh personalhealth_goisa_company_id_babf05cb_fk_core_comp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personalhealth_goisanphamchinh
    ADD CONSTRAINT personalhealth_goisa_company_id_babf05cb_fk_core_comp FOREIGN KEY (company_id) REFERENCES public.core_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: personalhealth_nguoiduocbaohiem personalhealth_nguoi_nguoimuabaohiem_id_b60f933a_fk_core_nguo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personalhealth_nguoiduocbaohiem
    ADD CONSTRAINT personalhealth_nguoi_nguoimuabaohiem_id_b60f933a_fk_core_nguo FOREIGN KEY (nguoimuabaohiem_id) REFERENCES public.core_nguoimuabaohiem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: personalhealth_nguoiduocbaohiemtam personalhealth_nguoi_nguoimuabaohiemtam_i_7b7cb92f_fk_core_nguo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personalhealth_nguoiduocbaohiemtam
    ADD CONSTRAINT personalhealth_nguoi_nguoimuabaohiemtam_i_7b7cb92f_fk_core_nguo FOREIGN KEY (nguoimuabaohiemtam_id) REFERENCES public.core_nguoimuabaohiemtam(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reset_token reset_token_user_id_aae5d20a_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reset_token
    ADD CONSTRAINT reset_token_user_id_aae5d20a_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: termlife_goisanphamchinh termlife_goisanphamchinh_company_id_8b6deac0_fk_core_company_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termlife_goisanphamchinh
    ADD CONSTRAINT termlife_goisanphamchinh_company_id_8b6deac0_fk_core_company_id FOREIGN KEY (company_id) REFERENCES public.core_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: termlife_goisanphamphu termlife_goisanphamphu_company_id_cf225ec9_fk_core_company_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termlife_goisanphamphu
    ADD CONSTRAINT termlife_goisanphamphu_company_id_cf225ec9_fk_core_company_id FOREIGN KEY (company_id) REFERENCES public.core_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: termlife_nguoiduocbaohiem termlife_nguoiduocba_nguoimuabaohiem_id_1189152d_fk_core_nguo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termlife_nguoiduocbaohiem
    ADD CONSTRAINT termlife_nguoiduocba_nguoimuabaohiem_id_1189152d_fk_core_nguo FOREIGN KEY (nguoimuabaohiem_id) REFERENCES public.core_nguoimuabaohiem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: termlife_nguoiduocbaohiemtam termlife_nguoiduocba_nguoimuabaohiemtam_i_8f7e0688_fk_core_nguo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termlife_nguoiduocbaohiemtam
    ADD CONSTRAINT termlife_nguoiduocba_nguoimuabaohiemtam_i_8f7e0688_fk_core_nguo FOREIGN KEY (nguoimuabaohiemtam_id) REFERENCES public.core_nguoimuabaohiemtam(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: termlife_nguoithuhuong termlife_nguoithuhuo_nguoiduocbaohiem_id_ae13bb79_fk_termlife_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termlife_nguoithuhuong
    ADD CONSTRAINT termlife_nguoithuhuo_nguoiduocbaohiem_id_ae13bb79_fk_termlife_ FOREIGN KEY (nguoiduocbaohiem_id) REFERENCES public.termlife_nguoiduocbaohiem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: termlife_nguoithuhuongtam termlife_nguoithuhuo_nguoiduocbaohiemtam__79e052ef_fk_termlife_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termlife_nguoithuhuongtam
    ADD CONSTRAINT termlife_nguoithuhuo_nguoiduocbaohiemtam__79e052ef_fk_termlife_ FOREIGN KEY (nguoiduocbaohiemtam_id) REFERENCES public.termlife_nguoiduocbaohiemtam(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tndsoto_goisanphamchinh tndsoto_goisanphamchinh_company_id_0a47f06c_fk_core_company_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tndsoto_goisanphamchinh
    ADD CONSTRAINT tndsoto_goisanphamchinh_company_id_0a47f06c_fk_core_company_id FOREIGN KEY (company_id) REFERENCES public.core_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tndsoto_goisanphamphu tndsoto_goisanphamphu_company_id_fd854b4e_fk_core_company_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tndsoto_goisanphamphu
    ADD CONSTRAINT tndsoto_goisanphamphu_company_id_fd854b4e_fk_core_company_id FOREIGN KEY (company_id) REFERENCES public.core_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tndsoto_nguoiduocbaohiem tndsoto_nguoiduocbao_nguoimuabaohiem_id_7ca949ba_fk_core_nguo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tndsoto_nguoiduocbaohiem
    ADD CONSTRAINT tndsoto_nguoiduocbao_nguoimuabaohiem_id_7ca949ba_fk_core_nguo FOREIGN KEY (nguoimuabaohiem_id) REFERENCES public.core_nguoimuabaohiem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tndsoto_nguoiduocbaohiemtam tndsoto_nguoiduocbao_nguoimuabaohiemtam_i_4c05a41a_fk_core_nguo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tndsoto_nguoiduocbaohiemtam
    ADD CONSTRAINT tndsoto_nguoiduocbao_nguoimuabaohiemtam_i_4c05a41a_fk_core_nguo FOREIGN KEY (nguoimuabaohiemtam_id) REFERENCES public.core_nguoimuabaohiemtam(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tndsxemay_goisanphamchinh tndsxemay_goisanpham_company_id_76631f68_fk_core_comp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tndsxemay_goisanphamchinh
    ADD CONSTRAINT tndsxemay_goisanpham_company_id_76631f68_fk_core_comp FOREIGN KEY (company_id) REFERENCES public.core_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tndsxemay_goisanphamphu tndsxemay_goisanphamphu_company_id_bc899751_fk_core_company_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tndsxemay_goisanphamphu
    ADD CONSTRAINT tndsxemay_goisanphamphu_company_id_bc899751_fk_core_company_id FOREIGN KEY (company_id) REFERENCES public.core_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tndsxemay_nguoiduocbaohiem tndsxemay_nguoiduocb_nguoimuabaohiem_id_39904c5f_fk_core_nguo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tndsxemay_nguoiduocbaohiem
    ADD CONSTRAINT tndsxemay_nguoiduocb_nguoimuabaohiem_id_39904c5f_fk_core_nguo FOREIGN KEY (nguoimuabaohiem_id) REFERENCES public.core_nguoimuabaohiem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tndsxemay_nguoiduocbaohiemtam tndsxemay_nguoiduocb_nguoimuabaohiemtam_i_91244fe5_fk_core_nguo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tndsxemay_nguoiduocbaohiemtam
    ADD CONSTRAINT tndsxemay_nguoiduocb_nguoimuabaohiemtam_i_91244fe5_fk_core_nguo FOREIGN KEY (nguoimuabaohiemtam_id) REFERENCES public.core_nguoimuabaohiemtam(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: token token_user_id_1c65fba4_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token
    ADD CONSTRAINT token_user_id_1c65fba4_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_notification user_notification_notification_id_02fe6489_fk_notification_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_notification
    ADD CONSTRAINT user_notification_notification_id_02fe6489_fk_notification_id FOREIGN KEY (notification_id) REFERENCES public.notification(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_notification user_notification_user_id_66a31b4a_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_notification
    ADD CONSTRAINT user_notification_user_id_66a31b4a_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_bankaccount users_bankaccount_ctv_id_54a3f3da_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_bankaccount
    ADD CONSTRAINT users_bankaccount_ctv_id_54a3f3da_fk_users_user_id FOREIGN KEY (ctv_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_forgotpassword users_forgotpassword_user_id_c1001e05_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_forgotpassword
    ADD CONSTRAINT users_forgotpassword_user_id_c1001e05_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_lenhruttien users_lenhruttien_bank_account_id_5b96f45c_fk_users_ban; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_lenhruttien
    ADD CONSTRAINT users_lenhruttien_bank_account_id_5b96f45c_fk_users_ban FOREIGN KEY (bank_account_id) REFERENCES public.users_bankaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_loginhistory users_loginhistory_user_id_9e68879b_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_loginhistory
    ADD CONSTRAINT users_loginhistory_user_id_9e68879b_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Debian 10.12-2.pgdg90+1)
-- Dumped by pg_dump version 10.12 (Debian 10.12-2.pgdg90+1)

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

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

