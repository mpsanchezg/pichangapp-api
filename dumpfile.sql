--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Ubuntu 15.4-2.pgdg20.04+1)
-- Dumped by pg_dump version 15.4 (Ubuntu 15.4-2.pgdg22.04+1)

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
-- Name: heroku_ext; Type: SCHEMA; Schema: -; Owner: u3iim5044eq77h
--

CREATE SCHEMA heroku_ext;


ALTER SCHEMA heroku_ext OWNER TO u3iim5044eq77h;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: efyzsjfynxiwjx
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO efyzsjfynxiwjx;

--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA heroku_ext;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: SCHEMA heroku_ext; Type: ACL; Schema: -; Owner: u3iim5044eq77h
--

GRANT USAGE ON SCHEMA heroku_ext TO efyzsjfynxiwjx;


--
-- Name: LANGUAGE plpgsql; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON LANGUAGE plpgsql TO efyzsjfynxiwjx;


--
-- PostgreSQL database dump complete
--

