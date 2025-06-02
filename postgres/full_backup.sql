--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

-- CREATE ROLE admin;
-- ALTER ROLE admin WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:B5iplo0Gbdgs9N9vZGIeDg==$+SN993aWdkfSImhrM76hMiJy2MUivC8ek6wBoFhgAnI=:TgZD4rcrmCWo2WvybAgOvsxmRzuivSy94RPvkFM3e7U=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4 (Debian 17.4-1.pgdg120+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

--
-- Database "admin" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4 (Debian 17.4-1.pgdg120+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: admin; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE admin WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE admin OWNER TO admin;

\connect admin

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

--
-- Database "keycloak" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4 (Debian 17.4-1.pgdg120+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: keycloak; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE keycloak WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE keycloak OWNER TO admin;

\connect keycloak

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO admin;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO admin;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO admin;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO admin;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO admin;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO admin;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO admin;

--
-- Name: client; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO admin;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.client_attributes OWNER TO admin;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO admin;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO admin;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO admin;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO admin;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO admin;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO admin;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO admin;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO admin;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO admin;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO admin;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO admin;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO admin;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO admin;

--
-- Name: component; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO admin;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.component_config OWNER TO admin;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO admin;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO admin;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO admin;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO admin;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO admin;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255),
    details_json_long_value text
);


ALTER TABLE public.event_entity OWNER TO admin;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024),
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.fed_user_attribute OWNER TO admin;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO admin;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO admin;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO admin;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO admin;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO admin;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO admin;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO admin;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO admin;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO admin;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO admin;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO admin;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO admin;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO admin;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO admin;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO admin;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO admin;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO admin;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO admin;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO admin;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO admin;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO admin;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO admin;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO admin;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO admin;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO admin;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO admin;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO admin;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO admin;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO admin;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO admin;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO admin;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO admin;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO admin;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO admin;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO admin;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO admin;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO admin;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO admin;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO admin;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO admin;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO admin;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO admin;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO admin;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO admin;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO admin;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO admin;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.user_attribute OWNER TO admin;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO admin;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO admin;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO admin;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO admin;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO admin;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO admin;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO admin;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO admin;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO admin;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO admin;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO admin;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO admin;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO admin;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO admin;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
3d91d93d-ec78-4da9-bed6-d1e9a962eb90	\N	auth-cookie	62eee42e-1836-4073-ba2c-4845df4bb81f	d2f9a516-ee50-4332-ab83-064c9e836a6e	2	10	f	\N	\N
03590a84-3571-4ef3-9519-8cc6ad4bbb1f	\N	auth-spnego	62eee42e-1836-4073-ba2c-4845df4bb81f	d2f9a516-ee50-4332-ab83-064c9e836a6e	3	20	f	\N	\N
9fe7ad30-c4f3-42d3-80df-f094c6e171ec	\N	identity-provider-redirector	62eee42e-1836-4073-ba2c-4845df4bb81f	d2f9a516-ee50-4332-ab83-064c9e836a6e	2	25	f	\N	\N
ad93fef8-00da-456d-993d-3b1380156899	\N	\N	62eee42e-1836-4073-ba2c-4845df4bb81f	d2f9a516-ee50-4332-ab83-064c9e836a6e	2	30	t	985cdeec-74ed-4789-8305-05857af94f15	\N
dbf9b77b-55ee-47d6-8a88-6e3fb1fe2947	\N	auth-username-password-form	62eee42e-1836-4073-ba2c-4845df4bb81f	985cdeec-74ed-4789-8305-05857af94f15	0	10	f	\N	\N
f569980d-eda1-4487-bcdd-fc79c3c8ea58	\N	\N	62eee42e-1836-4073-ba2c-4845df4bb81f	985cdeec-74ed-4789-8305-05857af94f15	1	20	t	6caaa3ae-8827-44b6-aefd-d7a4151f4d30	\N
f989c18b-9bc1-4c61-882d-fbaf9d148a93	\N	conditional-user-configured	62eee42e-1836-4073-ba2c-4845df4bb81f	6caaa3ae-8827-44b6-aefd-d7a4151f4d30	0	10	f	\N	\N
222496cf-374c-46b5-816b-92cc7cc09032	\N	auth-otp-form	62eee42e-1836-4073-ba2c-4845df4bb81f	6caaa3ae-8827-44b6-aefd-d7a4151f4d30	0	20	f	\N	\N
a06d5f28-94ed-4e43-b991-13143fbf80c5	\N	direct-grant-validate-username	62eee42e-1836-4073-ba2c-4845df4bb81f	6d891d07-9a44-4198-95c0-f5ac9f52c993	0	10	f	\N	\N
1d22a640-288f-4013-a51c-90d888ffa5b6	\N	direct-grant-validate-password	62eee42e-1836-4073-ba2c-4845df4bb81f	6d891d07-9a44-4198-95c0-f5ac9f52c993	0	20	f	\N	\N
bba16205-6eaf-4d36-9ff1-f42a74afc38a	\N	\N	62eee42e-1836-4073-ba2c-4845df4bb81f	6d891d07-9a44-4198-95c0-f5ac9f52c993	1	30	t	0556c626-7dbc-402f-b737-e7a18af68b6e	\N
95266825-58b5-405a-8d93-b5acd8bca2e3	\N	conditional-user-configured	62eee42e-1836-4073-ba2c-4845df4bb81f	0556c626-7dbc-402f-b737-e7a18af68b6e	0	10	f	\N	\N
8498c55c-5708-4d0e-bdf8-170c5b18c230	\N	direct-grant-validate-otp	62eee42e-1836-4073-ba2c-4845df4bb81f	0556c626-7dbc-402f-b737-e7a18af68b6e	0	20	f	\N	\N
a8b67a3f-7091-4bc5-a1fd-89b8847c3729	\N	registration-page-form	62eee42e-1836-4073-ba2c-4845df4bb81f	4f54ecb3-4d53-47fd-b015-ed9215878840	0	10	t	e310a9af-c1c2-4ea2-8440-364788d4ba24	\N
42d1811d-23fa-422a-b54f-10fff39b6e41	\N	registration-user-creation	62eee42e-1836-4073-ba2c-4845df4bb81f	e310a9af-c1c2-4ea2-8440-364788d4ba24	0	20	f	\N	\N
57c555bc-23c2-4efd-92d6-129d3bfaf042	\N	registration-password-action	62eee42e-1836-4073-ba2c-4845df4bb81f	e310a9af-c1c2-4ea2-8440-364788d4ba24	0	50	f	\N	\N
079e014d-300e-455b-9507-814d13017b72	\N	registration-recaptcha-action	62eee42e-1836-4073-ba2c-4845df4bb81f	e310a9af-c1c2-4ea2-8440-364788d4ba24	3	60	f	\N	\N
a85c2440-95b0-4266-8d8a-857f7d26c789	\N	registration-terms-and-conditions	62eee42e-1836-4073-ba2c-4845df4bb81f	e310a9af-c1c2-4ea2-8440-364788d4ba24	3	70	f	\N	\N
f2fbdab2-104b-4068-8e2f-9c7631754a1c	\N	reset-credentials-choose-user	62eee42e-1836-4073-ba2c-4845df4bb81f	a15a1c1c-4091-4065-9787-ac617c49bf7b	0	10	f	\N	\N
922e6a4e-abc0-447d-817f-b3ac2de5f61c	\N	reset-credential-email	62eee42e-1836-4073-ba2c-4845df4bb81f	a15a1c1c-4091-4065-9787-ac617c49bf7b	0	20	f	\N	\N
0f5feb62-ac08-4a49-a2d4-6a8c814e155f	\N	reset-password	62eee42e-1836-4073-ba2c-4845df4bb81f	a15a1c1c-4091-4065-9787-ac617c49bf7b	0	30	f	\N	\N
36e6f441-9a52-4e62-a4fc-8cd99d6a775d	\N	\N	62eee42e-1836-4073-ba2c-4845df4bb81f	a15a1c1c-4091-4065-9787-ac617c49bf7b	1	40	t	17aaf746-5aea-4929-a720-826110e81b13	\N
95359e2f-9ea6-4468-acae-dbc164c98f0f	\N	conditional-user-configured	62eee42e-1836-4073-ba2c-4845df4bb81f	17aaf746-5aea-4929-a720-826110e81b13	0	10	f	\N	\N
9b185772-d827-4296-a837-ccc89ef82823	\N	reset-otp	62eee42e-1836-4073-ba2c-4845df4bb81f	17aaf746-5aea-4929-a720-826110e81b13	0	20	f	\N	\N
39d6dbf5-7526-46a4-b5de-f4e65ae7e155	\N	client-secret	62eee42e-1836-4073-ba2c-4845df4bb81f	8261cb25-ccf8-469b-b0ee-0c2881314c61	2	10	f	\N	\N
6e869539-544f-43e0-b193-3d018f2ee51f	\N	client-jwt	62eee42e-1836-4073-ba2c-4845df4bb81f	8261cb25-ccf8-469b-b0ee-0c2881314c61	2	20	f	\N	\N
36b108ff-37ab-48f1-9fc3-488262d3e9ba	\N	client-secret-jwt	62eee42e-1836-4073-ba2c-4845df4bb81f	8261cb25-ccf8-469b-b0ee-0c2881314c61	2	30	f	\N	\N
a65ce2ac-c058-4c2d-a866-c23a36dd36d6	\N	client-x509	62eee42e-1836-4073-ba2c-4845df4bb81f	8261cb25-ccf8-469b-b0ee-0c2881314c61	2	40	f	\N	\N
0955dd92-33b5-416d-8d1d-d2a70a190fdd	\N	idp-review-profile	62eee42e-1836-4073-ba2c-4845df4bb81f	facb0ff9-4597-4aca-8a6b-1c1d254d63fe	0	10	f	\N	145d611a-5c3f-46e2-9273-8051a6f35742
c9de9fd8-cbaa-42b4-b7ef-e924f98a8f8e	\N	\N	62eee42e-1836-4073-ba2c-4845df4bb81f	facb0ff9-4597-4aca-8a6b-1c1d254d63fe	0	20	t	249a5bd8-b264-4b17-a40b-934b8074adbe	\N
b2097cc7-7230-49de-8307-2ebc7aa9d173	\N	idp-create-user-if-unique	62eee42e-1836-4073-ba2c-4845df4bb81f	249a5bd8-b264-4b17-a40b-934b8074adbe	2	10	f	\N	c44d2af4-dea2-4979-9afb-61aaa611b621
c27b4a14-e8d3-46eb-a156-c7a5d5802d05	\N	\N	62eee42e-1836-4073-ba2c-4845df4bb81f	249a5bd8-b264-4b17-a40b-934b8074adbe	2	20	t	08054b32-2e8c-4b60-b7c2-2185f8e985cd	\N
ef77c771-d88c-47a7-a6c9-f00f21e6fdd9	\N	idp-confirm-link	62eee42e-1836-4073-ba2c-4845df4bb81f	08054b32-2e8c-4b60-b7c2-2185f8e985cd	0	10	f	\N	\N
7fdb69a6-71af-4655-baa3-b21e49931153	\N	\N	62eee42e-1836-4073-ba2c-4845df4bb81f	08054b32-2e8c-4b60-b7c2-2185f8e985cd	0	20	t	e978e7b7-9a26-4c23-b5e5-4a5c5704534f	\N
48e173d0-562f-4a76-84e8-59a8dccbd3a6	\N	idp-email-verification	62eee42e-1836-4073-ba2c-4845df4bb81f	e978e7b7-9a26-4c23-b5e5-4a5c5704534f	2	10	f	\N	\N
a4c4e71d-c76a-4b58-930d-823f0ae226df	\N	\N	62eee42e-1836-4073-ba2c-4845df4bb81f	e978e7b7-9a26-4c23-b5e5-4a5c5704534f	2	20	t	6edf06b0-50dd-4b5d-8115-985cb275b20c	\N
6390c6ff-16c5-420a-bf2e-48898a9f14b3	\N	idp-username-password-form	62eee42e-1836-4073-ba2c-4845df4bb81f	6edf06b0-50dd-4b5d-8115-985cb275b20c	0	10	f	\N	\N
4e49d9c6-f40a-4d05-8e02-2e986997314f	\N	\N	62eee42e-1836-4073-ba2c-4845df4bb81f	6edf06b0-50dd-4b5d-8115-985cb275b20c	1	20	t	d348a4b7-2434-4f46-abcb-4a89cb3e6d0e	\N
e5e11f45-61a1-417d-9fdc-22737c6c91f2	\N	conditional-user-configured	62eee42e-1836-4073-ba2c-4845df4bb81f	d348a4b7-2434-4f46-abcb-4a89cb3e6d0e	0	10	f	\N	\N
6eba7e2e-53dd-4d8c-b58a-06e2a54bf10e	\N	auth-otp-form	62eee42e-1836-4073-ba2c-4845df4bb81f	d348a4b7-2434-4f46-abcb-4a89cb3e6d0e	0	20	f	\N	\N
624d5e32-6510-456d-81a1-9fa943ad580d	\N	http-basic-authenticator	62eee42e-1836-4073-ba2c-4845df4bb81f	7e8a76f6-ddff-4828-a94c-6e42d3689abc	0	10	f	\N	\N
8d26db75-0545-404d-bf3e-b34271db04b0	\N	docker-http-basic-authenticator	62eee42e-1836-4073-ba2c-4845df4bb81f	b12844cb-ec58-4951-8709-ae773d3933dc	0	10	f	\N	\N
cee0a6b3-ea08-4a4d-9269-7e60d8e79825	\N	idp-email-verification	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	bf880572-f09d-46c5-bd10-79de7732e51b	2	10	f	\N	\N
e61d13d1-fd39-40e8-ad1c-728eb21a2700	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	bf880572-f09d-46c5-bd10-79de7732e51b	2	20	t	bd42a21f-8a21-4799-9197-cc8cd87c71c5	\N
249aa957-9289-4640-b2d9-343774e2ee87	\N	conditional-user-configured	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	633d93d2-dab9-4180-9e0f-5a753bc18d83	0	10	f	\N	\N
204c34ed-a926-4087-ba8b-1b09152ab1f7	\N	auth-otp-form	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	633d93d2-dab9-4180-9e0f-5a753bc18d83	0	20	f	\N	\N
5054a9a9-e024-44df-8285-253c5377083c	\N	conditional-user-configured	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	eeea0368-73ff-4ff2-ae30-6f39ff750981	0	10	f	\N	\N
d1f5cbe6-67be-42ea-b3ff-18689ced7707	\N	direct-grant-validate-otp	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	eeea0368-73ff-4ff2-ae30-6f39ff750981	0	20	f	\N	\N
3398ab13-5281-4a19-b5a0-392e1ba4ad1b	\N	conditional-user-configured	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	596cc41f-8afe-45b3-aa30-bcc33ca101c7	0	10	f	\N	\N
64d3fa29-1de0-4324-9c53-9948a71feb22	\N	auth-otp-form	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	596cc41f-8afe-45b3-aa30-bcc33ca101c7	0	20	f	\N	\N
c32c99ad-754e-4bf0-9d1d-ae465dd5f3ca	\N	idp-confirm-link	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	8f74a1cd-5ce7-49e4-97bd-feb967c9cdfa	0	10	f	\N	\N
c5e4d19f-893f-4070-bbc1-2f0fd6cc2c7d	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	8f74a1cd-5ce7-49e4-97bd-feb967c9cdfa	0	20	t	bf880572-f09d-46c5-bd10-79de7732e51b	\N
df78ca5c-5f67-4943-808e-b691ded50c61	\N	conditional-user-configured	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	84da0957-11cd-4388-8ed9-c8997dfffcd3	0	10	f	\N	\N
9366c994-fc49-48c4-9b04-3a3e8cc71b8a	\N	reset-otp	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	84da0957-11cd-4388-8ed9-c8997dfffcd3	0	20	f	\N	\N
47780744-a896-4a33-b227-cdd6e47f5c2c	\N	idp-create-user-if-unique	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	559e0144-9d6e-4a68-b25c-14c3d005bd18	2	10	f	\N	a2c09254-fda1-47b1-b7ab-c22d981cab7f
40bb915b-5ab7-4f9e-913d-af5025290b6e	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	559e0144-9d6e-4a68-b25c-14c3d005bd18	2	20	t	8f74a1cd-5ce7-49e4-97bd-feb967c9cdfa	\N
616c688e-1072-4daa-a49f-cadf51c72372	\N	idp-username-password-form	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	bd42a21f-8a21-4799-9197-cc8cd87c71c5	0	10	f	\N	\N
a205f837-87b7-4ca0-b42c-d600f3bc1aa7	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	bd42a21f-8a21-4799-9197-cc8cd87c71c5	1	20	t	596cc41f-8afe-45b3-aa30-bcc33ca101c7	\N
663e567c-a879-4c86-b217-38805659baa6	\N	auth-cookie	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	5b4a9417-d119-4583-9e41-a196ef53ebbd	2	10	f	\N	\N
a0b3a75a-9ba9-4c35-b358-af2b0f1f1a31	\N	auth-spnego	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	5b4a9417-d119-4583-9e41-a196ef53ebbd	3	20	f	\N	\N
5daa3db2-cd19-4f42-8d41-c0b1eace378c	\N	identity-provider-redirector	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	5b4a9417-d119-4583-9e41-a196ef53ebbd	2	25	f	\N	\N
0edf8142-a6bb-49d9-a2b8-c703890dafe6	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	5b4a9417-d119-4583-9e41-a196ef53ebbd	2	30	t	6a219e87-bbbd-4168-968e-4a2291bc8aed	\N
ffc22af9-7ca6-464d-92ed-e212fd93447b	\N	client-secret	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	2296c735-7776-4d79-b834-19e69c360ecf	2	10	f	\N	\N
8a9c10ef-04df-4bd9-b6a0-662ea609cf60	\N	client-jwt	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	2296c735-7776-4d79-b834-19e69c360ecf	2	20	f	\N	\N
3663490c-a0cc-4cc2-836f-9f074aceb9cd	\N	client-secret-jwt	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	2296c735-7776-4d79-b834-19e69c360ecf	2	30	f	\N	\N
3b93177a-bf2c-48e9-afb6-b8be1d5bef2e	\N	client-x509	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	2296c735-7776-4d79-b834-19e69c360ecf	2	40	f	\N	\N
9672e588-59fc-4490-b445-1a969a26fe7f	\N	direct-grant-validate-username	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	b2dd812f-6fe5-4990-b84e-d2a530291025	0	10	f	\N	\N
728b581a-3e7d-457b-bb8e-582e02f3bee1	\N	direct-grant-validate-password	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	b2dd812f-6fe5-4990-b84e-d2a530291025	0	20	f	\N	\N
cb0ab4b9-7615-4daa-b8f3-9e02de903c09	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	b2dd812f-6fe5-4990-b84e-d2a530291025	1	30	t	eeea0368-73ff-4ff2-ae30-6f39ff750981	\N
3b80321e-9002-4b7a-88bd-3a5c703b8507	\N	docker-http-basic-authenticator	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	656254e8-ebd7-4e6a-a739-348cd3243248	0	10	f	\N	\N
8a49b560-e3e8-4ecc-9f8f-781ca74a6fdf	\N	idp-review-profile	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	d52fe36a-5645-4df1-a598-4033fd70bdf2	0	10	f	\N	05f036cb-ff54-431a-8915-0434f0a911ec
47b898ea-fcaa-4a9a-8321-785024533584	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	d52fe36a-5645-4df1-a598-4033fd70bdf2	0	20	t	559e0144-9d6e-4a68-b25c-14c3d005bd18	\N
8314119a-b00d-434d-b572-5f9478456058	\N	auth-username-password-form	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	6a219e87-bbbd-4168-968e-4a2291bc8aed	0	10	f	\N	\N
5125b5fa-186f-4cd2-bf80-dbdcefa37fc1	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	6a219e87-bbbd-4168-968e-4a2291bc8aed	1	20	t	633d93d2-dab9-4180-9e0f-5a753bc18d83	\N
bdbe99f0-62d4-46f7-bd3d-796c50f3366c	\N	registration-page-form	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	8b014614-9983-47ee-bb39-2e7380f0daed	0	10	t	dc357f3a-1d03-49dc-9775-9c7e7307db91	\N
bce4c1ec-72eb-479a-bf9a-4ef1d4472d80	\N	registration-user-creation	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	dc357f3a-1d03-49dc-9775-9c7e7307db91	0	20	f	\N	\N
eb0a54e5-4f0c-4792-99c9-e058421255f0	\N	registration-password-action	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	dc357f3a-1d03-49dc-9775-9c7e7307db91	0	50	f	\N	\N
e115fa45-07c4-4f5e-b7bb-3415c5707ecb	\N	registration-recaptcha-action	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	dc357f3a-1d03-49dc-9775-9c7e7307db91	3	60	f	\N	\N
d6630e24-3a8f-4eff-836a-3327ca7b0ab1	\N	registration-terms-and-conditions	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	dc357f3a-1d03-49dc-9775-9c7e7307db91	3	70	f	\N	\N
4ed32151-7cbb-494d-a5fd-0e7b398fdd0b	\N	reset-credentials-choose-user	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	651d1279-4010-40f3-afa3-b0eb224ec1df	0	10	f	\N	\N
cf778607-a332-497c-9249-0e9437c7b9e1	\N	reset-credential-email	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	651d1279-4010-40f3-afa3-b0eb224ec1df	0	20	f	\N	\N
5bff2f0a-be2c-4387-bb09-037dcb389447	\N	reset-password	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	651d1279-4010-40f3-afa3-b0eb224ec1df	0	30	f	\N	\N
a5ce465b-a37f-4fc4-9642-e7e6ef128d93	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	651d1279-4010-40f3-afa3-b0eb224ec1df	1	40	t	84da0957-11cd-4388-8ed9-c8997dfffcd3	\N
1728f66d-faa2-47e0-ab93-636418c6700a	\N	http-basic-authenticator	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	69f0466f-e926-4f8f-b4cb-bbee0a76d248	0	10	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
d2f9a516-ee50-4332-ab83-064c9e836a6e	browser	browser based authentication	62eee42e-1836-4073-ba2c-4845df4bb81f	basic-flow	t	t
985cdeec-74ed-4789-8305-05857af94f15	forms	Username, password, otp and other auth forms.	62eee42e-1836-4073-ba2c-4845df4bb81f	basic-flow	f	t
6caaa3ae-8827-44b6-aefd-d7a4151f4d30	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	62eee42e-1836-4073-ba2c-4845df4bb81f	basic-flow	f	t
6d891d07-9a44-4198-95c0-f5ac9f52c993	direct grant	OpenID Connect Resource Owner Grant	62eee42e-1836-4073-ba2c-4845df4bb81f	basic-flow	t	t
0556c626-7dbc-402f-b737-e7a18af68b6e	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	62eee42e-1836-4073-ba2c-4845df4bb81f	basic-flow	f	t
4f54ecb3-4d53-47fd-b015-ed9215878840	registration	registration flow	62eee42e-1836-4073-ba2c-4845df4bb81f	basic-flow	t	t
e310a9af-c1c2-4ea2-8440-364788d4ba24	registration form	registration form	62eee42e-1836-4073-ba2c-4845df4bb81f	form-flow	f	t
a15a1c1c-4091-4065-9787-ac617c49bf7b	reset credentials	Reset credentials for a user if they forgot their password or something	62eee42e-1836-4073-ba2c-4845df4bb81f	basic-flow	t	t
17aaf746-5aea-4929-a720-826110e81b13	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	62eee42e-1836-4073-ba2c-4845df4bb81f	basic-flow	f	t
8261cb25-ccf8-469b-b0ee-0c2881314c61	clients	Base authentication for clients	62eee42e-1836-4073-ba2c-4845df4bb81f	client-flow	t	t
facb0ff9-4597-4aca-8a6b-1c1d254d63fe	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	62eee42e-1836-4073-ba2c-4845df4bb81f	basic-flow	t	t
249a5bd8-b264-4b17-a40b-934b8074adbe	User creation or linking	Flow for the existing/non-existing user alternatives	62eee42e-1836-4073-ba2c-4845df4bb81f	basic-flow	f	t
08054b32-2e8c-4b60-b7c2-2185f8e985cd	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	62eee42e-1836-4073-ba2c-4845df4bb81f	basic-flow	f	t
e978e7b7-9a26-4c23-b5e5-4a5c5704534f	Account verification options	Method with which to verity the existing account	62eee42e-1836-4073-ba2c-4845df4bb81f	basic-flow	f	t
6edf06b0-50dd-4b5d-8115-985cb275b20c	Verify Existing Account by Re-authentication	Reauthentication of existing account	62eee42e-1836-4073-ba2c-4845df4bb81f	basic-flow	f	t
d348a4b7-2434-4f46-abcb-4a89cb3e6d0e	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	62eee42e-1836-4073-ba2c-4845df4bb81f	basic-flow	f	t
7e8a76f6-ddff-4828-a94c-6e42d3689abc	saml ecp	SAML ECP Profile Authentication Flow	62eee42e-1836-4073-ba2c-4845df4bb81f	basic-flow	t	t
b12844cb-ec58-4951-8709-ae773d3933dc	docker auth	Used by Docker clients to authenticate against the IDP	62eee42e-1836-4073-ba2c-4845df4bb81f	basic-flow	t	t
bf880572-f09d-46c5-bd10-79de7732e51b	Account verification options	Method with which to verity the existing account	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	basic-flow	f	t
633d93d2-dab9-4180-9e0f-5a753bc18d83	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	basic-flow	f	t
eeea0368-73ff-4ff2-ae30-6f39ff750981	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	basic-flow	f	t
596cc41f-8afe-45b3-aa30-bcc33ca101c7	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	basic-flow	f	t
8f74a1cd-5ce7-49e4-97bd-feb967c9cdfa	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	basic-flow	f	t
84da0957-11cd-4388-8ed9-c8997dfffcd3	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	basic-flow	f	t
559e0144-9d6e-4a68-b25c-14c3d005bd18	User creation or linking	Flow for the existing/non-existing user alternatives	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	basic-flow	f	t
bd42a21f-8a21-4799-9197-cc8cd87c71c5	Verify Existing Account by Re-authentication	Reauthentication of existing account	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	basic-flow	f	t
5b4a9417-d119-4583-9e41-a196ef53ebbd	browser	browser based authentication	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	basic-flow	t	t
2296c735-7776-4d79-b834-19e69c360ecf	clients	Base authentication for clients	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	client-flow	t	t
b2dd812f-6fe5-4990-b84e-d2a530291025	direct grant	OpenID Connect Resource Owner Grant	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	basic-flow	t	t
656254e8-ebd7-4e6a-a739-348cd3243248	docker auth	Used by Docker clients to authenticate against the IDP	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	basic-flow	t	t
d52fe36a-5645-4df1-a598-4033fd70bdf2	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	basic-flow	t	t
6a219e87-bbbd-4168-968e-4a2291bc8aed	forms	Username, password, otp and other auth forms.	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	basic-flow	f	t
8b014614-9983-47ee-bb39-2e7380f0daed	registration	registration flow	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	basic-flow	t	t
dc357f3a-1d03-49dc-9775-9c7e7307db91	registration form	registration form	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	form-flow	f	t
651d1279-4010-40f3-afa3-b0eb224ec1df	reset credentials	Reset credentials for a user if they forgot their password or something	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	basic-flow	t	t
69f0466f-e926-4f8f-b4cb-bbee0a76d248	saml ecp	SAML ECP Profile Authentication Flow	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	basic-flow	t	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
145d611a-5c3f-46e2-9273-8051a6f35742	review profile config	62eee42e-1836-4073-ba2c-4845df4bb81f
c44d2af4-dea2-4979-9afb-61aaa611b621	create unique user config	62eee42e-1836-4073-ba2c-4845df4bb81f
a2c09254-fda1-47b1-b7ab-c22d981cab7f	create unique user config	648ca54c-3788-49f4-b9fa-de81e6fc4bbb
05f036cb-ff54-431a-8915-0434f0a911ec	review profile config	648ca54c-3788-49f4-b9fa-de81e6fc4bbb
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
145d611a-5c3f-46e2-9273-8051a6f35742	missing	update.profile.on.first.login
c44d2af4-dea2-4979-9afb-61aaa611b621	false	require.password.update.after.registration
05f036cb-ff54-431a-8915-0434f0a911ec	missing	update.profile.on.first.login
a2c09254-fda1-47b1-b7ab-c22d981cab7f	false	require.password.update.after.registration
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	t	f	master-realm	0	f	\N	\N	t	\N	f	62eee42e-1836-4073-ba2c-4845df4bb81f	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
73dacec3-6bba-49f4-9fd3-46de00fd8cb7	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	62eee42e-1836-4073-ba2c-4845df4bb81f	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
ae6ce30c-5355-4a89-ab59-8c5eab30c235	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	62eee42e-1836-4073-ba2c-4845df4bb81f	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
64e92d33-04c4-4b2d-a821-3b988c8963d6	t	f	broker	0	f	\N	\N	t	\N	f	62eee42e-1836-4073-ba2c-4845df4bb81f	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
1adf445c-da43-44c8-9b30-ca249e2f8209	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	62eee42e-1836-4073-ba2c-4845df4bb81f	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
b9b5f6bb-e705-4537-af49-f1eca8b10139	t	f	admin-cli	0	t	\N	\N	f	\N	f	62eee42e-1836-4073-ba2c-4845df4bb81f	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
f20d1de2-5b48-445f-941d-cb74b3f0fae6	t	f	violation-system-realm	0	f	\N	\N	t	\N	f	62eee42e-1836-4073-ba2c-4845df4bb81f	\N	0	f	f	violation-system Realm	f	client-secret	\N	\N	\N	t	f	f	f
71f25c21-915e-4015-811a-5cb3df1d0aff	t	t	react-app	0	t	\N	http://localhost:5173/	f	http://localhost:5173	f	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	openid-connect	-1	t	f	react-app	f	client-secret	http://localhost:5173		\N	t	f	t	t
6a09ee99-9116-45f9-adac-0f04cb119b5a	t	f	account	0	t	\N	/realms/violation-system/account/	f	\N	f	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
2720e5ea-0903-4fe2-ba6f-4e978245faf6	t	f	account-console	0	t	\N	/realms/violation-system/account/	f	\N	f	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
83e0a6e6-a6ac-487c-b3ab-5d22162ccad8	t	f	admin-cli	0	t	\N	\N	f	\N	f	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
f2073cc7-0a3d-4eb4-96f7-2342d5fd726a	t	f	broker	0	f	\N	\N	t	\N	f	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
2529b41e-7231-480c-a34e-2d54047a3694	t	f	realm-management	0	f	\N	\N	t	\N	f	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
b0e6e45d-48a4-4ef8-8844-ac077ec6b634	t	f	security-admin-console	0	t	\N	/admin/violation-system/console/	f	\N	f	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
ffc6f6a0-6672-4968-8162-44761080f4da	t	t	springboot-app	0	f	TIGLZ1nKr00nStozDJ9Wjpl1tVOUqksi	http://localhost:8888/	f	http://localhost:8888/	f	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	openid-connect	-1	t	f	springboot-app	f	client-secret	http://localhost:8888/		\N	t	f	t	t
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
73dacec3-6bba-49f4-9fd3-46de00fd8cb7	post.logout.redirect.uris	+
ae6ce30c-5355-4a89-ab59-8c5eab30c235	post.logout.redirect.uris	+
ae6ce30c-5355-4a89-ab59-8c5eab30c235	pkce.code.challenge.method	S256
1adf445c-da43-44c8-9b30-ca249e2f8209	post.logout.redirect.uris	+
1adf445c-da43-44c8-9b30-ca249e2f8209	pkce.code.challenge.method	S256
6a09ee99-9116-45f9-adac-0f04cb119b5a	post.logout.redirect.uris	+
2720e5ea-0903-4fe2-ba6f-4e978245faf6	post.logout.redirect.uris	+
2720e5ea-0903-4fe2-ba6f-4e978245faf6	pkce.code.challenge.method	S256
83e0a6e6-a6ac-487c-b3ab-5d22162ccad8	post.logout.redirect.uris	+
f2073cc7-0a3d-4eb4-96f7-2342d5fd726a	post.logout.redirect.uris	+
2529b41e-7231-480c-a34e-2d54047a3694	post.logout.redirect.uris	+
b0e6e45d-48a4-4ef8-8844-ac077ec6b634	post.logout.redirect.uris	+
b0e6e45d-48a4-4ef8-8844-ac077ec6b634	pkce.code.challenge.method	S256
ffc6f6a0-6672-4968-8162-44761080f4da	oidc.ciba.grant.enabled	false
ffc6f6a0-6672-4968-8162-44761080f4da	client.secret.creation.time	1748341571
ffc6f6a0-6672-4968-8162-44761080f4da	backchannel.logout.session.required	true
ffc6f6a0-6672-4968-8162-44761080f4da	login_theme	keycloak
ffc6f6a0-6672-4968-8162-44761080f4da	post.logout.redirect.uris	http://localhost:3000/
ffc6f6a0-6672-4968-8162-44761080f4da	oauth2.device.authorization.grant.enabled	false
ffc6f6a0-6672-4968-8162-44761080f4da	display.on.consent.screen	false
ffc6f6a0-6672-4968-8162-44761080f4da	backchannel.logout.revoke.offline.tokens	false
71f25c21-915e-4015-811a-5cb3df1d0aff	oauth2.device.authorization.grant.enabled	false
71f25c21-915e-4015-811a-5cb3df1d0aff	oidc.ciba.grant.enabled	false
71f25c21-915e-4015-811a-5cb3df1d0aff	post.logout.redirect.uris	http://localhost:5173/
71f25c21-915e-4015-811a-5cb3df1d0aff	backchannel.logout.session.required	true
71f25c21-915e-4015-811a-5cb3df1d0aff	backchannel.logout.revoke.offline.tokens	false
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
7113d44e-e297-4a7f-833e-89f4b5868ffe	offline_access	62eee42e-1836-4073-ba2c-4845df4bb81f	OpenID Connect built-in scope: offline_access	openid-connect
6bf9ab1e-615a-4104-a538-a87dbafe593c	role_list	62eee42e-1836-4073-ba2c-4845df4bb81f	SAML role list	saml
bf5c8e29-f740-4b97-81cc-2757677b39aa	profile	62eee42e-1836-4073-ba2c-4845df4bb81f	OpenID Connect built-in scope: profile	openid-connect
c412ca6c-70b6-45b9-ada1-cdedd2713a03	email	62eee42e-1836-4073-ba2c-4845df4bb81f	OpenID Connect built-in scope: email	openid-connect
195e5438-7ff4-4dfa-95a2-6341a67a840c	address	62eee42e-1836-4073-ba2c-4845df4bb81f	OpenID Connect built-in scope: address	openid-connect
e55134ce-eefb-4614-aa88-cc9d540b18eb	phone	62eee42e-1836-4073-ba2c-4845df4bb81f	OpenID Connect built-in scope: phone	openid-connect
35a05f73-9f95-48d0-97f5-65568efa12c1	roles	62eee42e-1836-4073-ba2c-4845df4bb81f	OpenID Connect scope for add user roles to the access token	openid-connect
e2bba359-c3fb-4c1a-925b-087baba1919f	web-origins	62eee42e-1836-4073-ba2c-4845df4bb81f	OpenID Connect scope for add allowed web origins to the access token	openid-connect
20d1a975-5194-4baf-8e44-bb4a24dac059	microprofile-jwt	62eee42e-1836-4073-ba2c-4845df4bb81f	Microprofile - JWT built-in scope	openid-connect
3624c435-6b46-4f19-bc27-8c1a465c62f6	acr	62eee42e-1836-4073-ba2c-4845df4bb81f	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
d20308dc-fabb-4c68-8c3c-fe7d09e1e5ac	phoneNumber	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	phoneNumber	openid-connect
28009592-b8ca-465b-bc72-44d4a7d56caf	roles	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	OpenID Connect scope for add user roles to the access token	openid-connect
bc5e0698-38c5-483e-8346-4295b33fa467	offline_access	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	OpenID Connect built-in scope: offline_access	openid-connect
d2a2002e-87c4-426a-8bcb-209558bf33c4	address	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	OpenID Connect built-in scope: address	openid-connect
2f40a8d6-59e1-401b-aaf6-c28d3138458d	identityCard	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	identityCard	openid-connect
df6c9ac5-1a5c-497f-aa33-be81356e8d35	phone	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	OpenID Connect built-in scope: phone	openid-connect
85e69bde-6796-4bc6-a367-598d0885d74e	email	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	OpenID Connect built-in scope: email	openid-connect
881ff552-8ce1-43a7-9277-6e394a814eda	profile	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	OpenID Connect built-in scope: profile	openid-connect
58f891cd-9611-4a26-b186-f502be530ef3	web-origins	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	OpenID Connect scope for add allowed web origins to the access token	openid-connect
8f2bab50-b5ef-4ea8-aaa4-c034239d6c68	microprofile-jwt	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	Microprofile - JWT built-in scope	openid-connect
5e2764f6-1d47-4d4e-b738-35e6dbb04e9f	fullName	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	fullName	openid-connect
da437c66-8933-46a4-b5b2-ee3240b8016c	role_list	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	SAML role list	saml
7fd6ddbd-8b66-4984-9bd0-b2a9fa8ee427	acr	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
7113d44e-e297-4a7f-833e-89f4b5868ffe	true	display.on.consent.screen
7113d44e-e297-4a7f-833e-89f4b5868ffe	${offlineAccessScopeConsentText}	consent.screen.text
6bf9ab1e-615a-4104-a538-a87dbafe593c	true	display.on.consent.screen
6bf9ab1e-615a-4104-a538-a87dbafe593c	${samlRoleListScopeConsentText}	consent.screen.text
bf5c8e29-f740-4b97-81cc-2757677b39aa	true	display.on.consent.screen
bf5c8e29-f740-4b97-81cc-2757677b39aa	${profileScopeConsentText}	consent.screen.text
bf5c8e29-f740-4b97-81cc-2757677b39aa	true	include.in.token.scope
c412ca6c-70b6-45b9-ada1-cdedd2713a03	true	display.on.consent.screen
c412ca6c-70b6-45b9-ada1-cdedd2713a03	${emailScopeConsentText}	consent.screen.text
c412ca6c-70b6-45b9-ada1-cdedd2713a03	true	include.in.token.scope
195e5438-7ff4-4dfa-95a2-6341a67a840c	true	display.on.consent.screen
195e5438-7ff4-4dfa-95a2-6341a67a840c	${addressScopeConsentText}	consent.screen.text
195e5438-7ff4-4dfa-95a2-6341a67a840c	true	include.in.token.scope
e55134ce-eefb-4614-aa88-cc9d540b18eb	true	display.on.consent.screen
e55134ce-eefb-4614-aa88-cc9d540b18eb	${phoneScopeConsentText}	consent.screen.text
e55134ce-eefb-4614-aa88-cc9d540b18eb	true	include.in.token.scope
35a05f73-9f95-48d0-97f5-65568efa12c1	true	display.on.consent.screen
35a05f73-9f95-48d0-97f5-65568efa12c1	${rolesScopeConsentText}	consent.screen.text
35a05f73-9f95-48d0-97f5-65568efa12c1	false	include.in.token.scope
e2bba359-c3fb-4c1a-925b-087baba1919f	false	display.on.consent.screen
e2bba359-c3fb-4c1a-925b-087baba1919f		consent.screen.text
e2bba359-c3fb-4c1a-925b-087baba1919f	false	include.in.token.scope
20d1a975-5194-4baf-8e44-bb4a24dac059	false	display.on.consent.screen
20d1a975-5194-4baf-8e44-bb4a24dac059	true	include.in.token.scope
3624c435-6b46-4f19-bc27-8c1a465c62f6	false	display.on.consent.screen
3624c435-6b46-4f19-bc27-8c1a465c62f6	false	include.in.token.scope
d20308dc-fabb-4c68-8c3c-fe7d09e1e5ac	true	include.in.token.scope
d20308dc-fabb-4c68-8c3c-fe7d09e1e5ac	true	display.on.consent.screen
d20308dc-fabb-4c68-8c3c-fe7d09e1e5ac		gui.order
d20308dc-fabb-4c68-8c3c-fe7d09e1e5ac		consent.screen.text
28009592-b8ca-465b-bc72-44d4a7d56caf	false	include.in.token.scope
28009592-b8ca-465b-bc72-44d4a7d56caf	true	display.on.consent.screen
28009592-b8ca-465b-bc72-44d4a7d56caf	${rolesScopeConsentText}	consent.screen.text
bc5e0698-38c5-483e-8346-4295b33fa467	${offlineAccessScopeConsentText}	consent.screen.text
bc5e0698-38c5-483e-8346-4295b33fa467	true	display.on.consent.screen
d2a2002e-87c4-426a-8bcb-209558bf33c4	true	include.in.token.scope
d2a2002e-87c4-426a-8bcb-209558bf33c4	true	display.on.consent.screen
d2a2002e-87c4-426a-8bcb-209558bf33c4	${addressScopeConsentText}	consent.screen.text
2f40a8d6-59e1-401b-aaf6-c28d3138458d	true	include.in.token.scope
2f40a8d6-59e1-401b-aaf6-c28d3138458d	true	display.on.consent.screen
2f40a8d6-59e1-401b-aaf6-c28d3138458d		gui.order
2f40a8d6-59e1-401b-aaf6-c28d3138458d		consent.screen.text
df6c9ac5-1a5c-497f-aa33-be81356e8d35	true	include.in.token.scope
df6c9ac5-1a5c-497f-aa33-be81356e8d35	true	display.on.consent.screen
df6c9ac5-1a5c-497f-aa33-be81356e8d35	${phoneScopeConsentText}	consent.screen.text
85e69bde-6796-4bc6-a367-598d0885d74e	true	include.in.token.scope
85e69bde-6796-4bc6-a367-598d0885d74e	true	display.on.consent.screen
85e69bde-6796-4bc6-a367-598d0885d74e	${emailScopeConsentText}	consent.screen.text
881ff552-8ce1-43a7-9277-6e394a814eda	true	include.in.token.scope
881ff552-8ce1-43a7-9277-6e394a814eda	true	display.on.consent.screen
881ff552-8ce1-43a7-9277-6e394a814eda	${profileScopeConsentText}	consent.screen.text
58f891cd-9611-4a26-b186-f502be530ef3	false	include.in.token.scope
58f891cd-9611-4a26-b186-f502be530ef3	false	display.on.consent.screen
58f891cd-9611-4a26-b186-f502be530ef3		consent.screen.text
8f2bab50-b5ef-4ea8-aaa4-c034239d6c68	true	include.in.token.scope
8f2bab50-b5ef-4ea8-aaa4-c034239d6c68	false	display.on.consent.screen
5e2764f6-1d47-4d4e-b738-35e6dbb04e9f	true	include.in.token.scope
5e2764f6-1d47-4d4e-b738-35e6dbb04e9f	true	display.on.consent.screen
5e2764f6-1d47-4d4e-b738-35e6dbb04e9f		gui.order
5e2764f6-1d47-4d4e-b738-35e6dbb04e9f		consent.screen.text
da437c66-8933-46a4-b5b2-ee3240b8016c	${samlRoleListScopeConsentText}	consent.screen.text
da437c66-8933-46a4-b5b2-ee3240b8016c	true	display.on.consent.screen
7fd6ddbd-8b66-4984-9bd0-b2a9fa8ee427	false	include.in.token.scope
7fd6ddbd-8b66-4984-9bd0-b2a9fa8ee427	false	display.on.consent.screen
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
73dacec3-6bba-49f4-9fd3-46de00fd8cb7	3624c435-6b46-4f19-bc27-8c1a465c62f6	t
73dacec3-6bba-49f4-9fd3-46de00fd8cb7	e2bba359-c3fb-4c1a-925b-087baba1919f	t
73dacec3-6bba-49f4-9fd3-46de00fd8cb7	bf5c8e29-f740-4b97-81cc-2757677b39aa	t
73dacec3-6bba-49f4-9fd3-46de00fd8cb7	c412ca6c-70b6-45b9-ada1-cdedd2713a03	t
73dacec3-6bba-49f4-9fd3-46de00fd8cb7	35a05f73-9f95-48d0-97f5-65568efa12c1	t
73dacec3-6bba-49f4-9fd3-46de00fd8cb7	7113d44e-e297-4a7f-833e-89f4b5868ffe	f
73dacec3-6bba-49f4-9fd3-46de00fd8cb7	195e5438-7ff4-4dfa-95a2-6341a67a840c	f
73dacec3-6bba-49f4-9fd3-46de00fd8cb7	e55134ce-eefb-4614-aa88-cc9d540b18eb	f
73dacec3-6bba-49f4-9fd3-46de00fd8cb7	20d1a975-5194-4baf-8e44-bb4a24dac059	f
ae6ce30c-5355-4a89-ab59-8c5eab30c235	3624c435-6b46-4f19-bc27-8c1a465c62f6	t
ae6ce30c-5355-4a89-ab59-8c5eab30c235	e2bba359-c3fb-4c1a-925b-087baba1919f	t
ae6ce30c-5355-4a89-ab59-8c5eab30c235	bf5c8e29-f740-4b97-81cc-2757677b39aa	t
ae6ce30c-5355-4a89-ab59-8c5eab30c235	c412ca6c-70b6-45b9-ada1-cdedd2713a03	t
ae6ce30c-5355-4a89-ab59-8c5eab30c235	35a05f73-9f95-48d0-97f5-65568efa12c1	t
ae6ce30c-5355-4a89-ab59-8c5eab30c235	7113d44e-e297-4a7f-833e-89f4b5868ffe	f
ae6ce30c-5355-4a89-ab59-8c5eab30c235	195e5438-7ff4-4dfa-95a2-6341a67a840c	f
ae6ce30c-5355-4a89-ab59-8c5eab30c235	e55134ce-eefb-4614-aa88-cc9d540b18eb	f
ae6ce30c-5355-4a89-ab59-8c5eab30c235	20d1a975-5194-4baf-8e44-bb4a24dac059	f
b9b5f6bb-e705-4537-af49-f1eca8b10139	3624c435-6b46-4f19-bc27-8c1a465c62f6	t
b9b5f6bb-e705-4537-af49-f1eca8b10139	e2bba359-c3fb-4c1a-925b-087baba1919f	t
b9b5f6bb-e705-4537-af49-f1eca8b10139	bf5c8e29-f740-4b97-81cc-2757677b39aa	t
b9b5f6bb-e705-4537-af49-f1eca8b10139	c412ca6c-70b6-45b9-ada1-cdedd2713a03	t
b9b5f6bb-e705-4537-af49-f1eca8b10139	35a05f73-9f95-48d0-97f5-65568efa12c1	t
b9b5f6bb-e705-4537-af49-f1eca8b10139	7113d44e-e297-4a7f-833e-89f4b5868ffe	f
b9b5f6bb-e705-4537-af49-f1eca8b10139	195e5438-7ff4-4dfa-95a2-6341a67a840c	f
b9b5f6bb-e705-4537-af49-f1eca8b10139	e55134ce-eefb-4614-aa88-cc9d540b18eb	f
b9b5f6bb-e705-4537-af49-f1eca8b10139	20d1a975-5194-4baf-8e44-bb4a24dac059	f
64e92d33-04c4-4b2d-a821-3b988c8963d6	3624c435-6b46-4f19-bc27-8c1a465c62f6	t
64e92d33-04c4-4b2d-a821-3b988c8963d6	e2bba359-c3fb-4c1a-925b-087baba1919f	t
64e92d33-04c4-4b2d-a821-3b988c8963d6	bf5c8e29-f740-4b97-81cc-2757677b39aa	t
64e92d33-04c4-4b2d-a821-3b988c8963d6	c412ca6c-70b6-45b9-ada1-cdedd2713a03	t
64e92d33-04c4-4b2d-a821-3b988c8963d6	35a05f73-9f95-48d0-97f5-65568efa12c1	t
64e92d33-04c4-4b2d-a821-3b988c8963d6	7113d44e-e297-4a7f-833e-89f4b5868ffe	f
64e92d33-04c4-4b2d-a821-3b988c8963d6	195e5438-7ff4-4dfa-95a2-6341a67a840c	f
64e92d33-04c4-4b2d-a821-3b988c8963d6	e55134ce-eefb-4614-aa88-cc9d540b18eb	f
64e92d33-04c4-4b2d-a821-3b988c8963d6	20d1a975-5194-4baf-8e44-bb4a24dac059	f
ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	3624c435-6b46-4f19-bc27-8c1a465c62f6	t
ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	e2bba359-c3fb-4c1a-925b-087baba1919f	t
ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	bf5c8e29-f740-4b97-81cc-2757677b39aa	t
ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	c412ca6c-70b6-45b9-ada1-cdedd2713a03	t
ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	35a05f73-9f95-48d0-97f5-65568efa12c1	t
ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	7113d44e-e297-4a7f-833e-89f4b5868ffe	f
ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	195e5438-7ff4-4dfa-95a2-6341a67a840c	f
ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	e55134ce-eefb-4614-aa88-cc9d540b18eb	f
ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	20d1a975-5194-4baf-8e44-bb4a24dac059	f
1adf445c-da43-44c8-9b30-ca249e2f8209	3624c435-6b46-4f19-bc27-8c1a465c62f6	t
1adf445c-da43-44c8-9b30-ca249e2f8209	e2bba359-c3fb-4c1a-925b-087baba1919f	t
1adf445c-da43-44c8-9b30-ca249e2f8209	bf5c8e29-f740-4b97-81cc-2757677b39aa	t
1adf445c-da43-44c8-9b30-ca249e2f8209	c412ca6c-70b6-45b9-ada1-cdedd2713a03	t
1adf445c-da43-44c8-9b30-ca249e2f8209	35a05f73-9f95-48d0-97f5-65568efa12c1	t
1adf445c-da43-44c8-9b30-ca249e2f8209	7113d44e-e297-4a7f-833e-89f4b5868ffe	f
1adf445c-da43-44c8-9b30-ca249e2f8209	195e5438-7ff4-4dfa-95a2-6341a67a840c	f
1adf445c-da43-44c8-9b30-ca249e2f8209	e55134ce-eefb-4614-aa88-cc9d540b18eb	f
1adf445c-da43-44c8-9b30-ca249e2f8209	20d1a975-5194-4baf-8e44-bb4a24dac059	f
71f25c21-915e-4015-811a-5cb3df1d0aff	d20308dc-fabb-4c68-8c3c-fe7d09e1e5ac	t
71f25c21-915e-4015-811a-5cb3df1d0aff	28009592-b8ca-465b-bc72-44d4a7d56caf	t
71f25c21-915e-4015-811a-5cb3df1d0aff	58f891cd-9611-4a26-b186-f502be530ef3	t
71f25c21-915e-4015-811a-5cb3df1d0aff	5e2764f6-1d47-4d4e-b738-35e6dbb04e9f	t
71f25c21-915e-4015-811a-5cb3df1d0aff	2f40a8d6-59e1-401b-aaf6-c28d3138458d	t
71f25c21-915e-4015-811a-5cb3df1d0aff	85e69bde-6796-4bc6-a367-598d0885d74e	t
71f25c21-915e-4015-811a-5cb3df1d0aff	7fd6ddbd-8b66-4984-9bd0-b2a9fa8ee427	t
71f25c21-915e-4015-811a-5cb3df1d0aff	881ff552-8ce1-43a7-9277-6e394a814eda	t
71f25c21-915e-4015-811a-5cb3df1d0aff	bc5e0698-38c5-483e-8346-4295b33fa467	f
71f25c21-915e-4015-811a-5cb3df1d0aff	8f2bab50-b5ef-4ea8-aaa4-c034239d6c68	f
71f25c21-915e-4015-811a-5cb3df1d0aff	d2a2002e-87c4-426a-8bcb-209558bf33c4	f
71f25c21-915e-4015-811a-5cb3df1d0aff	df6c9ac5-1a5c-497f-aa33-be81356e8d35	f
6a09ee99-9116-45f9-adac-0f04cb119b5a	58f891cd-9611-4a26-b186-f502be530ef3	t
6a09ee99-9116-45f9-adac-0f04cb119b5a	7fd6ddbd-8b66-4984-9bd0-b2a9fa8ee427	t
6a09ee99-9116-45f9-adac-0f04cb119b5a	28009592-b8ca-465b-bc72-44d4a7d56caf	t
6a09ee99-9116-45f9-adac-0f04cb119b5a	881ff552-8ce1-43a7-9277-6e394a814eda	t
6a09ee99-9116-45f9-adac-0f04cb119b5a	85e69bde-6796-4bc6-a367-598d0885d74e	t
6a09ee99-9116-45f9-adac-0f04cb119b5a	d2a2002e-87c4-426a-8bcb-209558bf33c4	f
6a09ee99-9116-45f9-adac-0f04cb119b5a	df6c9ac5-1a5c-497f-aa33-be81356e8d35	f
6a09ee99-9116-45f9-adac-0f04cb119b5a	bc5e0698-38c5-483e-8346-4295b33fa467	f
6a09ee99-9116-45f9-adac-0f04cb119b5a	8f2bab50-b5ef-4ea8-aaa4-c034239d6c68	f
2720e5ea-0903-4fe2-ba6f-4e978245faf6	58f891cd-9611-4a26-b186-f502be530ef3	t
2720e5ea-0903-4fe2-ba6f-4e978245faf6	7fd6ddbd-8b66-4984-9bd0-b2a9fa8ee427	t
2720e5ea-0903-4fe2-ba6f-4e978245faf6	28009592-b8ca-465b-bc72-44d4a7d56caf	t
2720e5ea-0903-4fe2-ba6f-4e978245faf6	881ff552-8ce1-43a7-9277-6e394a814eda	t
2720e5ea-0903-4fe2-ba6f-4e978245faf6	85e69bde-6796-4bc6-a367-598d0885d74e	t
2720e5ea-0903-4fe2-ba6f-4e978245faf6	d2a2002e-87c4-426a-8bcb-209558bf33c4	f
2720e5ea-0903-4fe2-ba6f-4e978245faf6	df6c9ac5-1a5c-497f-aa33-be81356e8d35	f
2720e5ea-0903-4fe2-ba6f-4e978245faf6	bc5e0698-38c5-483e-8346-4295b33fa467	f
2720e5ea-0903-4fe2-ba6f-4e978245faf6	8f2bab50-b5ef-4ea8-aaa4-c034239d6c68	f
83e0a6e6-a6ac-487c-b3ab-5d22162ccad8	58f891cd-9611-4a26-b186-f502be530ef3	t
83e0a6e6-a6ac-487c-b3ab-5d22162ccad8	7fd6ddbd-8b66-4984-9bd0-b2a9fa8ee427	t
83e0a6e6-a6ac-487c-b3ab-5d22162ccad8	28009592-b8ca-465b-bc72-44d4a7d56caf	t
83e0a6e6-a6ac-487c-b3ab-5d22162ccad8	881ff552-8ce1-43a7-9277-6e394a814eda	t
83e0a6e6-a6ac-487c-b3ab-5d22162ccad8	85e69bde-6796-4bc6-a367-598d0885d74e	t
83e0a6e6-a6ac-487c-b3ab-5d22162ccad8	d2a2002e-87c4-426a-8bcb-209558bf33c4	f
83e0a6e6-a6ac-487c-b3ab-5d22162ccad8	df6c9ac5-1a5c-497f-aa33-be81356e8d35	f
83e0a6e6-a6ac-487c-b3ab-5d22162ccad8	bc5e0698-38c5-483e-8346-4295b33fa467	f
83e0a6e6-a6ac-487c-b3ab-5d22162ccad8	8f2bab50-b5ef-4ea8-aaa4-c034239d6c68	f
f2073cc7-0a3d-4eb4-96f7-2342d5fd726a	58f891cd-9611-4a26-b186-f502be530ef3	t
f2073cc7-0a3d-4eb4-96f7-2342d5fd726a	7fd6ddbd-8b66-4984-9bd0-b2a9fa8ee427	t
f2073cc7-0a3d-4eb4-96f7-2342d5fd726a	28009592-b8ca-465b-bc72-44d4a7d56caf	t
f2073cc7-0a3d-4eb4-96f7-2342d5fd726a	881ff552-8ce1-43a7-9277-6e394a814eda	t
f2073cc7-0a3d-4eb4-96f7-2342d5fd726a	85e69bde-6796-4bc6-a367-598d0885d74e	t
f2073cc7-0a3d-4eb4-96f7-2342d5fd726a	d2a2002e-87c4-426a-8bcb-209558bf33c4	f
f2073cc7-0a3d-4eb4-96f7-2342d5fd726a	df6c9ac5-1a5c-497f-aa33-be81356e8d35	f
f2073cc7-0a3d-4eb4-96f7-2342d5fd726a	bc5e0698-38c5-483e-8346-4295b33fa467	f
f2073cc7-0a3d-4eb4-96f7-2342d5fd726a	8f2bab50-b5ef-4ea8-aaa4-c034239d6c68	f
2529b41e-7231-480c-a34e-2d54047a3694	58f891cd-9611-4a26-b186-f502be530ef3	t
2529b41e-7231-480c-a34e-2d54047a3694	7fd6ddbd-8b66-4984-9bd0-b2a9fa8ee427	t
2529b41e-7231-480c-a34e-2d54047a3694	28009592-b8ca-465b-bc72-44d4a7d56caf	t
2529b41e-7231-480c-a34e-2d54047a3694	881ff552-8ce1-43a7-9277-6e394a814eda	t
2529b41e-7231-480c-a34e-2d54047a3694	85e69bde-6796-4bc6-a367-598d0885d74e	t
2529b41e-7231-480c-a34e-2d54047a3694	d2a2002e-87c4-426a-8bcb-209558bf33c4	f
2529b41e-7231-480c-a34e-2d54047a3694	df6c9ac5-1a5c-497f-aa33-be81356e8d35	f
2529b41e-7231-480c-a34e-2d54047a3694	bc5e0698-38c5-483e-8346-4295b33fa467	f
2529b41e-7231-480c-a34e-2d54047a3694	8f2bab50-b5ef-4ea8-aaa4-c034239d6c68	f
b0e6e45d-48a4-4ef8-8844-ac077ec6b634	58f891cd-9611-4a26-b186-f502be530ef3	t
b0e6e45d-48a4-4ef8-8844-ac077ec6b634	7fd6ddbd-8b66-4984-9bd0-b2a9fa8ee427	t
b0e6e45d-48a4-4ef8-8844-ac077ec6b634	28009592-b8ca-465b-bc72-44d4a7d56caf	t
b0e6e45d-48a4-4ef8-8844-ac077ec6b634	881ff552-8ce1-43a7-9277-6e394a814eda	t
b0e6e45d-48a4-4ef8-8844-ac077ec6b634	85e69bde-6796-4bc6-a367-598d0885d74e	t
b0e6e45d-48a4-4ef8-8844-ac077ec6b634	d2a2002e-87c4-426a-8bcb-209558bf33c4	f
b0e6e45d-48a4-4ef8-8844-ac077ec6b634	df6c9ac5-1a5c-497f-aa33-be81356e8d35	f
b0e6e45d-48a4-4ef8-8844-ac077ec6b634	bc5e0698-38c5-483e-8346-4295b33fa467	f
b0e6e45d-48a4-4ef8-8844-ac077ec6b634	8f2bab50-b5ef-4ea8-aaa4-c034239d6c68	f
ffc6f6a0-6672-4968-8162-44761080f4da	58f891cd-9611-4a26-b186-f502be530ef3	t
ffc6f6a0-6672-4968-8162-44761080f4da	7fd6ddbd-8b66-4984-9bd0-b2a9fa8ee427	t
ffc6f6a0-6672-4968-8162-44761080f4da	d20308dc-fabb-4c68-8c3c-fe7d09e1e5ac	t
ffc6f6a0-6672-4968-8162-44761080f4da	28009592-b8ca-465b-bc72-44d4a7d56caf	t
ffc6f6a0-6672-4968-8162-44761080f4da	881ff552-8ce1-43a7-9277-6e394a814eda	t
ffc6f6a0-6672-4968-8162-44761080f4da	5e2764f6-1d47-4d4e-b738-35e6dbb04e9f	t
ffc6f6a0-6672-4968-8162-44761080f4da	2f40a8d6-59e1-401b-aaf6-c28d3138458d	t
ffc6f6a0-6672-4968-8162-44761080f4da	85e69bde-6796-4bc6-a367-598d0885d74e	t
ffc6f6a0-6672-4968-8162-44761080f4da	d2a2002e-87c4-426a-8bcb-209558bf33c4	f
ffc6f6a0-6672-4968-8162-44761080f4da	df6c9ac5-1a5c-497f-aa33-be81356e8d35	f
ffc6f6a0-6672-4968-8162-44761080f4da	bc5e0698-38c5-483e-8346-4295b33fa467	f
ffc6f6a0-6672-4968-8162-44761080f4da	8f2bab50-b5ef-4ea8-aaa4-c034239d6c68	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
7113d44e-e297-4a7f-833e-89f4b5868ffe	fdcfbbbd-ba00-4660-8b64-e5fe7b5c41e5
bc5e0698-38c5-483e-8346-4295b33fa467	6619ce06-3777-40c7-b101-d27bfa5c7fa1
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
81af9c5b-188b-4bda-b25c-d0afc8230d50	Trusted Hosts	62eee42e-1836-4073-ba2c-4845df4bb81f	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	62eee42e-1836-4073-ba2c-4845df4bb81f	anonymous
50b9d07a-172a-411b-8e5a-ecb6aba35eab	Consent Required	62eee42e-1836-4073-ba2c-4845df4bb81f	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	62eee42e-1836-4073-ba2c-4845df4bb81f	anonymous
d9f9f1f2-384b-42eb-b0b4-4a86be35ab5f	Full Scope Disabled	62eee42e-1836-4073-ba2c-4845df4bb81f	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	62eee42e-1836-4073-ba2c-4845df4bb81f	anonymous
63abe1a6-897d-4eac-9f32-1d9ccc0ac35f	Max Clients Limit	62eee42e-1836-4073-ba2c-4845df4bb81f	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	62eee42e-1836-4073-ba2c-4845df4bb81f	anonymous
36d5afd6-9a69-447f-b4b6-4e18ef14f5d6	Allowed Protocol Mapper Types	62eee42e-1836-4073-ba2c-4845df4bb81f	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	62eee42e-1836-4073-ba2c-4845df4bb81f	anonymous
2e0880cc-e8ce-4ed7-9daf-4fc2d906069a	Allowed Client Scopes	62eee42e-1836-4073-ba2c-4845df4bb81f	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	62eee42e-1836-4073-ba2c-4845df4bb81f	anonymous
e54b5694-b7b0-4ceb-831e-16552c51cc52	Allowed Protocol Mapper Types	62eee42e-1836-4073-ba2c-4845df4bb81f	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	62eee42e-1836-4073-ba2c-4845df4bb81f	authenticated
a78716e8-06b6-48c0-ac4d-9de07a8072ba	Allowed Client Scopes	62eee42e-1836-4073-ba2c-4845df4bb81f	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	62eee42e-1836-4073-ba2c-4845df4bb81f	authenticated
38aa61b5-b74e-43a7-9cac-898b96d3e87e	rsa-generated	62eee42e-1836-4073-ba2c-4845df4bb81f	rsa-generated	org.keycloak.keys.KeyProvider	62eee42e-1836-4073-ba2c-4845df4bb81f	\N
ac715821-b6cd-47f5-86a0-3bb3ea027066	rsa-enc-generated	62eee42e-1836-4073-ba2c-4845df4bb81f	rsa-enc-generated	org.keycloak.keys.KeyProvider	62eee42e-1836-4073-ba2c-4845df4bb81f	\N
f372f7d6-1844-4bc5-bf91-bf5c951daf00	hmac-generated-hs512	62eee42e-1836-4073-ba2c-4845df4bb81f	hmac-generated	org.keycloak.keys.KeyProvider	62eee42e-1836-4073-ba2c-4845df4bb81f	\N
707df348-9c9c-434a-957f-a7b767622324	aes-generated	62eee42e-1836-4073-ba2c-4845df4bb81f	aes-generated	org.keycloak.keys.KeyProvider	62eee42e-1836-4073-ba2c-4845df4bb81f	\N
94b203ee-18bd-469f-8076-34725b90ff5e	\N	62eee42e-1836-4073-ba2c-4845df4bb81f	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	62eee42e-1836-4073-ba2c-4845df4bb81f	\N
0157f3c4-8e56-4ce2-87e0-60a182dfed3a	Full Scope Disabled	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	anonymous
ec7fd7ce-cef8-4e6a-a94a-e1d9522c2a43	Allowed Client Scopes	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	authenticated
92447629-d252-4c79-af8a-5d53bafe59c0	Consent Required	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	anonymous
fa6abd07-d850-42b1-abbc-b93a65149131	Allowed Protocol Mapper Types	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	anonymous
e29cd9a7-3d33-41ce-b519-e81873f1c4d5	Allowed Client Scopes	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	anonymous
329056bf-84f0-4cfb-a4de-bc82df2da5c2	Trusted Hosts	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	anonymous
4d9b25a9-fec6-43d6-8270-30bd70b5ec11	Max Clients Limit	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	anonymous
740e0875-b4cc-467c-ad6e-9cb0c69f30ee	Allowed Protocol Mapper Types	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	authenticated
cdc8e0bc-c593-49db-a189-daae0401cd38	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	\N
4724d432-92db-4b9b-8c28-a29124ddb012	rsa-enc-generated	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	rsa-enc-generated	org.keycloak.keys.KeyProvider	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	\N
e257b9c4-c433-4ff1-890f-7026f1ff889d	rsa-generated	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	rsa-generated	org.keycloak.keys.KeyProvider	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	\N
4f3f084d-94c5-4429-b5b5-097d29e82cb5	hmac-generated-hs512	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	hmac-generated	org.keycloak.keys.KeyProvider	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	\N
0956f3c2-0853-43b5-bc2b-16516942f17d	aes-generated	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	aes-generated	org.keycloak.keys.KeyProvider	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	\N
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
01ff3df2-0fca-4d27-9857-10e0bcdd39d7	e54b5694-b7b0-4ceb-831e-16552c51cc52	allowed-protocol-mapper-types	saml-user-attribute-mapper
689c45c0-6357-4014-bcab-d5a98dd00649	e54b5694-b7b0-4ceb-831e-16552c51cc52	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
f7baf0ee-5562-4034-ac0c-afdbb1252f13	e54b5694-b7b0-4ceb-831e-16552c51cc52	allowed-protocol-mapper-types	oidc-address-mapper
6225582f-c6ac-4601-b6e7-da87f1ce67a0	e54b5694-b7b0-4ceb-831e-16552c51cc52	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
2e7839c8-9b0e-4687-9e41-3590ae7c33b8	e54b5694-b7b0-4ceb-831e-16552c51cc52	allowed-protocol-mapper-types	saml-role-list-mapper
a47c6e1f-1b33-4d7b-955b-f40d1517ae26	e54b5694-b7b0-4ceb-831e-16552c51cc52	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
870e72c1-987a-4b73-af07-4dcaf877f961	e54b5694-b7b0-4ceb-831e-16552c51cc52	allowed-protocol-mapper-types	saml-user-property-mapper
aa29a932-b46d-446e-9b61-3e598cf908e4	e54b5694-b7b0-4ceb-831e-16552c51cc52	allowed-protocol-mapper-types	oidc-full-name-mapper
9bf47c6a-1ccb-4d4f-bc89-7fbe69a7a011	63abe1a6-897d-4eac-9f32-1d9ccc0ac35f	max-clients	200
a76042f2-5ab6-4cb8-aa65-3b2a94001b46	a78716e8-06b6-48c0-ac4d-9de07a8072ba	allow-default-scopes	true
59d9a9a4-a606-4527-a76b-bad615a78cca	81af9c5b-188b-4bda-b25c-d0afc8230d50	host-sending-registration-request-must-match	true
26220da6-1cef-4ebe-8f36-f29067b3ad22	81af9c5b-188b-4bda-b25c-d0afc8230d50	client-uris-must-match	true
d43ad298-71a1-48e7-9800-5387ef1f479b	2e0880cc-e8ce-4ed7-9daf-4fc2d906069a	allow-default-scopes	true
513d5c05-4aa1-4574-92a0-49a5762f071a	36d5afd6-9a69-447f-b4b6-4e18ef14f5d6	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
ca320644-7ac3-4594-8810-08bb96de71a2	36d5afd6-9a69-447f-b4b6-4e18ef14f5d6	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
de3f07a3-53fd-4ed3-85a9-134805a54418	36d5afd6-9a69-447f-b4b6-4e18ef14f5d6	allowed-protocol-mapper-types	oidc-address-mapper
4537b680-6d36-48dd-af92-ffdee56247e2	36d5afd6-9a69-447f-b4b6-4e18ef14f5d6	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
acdb7dbd-00c3-43a0-b3fa-bf0afb6107d6	36d5afd6-9a69-447f-b4b6-4e18ef14f5d6	allowed-protocol-mapper-types	saml-role-list-mapper
094b0563-8a84-463c-aef1-f4d4c87686aa	36d5afd6-9a69-447f-b4b6-4e18ef14f5d6	allowed-protocol-mapper-types	saml-user-property-mapper
57ec3fdb-68aa-4ae0-a8b5-b9d30bd44e84	36d5afd6-9a69-447f-b4b6-4e18ef14f5d6	allowed-protocol-mapper-types	saml-user-attribute-mapper
0c17926f-bc74-4000-a6b8-17e78e99ae48	36d5afd6-9a69-447f-b4b6-4e18ef14f5d6	allowed-protocol-mapper-types	oidc-full-name-mapper
1ca3ca22-7c50-4d56-b9af-d401e7742f5f	38aa61b5-b74e-43a7-9cac-898b96d3e87e	privateKey	MIIEpQIBAAKCAQEA5El1Ltg15HXU2kgx541qcm7VPhjc+EBTU+ngdc+oHajM5w+lxutdXYPJ7JTyiqyQA4xnUyVLw/74IsEB1nKQERoMrybrPkIhybTeviig9MqPsBGkoN2qQ5yQl9/59bnU1r+AatzZIjBreyciq2UkE7hUgIwMqGYDk6XbMOUDQdfTLKILaRvzCjkoJ8kZvNBI01nnmd2X3+aqTwuauTxWJ1uYEUVV+XgTFKnHo5YCa9hMYRCKkhQbp6z/sqcVyPh+jC0wEcWVYk02xmGxpukDJN+Y8+8HoXAqKqH6ZOzl0FAF8MW2ZmPQOaLbwIDBnrkpgc+eeunpaR82DLkb91c87wIDAQABAoIBABdtMl6hnBDbHAIKcT9B09qfumJU9YLEQcjVXKNlBpYvQa0J016bvfO1bSifYFm6u6H26+OBwEoCBZS2Gb+CoiYfIONt1auIkyRlMIvIajwJ+BTUEADcvnbnFNorseBK4ac9SlWtCYXop3RL39LsM3eSmEQDcIkXbuaH7qZl2fUM7zanq8BFMd79DfliHBaayd3CnPgXob1xMFnKkD63f2zyXiR0/Ab3FSvoj0EmsLfktjXLHvoA8JFfYiXxfxRPBfOifKB7T3WWqpLNVhc6mpmjQk4BDFv40lrXyV6gS6Sr3nEx1GJjjsqabNIsvrJoB/OGiM6VWQUOXpvFKyM8EwECgYEA+KV6KQZw21dCULKAwSsororF9wDd50VEtd2bYkYMO3mSeElobUfrdLDlt85BNGNI09e3HtyiIJkrwWOrI48C0i5ixTf9leybtNrUrwbL7tPIcyavRrO+oyULFdoT+Eq276Dh5RVUonoEhJDZM9Ox/dSqLzKYXkqrIA4ZAGeKr3kCgYEA6wnWYmM9yjETlQfa6pwnE8Qk45pyoJNqacXh7psXAFIohj7pri1E5iSDFCIMDgleaez6bo8UMSxZhZEHH673uAo75FfA5QilHhVGBeckUXciq74ZMU7xVlyzw2j7dIovMtiB9K70ifyT6ERnXlH6mHUsEhuF1aKJd0IVy6karacCgYEA10ZF1uEpsu4Aj2eMzDH2ve+OaEWK2iIB1EeysUoeaxvdsWE1FXBwLg6+RP5BO/893ZPlisXRZNHYrU4CrP2zno/kmgXY+wXo5ZOVEpia1gLsiK4UkO0sf4mh6GBwa8ccTaoIClQGe8mSwce7FgESGMcYNVbjzrdtI4qxIMWEsFkCgYEA56gQh3StKCXq2Q6e9HHoChFfEn3d0Oq7DXmeT6DIsOZJTtefVq8Do5oFH8jW/Na7GcgapPGcw0KlEYJ59P5s5hYgJdVgJ923cMki9Rp2r1yu7Xs2NWVLdQV1oHpOrPStxH2kyNfP6ljqJxmUkGBYj/+c6lP6OzAyMTsPZGZOBy0CgYEAlxkLbjMhc4bRi3QvCGYv7nlAt1tsIVYRVAq5lIOKe5KEH3jxnY5hX8GFQrWiMAQtD2OmTxj6VyJFPMVq7cgFTzrAlcoVyuyCtxS0e2oSHYQgVyUEfUgSShPbf5IGDZEy10fU92VGO3r8fkBdvH/7PLrXlFp0HsVQkzQABDeVhgM=
36c1282d-d93f-4de5-9e41-cb3e9b7c7f17	38aa61b5-b74e-43a7-9cac-898b96d3e87e	certificate	MIICmzCCAYMCBgGXEXi2ajANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjUwNTI3MTExODMzWhcNMzUwNTI3MTEyMDEzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDkSXUu2DXkddTaSDHnjWpybtU+GNz4QFNT6eB1z6gdqMznD6XG611dg8nslPKKrJADjGdTJUvD/vgiwQHWcpARGgyvJus+QiHJtN6+KKD0yo+wEaSg3apDnJCX3/n1udTWv4Bq3NkiMGt7JyKrZSQTuFSAjAyoZgOTpdsw5QNB19MsogtpG/MKOSgnyRm80EjTWeeZ3Zff5qpPC5q5PFYnW5gRRVX5eBMUqcejlgJr2ExhEIqSFBunrP+ypxXI+H6MLTARxZViTTbGYbGm6QMk35jz7wehcCoqofpk7OXQUAXwxbZmY9A5otvAgMGeuSmBz5566elpHzYMuRv3VzzvAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAOA7iIMM6Zokn9/Be5kMvGozl6PcKTiyJV3jD8Kb5PQ9PmqfejmrsI9SJF26+wJxRZBm5iKQM+pVEhRf8wLSqJi6S3uK3QnHamvQZEN5Mu74QXCrwprhChy9OXq/q1gKqbokke8OMwgoVzVfXpXMEMCALDU1oZ7Cw+s98XuT1A7ruj3b6XkldpatlZ1VDk6tiyQrqvo3GxQ1QLfVrJirNWK1aEBw9kOF3irBwvYonp35LQYwtijYcGFopzMmhjvoNSFd+eBZWW0YSi1GCq2lLKTFPAR/E0wYhz8MJ1WoLCTaC9uEYBs14FPn3s4yo6cNkdJ4FubzaYjrd+pT1azPBN0=
366be208-f37c-4b90-a943-7fb9fe89683f	38aa61b5-b74e-43a7-9cac-898b96d3e87e	keyUse	SIG
a491f279-5ee3-4eec-a501-77adad21a8bb	38aa61b5-b74e-43a7-9cac-898b96d3e87e	priority	100
721ab669-9e48-4e00-9f7f-3b55922bc1ec	94b203ee-18bd-469f-8076-34725b90ff5e	kc.user.profile.config	{"attributes":[{"name":"username","displayName":"${username}","validations":{"length":{"min":3,"max":255},"username-prohibited-characters":{},"up-username-not-idn-homograph":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"email","displayName":"${email}","validations":{"email":{},"length":{"max":255}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"firstName","displayName":"${firstName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"lastName","displayName":"${lastName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false}],"groups":[{"name":"user-metadata","displayHeader":"User metadata","displayDescription":"Attributes, which refer to user metadata"}]}
9c998708-137a-48c0-9a2c-bc8d21e41921	707df348-9c9c-434a-957f-a7b767622324	secret	3eduriQ1gNSQ6IfslCw7rg
4403d49e-8aed-4292-b36f-69cf07b213c2	707df348-9c9c-434a-957f-a7b767622324	kid	4cd8048e-907b-4a3a-8420-a0e26a4a9284
861b1088-91d6-4135-8acc-f8112c0523cf	707df348-9c9c-434a-957f-a7b767622324	priority	100
0294ef2f-c896-4ad9-955c-e459b63ca06e	f372f7d6-1844-4bc5-bf91-bf5c951daf00	secret	jgeF-FiKEhsXDyjgoAufPslTsoW9TPzJgBjHjAraPr0dQ9QrpAsTI6uh_xWA7rINjKKGYeOCJWQnu3PdmS0dYjsb1-Z4tX03jMIyK_Xn1_aDrtcGSI11b4WCB2mFbFin-ZStRPePP7_qWV0J8ElNL1EFSxVJDvriAPbu3hKStkw
ebcf41b4-e0a3-4c78-9881-9bd02b639eb4	f372f7d6-1844-4bc5-bf91-bf5c951daf00	algorithm	HS512
69c7c88a-f6ca-496c-bb57-743e4ae158f1	f372f7d6-1844-4bc5-bf91-bf5c951daf00	priority	100
2bd21f33-fed8-4aa6-b7da-29fa6fe8932d	f372f7d6-1844-4bc5-bf91-bf5c951daf00	kid	cf82de40-9b88-4019-af21-c7a21835a1e8
8d0625be-864e-43ff-b065-b303487577e9	ac715821-b6cd-47f5-86a0-3bb3ea027066	privateKey	MIIEogIBAAKCAQEApH0JqI780o0NJEibkX4XzGStE5sFlJB3oZ3tCIV8pCFYKnTB8rm+gAdFFZvPpaPjPFNkVcuxk8DrdHQm0/r31IqywNoGPlxe2fyJqYu2sLsQcvsgZVVK4XBIZpFPvAoXxYsWssriF9tUqaappTgE5+7hEi89MuzAM25xcGl4PI79HnekPFGiJLHax6gcIs9dn2wQPgXQRmSYT3J4IR9iYCmaMh6Ipn04bUBusUoXmFT1k56JmAeZeWbNvf5SfbzqC9Y5cJCEUB9DBEll+T0QqkjOcffl3/gK+T8lJk7s18sft64p1kijMtVC8kfoheBakxAg+7v+zex89FsF8fL1XQIDAQABAoIBAAHR4Ube5sASjInAd18aedm3+1MtY44TC6HldrFlJzYcFRHewlp2atakyA1jmRrscFc/p13fHAgjiRdaTEKEuC1FyZFlwjoVS30lcv6q7Ukel3JkiLmd3SUXiB2IE0AaKCservVDmdf7dq8lTIE/REldkvwPtFCNhuaJFiU2KiVcGHKxGhzJ8CPbxBzKHWGOZgX/LVTAD0MSNhTdzet6SqdHtd0gbyxAh2ojbg9jTeCMS+86EtrvLJZNbub42o5wK0pQxSZneCFr3BWyyh7mkKcf0Tb4Ciabzq9QNqOJ5Nd629+PJe08yPg1V2FJeOCX/3wlfaZoS+fJtghCiK+6VhECgYEA3Rq0aQ1yugkM8z/4WIUhb19i2AMz5Wz+JVPvN7TRyjVJByqo1vGFmv6RVgfYYOjQcvuRoQnJpHrM2cKzaVefAnDQXNEv6MMutkkwjD1VWPOWp9r7/8DBHIf0LC0PbsIkZbM/iVePUiV8iXW9kqdo9NQL5it83RbYGu/Bg4QfbSUCgYEAvnLgdx804A8woE/jGkxNKahji1ZSxcJUkMLbshDu6tovVzR49gr10ZSXVW9PijumpJBC9EJ9auOrGOttAjTUKd3OIHrGQm5UIWgM5qDInEZlBpU0AzdNhFKObySPrjYEFv7I6hM71yUT92nTCWN5/8L27BtKs0TXLifRVzA1XdkCgYBA2m9mjPpE1RjGVNIsbMhU2Z6ti6ryNZkKK+dz6IbMj/qeroWdnnQ49Uh9+okeS8uwnlel67AInbhueyySzo+mcJ69SuKJnI6cCzXBPNBG6hQboiDecJR0IPCe8IyhSTLR3dTaHSO9zZ8M1stHM/GWNohS+BiE5Ql4RTD2uY9aPQKBgD0vbPv4U6V0W9v1LnIhd1zd03VNe3Q7da24XJq9o/Rhunnays3JQaZehawWAcjYVzZhfpE411BC6pIr+K6PyGXW88UtjIqFJZRB+HsTxr+mQgi2YKpz1vyfBVGhvmNqyS+WFXhWS5BYQiznm7xVcDmCKpA6SGqFwFf8xN2tCEgpAoGAWIFyKesvzZ80ickLgufbLt0Nl8kQiSgfgaSaWEE42nwp5R377qILcd2vQ3hjxJwvF3FhsFTHbeeudr2iREO2P2VyEOGzlgNLHcOUNoGqAuktAa88lkcZICsf3mCpiqZha/o54TDAGRobOZ0k1EXIrlNMRMuwmPvAFOZtUOXoYdM=
1b7f615b-413a-4d26-b1d8-f66460149cb8	ac715821-b6cd-47f5-86a0-3bb3ea027066	keyUse	ENC
2b2bb7c7-7cc1-4ac1-be53-85b320036c5c	ac715821-b6cd-47f5-86a0-3bb3ea027066	certificate	MIICmzCCAYMCBgGXEXi23jANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjUwNTI3MTExODMzWhcNMzUwNTI3MTEyMDEzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCkfQmojvzSjQ0kSJuRfhfMZK0TmwWUkHehne0IhXykIVgqdMHyub6AB0UVm8+lo+M8U2RVy7GTwOt0dCbT+vfUirLA2gY+XF7Z/Impi7awuxBy+yBlVUrhcEhmkU+8ChfFixayyuIX21SppqmlOATn7uESLz0y7MAzbnFwaXg8jv0ed6Q8UaIksdrHqBwiz12fbBA+BdBGZJhPcnghH2JgKZoyHoimfThtQG6xSheYVPWTnomYB5l5Zs29/lJ9vOoL1jlwkIRQH0MESWX5PRCqSM5x9+Xf+Ar5PyUmTuzXyx+3rinWSKMy1ULyR+iF4FqTECD7u/7N7Hz0WwXx8vVdAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAGdIP2Pq+jDP5uCcqoxxRpQgDt6ZIZx5rougTzgXbHDdTzbYgKSBfBVQcvB3xl36YndCdHrTrQrrajsKPWQ3zN8QyGjL9gshGWkTlh6b6pXqCP+B+jc918yA5lEwXUQmY5EZcxxwOHfXCxG/yQjJNZEW0+OtPTQPADGeLYKIRNfCKMWPfzl5svlT/SWle5RerIUoAOpwqhVHUdFaj3CEna7pPkMNdudz57LBIOOoc3dlHFdxmvkVtpQJRbo+m+CE5IQ+ukh+A7hm7T2aHISrOWGzxkrXd9RsfWXqDmpHLPfdv3Ch0VobehmdKGq/VGoO6t52Sdw+5mIIGORzdLa8I+U=
80a577fb-89ee-48d6-be94-e600c2ded9bd	ac715821-b6cd-47f5-86a0-3bb3ea027066	priority	100
295fce06-7186-493c-b5a3-7029dd34efc0	ac715821-b6cd-47f5-86a0-3bb3ea027066	algorithm	RSA-OAEP
535ec2ba-ece2-4e47-b8f2-fd6c3957f043	ec7fd7ce-cef8-4e6a-a94a-e1d9522c2a43	allow-default-scopes	true
6bc5d30e-308e-4d91-99ee-b1a537a7b155	4724d432-92db-4b9b-8c28-a29124ddb012	certificate	MIICrzCCAZcCBgGXERqiCTANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDDBB2aW9sYXRpb24tc3lzdGVtMB4XDTI1MDUyNzA5MzU0N1oXDTM1MDUyNzA5MzcyN1owGzEZMBcGA1UEAwwQdmlvbGF0aW9uLXN5c3RlbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMKgmM7RHTc1psRbRAHGQ4urR3mt+g1zsSqY0fnRO7xgwPlTy4bmNPiAnV9IWmha9Psg1UWEsCSsK0s8sE8YEp7aiM8R6sShJvbEFZFtIJDC/C4GbGrEpAVHep8voSI84daYjY3mJinMxgkr9sixesN020jJOWnHTBO4x7rAU32otMu6COEzXeNX6WZ7to3B2Mx/m746vu0+Ei4vJYFdDdYwEeAa3ibF8sU13yIIYxJcIp/E7wluY9tycETMi0LvjZOtAi1vmeG0VBgLzW+QaZ5/dwmqPk26S/i2oc28Ray9VC1hngbWyZd6lt5L0/ubGuNgTG22SLmEUfT5ilUbG2kCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAL2nFfK7xifwbKHb2zWj7pD7c5T89J1xFRYR16xaDJMD0WJiuywNrqHo74J/Y0r+MJzIqR3BTAEEjxXpMdMbj1z2nw2z1AB5zTEGfiW/8+nAsEoqv3sbNWXgq+uYzKy2sY/eZv9uvCq1X5hQrcnrPXpXDI/AnQjBvZVfnfYIV/xrafqczb5vPhWCfvSEu1yR+VS1lWo5PDqImbdFiAlYLYUkQR4u7zO61+cLmuIiP+2Y763J9GYj92ZQb5Gv2RvVH1Sdz8E0ic0KVWt90yiB1xYJb/laUKt8Ttg0fnXxSvvfNotdYvsfijzqzry1wzlsAJdQZ6065Cpf+34WapCRUkA==
427c085e-4567-4890-b49c-cfb1219e76cb	4724d432-92db-4b9b-8c28-a29124ddb012	priority	100
116d963b-9169-4def-9ffb-33ebd4f4236e	4724d432-92db-4b9b-8c28-a29124ddb012	keyUse	ENC
d1cbfc2d-d010-4c8f-b4ce-34820ab7a30f	4724d432-92db-4b9b-8c28-a29124ddb012	privateKey	MIIEowIBAAKCAQEAwqCYztEdNzWmxFtEAcZDi6tHea36DXOxKpjR+dE7vGDA+VPLhuY0+ICdX0haaFr0+yDVRYSwJKwrSzywTxgSntqIzxHqxKEm9sQVkW0gkML8LgZsasSkBUd6ny+hIjzh1piNjeYmKczGCSv2yLF6w3TbSMk5acdME7jHusBTfai0y7oI4TNd41fpZnu2jcHYzH+bvjq+7T4SLi8lgV0N1jAR4BreJsXyxTXfIghjElwin8TvCW5j23JwRMyLQu+Nk60CLW+Z4bRUGAvNb5Bpnn93Cao+TbpL+LahzbxFrL1ULWGeBtbJl3qW3kvT+5sa42BMbbZIuYRR9PmKVRsbaQIDAQABAoIBAAKgsh93YaUZWNc6141h6g83MJ+wcnlUWraABLRnl55gp1+ruso8o8dyeRghvR1pPk3WW3rKTVSEFzuMpgwTVPZcbfoZvFPg9x/gIDMWnZjGwSqKlKkmXtk2u1hDMjI+TzBGCVc6ncD1DlFuYgZt+wHWOzsILc8YopV7lQVs9lOdJEDrvmt1o4F3t4CrxUN0TgFdwxYcnaF0zSlfLcTfR3gwxWtiWD+viEw6s85JR8+uwyrwXjkDEMNIdTGNtDZSu3YFS6SLK/aGFXZxuZh4WebXoO/cPY2++B9Vjx+zgmLVa+mD4zeY3RRHNy89Rl/qCIAdZ9R4XCQyer7DlJ5Sa9kCgYEA/k/MuZ7xHtgk6BhUQO/dqVY8QO8bfjekVOl91MPnrYT5wsygZUG4eidEykx9tlfHPygTLHhiFeBhtiSVAkFmB6Bo8Az5RFm84whFQjQXAbKTslzff3GlxFAr3GfA9WP0fgmt0pXow9hz9JZ+Pcn0HuHJpWbw4WVrFGhxhfHI1xUCgYEAw+tdOeMB4fLIo++EAzjZyBO4clQmm8awqG92NIRBcN2PJYODc2/kojQM8UBGm6trUWYuHvFO6dLJOTsCOTGtRLtaWXFI0ABoFmZfY8e2oltAjf8mDQc6/9TNwsR0UhDO/FkXcklqCp+lVjPNssgsbxCEAdxUrmNlyEF0eU0tSAUCgYBRC/F8vpCtecjZRtejEk6cJuVw9ELYyLbQcNEvO3fcLuLCGCCN5JH8LAOaTSJLOFJBaG4j4AGyYx4AxEvQujLf/1kyF5BhHhA6cmpQHPWwDs9PKpX3sapYlAxGY7J1AfPrLv58fFYABD2AF24IFxJ7vQ1cbyAZVQ75JAf53gJZuQKBgH10g7gDozr6anx/bTta9inmZt/e/vIVYx4YccrjPbx2Q6mz80LCTdeIGRmLHSulswzmr3Xk87FK5suc+6mAJAG1Lv/DSOrYt85QM5kDU/HXGRlUXxtMm/0iWbf0cL/0P3bb3eWzGRJAdHEkrv1irQFZxA4k9pzMzWpUb68VOn+5AoGBAMF3yK3QxqFCW93ynOkMm8IIMQA9Tp1Ldgvn3va03DBQLQxvOmOtccSVQx6kYMIA7MnMqIj6ifHmyQ/eUHjO/RpdQxt2LXvCyKBBEb2vUVrqru3C6OODisnibo2Su0zdhl3PAY6SJPnPkMy/huo6Fe928RKk7qKH3krxFh583pqv
c94b500e-fbf1-456c-8121-7c9fbd4070c3	4724d432-92db-4b9b-8c28-a29124ddb012	algorithm	RSA-OAEP
0c27d3b0-0bab-4afa-a13d-f6b195458b7b	fa6abd07-d850-42b1-abbc-b93a65149131	allowed-protocol-mapper-types	saml-user-property-mapper
42fed5f1-3874-40ad-84f5-75d1471d3ff0	fa6abd07-d850-42b1-abbc-b93a65149131	allowed-protocol-mapper-types	oidc-address-mapper
2a385648-1c9f-48b0-87f4-9e333de1527f	fa6abd07-d850-42b1-abbc-b93a65149131	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
8eae455d-3a91-46b1-9186-5d667145df6d	fa6abd07-d850-42b1-abbc-b93a65149131	allowed-protocol-mapper-types	oidc-full-name-mapper
2e560327-f14a-40d6-a673-bf5838546e98	fa6abd07-d850-42b1-abbc-b93a65149131	allowed-protocol-mapper-types	saml-role-list-mapper
baea88a7-f289-44fd-9363-1e02677a2321	fa6abd07-d850-42b1-abbc-b93a65149131	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
84f498fb-f6e3-4865-971b-bb07f50aafd7	fa6abd07-d850-42b1-abbc-b93a65149131	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
66e3a9ae-845d-49e1-b6d4-52d58a419f77	fa6abd07-d850-42b1-abbc-b93a65149131	allowed-protocol-mapper-types	saml-user-attribute-mapper
803add18-b5f1-4856-9121-e32e2caada0a	e29cd9a7-3d33-41ce-b519-e81873f1c4d5	allow-default-scopes	true
752f7722-f86c-4534-8e05-633dd109d587	329056bf-84f0-4cfb-a4de-bc82df2da5c2	host-sending-registration-request-must-match	true
c2c487e7-2979-4aea-ba2a-ddcd6da29f1a	329056bf-84f0-4cfb-a4de-bc82df2da5c2	client-uris-must-match	true
90cbee9a-ee64-4856-b9ac-ed8a63719ee2	4d9b25a9-fec6-43d6-8270-30bd70b5ec11	max-clients	200
bc1473f8-e316-4019-9470-b358280c72b0	e257b9c4-c433-4ff1-890f-7026f1ff889d	certificate	MIICrzCCAZcCBgGXERqhejANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDDBB2aW9sYXRpb24tc3lzdGVtMB4XDTI1MDUyNzA5MzU0N1oXDTM1MDUyNzA5MzcyN1owGzEZMBcGA1UEAwwQdmlvbGF0aW9uLXN5c3RlbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANP2jvhQn8MxZVM0JGvwitLxx6FiAPRJ7bgw48OOyGDiVHphNueBzP0MXVF8n+0YNdw2YNlTsctZQqZwKki22OhS2seO7QoULi1SpGA1D1Z5/v132cpUwaA5w1X6biZS2SQsbc/DTg+kZE3cCg3e61xboQvWsduOzBn7RxOPYXSSoVy7IFmesHoitF830DJR8B+3hpd9NgV48DWQyzjYqOSGUsNwNKY1delyKtJhaocUmwRJtAPAwhDF3MZRK7EjugIfO7GSVlxXQhOTjb3C0XVBfVbJkCLYj7132Iif/ZsF8Ke9vfngtDJbiY+RDqcMUACsj1C0U+Wr9e3zHWPqmHECAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAroKAgInzlUam+BEEIPAU2bFCJBlh/bS1mgDW1Z1CqYKfWNTPBoVAGiDH7zn+3riaxq3dAWE4gWSDEdQcuu4evxcFaK9pNjtJGrZIJYUHzrOvfNW6nfu6OJv2AwWpa7PX2I07lPJu91NOyNpTXi5kvDWuCPKTMScOHBkf3zIeXXcAqNoGOKM7sCbr5/NKwZqGnn+SNUoHC14ujA7xo7cOVnVSMWl5wxedJySWcGL+/EE2NDFlpDuA2Yvs14uGZpvABwF/JO1hRPuiOmbT+bccxuapAwJe+Ie3oviKgKuSHUswoNyFBeESwXb/rb9fNkla0eVYeUejVd8TgbkOgBHj0g==
5496944c-bb04-4fe3-8c65-b0a628850b54	e257b9c4-c433-4ff1-890f-7026f1ff889d	priority	100
e9461584-1f2c-42db-9a5c-5cad5f6204a2	e257b9c4-c433-4ff1-890f-7026f1ff889d	keyUse	SIG
4bbcffb2-d3f4-4888-8c5c-3a6e877e4d34	e257b9c4-c433-4ff1-890f-7026f1ff889d	privateKey	MIIEpQIBAAKCAQEA0/aO+FCfwzFlUzQka/CK0vHHoWIA9EntuDDjw47IYOJUemE254HM/QxdUXyf7Rg13DZg2VOxy1lCpnAqSLbY6FLax47tChQuLVKkYDUPVnn+/XfZylTBoDnDVfpuJlLZJCxtz8NOD6RkTdwKDd7rXFuhC9ax247MGftHE49hdJKhXLsgWZ6weiK0XzfQMlHwH7eGl302BXjwNZDLONio5IZSw3A0pjV16XIq0mFqhxSbBEm0A8DCEMXcxlErsSO6Ah87sZJWXFdCE5ONvcLRdUF9VsmQItiPvXfYiJ/9mwXwp729+eC0MluJj5EOpwxQAKyPULRT5av17fMdY+qYcQIDAQABAoIBAATE+i1Bjda+jcvJfehP3qUl0PAjXGd4ImPlSxAOGRl/qOxNXlw8jM2aMZ9bxogh5f8GhOIJrWkooQSjEXssDMVtgoQVsI/BfyiAljeepLG1cl9nCvzahguCQTr2CknNI3BaROj1OWnGBoZvT7/wJtZKhDKCqjiJMLPaS5x3usxSAIDRx9Ift2D0+//JqzWbKLmbpXEe1vhv9YmbrqBjTZNaWcMk0I0+4iubYBZCGLrWtqarX16VsRQ0VfFX2nqAlziluThHdLJB5cKqY9Nusnqik/FJl4W4WlgLVcV8EsBGhFl1Qf+Qz24BBxw7I9hvrW/y+3YG8OFyEBqSd2VuaoECgYEA9DSX/UDF2yDYIjFPX5M6y2G3vGgdecxl6G6c5GPiPoB2JOqiQno38mMMouGGo4v2kLzlFsB/hKjJ4pZVI78dLcSNQoqs/xyt12g21RCZW2Z1f9CgYX9MEi/4rsa2CpKNNngFPIm6c/qUZCajBx4xTj+73wpYTZeEsFnbcTgBEe0CgYEA3jNQZJ5ARMxEJ82PgAYk27KXy6wVppc8HqbMgw706tsMg3X8D3EQmGMtVpY0TF+rcB1gydO8b//PoFGysAr0McEcEKUohxiOkEzmAqkFQJbyMo2IZ7LY3Njk7IIsG3qYVFikdmqR0ywgEQ3OEvMuPYlQ2Uzi7T1wm835tA8goBUCgYEAuE5xX4vhSA6z0KqSkzmVKCZp+2JAzMn9J71D4AOanz1o7VfAepevXdpvkQbRDOH3hylpZRCHrWGObNq1CzOUHBS54Dy1cBz+/xICQDA07gyYJY0ZXjwq95cJAy+p+LS+qxtOKHByLlIyaJvYcujQoZPsgNtX5cezNz26Jurzs8kCgYEAgKhfpVMITY2k7RMWQv/LubYoNJM4mhQ5iFn2UvCHGbGqBjh7sYk7HbFXYCpqr8o5Xxpzn4lNM+CAHQkRGOPOzzxMfsrSs56hdaZBDEtHskV0iZbv43NoJEAmFVeuKF8M8tG8sKA2PXrwOk+vAcPzA0iOGrRtNQb9PAnAyuRzdJ0CgYEAoos3NhJ3osv9XpttePea/wnzRGyjds+xwA68Am0EKwU9EXnyfnFIpFZdTO2OvqWKeicF5pZSfZRk0X+pnpyv2kingS9S/h9UPTtVy9Ml7YMIv0FXW8IZ5pJ3NakbHPbIQdmMik1eeapf2vTyx4W9kUfDwCSq2uUR/q4VEs2ccz4=
2547bfa3-82e9-46d1-a9cb-9ba6c289040c	4f3f084d-94c5-4429-b5b5-097d29e82cb5	algorithm	HS512
7f5fe6ff-3d61-49bd-afa5-340a85478235	4f3f084d-94c5-4429-b5b5-097d29e82cb5	kid	55c95ea2-adc3-43ac-b9f2-b2c3d4cb2f8c
5f963fa7-fc6f-440e-a942-6be083bb200e	4f3f084d-94c5-4429-b5b5-097d29e82cb5	secret	DV4ELj3uQKUcWSOgkIExNsQ-QTCeqdc55ME3F4Zn4SxW9uwnoSM90iKpjzQDNzm2WSRf_fKGsuOVMcXvxazbPDZwljmP9LJrwX13ovnkQeFq4HFKZP7jhvxuMeMndc1Lfu673vldfapUo5alTGuaV-Ly-_56loOBy4Icmyl8wNc
702d9332-c028-4696-833a-70893ba6b318	4f3f084d-94c5-4429-b5b5-097d29e82cb5	priority	100
5ab4caac-cd48-4795-b5a3-af0673ec5069	cdc8e0bc-c593-49db-a189-daae0401cd38	kc.user.profile.config	{"attributes":[{"name":"username","displayName":"${username}","validations":{"length":{"min":3,"max":255},"username-prohibited-characters":{},"up-username-not-idn-homograph":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"email","displayName":"${email}","validations":{"email":{},"length":{"max":255}},"required":{"roles":["user"]},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"fullName","displayName":"Tên người dùng","validations":{},"annotations":{},"required":{"roles":["admin","user"]},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"identityCard","displayName":"Số định danh cá nhân","validations":{},"annotations":{},"required":{"roles":["admin","user"]},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"phoneNumber","displayName":"Số điện thoại","validations":{},"annotations":{},"required":{"roles":["admin","user"]},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false}],"groups":[{"name":"user-metadata","displayHeader":"User metadata","displayDescription":"Attributes, which refer to user metadata"}]}
d3e77dcd-1abf-46d0-ac36-d52d8ffecc57	0956f3c2-0853-43b5-bc2b-16516942f17d	kid	83e75a4e-a3ee-47dc-8b8f-efe87e904090
20d8b2f4-b96e-4aa0-9eb7-87a084afd912	0956f3c2-0853-43b5-bc2b-16516942f17d	secret	L4c5BlAlWSOZjYRzLJitfw
6351ca95-312d-4f6a-b3c3-f81e9eccedd9	0956f3c2-0853-43b5-bc2b-16516942f17d	priority	100
1b39473f-a746-4cf8-bfb6-d192252b3f39	740e0875-b4cc-467c-ad6e-9cb0c69f30ee	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
0f4bc40e-c064-4310-8396-ecede2054e13	740e0875-b4cc-467c-ad6e-9cb0c69f30ee	allowed-protocol-mapper-types	saml-user-attribute-mapper
83eda6fd-cd29-4674-adbb-c426d05c684f	740e0875-b4cc-467c-ad6e-9cb0c69f30ee	allowed-protocol-mapper-types	oidc-full-name-mapper
8c450247-64a2-4892-82de-ec9b50a4ee5f	740e0875-b4cc-467c-ad6e-9cb0c69f30ee	allowed-protocol-mapper-types	oidc-address-mapper
9d7850dc-be9f-4dfc-959b-20b1f0860679	740e0875-b4cc-467c-ad6e-9cb0c69f30ee	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
3146b69d-2fb9-4336-94e6-c9bef6ef10e3	740e0875-b4cc-467c-ad6e-9cb0c69f30ee	allowed-protocol-mapper-types	saml-user-property-mapper
63453495-10f4-46b6-b17c-8f4979569e5e	740e0875-b4cc-467c-ad6e-9cb0c69f30ee	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
8485165f-faf5-4ebe-9431-5e8fbe25b956	740e0875-b4cc-467c-ad6e-9cb0c69f30ee	allowed-protocol-mapper-types	saml-role-list-mapper
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.composite_role (composite, child_role) FROM stdin;
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	76b48efd-0bbd-4a31-b9f9-ec0dbcebe079
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	1d2c228c-d318-403e-9b5d-aa7a6fac0b1c
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	1c6a0a14-15b2-4902-9115-d8cd6471bc48
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	b2b391f0-ff98-4cf0-a166-a88b9930081d
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	710f2430-66d8-4481-a0f7-184065986fae
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	d6c7a372-a383-41ba-a76b-eb5193f4e009
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	9a2a3ef4-b9c4-41cf-bc7e-8503bf6ec13b
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	cd3133c2-dff7-4e93-a8b4-d7f5863bc01d
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	6e135297-ff9d-4d43-b6c8-d546d78251ea
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	75752944-b247-4f56-9657-44a835141f63
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	cded22b4-0a21-4e78-8a7a-ba76f098117f
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	39b06046-f360-4cfa-b613-7d231c6f3839
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	d5fe20f3-ffd7-493e-aa52-6af29c0763d9
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	115dddd7-51a7-424f-a060-bbf4fd36410c
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	8a0acd20-b779-4d67-bbfa-cc78a752c0ef
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	3a756a9c-136a-4007-b752-98bdc122eb8c
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	c898c342-d387-4194-941e-9decea865837
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	673b1dd5-03ed-4a9e-a6d2-9628a379daf2
710f2430-66d8-4481-a0f7-184065986fae	3a756a9c-136a-4007-b752-98bdc122eb8c
b2b391f0-ff98-4cf0-a166-a88b9930081d	8a0acd20-b779-4d67-bbfa-cc78a752c0ef
b2b391f0-ff98-4cf0-a166-a88b9930081d	673b1dd5-03ed-4a9e-a6d2-9628a379daf2
ba6ac653-34a3-4b2a-ac74-8c56a9b5f66a	e2403b55-f3e9-4b0a-bad8-306dc6f3e198
ba6ac653-34a3-4b2a-ac74-8c56a9b5f66a	c061eedf-cc54-43c8-b96c-49601fbdf682
c061eedf-cc54-43c8-b96c-49601fbdf682	8d0c6306-09bf-402b-b2d4-062df0026cdf
19f91c4f-4660-4ed2-857d-0d9919d22477	b58605b3-c205-4287-afcc-6274ac960931
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	2c60e3b1-53c7-4b55-915f-c483cbbfd39d
ba6ac653-34a3-4b2a-ac74-8c56a9b5f66a	fdcfbbbd-ba00-4660-8b64-e5fe7b5c41e5
ba6ac653-34a3-4b2a-ac74-8c56a9b5f66a	b01f1e8d-f9f6-40c6-a043-cc3f97a869f6
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	15e46ad5-9a6c-4001-a111-ee2e93679639
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	4f31d0bd-8e14-4ffe-88da-21482fdacc8a
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	8fb79864-9cf5-4b20-930b-72127601ef2c
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	8da2c82f-eb22-4c42-b62f-6e6d2e1eee0f
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	f0d493f3-8154-495b-919f-acf950d32968
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	c39b83e2-acff-4a72-839e-f8f0477de5b8
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	9a997053-3925-42f4-8d7c-935a25e24311
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	8cf132ed-edf8-4988-adeb-5ac2bcb025db
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	a0703aba-03c0-4e9e-8614-02fbba4042df
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	a2e760a8-676b-4db5-a916-925e1556d795
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	d82539f5-6880-43f6-a9bd-184bf4ecd33f
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	374b0399-0d60-4cfa-93e8-99013a680680
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	01a78076-cbf2-406c-9f56-2e5e2fd9fd99
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	8551a5bb-bfb5-41ff-ba01-df9d755d3c45
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	67c58be2-db16-464b-a505-2f42b6b7f36f
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	7105d77e-1d1e-45a8-aedd-5fae19720d28
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	26cc76ab-8e36-45d1-808e-8bcffc8098e1
8da2c82f-eb22-4c42-b62f-6e6d2e1eee0f	67c58be2-db16-464b-a505-2f42b6b7f36f
8fb79864-9cf5-4b20-930b-72127601ef2c	8551a5bb-bfb5-41ff-ba01-df9d755d3c45
8fb79864-9cf5-4b20-930b-72127601ef2c	26cc76ab-8e36-45d1-808e-8bcffc8098e1
068bdfe0-7aa1-480c-8a0c-b0f128beecd7	3e41db10-19fc-492f-b9c0-a9e5010f8d0e
ab18b326-0a16-4b87-a728-45cb9a72d263	ef2ee163-55e3-4806-9725-4f5be4968b50
ab18b326-0a16-4b87-a728-45cb9a72d263	ff7582b9-2b4c-41af-9393-a9724a2d503d
ab18b326-0a16-4b87-a728-45cb9a72d263	6619ce06-3777-40c7-b101-d27bfa5c7fa1
ab18b326-0a16-4b87-a728-45cb9a72d263	768dead6-30f1-4f07-b04d-b24ea7064092
b8314408-6cac-49e8-90fa-bb491cc63c7e	541b9983-ecdc-4bb4-8331-dcad473df56b
b8314408-6cac-49e8-90fa-bb491cc63c7e	e83fe6d4-2955-4132-a570-f9c0ca954d5f
b8314408-6cac-49e8-90fa-bb491cc63c7e	ba41cd6a-fedd-4e47-b097-5b1c6275f5f0
b8314408-6cac-49e8-90fa-bb491cc63c7e	c9b28080-a4c3-4207-8076-7bb5a2d7a008
b8314408-6cac-49e8-90fa-bb491cc63c7e	d733dead-c2b6-4f93-aa48-595b44749ed2
b8314408-6cac-49e8-90fa-bb491cc63c7e	2b5b65d7-b7df-4798-b9aa-eac2c80fad45
b8314408-6cac-49e8-90fa-bb491cc63c7e	ac3f2bfa-c318-4ed4-b492-79fea304b1bc
b8314408-6cac-49e8-90fa-bb491cc63c7e	f904085d-86a7-401f-bbdb-6306421b087b
b8314408-6cac-49e8-90fa-bb491cc63c7e	fd0a9216-e9af-4154-bf91-2ee4408ec026
b8314408-6cac-49e8-90fa-bb491cc63c7e	262ebd55-4ca4-40af-b112-c5f437a7ebeb
b8314408-6cac-49e8-90fa-bb491cc63c7e	97eb03ea-f78c-44b5-b7e8-74fc0fc22fe7
b8314408-6cac-49e8-90fa-bb491cc63c7e	48f4a28b-bbca-4c81-88eb-4f1799a98ab4
b8314408-6cac-49e8-90fa-bb491cc63c7e	e0692de9-c2f7-4fd1-b693-b4cf12d6518d
b8314408-6cac-49e8-90fa-bb491cc63c7e	dc4b2bf1-d1cb-47ab-a12e-b12f31562fcc
b8314408-6cac-49e8-90fa-bb491cc63c7e	6803cb44-a3ff-4618-9a79-4d23afbfbf79
b8314408-6cac-49e8-90fa-bb491cc63c7e	05cc1e10-a76d-48bf-9c70-a9818655570f
b8314408-6cac-49e8-90fa-bb491cc63c7e	91ed453c-ade6-443f-a541-ee09daff7f4f
b8314408-6cac-49e8-90fa-bb491cc63c7e	dfff9d50-26db-4a48-83fd-fa21abe2bce8
d733dead-c2b6-4f93-aa48-595b44749ed2	541b9983-ecdc-4bb4-8331-dcad473df56b
e0692de9-c2f7-4fd1-b693-b4cf12d6518d	48f4a28b-bbca-4c81-88eb-4f1799a98ab4
e0692de9-c2f7-4fd1-b693-b4cf12d6518d	dfff9d50-26db-4a48-83fd-fa21abe2bce8
ef2ee163-55e3-4806-9725-4f5be4968b50	4c1c5718-3f2d-4eb5-9255-13da255d151e
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	20a4814f-a430-4bb5-9a80-f99e350c47d6
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
99f495d6-0d98-4e82-8fa7-edc048df4f3f	\N	password	c61b7e1f-57dc-4a83-a298-b69e5d33c044	1748342097030	My password	{"value":"BPdHyQB5VQN5hJFdOpbi8nPrTQG6pjNkddsMPOw3MFr00zZFKwD/j7mZ6yIy4rDpmIZpvH1hx7WWU+4o0SD/Ew==","salt":"p4hs74iJ4ZddFOyYcVq1bA==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
e6f54a44-d19b-48c6-9f26-6dad01a2d76c	\N	password	96e816b2-13b7-42af-8e5a-720b4bc84cc4	1748344816429	\N	{"value":"Tia0ul/91hcP0x1B5mpyLZJuXQFLgL693oyzNtNJMfTvIrg7XnhuXFX+r9lktleB+9qWc4GZlbmT6NGtij2YVQ==","salt":"EBdb55fjdmf3ky9F+Pt8dA==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
b6828681-8c4c-404a-ba1e-6ffd5637f54f	\N	password	c200e091-4552-40de-b721-8e4ac046d812	1748370541522	My password	{"value":"xoeCbgXw6hm6WuuIA4CuJ0jL2mUkI8MMHgGwyGdhWRh8Osk0P+xu83KT3oIQP91CyDMW/9PW78gZUSagH2fIxg==","salt":"C6DFV1JBk1M8VBNs7OUfgw==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
454ff102-5691-4bc2-882d-365f39d2c4ee	\N	password	c69eabb7-a087-48a1-8510-1a7f1bef6e79	1748371012049	\N	{"value":"cCdZxBhURzVUc9cvS9NkZ1BH8BTi/SBKCHMtdwqWcjzSsbPqTxJCF7GHhk8iGkhpS1+Y3al40GK5IDVk3f6ZdQ==","salt":"SVEFMg3hN+BVQWXrDIDLAg==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
c949fb07-490b-418b-9948-1407f4d6ff55	\N	password	def6ece6-9ecf-484d-8b2d-bf9402042dda	1748432224700	\N	{"value":"7FNk5oFzNQOGnqRCdcBV3sXWaYCXdlWipv6p/hHbOm9STNDVvqlQnyJYDoTcj3ug/C+1uk6Z3mVn7c9KOFJSXA==","salt":"iah64+/aCW8fVk/i0tqVHw==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
b53910da-c3e4-4416-a335-a2dbb42940ab	\N	password	86c52cf2-109a-4cfe-bdd3-839a0f1ba7a4	1748432237896	\N	{"value":"CCEhmF/+Y5FtYo8+sm6FmFkQhL5Ywq1WFu9SY7VDZdkVX4TskMXiebI8QJ56rkQ3JhiyWMjCTBjXyhjgqZ+6DA==","salt":"NDa/OMKu/XTJhQdFcFKsbw==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
d2dd4dcc-4b35-47f0-8fbc-d8cdf6501b44	\N	password	8a9f43a8-16e8-4853-b06d-af4406d3d990	1748432251065	\N	{"value":"Xne1exLwLPXBVFbVkdHKlT+wf6piqLZZ6F5W+qhHkTa0uUDvuSaf5hMn0Kb3kf60wMi4TGuynfRQhrmN4gRxvQ==","salt":"3gzJ9PqGr1/JbJvonr+szA==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
86a56323-d273-4d06-b8c5-34128fcd30a4	\N	password	0477c90e-88b8-4adb-ad7e-15ef2cbdfdea	1748432260027	\N	{"value":"NoxLKjh+9/DDeq7jj8JhqIF+y9zjQ8NSNdK/cMu4reu3ksnJ81nbwJzCqn6GDzkdENw2AvaUamoOe0A6I5Hk5Q==","salt":"m/9diwiBG1bdwADAqW06Ew==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
c1822a7e-e119-4890-8161-4fbe45cdca91	\N	password	b201b699-76df-4ca7-8e20-982c9ea08ae9	1748432269191	\N	{"value":"O1i3l4nCaf4MJz9A2i1qha7rpJ7Ha8JkACKEfyjfjdNYeohFhrBB/wMKH2jMTBEhDfomLOheMBlMZrG9KLspug==","salt":"7phSt3q9nt9nyy87Ey83ww==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
0471fcd4-2da4-44b5-95fd-d48910a0cd59	\N	password	32a0e73e-a226-4d2b-a19f-10f9f5292858	1748432279943	\N	{"value":"UfKP+saU80t/u7QhFNyDVTciG3bDBbLJL2ib0pS3PFApbxym8PCO+sWyZWMiETe9l/L0sQ7h4QjsB4Pt2Gp9Og==","salt":"PCbqtn91GWf/1HrK7tD+4Q==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
04809a68-0f9d-4fdf-9644-94af0ad396ca	\N	password	e914bbd6-6db1-4762-bcae-a15daae55e68	1748432288870	\N	{"value":"pwCv8r7Coz5GcElDmBFA4MLd2Uuj97tCSrFsYCFYdQhlerrsVDtFISqQeS2dSTdDTbbPn938utuTnp0ZoylyZQ==","salt":"zXGvmixmIRdgRc/PvPSGMw==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
213ff4f4-73ec-4ce4-b1fc-3bbe3893bfd5	\N	password	f2c8a807-eb1c-40ab-9bbc-2f352f8f19b9	1748432301241	\N	{"value":"Ws1lcGLoSbAZm8gqrmJgIzJO20ySgQOVKyZyAIeW8mwIJWGg07J9J5Qiwn7vrMLOR4PK+p7QGAP+roHqonqqcg==","salt":"qqw8EcoozU8n2CxN6nLXlg==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
c963114e-a677-4eee-874f-67135428963a	\N	password	369432fb-b127-4244-b5d0-463b4a9d46c0	1748432314487	\N	{"value":"nnmG25i8XRa77JJ+0Po5I1Ijc9FfGvWHidZPZML5qnGmfQcvYLlOLbORUIm2bu1aCG1cfzVYDhVupE7Nfxw/tw==","salt":"yCTwoVxxe3Ew9x+Il2r1LQ==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
009dcd08-3341-4ab5-acf7-3ef46a4c057c	\N	password	9cf11d32-6f50-4b88-a83a-da4296bf44f2	1748432325092	\N	{"value":"2M1G29VYRbcCy9GSWhAo/2yWIav6ypNGa90XyifqEgETTwykvCnm2rRAuyzQ7xzMcZKf1T0KP9nDBMY8kjPs/w==","salt":"UqhVD79HG22lRDTikd7QPw==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
e00fe37c-1a19-4390-9c0e-e96de28b1968	\N	password	ead92f4e-abe7-4c89-8c50-40017580f6bb	1748432403548	\N	{"value":"VROt8NjpliZlduDjQGd6Zvd1CMnHBFyunCezrKCbR8SUbOzn5nkDUQI1b4f8CtOQ9CmKbhZI6j1aN1w/yF7IsA==","salt":"heNnhiNWEl44L6/+7Tn8Ig==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
1c0b4de2-c2a4-4dd2-9154-ad54c0337e5d	\N	password	f2ca25e0-e2bb-4cbc-8d80-c93aa8d5d714	1748432415286	\N	{"value":"kOuk2fqleV1i3UtHHW9qr7Qeh/n480qjf3ZBlMZyWUAqQ2IW7xnFZG4GOAzWo8ZHXSLoquscygc7ovh8Zd1ALg==","salt":"siOM5VoR4MhYqdVUYIreAg==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
8f69b420-27ac-4960-a9ed-3e78e2da6787	\N	password	6c067068-4335-47af-8a01-32416137a5f6	1748432445220	\N	{"value":"fFEY9vXok//jsL5hJIAgkhd9hxS1pIu/vBt/g96f4NxHJrHe9L94aubuZ5ZrbP9xgRQFFpZUz9v+DnIGoA5A3A==","salt":"LmS3sh4MZ3c2Rv0vnyIsOQ==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
da24d83f-fa52-48fe-a635-93a2f8f5b8b8	\N	password	7ddcaea6-5c3b-49ac-988e-c3353d365656	1748432453571	\N	{"value":"6+Hh25a3QrWkTpXPLdRNDx4dp6e6YL3cptQhss3ox8LmYEKYMs/EUoLpwhjb1kSpRI1eaCbc2CZ6rz/ucur0gw==","salt":"XrmxVc9+oekVYh/LYODPtA==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
c18db341-0adf-4b45-bae1-46c3467679b4	\N	password	0e5f7ced-91de-4496-b164-271655d3dd09	1748432463160	\N	{"value":"Mqd83Wh3T2b53fI+ly5yj6C0qPPrctb6BlUrjeDR+7hX5VprhT2EVQACDvu2ZbdDrYahvDyHALaZ6XyYkYHghw==","salt":"KEoutvSGZozIZXzFDcdz/g==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
1ed04058-4ff4-4920-8b6e-e619625819b6	\N	password	16398a91-879d-4763-b0f4-3f295cdc4e71	1748432472463	\N	{"value":"Q1ebq4okFRV6eOOsjy+smA8+VxeRJUuSYIuItExHz526GPGo4GlsLLEEtjoYmOPELsu0bSqixKchKAUQtYOwOw==","salt":"Ks7n515b2kXOtkPQSN8Y5Q==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
1e5084d6-647d-4df6-b527-b19f81879c40	\N	password	97c94877-8348-4d33-a17f-7baad60d16ea	1748432482030	\N	{"value":"sn6FTAIphjNKB/w4oWvyEcKhxXqeCtX32fK7Rz31k7oyNBAuw0gdd+Wq93VwQKKAcSQhNdCqoTtnr7VrTcRVNg==","salt":"4UJqtIBcLN7DvUL/Xghfzw==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
8747d6bb-d4fb-4ba6-bc51-4be763451987	\N	password	8a9d49a7-3c21-4e14-b584-9a35b6505352	1748432491865	\N	{"value":"lwrWzt1O/7nmLJhsaMthqTyCIU5HWg7etqkLYPMdWoxfcdRS+R1VJozSmkTTMWuwdavC1vJaged4pUAAYVUbPA==","salt":"H//rorvbqhMaoo4dIzgiLg==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
72676d12-5bbe-42e9-995c-5b92851136c4	\N	password	7faf3975-73e5-4925-b6c0-6c4191daf102	1748432501778	\N	{"value":"eMLbkhV32NEVNZZYZS42GRTDn19QWHGKK8HGciMeOm6YCrDE1aYhk6Zzkcj5TRHjq2Xclb1BEi6AncnHJvDRkQ==","salt":"/tV0G+ZlcfaLOsrFMfT5Bw==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
7b72917e-b71a-4501-853e-5878b820aa0d	\N	password	6d9e0a86-ce11-402c-b9c5-857f6fdcc598	1748434524975	\N	{"value":"Ba1jTL90iaybAUvkAIxYWFeViEH+8A4A1zztXWhC94PIq3xZkvXGBJfnNsNBFfW4hr3DTqOqiN0xpqy41ZcD8Q==","salt":"BVCRX0ZHS4lgW8B1DDfalg==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2025-05-27 11:20:10.384054	1	EXECUTED	9:6f1016664e21e16d26517a4418f5e3df	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.25.1	\N	\N	8344810012
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2025-05-27 11:20:10.40412	2	MARK_RAN	9:828775b1596a07d1200ba1d49e5e3941	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.25.1	\N	\N	8344810012
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2025-05-27 11:20:10.453534	3	EXECUTED	9:5f090e44a7d595883c1fb61f4b41fd38	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.25.1	\N	\N	8344810012
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2025-05-27 11:20:10.460081	4	EXECUTED	9:c07e577387a3d2c04d1adc9aaad8730e	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.25.1	\N	\N	8344810012
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2025-05-27 11:20:10.534666	5	EXECUTED	9:b68ce996c655922dbcd2fe6b6ae72686	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.25.1	\N	\N	8344810012
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2025-05-27 11:20:10.540447	6	MARK_RAN	9:543b5c9989f024fe35c6f6c5a97de88e	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.25.1	\N	\N	8344810012
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2025-05-27 11:20:10.599016	7	EXECUTED	9:765afebbe21cf5bbca048e632df38336	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.25.1	\N	\N	8344810012
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2025-05-27 11:20:10.604793	8	MARK_RAN	9:db4a145ba11a6fdaefb397f6dbf829a1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.25.1	\N	\N	8344810012
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2025-05-27 11:20:10.610803	9	EXECUTED	9:9d05c7be10cdb873f8bcb41bc3a8ab23	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.25.1	\N	\N	8344810012
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2025-05-27 11:20:10.679271	10	EXECUTED	9:18593702353128d53111f9b1ff0b82b8	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.25.1	\N	\N	8344810012
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2025-05-27 11:20:10.721303	11	EXECUTED	9:6122efe5f090e41a85c0f1c9e52cbb62	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.25.1	\N	\N	8344810012
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2025-05-27 11:20:10.726445	12	MARK_RAN	9:e1ff28bf7568451453f844c5d54bb0b5	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.25.1	\N	\N	8344810012
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2025-05-27 11:20:10.746487	13	EXECUTED	9:7af32cd8957fbc069f796b61217483fd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.25.1	\N	\N	8344810012
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-05-27 11:20:10.761546	14	EXECUTED	9:6005e15e84714cd83226bf7879f54190	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.25.1	\N	\N	8344810012
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-05-27 11:20:10.764369	15	MARK_RAN	9:bf656f5a2b055d07f314431cae76f06c	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.25.1	\N	\N	8344810012
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-05-27 11:20:10.767401	16	MARK_RAN	9:f8dadc9284440469dcf71e25ca6ab99b	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.25.1	\N	\N	8344810012
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-05-27 11:20:10.771179	17	EXECUTED	9:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.25.1	\N	\N	8344810012
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2025-05-27 11:20:10.800258	18	EXECUTED	9:3368ff0be4c2855ee2dd9ca813b38d8e	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.25.1	\N	\N	8344810012
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2025-05-27 11:20:10.827393	19	EXECUTED	9:8ac2fb5dd030b24c0570a763ed75ed20	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.25.1	\N	\N	8344810012
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2025-05-27 11:20:10.833317	20	EXECUTED	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.25.1	\N	\N	8344810012
24.0.0-9758-2	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-05-27 11:20:11.651754	119	EXECUTED	9:bf0fdee10afdf597a987adbf291db7b2	customChange		\N	4.25.1	\N	\N	8344810012
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2025-05-27 11:20:10.837663	21	MARK_RAN	9:831e82914316dc8a57dc09d755f23c51	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.25.1	\N	\N	8344810012
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2025-05-27 11:20:10.841137	22	MARK_RAN	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.25.1	\N	\N	8344810012
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2025-05-27 11:20:10.866601	23	EXECUTED	9:bc3d0f9e823a69dc21e23e94c7a94bb1	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.25.1	\N	\N	8344810012
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2025-05-27 11:20:10.874177	24	EXECUTED	9:c9999da42f543575ab790e76439a2679	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.25.1	\N	\N	8344810012
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2025-05-27 11:20:10.876515	25	MARK_RAN	9:0d6c65c6f58732d81569e77b10ba301d	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.25.1	\N	\N	8344810012
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2025-05-27 11:20:10.891676	26	EXECUTED	9:fc576660fc016ae53d2d4778d84d86d0	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.25.1	\N	\N	8344810012
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2025-05-27 11:20:10.93725	27	EXECUTED	9:43ed6b0da89ff77206289e87eaa9c024	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.25.1	\N	\N	8344810012
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2025-05-27 11:20:10.941174	28	EXECUTED	9:44bae577f551b3738740281eceb4ea70	update tableName=RESOURCE_SERVER_POLICY		\N	4.25.1	\N	\N	8344810012
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2025-05-27 11:20:10.976564	29	EXECUTED	9:bd88e1f833df0420b01e114533aee5e8	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.25.1	\N	\N	8344810012
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2025-05-27 11:20:10.988622	30	EXECUTED	9:a7022af5267f019d020edfe316ef4371	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.25.1	\N	\N	8344810012
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2025-05-27 11:20:11.005523	31	EXECUTED	9:fc155c394040654d6a79227e56f5e25a	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.25.1	\N	\N	8344810012
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2025-05-27 11:20:11.01296	32	EXECUTED	9:eac4ffb2a14795e5dc7b426063e54d88	customChange		\N	4.25.1	\N	\N	8344810012
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-05-27 11:20:11.020703	33	EXECUTED	9:54937c05672568c4c64fc9524c1e9462	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.25.1	\N	\N	8344810012
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-05-27 11:20:11.022732	34	MARK_RAN	9:3a32bace77c84d7678d035a7f5a8084e	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.25.1	\N	\N	8344810012
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-05-27 11:20:11.044222	35	EXECUTED	9:33d72168746f81f98ae3a1e8e0ca3554	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.25.1	\N	\N	8344810012
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2025-05-27 11:20:11.051262	36	EXECUTED	9:61b6d3d7a4c0e0024b0c839da283da0c	addColumn tableName=REALM		\N	4.25.1	\N	\N	8344810012
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-05-27 11:20:11.056642	37	EXECUTED	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.25.1	\N	\N	8344810012
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2025-05-27 11:20:11.061445	38	EXECUTED	9:a2b870802540cb3faa72098db5388af3	addColumn tableName=FED_USER_CONSENT		\N	4.25.1	\N	\N	8344810012
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2025-05-27 11:20:11.065104	39	EXECUTED	9:132a67499ba24bcc54fb5cbdcfe7e4c0	addColumn tableName=IDENTITY_PROVIDER		\N	4.25.1	\N	\N	8344810012
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-05-27 11:20:11.067251	40	MARK_RAN	9:938f894c032f5430f2b0fafb1a243462	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.25.1	\N	\N	8344810012
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-05-27 11:20:11.069922	41	MARK_RAN	9:845c332ff1874dc5d35974b0babf3006	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.25.1	\N	\N	8344810012
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2025-05-27 11:20:11.076896	42	EXECUTED	9:fc86359c079781adc577c5a217e4d04c	customChange		\N	4.25.1	\N	\N	8344810012
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-05-27 11:20:11.117293	43	EXECUTED	9:59a64800e3c0d09b825f8a3b444fa8f4	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.25.1	\N	\N	8344810012
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2025-05-27 11:20:11.122725	44	EXECUTED	9:d48d6da5c6ccf667807f633fe489ce88	addColumn tableName=USER_ENTITY		\N	4.25.1	\N	\N	8344810012
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-05-27 11:20:11.128311	45	EXECUTED	9:dde36f7973e80d71fceee683bc5d2951	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.25.1	\N	\N	8344810012
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-05-27 11:20:11.13425	46	EXECUTED	9:b855e9b0a406b34fa323235a0cf4f640	customChange		\N	4.25.1	\N	\N	8344810012
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-05-27 11:20:11.136541	47	MARK_RAN	9:51abbacd7b416c50c4421a8cabf7927e	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.25.1	\N	\N	8344810012
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-05-27 11:20:11.15733	48	EXECUTED	9:bdc99e567b3398bac83263d375aad143	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.25.1	\N	\N	8344810012
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-05-27 11:20:11.161792	49	EXECUTED	9:d198654156881c46bfba39abd7769e69	addColumn tableName=REALM		\N	4.25.1	\N	\N	8344810012
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2025-05-27 11:20:11.180316	50	EXECUTED	9:cfdd8736332ccdd72c5256ccb42335db	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.25.1	\N	\N	8344810012
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2025-05-27 11:20:11.189346	51	EXECUTED	9:7c84de3d9bd84d7f077607c1a4dcb714	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.25.1	\N	\N	8344810012
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2025-05-27 11:20:11.194146	52	EXECUTED	9:5a6bb36cbefb6a9d6928452c0852af2d	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	8344810012
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2025-05-27 11:20:11.196451	53	EXECUTED	9:8f23e334dbc59f82e0a328373ca6ced0	update tableName=REALM		\N	4.25.1	\N	\N	8344810012
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2025-05-27 11:20:11.199232	54	EXECUTED	9:9156214268f09d970cdf0e1564d866af	update tableName=CLIENT		\N	4.25.1	\N	\N	8344810012
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-05-27 11:20:11.202999	55	EXECUTED	9:db806613b1ed154826c02610b7dbdf74	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.25.1	\N	\N	8344810012
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-05-27 11:20:11.207166	56	EXECUTED	9:229a041fb72d5beac76bb94a5fa709de	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.25.1	\N	\N	8344810012
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-05-27 11:20:11.262548	57	EXECUTED	9:079899dade9c1e683f26b2aa9ca6ff04	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.25.1	\N	\N	8344810012
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-05-27 11:20:11.306004	58	EXECUTED	9:139b79bcbbfe903bb1c2d2a4dbf001d9	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.25.1	\N	\N	8344810012
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2025-05-27 11:20:11.318422	59	EXECUTED	9:b55738ad889860c625ba2bf483495a04	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.25.1	\N	\N	8344810012
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2025-05-27 11:20:11.323006	60	EXECUTED	9:e0057eac39aa8fc8e09ac6cfa4ae15fe	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.25.1	\N	\N	8344810012
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2025-05-27 11:20:11.331999	61	EXECUTED	9:42a33806f3a0443fe0e7feeec821326c	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.25.1	\N	\N	8344810012
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2025-05-27 11:20:11.335324	62	EXECUTED	9:9968206fca46eecc1f51db9c024bfe56	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.25.1	\N	\N	8344810012
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2025-05-27 11:20:11.33874	63	EXECUTED	9:92143a6daea0a3f3b8f598c97ce55c3d	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.25.1	\N	\N	8344810012
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2025-05-27 11:20:11.342213	64	EXECUTED	9:82bab26a27195d889fb0429003b18f40	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.25.1	\N	\N	8344810012
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2025-05-27 11:20:11.345757	65	EXECUTED	9:e590c88ddc0b38b0ae4249bbfcb5abc3	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.25.1	\N	\N	8344810012
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2025-05-27 11:20:11.352942	66	EXECUTED	9:5c1f475536118dbdc38d5d7977950cc0	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.25.1	\N	\N	8344810012
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2025-05-27 11:20:11.357237	67	EXECUTED	9:e7c9f5f9c4d67ccbbcc215440c718a17	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.25.1	\N	\N	8344810012
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2025-05-27 11:20:11.362107	68	EXECUTED	9:88e0bfdda924690d6f4e430c53447dd5	addColumn tableName=REALM		\N	4.25.1	\N	\N	8344810012
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2025-05-27 11:20:11.371935	69	EXECUTED	9:f53177f137e1c46b6a88c59ec1cb5218	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.25.1	\N	\N	8344810012
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2025-05-27 11:20:11.37819	70	EXECUTED	9:a74d33da4dc42a37ec27121580d1459f	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.25.1	\N	\N	8344810012
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2025-05-27 11:20:11.382674	71	EXECUTED	9:fd4ade7b90c3b67fae0bfcfcb42dfb5f	addColumn tableName=RESOURCE_SERVER		\N	4.25.1	\N	\N	8344810012
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-05-27 11:20:11.389056	72	EXECUTED	9:aa072ad090bbba210d8f18781b8cebf4	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.25.1	\N	\N	8344810012
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-05-27 11:20:11.394956	73	EXECUTED	9:1ae6be29bab7c2aa376f6983b932be37	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.25.1	\N	\N	8344810012
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-05-27 11:20:11.397196	74	MARK_RAN	9:14706f286953fc9a25286dbd8fb30d97	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.25.1	\N	\N	8344810012
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-05-27 11:20:11.411014	75	EXECUTED	9:2b9cc12779be32c5b40e2e67711a218b	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.25.1	\N	\N	8344810012
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-05-27 11:20:11.415757	76	EXECUTED	9:91fa186ce7a5af127a2d7a91ee083cc5	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.25.1	\N	\N	8344810012
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-05-27 11:20:11.419764	77	EXECUTED	9:6335e5c94e83a2639ccd68dd24e2e5ad	addColumn tableName=CLIENT		\N	4.25.1	\N	\N	8344810012
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-05-27 11:20:11.421611	78	MARK_RAN	9:6bdb5658951e028bfe16fa0a8228b530	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.25.1	\N	\N	8344810012
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-05-27 11:20:11.433518	79	EXECUTED	9:d5bc15a64117ccad481ce8792d4c608f	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.25.1	\N	\N	8344810012
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-05-27 11:20:11.435434	80	MARK_RAN	9:077cba51999515f4d3e7ad5619ab592c	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.25.1	\N	\N	8344810012
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-05-27 11:20:11.440767	81	EXECUTED	9:be969f08a163bf47c6b9e9ead8ac2afb	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.25.1	\N	\N	8344810012
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-05-27 11:20:11.442515	82	MARK_RAN	9:6d3bb4408ba5a72f39bd8a0b301ec6e3	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.25.1	\N	\N	8344810012
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-05-27 11:20:11.4469	83	EXECUTED	9:966bda61e46bebf3cc39518fbed52fa7	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.25.1	\N	\N	8344810012
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-05-27 11:20:11.448595	84	MARK_RAN	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.25.1	\N	\N	8344810012
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-05-27 11:20:11.453327	85	EXECUTED	9:7d93d602352a30c0c317e6a609b56599	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.25.1	\N	\N	8344810012
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2025-05-27 11:20:11.457694	86	EXECUTED	9:71c5969e6cdd8d7b6f47cebc86d37627	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.25.1	\N	\N	8344810012
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2025-05-27 11:20:11.462943	87	EXECUTED	9:a9ba7d47f065f041b7da856a81762021	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.25.1	\N	\N	8344810012
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2025-05-27 11:20:11.467628	88	EXECUTED	9:fffabce2bc01e1a8f5110d5278500065	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.25.1	\N	\N	8344810012
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-05-27 11:20:11.47395	89	EXECUTED	9:fa8a5b5445e3857f4b010bafb5009957	addColumn tableName=REALM; customChange		\N	4.25.1	\N	\N	8344810012
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-05-27 11:20:11.47935	90	EXECUTED	9:67ac3241df9a8582d591c5ed87125f39	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.25.1	\N	\N	8344810012
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-05-27 11:20:11.485107	91	EXECUTED	9:ad1194d66c937e3ffc82386c050ba089	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.25.1	\N	\N	8344810012
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-05-27 11:20:11.515584	92	EXECUTED	9:d9be619d94af5a2f5d07b9f003543b91	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.25.1	\N	\N	8344810012
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-05-27 11:20:11.518189	93	MARK_RAN	9:544d201116a0fcc5a5da0925fbbc3bde	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.25.1	\N	\N	8344810012
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-05-27 11:20:11.525926	94	EXECUTED	9:43c0c1055b6761b4b3e89de76d612ccf	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.25.1	\N	\N	8344810012
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-05-27 11:20:11.527997	95	MARK_RAN	9:8bd711fd0330f4fe980494ca43ab1139	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.25.1	\N	\N	8344810012
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-05-27 11:20:11.53482	96	EXECUTED	9:e07d2bc0970c348bb06fb63b1f82ddbf	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.25.1	\N	\N	8344810012
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-05-27 11:20:11.542294	97	EXECUTED	9:24fb8611e97f29989bea412aa38d12b7	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.25.1	\N	\N	8344810012
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-05-27 11:20:11.544209	98	MARK_RAN	9:259f89014ce2506ee84740cbf7163aa7	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	8344810012
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-05-27 11:20:11.554093	99	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	8344810012
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-05-27 11:20:11.560714	100	EXECUTED	9:60ca84a0f8c94ec8c3504a5a3bc88ee8	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	8344810012
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-05-27 11:20:11.562632	101	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	8344810012
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-05-27 11:20:11.567031	102	EXECUTED	9:0b305d8d1277f3a89a0a53a659ad274c	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.25.1	\N	\N	8344810012
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-05-27 11:20:11.57451	103	EXECUTED	9:2c374ad2cdfe20e2905a84c8fac48460	customChange		\N	4.25.1	\N	\N	8344810012
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2025-05-27 11:20:11.580664	104	EXECUTED	9:47a760639ac597360a8219f5b768b4de	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.25.1	\N	\N	8344810012
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2025-05-27 11:20:11.586152	105	EXECUTED	9:a6272f0576727dd8cad2522335f5d99e	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.25.1	\N	\N	8344810012
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2025-05-27 11:20:11.589807	106	EXECUTED	9:015479dbd691d9cc8669282f4828c41d	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.25.1	\N	\N	8344810012
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2025-05-27 11:20:11.594991	107	EXECUTED	9:9518e495fdd22f78ad6425cc30630221	customChange		\N	4.25.1	\N	\N	8344810012
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-05-27 11:20:11.599182	108	EXECUTED	9:e5f243877199fd96bcc842f27a1656ac	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.25.1	\N	\N	8344810012
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-05-27 11:20:11.600853	109	MARK_RAN	9:1a6fcaa85e20bdeae0a9ce49b41946a5	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.25.1	\N	\N	8344810012
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-05-27 11:20:11.60656	110	EXECUTED	9:3f332e13e90739ed0c35b0b25b7822ca	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	8344810012
21.0.2-17277	keycloak	META-INF/jpa-changelog-21.0.2.xml	2025-05-27 11:20:11.611334	111	EXECUTED	9:7ee1f7a3fb8f5588f171fb9a6ab623c0	customChange		\N	4.25.1	\N	\N	8344810012
21.1.0-19404	keycloak	META-INF/jpa-changelog-21.1.0.xml	2025-05-27 11:20:11.618844	112	EXECUTED	9:3d7e830b52f33676b9d64f7f2b2ea634	modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER		\N	4.25.1	\N	\N	8344810012
21.1.0-19404-2	keycloak	META-INF/jpa-changelog-21.1.0.xml	2025-05-27 11:20:11.621878	113	MARK_RAN	9:627d032e3ef2c06c0e1f73d2ae25c26c	addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...		\N	4.25.1	\N	\N	8344810012
22.0.0-17484-updated	keycloak	META-INF/jpa-changelog-22.0.0.xml	2025-05-27 11:20:11.627488	114	EXECUTED	9:90af0bfd30cafc17b9f4d6eccd92b8b3	customChange		\N	4.25.1	\N	\N	8344810012
22.0.5-24031	keycloak	META-INF/jpa-changelog-22.0.0.xml	2025-05-27 11:20:11.629071	115	MARK_RAN	9:a60d2d7b315ec2d3eba9e2f145f9df28	customChange		\N	4.25.1	\N	\N	8344810012
23.0.0-12062	keycloak	META-INF/jpa-changelog-23.0.0.xml	2025-05-27 11:20:11.634981	116	EXECUTED	9:2168fbe728fec46ae9baf15bf80927b8	addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG		\N	4.25.1	\N	\N	8344810012
23.0.0-17258	keycloak	META-INF/jpa-changelog-23.0.0.xml	2025-05-27 11:20:11.638053	117	EXECUTED	9:36506d679a83bbfda85a27ea1864dca8	addColumn tableName=EVENT_ENTITY		\N	4.25.1	\N	\N	8344810012
24.0.0-9758	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-05-27 11:20:11.645524	118	EXECUTED	9:502c557a5189f600f0f445a9b49ebbce	addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...		\N	4.25.1	\N	\N	8344810012
24.0.0-26618-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-05-27 11:20:11.656562	120	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	8344810012
24.0.0-26618-reindex	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-05-27 11:20:11.660822	121	EXECUTED	9:08707c0f0db1cef6b352db03a60edc7f	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	8344810012
24.0.2-27228	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-05-27 11:20:11.665558	122	EXECUTED	9:eaee11f6b8aa25d2cc6a84fb86fc6238	customChange		\N	4.25.1	\N	\N	8344810012
24.0.2-27967-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-05-27 11:20:11.66701	123	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	8344810012
24.0.2-27967-reindex	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-05-27 11:20:11.669121	124	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	8344810012
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
62eee42e-1836-4073-ba2c-4845df4bb81f	7113d44e-e297-4a7f-833e-89f4b5868ffe	f
62eee42e-1836-4073-ba2c-4845df4bb81f	6bf9ab1e-615a-4104-a538-a87dbafe593c	t
62eee42e-1836-4073-ba2c-4845df4bb81f	bf5c8e29-f740-4b97-81cc-2757677b39aa	t
62eee42e-1836-4073-ba2c-4845df4bb81f	c412ca6c-70b6-45b9-ada1-cdedd2713a03	t
62eee42e-1836-4073-ba2c-4845df4bb81f	195e5438-7ff4-4dfa-95a2-6341a67a840c	f
62eee42e-1836-4073-ba2c-4845df4bb81f	e55134ce-eefb-4614-aa88-cc9d540b18eb	f
62eee42e-1836-4073-ba2c-4845df4bb81f	35a05f73-9f95-48d0-97f5-65568efa12c1	t
62eee42e-1836-4073-ba2c-4845df4bb81f	e2bba359-c3fb-4c1a-925b-087baba1919f	t
62eee42e-1836-4073-ba2c-4845df4bb81f	20d1a975-5194-4baf-8e44-bb4a24dac059	f
62eee42e-1836-4073-ba2c-4845df4bb81f	3624c435-6b46-4f19-bc27-8c1a465c62f6	t
648ca54c-3788-49f4-b9fa-de81e6fc4bbb	da437c66-8933-46a4-b5b2-ee3240b8016c	t
648ca54c-3788-49f4-b9fa-de81e6fc4bbb	881ff552-8ce1-43a7-9277-6e394a814eda	t
648ca54c-3788-49f4-b9fa-de81e6fc4bbb	85e69bde-6796-4bc6-a367-598d0885d74e	t
648ca54c-3788-49f4-b9fa-de81e6fc4bbb	28009592-b8ca-465b-bc72-44d4a7d56caf	t
648ca54c-3788-49f4-b9fa-de81e6fc4bbb	58f891cd-9611-4a26-b186-f502be530ef3	t
648ca54c-3788-49f4-b9fa-de81e6fc4bbb	7fd6ddbd-8b66-4984-9bd0-b2a9fa8ee427	t
648ca54c-3788-49f4-b9fa-de81e6fc4bbb	d20308dc-fabb-4c68-8c3c-fe7d09e1e5ac	t
648ca54c-3788-49f4-b9fa-de81e6fc4bbb	5e2764f6-1d47-4d4e-b738-35e6dbb04e9f	t
648ca54c-3788-49f4-b9fa-de81e6fc4bbb	2f40a8d6-59e1-401b-aaf6-c28d3138458d	t
648ca54c-3788-49f4-b9fa-de81e6fc4bbb	bc5e0698-38c5-483e-8346-4295b33fa467	f
648ca54c-3788-49f4-b9fa-de81e6fc4bbb	d2a2002e-87c4-426a-8bcb-209558bf33c4	f
648ca54c-3788-49f4-b9fa-de81e6fc4bbb	df6c9ac5-1a5c-497f-aa33-be81356e8d35	f
648ca54c-3788-49f4-b9fa-de81e6fc4bbb	8f2bab50-b5ef-4ea8-aaa4-c034239d6c68	f
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id, details_json_long_value) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
f8ecdc4f-c6be-44ab-a2ee-c066f312b823	38c25b33-c6ce-41f2-b38b-d0c91c2154d3
ed3402d0-76db-4444-a342-1a60e893cda0	9d994d40-6c2d-48eb-9078-426ee334dc60
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
38c25b33-c6ce-41f2-b38b-d0c91c2154d3	app_admin	 	648ca54c-3788-49f4-b9fa-de81e6fc4bbb
9d994d40-6c2d-48eb-9078-426ee334dc60	app_user	 	648ca54c-3788-49f4-b9fa-de81e6fc4bbb
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
ba6ac653-34a3-4b2a-ac74-8c56a9b5f66a	62eee42e-1836-4073-ba2c-4845df4bb81f	f	${role_default-roles}	default-roles-master	62eee42e-1836-4073-ba2c-4845df4bb81f	\N	\N
76b48efd-0bbd-4a31-b9f9-ec0dbcebe079	62eee42e-1836-4073-ba2c-4845df4bb81f	f	${role_create-realm}	create-realm	62eee42e-1836-4073-ba2c-4845df4bb81f	\N	\N
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	62eee42e-1836-4073-ba2c-4845df4bb81f	f	${role_admin}	admin	62eee42e-1836-4073-ba2c-4845df4bb81f	\N	\N
1d2c228c-d318-403e-9b5d-aa7a6fac0b1c	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	t	${role_create-client}	create-client	62eee42e-1836-4073-ba2c-4845df4bb81f	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	\N
1c6a0a14-15b2-4902-9115-d8cd6471bc48	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	t	${role_view-realm}	view-realm	62eee42e-1836-4073-ba2c-4845df4bb81f	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	\N
b2b391f0-ff98-4cf0-a166-a88b9930081d	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	t	${role_view-users}	view-users	62eee42e-1836-4073-ba2c-4845df4bb81f	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	\N
710f2430-66d8-4481-a0f7-184065986fae	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	t	${role_view-clients}	view-clients	62eee42e-1836-4073-ba2c-4845df4bb81f	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	\N
d6c7a372-a383-41ba-a76b-eb5193f4e009	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	t	${role_view-events}	view-events	62eee42e-1836-4073-ba2c-4845df4bb81f	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	\N
9a2a3ef4-b9c4-41cf-bc7e-8503bf6ec13b	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	t	${role_view-identity-providers}	view-identity-providers	62eee42e-1836-4073-ba2c-4845df4bb81f	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	\N
cd3133c2-dff7-4e93-a8b4-d7f5863bc01d	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	t	${role_view-authorization}	view-authorization	62eee42e-1836-4073-ba2c-4845df4bb81f	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	\N
6e135297-ff9d-4d43-b6c8-d546d78251ea	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	t	${role_manage-realm}	manage-realm	62eee42e-1836-4073-ba2c-4845df4bb81f	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	\N
75752944-b247-4f56-9657-44a835141f63	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	t	${role_manage-users}	manage-users	62eee42e-1836-4073-ba2c-4845df4bb81f	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	\N
cded22b4-0a21-4e78-8a7a-ba76f098117f	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	t	${role_manage-clients}	manage-clients	62eee42e-1836-4073-ba2c-4845df4bb81f	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	\N
39b06046-f360-4cfa-b613-7d231c6f3839	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	t	${role_manage-events}	manage-events	62eee42e-1836-4073-ba2c-4845df4bb81f	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	\N
d5fe20f3-ffd7-493e-aa52-6af29c0763d9	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	t	${role_manage-identity-providers}	manage-identity-providers	62eee42e-1836-4073-ba2c-4845df4bb81f	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	\N
115dddd7-51a7-424f-a060-bbf4fd36410c	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	t	${role_manage-authorization}	manage-authorization	62eee42e-1836-4073-ba2c-4845df4bb81f	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	\N
8a0acd20-b779-4d67-bbfa-cc78a752c0ef	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	t	${role_query-users}	query-users	62eee42e-1836-4073-ba2c-4845df4bb81f	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	\N
3a756a9c-136a-4007-b752-98bdc122eb8c	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	t	${role_query-clients}	query-clients	62eee42e-1836-4073-ba2c-4845df4bb81f	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	\N
c898c342-d387-4194-941e-9decea865837	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	t	${role_query-realms}	query-realms	62eee42e-1836-4073-ba2c-4845df4bb81f	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	\N
673b1dd5-03ed-4a9e-a6d2-9628a379daf2	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	t	${role_query-groups}	query-groups	62eee42e-1836-4073-ba2c-4845df4bb81f	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	\N
e2403b55-f3e9-4b0a-bad8-306dc6f3e198	73dacec3-6bba-49f4-9fd3-46de00fd8cb7	t	${role_view-profile}	view-profile	62eee42e-1836-4073-ba2c-4845df4bb81f	73dacec3-6bba-49f4-9fd3-46de00fd8cb7	\N
c061eedf-cc54-43c8-b96c-49601fbdf682	73dacec3-6bba-49f4-9fd3-46de00fd8cb7	t	${role_manage-account}	manage-account	62eee42e-1836-4073-ba2c-4845df4bb81f	73dacec3-6bba-49f4-9fd3-46de00fd8cb7	\N
8d0c6306-09bf-402b-b2d4-062df0026cdf	73dacec3-6bba-49f4-9fd3-46de00fd8cb7	t	${role_manage-account-links}	manage-account-links	62eee42e-1836-4073-ba2c-4845df4bb81f	73dacec3-6bba-49f4-9fd3-46de00fd8cb7	\N
2ce03097-04dc-40f9-9bb5-41bec4c2ed7e	73dacec3-6bba-49f4-9fd3-46de00fd8cb7	t	${role_view-applications}	view-applications	62eee42e-1836-4073-ba2c-4845df4bb81f	73dacec3-6bba-49f4-9fd3-46de00fd8cb7	\N
b58605b3-c205-4287-afcc-6274ac960931	73dacec3-6bba-49f4-9fd3-46de00fd8cb7	t	${role_view-consent}	view-consent	62eee42e-1836-4073-ba2c-4845df4bb81f	73dacec3-6bba-49f4-9fd3-46de00fd8cb7	\N
19f91c4f-4660-4ed2-857d-0d9919d22477	73dacec3-6bba-49f4-9fd3-46de00fd8cb7	t	${role_manage-consent}	manage-consent	62eee42e-1836-4073-ba2c-4845df4bb81f	73dacec3-6bba-49f4-9fd3-46de00fd8cb7	\N
e6899bea-f568-45aa-b178-e2a0f4856511	73dacec3-6bba-49f4-9fd3-46de00fd8cb7	t	${role_view-groups}	view-groups	62eee42e-1836-4073-ba2c-4845df4bb81f	73dacec3-6bba-49f4-9fd3-46de00fd8cb7	\N
f53b7d78-0d24-49bd-9686-05c1a2457bda	73dacec3-6bba-49f4-9fd3-46de00fd8cb7	t	${role_delete-account}	delete-account	62eee42e-1836-4073-ba2c-4845df4bb81f	73dacec3-6bba-49f4-9fd3-46de00fd8cb7	\N
a1bf7849-c8df-4828-8336-cfb66b9698d9	64e92d33-04c4-4b2d-a821-3b988c8963d6	t	${role_read-token}	read-token	62eee42e-1836-4073-ba2c-4845df4bb81f	64e92d33-04c4-4b2d-a821-3b988c8963d6	\N
2c60e3b1-53c7-4b55-915f-c483cbbfd39d	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	t	${role_impersonation}	impersonation	62eee42e-1836-4073-ba2c-4845df4bb81f	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	\N
fdcfbbbd-ba00-4660-8b64-e5fe7b5c41e5	62eee42e-1836-4073-ba2c-4845df4bb81f	f	${role_offline-access}	offline_access	62eee42e-1836-4073-ba2c-4845df4bb81f	\N	\N
b01f1e8d-f9f6-40c6-a043-cc3f97a869f6	62eee42e-1836-4073-ba2c-4845df4bb81f	f	${role_uma_authorization}	uma_authorization	62eee42e-1836-4073-ba2c-4845df4bb81f	\N	\N
ab18b326-0a16-4b87-a728-45cb9a72d263	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	f	${role_default-roles}	default-roles-violation-system	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	\N	\N
15e46ad5-9a6c-4001-a111-ee2e93679639	f20d1de2-5b48-445f-941d-cb74b3f0fae6	t	${role_create-client}	create-client	62eee42e-1836-4073-ba2c-4845df4bb81f	f20d1de2-5b48-445f-941d-cb74b3f0fae6	\N
4f31d0bd-8e14-4ffe-88da-21482fdacc8a	f20d1de2-5b48-445f-941d-cb74b3f0fae6	t	${role_view-realm}	view-realm	62eee42e-1836-4073-ba2c-4845df4bb81f	f20d1de2-5b48-445f-941d-cb74b3f0fae6	\N
8fb79864-9cf5-4b20-930b-72127601ef2c	f20d1de2-5b48-445f-941d-cb74b3f0fae6	t	${role_view-users}	view-users	62eee42e-1836-4073-ba2c-4845df4bb81f	f20d1de2-5b48-445f-941d-cb74b3f0fae6	\N
8da2c82f-eb22-4c42-b62f-6e6d2e1eee0f	f20d1de2-5b48-445f-941d-cb74b3f0fae6	t	${role_view-clients}	view-clients	62eee42e-1836-4073-ba2c-4845df4bb81f	f20d1de2-5b48-445f-941d-cb74b3f0fae6	\N
f0d493f3-8154-495b-919f-acf950d32968	f20d1de2-5b48-445f-941d-cb74b3f0fae6	t	${role_view-events}	view-events	62eee42e-1836-4073-ba2c-4845df4bb81f	f20d1de2-5b48-445f-941d-cb74b3f0fae6	\N
c39b83e2-acff-4a72-839e-f8f0477de5b8	f20d1de2-5b48-445f-941d-cb74b3f0fae6	t	${role_view-identity-providers}	view-identity-providers	62eee42e-1836-4073-ba2c-4845df4bb81f	f20d1de2-5b48-445f-941d-cb74b3f0fae6	\N
9a997053-3925-42f4-8d7c-935a25e24311	f20d1de2-5b48-445f-941d-cb74b3f0fae6	t	${role_view-authorization}	view-authorization	62eee42e-1836-4073-ba2c-4845df4bb81f	f20d1de2-5b48-445f-941d-cb74b3f0fae6	\N
8cf132ed-edf8-4988-adeb-5ac2bcb025db	f20d1de2-5b48-445f-941d-cb74b3f0fae6	t	${role_manage-realm}	manage-realm	62eee42e-1836-4073-ba2c-4845df4bb81f	f20d1de2-5b48-445f-941d-cb74b3f0fae6	\N
a0703aba-03c0-4e9e-8614-02fbba4042df	f20d1de2-5b48-445f-941d-cb74b3f0fae6	t	${role_manage-users}	manage-users	62eee42e-1836-4073-ba2c-4845df4bb81f	f20d1de2-5b48-445f-941d-cb74b3f0fae6	\N
a2e760a8-676b-4db5-a916-925e1556d795	f20d1de2-5b48-445f-941d-cb74b3f0fae6	t	${role_manage-clients}	manage-clients	62eee42e-1836-4073-ba2c-4845df4bb81f	f20d1de2-5b48-445f-941d-cb74b3f0fae6	\N
d82539f5-6880-43f6-a9bd-184bf4ecd33f	f20d1de2-5b48-445f-941d-cb74b3f0fae6	t	${role_manage-events}	manage-events	62eee42e-1836-4073-ba2c-4845df4bb81f	f20d1de2-5b48-445f-941d-cb74b3f0fae6	\N
374b0399-0d60-4cfa-93e8-99013a680680	f20d1de2-5b48-445f-941d-cb74b3f0fae6	t	${role_manage-identity-providers}	manage-identity-providers	62eee42e-1836-4073-ba2c-4845df4bb81f	f20d1de2-5b48-445f-941d-cb74b3f0fae6	\N
01a78076-cbf2-406c-9f56-2e5e2fd9fd99	f20d1de2-5b48-445f-941d-cb74b3f0fae6	t	${role_manage-authorization}	manage-authorization	62eee42e-1836-4073-ba2c-4845df4bb81f	f20d1de2-5b48-445f-941d-cb74b3f0fae6	\N
8551a5bb-bfb5-41ff-ba01-df9d755d3c45	f20d1de2-5b48-445f-941d-cb74b3f0fae6	t	${role_query-users}	query-users	62eee42e-1836-4073-ba2c-4845df4bb81f	f20d1de2-5b48-445f-941d-cb74b3f0fae6	\N
67c58be2-db16-464b-a505-2f42b6b7f36f	f20d1de2-5b48-445f-941d-cb74b3f0fae6	t	${role_query-clients}	query-clients	62eee42e-1836-4073-ba2c-4845df4bb81f	f20d1de2-5b48-445f-941d-cb74b3f0fae6	\N
7105d77e-1d1e-45a8-aedd-5fae19720d28	f20d1de2-5b48-445f-941d-cb74b3f0fae6	t	${role_query-realms}	query-realms	62eee42e-1836-4073-ba2c-4845df4bb81f	f20d1de2-5b48-445f-941d-cb74b3f0fae6	\N
26cc76ab-8e36-45d1-808e-8bcffc8098e1	f20d1de2-5b48-445f-941d-cb74b3f0fae6	t	${role_query-groups}	query-groups	62eee42e-1836-4073-ba2c-4845df4bb81f	f20d1de2-5b48-445f-941d-cb74b3f0fae6	\N
f8ecdc4f-c6be-44ab-a2ee-c066f312b823	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	f		admin	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	\N	\N
6619ce06-3777-40c7-b101-d27bfa5c7fa1	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	f	${role_offline-access}	offline_access	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	\N	\N
ed3402d0-76db-4444-a342-1a60e893cda0	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	f		user	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	\N	\N
768dead6-30f1-4f07-b04d-b24ea7064092	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	f	${role_uma_authorization}	uma_authorization	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	\N	\N
541b9983-ecdc-4bb4-8331-dcad473df56b	2529b41e-7231-480c-a34e-2d54047a3694	t	${role_query-clients}	query-clients	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	2529b41e-7231-480c-a34e-2d54047a3694	\N
e83fe6d4-2955-4132-a570-f9c0ca954d5f	2529b41e-7231-480c-a34e-2d54047a3694	t	${role_manage-events}	manage-events	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	2529b41e-7231-480c-a34e-2d54047a3694	\N
ba41cd6a-fedd-4e47-b097-5b1c6275f5f0	2529b41e-7231-480c-a34e-2d54047a3694	t	${role_manage-users}	manage-users	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	2529b41e-7231-480c-a34e-2d54047a3694	\N
d733dead-c2b6-4f93-aa48-595b44749ed2	2529b41e-7231-480c-a34e-2d54047a3694	t	${role_view-clients}	view-clients	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	2529b41e-7231-480c-a34e-2d54047a3694	\N
c9b28080-a4c3-4207-8076-7bb5a2d7a008	2529b41e-7231-480c-a34e-2d54047a3694	t	${role_view-events}	view-events	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	2529b41e-7231-480c-a34e-2d54047a3694	\N
2b5b65d7-b7df-4798-b9aa-eac2c80fad45	2529b41e-7231-480c-a34e-2d54047a3694	t	${role_view-identity-providers}	view-identity-providers	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	2529b41e-7231-480c-a34e-2d54047a3694	\N
f904085d-86a7-401f-bbdb-6306421b087b	2529b41e-7231-480c-a34e-2d54047a3694	t	${role_impersonation}	impersonation	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	2529b41e-7231-480c-a34e-2d54047a3694	\N
ac3f2bfa-c318-4ed4-b492-79fea304b1bc	2529b41e-7231-480c-a34e-2d54047a3694	t	${role_manage-clients}	manage-clients	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	2529b41e-7231-480c-a34e-2d54047a3694	\N
fd0a9216-e9af-4154-bf91-2ee4408ec026	2529b41e-7231-480c-a34e-2d54047a3694	t	${role_manage-realm}	manage-realm	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	2529b41e-7231-480c-a34e-2d54047a3694	\N
262ebd55-4ca4-40af-b112-c5f437a7ebeb	2529b41e-7231-480c-a34e-2d54047a3694	t	${role_create-client}	create-client	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	2529b41e-7231-480c-a34e-2d54047a3694	\N
97eb03ea-f78c-44b5-b7e8-74fc0fc22fe7	2529b41e-7231-480c-a34e-2d54047a3694	t	${role_view-authorization}	view-authorization	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	2529b41e-7231-480c-a34e-2d54047a3694	\N
48f4a28b-bbca-4c81-88eb-4f1799a98ab4	2529b41e-7231-480c-a34e-2d54047a3694	t	${role_query-users}	query-users	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	2529b41e-7231-480c-a34e-2d54047a3694	\N
e0692de9-c2f7-4fd1-b693-b4cf12d6518d	2529b41e-7231-480c-a34e-2d54047a3694	t	${role_view-users}	view-users	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	2529b41e-7231-480c-a34e-2d54047a3694	\N
b8314408-6cac-49e8-90fa-bb491cc63c7e	2529b41e-7231-480c-a34e-2d54047a3694	t	${role_realm-admin}	realm-admin	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	2529b41e-7231-480c-a34e-2d54047a3694	\N
dc4b2bf1-d1cb-47ab-a12e-b12f31562fcc	2529b41e-7231-480c-a34e-2d54047a3694	t	${role_manage-authorization}	manage-authorization	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	2529b41e-7231-480c-a34e-2d54047a3694	\N
6803cb44-a3ff-4618-9a79-4d23afbfbf79	2529b41e-7231-480c-a34e-2d54047a3694	t	${role_view-realm}	view-realm	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	2529b41e-7231-480c-a34e-2d54047a3694	\N
05cc1e10-a76d-48bf-9c70-a9818655570f	2529b41e-7231-480c-a34e-2d54047a3694	t	${role_manage-identity-providers}	manage-identity-providers	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	2529b41e-7231-480c-a34e-2d54047a3694	\N
dfff9d50-26db-4a48-83fd-fa21abe2bce8	2529b41e-7231-480c-a34e-2d54047a3694	t	${role_query-groups}	query-groups	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	2529b41e-7231-480c-a34e-2d54047a3694	\N
91ed453c-ade6-443f-a541-ee09daff7f4f	2529b41e-7231-480c-a34e-2d54047a3694	t	${role_query-realms}	query-realms	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	2529b41e-7231-480c-a34e-2d54047a3694	\N
a9130981-2a6e-458c-89d0-5d807a3f11c8	f2073cc7-0a3d-4eb4-96f7-2342d5fd726a	t	${role_read-token}	read-token	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	f2073cc7-0a3d-4eb4-96f7-2342d5fd726a	\N
068bdfe0-7aa1-480c-8a0c-b0f128beecd7	6a09ee99-9116-45f9-adac-0f04cb119b5a	t	${role_manage-consent}	manage-consent	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	6a09ee99-9116-45f9-adac-0f04cb119b5a	\N
ef2ee163-55e3-4806-9725-4f5be4968b50	6a09ee99-9116-45f9-adac-0f04cb119b5a	t	${role_manage-account}	manage-account	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	6a09ee99-9116-45f9-adac-0f04cb119b5a	\N
a17ea82a-8f9c-4627-b38d-2106df6bcbf9	6a09ee99-9116-45f9-adac-0f04cb119b5a	t	${role_view-groups}	view-groups	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	6a09ee99-9116-45f9-adac-0f04cb119b5a	\N
ff7582b9-2b4c-41af-9393-a9724a2d503d	6a09ee99-9116-45f9-adac-0f04cb119b5a	t	${role_view-profile}	view-profile	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	6a09ee99-9116-45f9-adac-0f04cb119b5a	\N
3e41db10-19fc-492f-b9c0-a9e5010f8d0e	6a09ee99-9116-45f9-adac-0f04cb119b5a	t	${role_view-consent}	view-consent	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	6a09ee99-9116-45f9-adac-0f04cb119b5a	\N
4c1c5718-3f2d-4eb5-9255-13da255d151e	6a09ee99-9116-45f9-adac-0f04cb119b5a	t	${role_manage-account-links}	manage-account-links	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	6a09ee99-9116-45f9-adac-0f04cb119b5a	\N
0fc16077-37d8-420c-b828-70cb31202ec2	6a09ee99-9116-45f9-adac-0f04cb119b5a	t	${role_view-applications}	view-applications	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	6a09ee99-9116-45f9-adac-0f04cb119b5a	\N
6b2a7ff2-d7be-47c7-9429-f9448b4ccf0c	6a09ee99-9116-45f9-adac-0f04cb119b5a	t	${role_delete-account}	delete-account	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	6a09ee99-9116-45f9-adac-0f04cb119b5a	\N
20a4814f-a430-4bb5-9a80-f99e350c47d6	f20d1de2-5b48-445f-941d-cb74b3f0fae6	t	${role_impersonation}	impersonation	62eee42e-1836-4073-ba2c-4845df4bb81f	f20d1de2-5b48-445f-941d-cb74b3f0fae6	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.migration_model (id, version, update_time) FROM stdin;
4o2ui	24.0.4	1748344811
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
6f4c26ce-3369-418d-9bec-0576ebf0f78c	audience resolve	openid-connect	oidc-audience-resolve-mapper	ae6ce30c-5355-4a89-ab59-8c5eab30c235	\N
8f1b7572-33f5-4ca7-b28f-b91d14ca911a	locale	openid-connect	oidc-usermodel-attribute-mapper	1adf445c-da43-44c8-9b30-ca249e2f8209	\N
a497a534-ca14-4148-b2da-f087ad910643	role list	saml	saml-role-list-mapper	\N	6bf9ab1e-615a-4104-a538-a87dbafe593c
fdf147d7-a00a-414f-8249-96f4d305215f	full name	openid-connect	oidc-full-name-mapper	\N	bf5c8e29-f740-4b97-81cc-2757677b39aa
bb2e481b-22b0-4628-9817-d992ae524942	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	bf5c8e29-f740-4b97-81cc-2757677b39aa
84ca8bf3-c5ef-4412-8700-802d2dc08cbe	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	bf5c8e29-f740-4b97-81cc-2757677b39aa
3b41893c-98ff-4f6e-b001-535c38c044b3	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	bf5c8e29-f740-4b97-81cc-2757677b39aa
1b855794-e186-4f88-8986-2565586522da	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	bf5c8e29-f740-4b97-81cc-2757677b39aa
f292f00d-1943-4478-acb8-79c82ca627a9	username	openid-connect	oidc-usermodel-attribute-mapper	\N	bf5c8e29-f740-4b97-81cc-2757677b39aa
878988be-0c15-4434-84c1-8985cfc8eecf	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	bf5c8e29-f740-4b97-81cc-2757677b39aa
68cd2d90-61ca-4203-9fdb-418727418d3c	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	bf5c8e29-f740-4b97-81cc-2757677b39aa
9fd22352-c609-4488-b0c5-8400cf74e6a3	website	openid-connect	oidc-usermodel-attribute-mapper	\N	bf5c8e29-f740-4b97-81cc-2757677b39aa
ca272875-2e59-488b-918d-4d00ebf456b6	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	bf5c8e29-f740-4b97-81cc-2757677b39aa
6773773e-c9f1-4f3b-9623-6b2e62d7db52	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	bf5c8e29-f740-4b97-81cc-2757677b39aa
fb8063ab-7bc2-4299-a182-77aed123857f	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	bf5c8e29-f740-4b97-81cc-2757677b39aa
3f267518-8048-403e-b613-1fc536636c3f	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	bf5c8e29-f740-4b97-81cc-2757677b39aa
980b10c2-b721-447c-8fdf-24772b956984	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	bf5c8e29-f740-4b97-81cc-2757677b39aa
0795cec3-315e-4881-9d36-308b9c9a6fb3	email	openid-connect	oidc-usermodel-attribute-mapper	\N	c412ca6c-70b6-45b9-ada1-cdedd2713a03
bcbe026d-a850-4347-aa4b-f957f9d17aea	email verified	openid-connect	oidc-usermodel-property-mapper	\N	c412ca6c-70b6-45b9-ada1-cdedd2713a03
593d3375-de10-4fbc-a7a9-c5cdd41ee494	address	openid-connect	oidc-address-mapper	\N	195e5438-7ff4-4dfa-95a2-6341a67a840c
420990ce-c3f7-4d49-93f0-88d08799d426	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	e55134ce-eefb-4614-aa88-cc9d540b18eb
f005c4da-4f7a-4b3f-a6cf-957b945e1fa9	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	e55134ce-eefb-4614-aa88-cc9d540b18eb
3109b53a-8610-41e0-9419-dcd0c62c32a2	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	35a05f73-9f95-48d0-97f5-65568efa12c1
78664bb7-272d-4dae-9dec-2b03c218ea8d	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	35a05f73-9f95-48d0-97f5-65568efa12c1
204d1d9a-e619-4a14-8a3c-30d57bc9773c	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	35a05f73-9f95-48d0-97f5-65568efa12c1
00f79f1d-a35b-4f3b-9fd5-f3f9fea84be4	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	e2bba359-c3fb-4c1a-925b-087baba1919f
10e96ea0-c722-4a06-a82a-6fc89afac017	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	20d1a975-5194-4baf-8e44-bb4a24dac059
c4bd300d-e557-48c8-ab92-72dabae13960	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	20d1a975-5194-4baf-8e44-bb4a24dac059
5a27e670-9912-4d89-a296-3dd1b4b9d04c	acr loa level	openid-connect	oidc-acr-mapper	\N	3624c435-6b46-4f19-bc27-8c1a465c62f6
17bcf0ed-fa81-4837-b467-5ab52d2fa1d4	phoneNumber	openid-connect	oidc-usermodel-attribute-mapper	\N	d20308dc-fabb-4c68-8c3c-fe7d09e1e5ac
711369a6-5662-4b2e-9f40-2734703cf69f	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	28009592-b8ca-465b-bc72-44d4a7d56caf
16ec950a-38d8-4a32-87c8-8c9c53a14a73	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	28009592-b8ca-465b-bc72-44d4a7d56caf
4ea2d316-b311-4e6b-90e5-829d17f36010	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	28009592-b8ca-465b-bc72-44d4a7d56caf
8192bd36-6e1c-4d2b-9fc1-7cf88951674d	address	openid-connect	oidc-address-mapper	\N	d2a2002e-87c4-426a-8bcb-209558bf33c4
6a1fd7c5-505e-4ec4-a2de-9e691372eb56	identityCard	openid-connect	oidc-usermodel-attribute-mapper	\N	2f40a8d6-59e1-401b-aaf6-c28d3138458d
90ebd635-a93c-441c-b243-16fefb669a6c	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	df6c9ac5-1a5c-497f-aa33-be81356e8d35
d4439e6c-d49c-4ee6-9105-7368093acbfb	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	df6c9ac5-1a5c-497f-aa33-be81356e8d35
275d951d-5d92-4a2c-a544-dcb03f607b7c	email	openid-connect	oidc-usermodel-attribute-mapper	\N	85e69bde-6796-4bc6-a367-598d0885d74e
a4f34899-5407-4b2e-8954-17e464d35912	email verified	openid-connect	oidc-usermodel-property-mapper	\N	85e69bde-6796-4bc6-a367-598d0885d74e
e74ee35c-3e8f-4cd2-86aa-ef03a33fcd95	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	881ff552-8ce1-43a7-9277-6e394a814eda
e8f55769-463b-409a-807c-eca404aac375	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	881ff552-8ce1-43a7-9277-6e394a814eda
33734d70-1064-4a08-867a-bbf44f77c317	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	881ff552-8ce1-43a7-9277-6e394a814eda
1c7317c0-24e7-4f17-b71a-0f05a3919254	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	881ff552-8ce1-43a7-9277-6e394a814eda
d9bf1bb8-6b23-4d36-9cef-4853eb91f4d4	full name	openid-connect	oidc-full-name-mapper	\N	881ff552-8ce1-43a7-9277-6e394a814eda
55d55235-a215-4f2d-9324-164ad1e842cb	username	openid-connect	oidc-usermodel-attribute-mapper	\N	881ff552-8ce1-43a7-9277-6e394a814eda
930fad4d-a1a4-4f3e-acaa-5416585dde3a	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	881ff552-8ce1-43a7-9277-6e394a814eda
4335c67b-881c-416a-a604-dab243fee4a4	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	881ff552-8ce1-43a7-9277-6e394a814eda
3abbfccb-ccf5-442f-8b52-b9c04b824f94	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	881ff552-8ce1-43a7-9277-6e394a814eda
4d41dcbd-34e3-4898-834a-9dae8fa965eb	website	openid-connect	oidc-usermodel-attribute-mapper	\N	881ff552-8ce1-43a7-9277-6e394a814eda
f0196095-2ed8-4c1a-968f-9f0e5a480410	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	881ff552-8ce1-43a7-9277-6e394a814eda
4c7982dd-5e54-4ada-af28-fa3d736e9b90	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	881ff552-8ce1-43a7-9277-6e394a814eda
bba3749c-33e5-4e65-b09a-99868c9ca1fd	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	881ff552-8ce1-43a7-9277-6e394a814eda
8e9a718d-b1a5-4663-a40b-52d0bec807f2	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	881ff552-8ce1-43a7-9277-6e394a814eda
8b303a49-1773-44c5-8951-88a83bbf50c3	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	58f891cd-9611-4a26-b186-f502be530ef3
41482f31-7ac9-49af-b393-011881c6bba3	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	8f2bab50-b5ef-4ea8-aaa4-c034239d6c68
f2f3f583-bd34-43ad-bec0-b1265fb20786	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	8f2bab50-b5ef-4ea8-aaa4-c034239d6c68
c4e3bc0e-be92-4653-9fda-cfc135538d71	fullName	openid-connect	oidc-usermodel-attribute-mapper	\N	5e2764f6-1d47-4d4e-b738-35e6dbb04e9f
e93f93d1-0b5b-4f66-b7a1-044820f02ecb	role list	saml	saml-role-list-mapper	\N	da437c66-8933-46a4-b5b2-ee3240b8016c
8a6efdec-6cf1-4229-8062-31a5eef774b8	acr loa level	openid-connect	oidc-acr-mapper	\N	7fd6ddbd-8b66-4984-9bd0-b2a9fa8ee427
d3ae3f84-4254-439b-8921-ecf78a55e907	audience resolve	openid-connect	oidc-audience-resolve-mapper	2720e5ea-0903-4fe2-ba6f-4e978245faf6	\N
cb2b90ba-7b55-4cfc-b35d-6e1a8d7be2a8	locale	openid-connect	oidc-usermodel-attribute-mapper	b0e6e45d-48a4-4ef8-8844-ac077ec6b634	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
8f1b7572-33f5-4ca7-b28f-b91d14ca911a	true	introspection.token.claim
8f1b7572-33f5-4ca7-b28f-b91d14ca911a	true	userinfo.token.claim
8f1b7572-33f5-4ca7-b28f-b91d14ca911a	locale	user.attribute
8f1b7572-33f5-4ca7-b28f-b91d14ca911a	true	id.token.claim
8f1b7572-33f5-4ca7-b28f-b91d14ca911a	true	access.token.claim
8f1b7572-33f5-4ca7-b28f-b91d14ca911a	locale	claim.name
8f1b7572-33f5-4ca7-b28f-b91d14ca911a	String	jsonType.label
a497a534-ca14-4148-b2da-f087ad910643	false	single
a497a534-ca14-4148-b2da-f087ad910643	Basic	attribute.nameformat
a497a534-ca14-4148-b2da-f087ad910643	Role	attribute.name
1b855794-e186-4f88-8986-2565586522da	true	introspection.token.claim
1b855794-e186-4f88-8986-2565586522da	true	userinfo.token.claim
1b855794-e186-4f88-8986-2565586522da	nickname	user.attribute
1b855794-e186-4f88-8986-2565586522da	true	id.token.claim
1b855794-e186-4f88-8986-2565586522da	true	access.token.claim
1b855794-e186-4f88-8986-2565586522da	nickname	claim.name
1b855794-e186-4f88-8986-2565586522da	String	jsonType.label
3b41893c-98ff-4f6e-b001-535c38c044b3	true	introspection.token.claim
3b41893c-98ff-4f6e-b001-535c38c044b3	true	userinfo.token.claim
3b41893c-98ff-4f6e-b001-535c38c044b3	middleName	user.attribute
3b41893c-98ff-4f6e-b001-535c38c044b3	true	id.token.claim
3b41893c-98ff-4f6e-b001-535c38c044b3	true	access.token.claim
3b41893c-98ff-4f6e-b001-535c38c044b3	middle_name	claim.name
3b41893c-98ff-4f6e-b001-535c38c044b3	String	jsonType.label
3f267518-8048-403e-b613-1fc536636c3f	true	introspection.token.claim
3f267518-8048-403e-b613-1fc536636c3f	true	userinfo.token.claim
3f267518-8048-403e-b613-1fc536636c3f	locale	user.attribute
3f267518-8048-403e-b613-1fc536636c3f	true	id.token.claim
3f267518-8048-403e-b613-1fc536636c3f	true	access.token.claim
3f267518-8048-403e-b613-1fc536636c3f	locale	claim.name
3f267518-8048-403e-b613-1fc536636c3f	String	jsonType.label
6773773e-c9f1-4f3b-9623-6b2e62d7db52	true	introspection.token.claim
6773773e-c9f1-4f3b-9623-6b2e62d7db52	true	userinfo.token.claim
6773773e-c9f1-4f3b-9623-6b2e62d7db52	birthdate	user.attribute
6773773e-c9f1-4f3b-9623-6b2e62d7db52	true	id.token.claim
6773773e-c9f1-4f3b-9623-6b2e62d7db52	true	access.token.claim
6773773e-c9f1-4f3b-9623-6b2e62d7db52	birthdate	claim.name
6773773e-c9f1-4f3b-9623-6b2e62d7db52	String	jsonType.label
68cd2d90-61ca-4203-9fdb-418727418d3c	true	introspection.token.claim
68cd2d90-61ca-4203-9fdb-418727418d3c	true	userinfo.token.claim
68cd2d90-61ca-4203-9fdb-418727418d3c	picture	user.attribute
68cd2d90-61ca-4203-9fdb-418727418d3c	true	id.token.claim
68cd2d90-61ca-4203-9fdb-418727418d3c	true	access.token.claim
68cd2d90-61ca-4203-9fdb-418727418d3c	picture	claim.name
68cd2d90-61ca-4203-9fdb-418727418d3c	String	jsonType.label
84ca8bf3-c5ef-4412-8700-802d2dc08cbe	true	introspection.token.claim
84ca8bf3-c5ef-4412-8700-802d2dc08cbe	true	userinfo.token.claim
84ca8bf3-c5ef-4412-8700-802d2dc08cbe	firstName	user.attribute
84ca8bf3-c5ef-4412-8700-802d2dc08cbe	true	id.token.claim
84ca8bf3-c5ef-4412-8700-802d2dc08cbe	true	access.token.claim
84ca8bf3-c5ef-4412-8700-802d2dc08cbe	given_name	claim.name
84ca8bf3-c5ef-4412-8700-802d2dc08cbe	String	jsonType.label
878988be-0c15-4434-84c1-8985cfc8eecf	true	introspection.token.claim
878988be-0c15-4434-84c1-8985cfc8eecf	true	userinfo.token.claim
878988be-0c15-4434-84c1-8985cfc8eecf	profile	user.attribute
878988be-0c15-4434-84c1-8985cfc8eecf	true	id.token.claim
878988be-0c15-4434-84c1-8985cfc8eecf	true	access.token.claim
878988be-0c15-4434-84c1-8985cfc8eecf	profile	claim.name
878988be-0c15-4434-84c1-8985cfc8eecf	String	jsonType.label
980b10c2-b721-447c-8fdf-24772b956984	true	introspection.token.claim
980b10c2-b721-447c-8fdf-24772b956984	true	userinfo.token.claim
980b10c2-b721-447c-8fdf-24772b956984	updatedAt	user.attribute
980b10c2-b721-447c-8fdf-24772b956984	true	id.token.claim
980b10c2-b721-447c-8fdf-24772b956984	true	access.token.claim
980b10c2-b721-447c-8fdf-24772b956984	updated_at	claim.name
980b10c2-b721-447c-8fdf-24772b956984	long	jsonType.label
9fd22352-c609-4488-b0c5-8400cf74e6a3	true	introspection.token.claim
9fd22352-c609-4488-b0c5-8400cf74e6a3	true	userinfo.token.claim
9fd22352-c609-4488-b0c5-8400cf74e6a3	website	user.attribute
9fd22352-c609-4488-b0c5-8400cf74e6a3	true	id.token.claim
9fd22352-c609-4488-b0c5-8400cf74e6a3	true	access.token.claim
9fd22352-c609-4488-b0c5-8400cf74e6a3	website	claim.name
9fd22352-c609-4488-b0c5-8400cf74e6a3	String	jsonType.label
bb2e481b-22b0-4628-9817-d992ae524942	true	introspection.token.claim
bb2e481b-22b0-4628-9817-d992ae524942	true	userinfo.token.claim
bb2e481b-22b0-4628-9817-d992ae524942	lastName	user.attribute
bb2e481b-22b0-4628-9817-d992ae524942	true	id.token.claim
bb2e481b-22b0-4628-9817-d992ae524942	true	access.token.claim
bb2e481b-22b0-4628-9817-d992ae524942	family_name	claim.name
bb2e481b-22b0-4628-9817-d992ae524942	String	jsonType.label
ca272875-2e59-488b-918d-4d00ebf456b6	true	introspection.token.claim
ca272875-2e59-488b-918d-4d00ebf456b6	true	userinfo.token.claim
ca272875-2e59-488b-918d-4d00ebf456b6	gender	user.attribute
ca272875-2e59-488b-918d-4d00ebf456b6	true	id.token.claim
ca272875-2e59-488b-918d-4d00ebf456b6	true	access.token.claim
ca272875-2e59-488b-918d-4d00ebf456b6	gender	claim.name
ca272875-2e59-488b-918d-4d00ebf456b6	String	jsonType.label
f292f00d-1943-4478-acb8-79c82ca627a9	true	introspection.token.claim
f292f00d-1943-4478-acb8-79c82ca627a9	true	userinfo.token.claim
f292f00d-1943-4478-acb8-79c82ca627a9	username	user.attribute
f292f00d-1943-4478-acb8-79c82ca627a9	true	id.token.claim
f292f00d-1943-4478-acb8-79c82ca627a9	true	access.token.claim
f292f00d-1943-4478-acb8-79c82ca627a9	preferred_username	claim.name
f292f00d-1943-4478-acb8-79c82ca627a9	String	jsonType.label
fb8063ab-7bc2-4299-a182-77aed123857f	true	introspection.token.claim
fb8063ab-7bc2-4299-a182-77aed123857f	true	userinfo.token.claim
fb8063ab-7bc2-4299-a182-77aed123857f	zoneinfo	user.attribute
fb8063ab-7bc2-4299-a182-77aed123857f	true	id.token.claim
fb8063ab-7bc2-4299-a182-77aed123857f	true	access.token.claim
fb8063ab-7bc2-4299-a182-77aed123857f	zoneinfo	claim.name
fb8063ab-7bc2-4299-a182-77aed123857f	String	jsonType.label
fdf147d7-a00a-414f-8249-96f4d305215f	true	introspection.token.claim
fdf147d7-a00a-414f-8249-96f4d305215f	true	userinfo.token.claim
fdf147d7-a00a-414f-8249-96f4d305215f	true	id.token.claim
fdf147d7-a00a-414f-8249-96f4d305215f	true	access.token.claim
0795cec3-315e-4881-9d36-308b9c9a6fb3	true	introspection.token.claim
0795cec3-315e-4881-9d36-308b9c9a6fb3	true	userinfo.token.claim
0795cec3-315e-4881-9d36-308b9c9a6fb3	email	user.attribute
0795cec3-315e-4881-9d36-308b9c9a6fb3	true	id.token.claim
0795cec3-315e-4881-9d36-308b9c9a6fb3	true	access.token.claim
0795cec3-315e-4881-9d36-308b9c9a6fb3	email	claim.name
0795cec3-315e-4881-9d36-308b9c9a6fb3	String	jsonType.label
bcbe026d-a850-4347-aa4b-f957f9d17aea	true	introspection.token.claim
bcbe026d-a850-4347-aa4b-f957f9d17aea	true	userinfo.token.claim
bcbe026d-a850-4347-aa4b-f957f9d17aea	emailVerified	user.attribute
bcbe026d-a850-4347-aa4b-f957f9d17aea	true	id.token.claim
bcbe026d-a850-4347-aa4b-f957f9d17aea	true	access.token.claim
bcbe026d-a850-4347-aa4b-f957f9d17aea	email_verified	claim.name
bcbe026d-a850-4347-aa4b-f957f9d17aea	boolean	jsonType.label
593d3375-de10-4fbc-a7a9-c5cdd41ee494	formatted	user.attribute.formatted
593d3375-de10-4fbc-a7a9-c5cdd41ee494	country	user.attribute.country
593d3375-de10-4fbc-a7a9-c5cdd41ee494	true	introspection.token.claim
593d3375-de10-4fbc-a7a9-c5cdd41ee494	postal_code	user.attribute.postal_code
593d3375-de10-4fbc-a7a9-c5cdd41ee494	true	userinfo.token.claim
593d3375-de10-4fbc-a7a9-c5cdd41ee494	street	user.attribute.street
593d3375-de10-4fbc-a7a9-c5cdd41ee494	true	id.token.claim
593d3375-de10-4fbc-a7a9-c5cdd41ee494	region	user.attribute.region
593d3375-de10-4fbc-a7a9-c5cdd41ee494	true	access.token.claim
593d3375-de10-4fbc-a7a9-c5cdd41ee494	locality	user.attribute.locality
420990ce-c3f7-4d49-93f0-88d08799d426	true	introspection.token.claim
420990ce-c3f7-4d49-93f0-88d08799d426	true	userinfo.token.claim
420990ce-c3f7-4d49-93f0-88d08799d426	phoneNumber	user.attribute
420990ce-c3f7-4d49-93f0-88d08799d426	true	id.token.claim
420990ce-c3f7-4d49-93f0-88d08799d426	true	access.token.claim
420990ce-c3f7-4d49-93f0-88d08799d426	phone_number	claim.name
420990ce-c3f7-4d49-93f0-88d08799d426	String	jsonType.label
f005c4da-4f7a-4b3f-a6cf-957b945e1fa9	true	introspection.token.claim
f005c4da-4f7a-4b3f-a6cf-957b945e1fa9	true	userinfo.token.claim
f005c4da-4f7a-4b3f-a6cf-957b945e1fa9	phoneNumberVerified	user.attribute
f005c4da-4f7a-4b3f-a6cf-957b945e1fa9	true	id.token.claim
f005c4da-4f7a-4b3f-a6cf-957b945e1fa9	true	access.token.claim
f005c4da-4f7a-4b3f-a6cf-957b945e1fa9	phone_number_verified	claim.name
f005c4da-4f7a-4b3f-a6cf-957b945e1fa9	boolean	jsonType.label
204d1d9a-e619-4a14-8a3c-30d57bc9773c	true	introspection.token.claim
204d1d9a-e619-4a14-8a3c-30d57bc9773c	true	access.token.claim
3109b53a-8610-41e0-9419-dcd0c62c32a2	true	introspection.token.claim
3109b53a-8610-41e0-9419-dcd0c62c32a2	true	multivalued
3109b53a-8610-41e0-9419-dcd0c62c32a2	foo	user.attribute
3109b53a-8610-41e0-9419-dcd0c62c32a2	true	access.token.claim
3109b53a-8610-41e0-9419-dcd0c62c32a2	realm_access.roles	claim.name
3109b53a-8610-41e0-9419-dcd0c62c32a2	String	jsonType.label
78664bb7-272d-4dae-9dec-2b03c218ea8d	true	introspection.token.claim
78664bb7-272d-4dae-9dec-2b03c218ea8d	true	multivalued
78664bb7-272d-4dae-9dec-2b03c218ea8d	foo	user.attribute
78664bb7-272d-4dae-9dec-2b03c218ea8d	true	access.token.claim
78664bb7-272d-4dae-9dec-2b03c218ea8d	resource_access.${client_id}.roles	claim.name
78664bb7-272d-4dae-9dec-2b03c218ea8d	String	jsonType.label
00f79f1d-a35b-4f3b-9fd5-f3f9fea84be4	true	introspection.token.claim
00f79f1d-a35b-4f3b-9fd5-f3f9fea84be4	true	access.token.claim
10e96ea0-c722-4a06-a82a-6fc89afac017	true	introspection.token.claim
10e96ea0-c722-4a06-a82a-6fc89afac017	true	userinfo.token.claim
10e96ea0-c722-4a06-a82a-6fc89afac017	username	user.attribute
10e96ea0-c722-4a06-a82a-6fc89afac017	true	id.token.claim
10e96ea0-c722-4a06-a82a-6fc89afac017	true	access.token.claim
10e96ea0-c722-4a06-a82a-6fc89afac017	upn	claim.name
10e96ea0-c722-4a06-a82a-6fc89afac017	String	jsonType.label
c4bd300d-e557-48c8-ab92-72dabae13960	true	introspection.token.claim
c4bd300d-e557-48c8-ab92-72dabae13960	true	multivalued
c4bd300d-e557-48c8-ab92-72dabae13960	foo	user.attribute
c4bd300d-e557-48c8-ab92-72dabae13960	true	id.token.claim
c4bd300d-e557-48c8-ab92-72dabae13960	true	access.token.claim
c4bd300d-e557-48c8-ab92-72dabae13960	groups	claim.name
c4bd300d-e557-48c8-ab92-72dabae13960	String	jsonType.label
5a27e670-9912-4d89-a296-3dd1b4b9d04c	true	introspection.token.claim
5a27e670-9912-4d89-a296-3dd1b4b9d04c	true	id.token.claim
5a27e670-9912-4d89-a296-3dd1b4b9d04c	true	access.token.claim
17bcf0ed-fa81-4837-b467-5ab52d2fa1d4	true	introspection.token.claim
17bcf0ed-fa81-4837-b467-5ab52d2fa1d4	true	userinfo.token.claim
17bcf0ed-fa81-4837-b467-5ab52d2fa1d4	phoneNumber	user.attribute
17bcf0ed-fa81-4837-b467-5ab52d2fa1d4	true	id.token.claim
17bcf0ed-fa81-4837-b467-5ab52d2fa1d4	false	lightweight.claim
17bcf0ed-fa81-4837-b467-5ab52d2fa1d4	true	access.token.claim
17bcf0ed-fa81-4837-b467-5ab52d2fa1d4	phoneNumber	claim.name
17bcf0ed-fa81-4837-b467-5ab52d2fa1d4	String	jsonType.label
16ec950a-38d8-4a32-87c8-8c9c53a14a73	true	introspection.token.claim
16ec950a-38d8-4a32-87c8-8c9c53a14a73	true	multivalued
16ec950a-38d8-4a32-87c8-8c9c53a14a73	false	userinfo.token.claim
16ec950a-38d8-4a32-87c8-8c9c53a14a73	foo	user.attribute
16ec950a-38d8-4a32-87c8-8c9c53a14a73	true	id.token.claim
16ec950a-38d8-4a32-87c8-8c9c53a14a73	false	lightweight.claim
16ec950a-38d8-4a32-87c8-8c9c53a14a73	true	access.token.claim
16ec950a-38d8-4a32-87c8-8c9c53a14a73	realm_access.roles	claim.name
16ec950a-38d8-4a32-87c8-8c9c53a14a73	String	jsonType.label
4ea2d316-b311-4e6b-90e5-829d17f36010	true	introspection.token.claim
4ea2d316-b311-4e6b-90e5-829d17f36010	true	multivalued
4ea2d316-b311-4e6b-90e5-829d17f36010	foo	user.attribute
4ea2d316-b311-4e6b-90e5-829d17f36010	true	access.token.claim
4ea2d316-b311-4e6b-90e5-829d17f36010	resource_access.${client_id}.roles	claim.name
4ea2d316-b311-4e6b-90e5-829d17f36010	String	jsonType.label
711369a6-5662-4b2e-9f40-2734703cf69f	true	introspection.token.claim
711369a6-5662-4b2e-9f40-2734703cf69f	true	access.token.claim
8192bd36-6e1c-4d2b-9fc1-7cf88951674d	formatted	user.attribute.formatted
8192bd36-6e1c-4d2b-9fc1-7cf88951674d	country	user.attribute.country
8192bd36-6e1c-4d2b-9fc1-7cf88951674d	true	introspection.token.claim
8192bd36-6e1c-4d2b-9fc1-7cf88951674d	postal_code	user.attribute.postal_code
8192bd36-6e1c-4d2b-9fc1-7cf88951674d	true	userinfo.token.claim
8192bd36-6e1c-4d2b-9fc1-7cf88951674d	street	user.attribute.street
8192bd36-6e1c-4d2b-9fc1-7cf88951674d	true	id.token.claim
8192bd36-6e1c-4d2b-9fc1-7cf88951674d	region	user.attribute.region
8192bd36-6e1c-4d2b-9fc1-7cf88951674d	true	access.token.claim
8192bd36-6e1c-4d2b-9fc1-7cf88951674d	locality	user.attribute.locality
6a1fd7c5-505e-4ec4-a2de-9e691372eb56	true	introspection.token.claim
6a1fd7c5-505e-4ec4-a2de-9e691372eb56	true	userinfo.token.claim
6a1fd7c5-505e-4ec4-a2de-9e691372eb56	identityCard	user.attribute
6a1fd7c5-505e-4ec4-a2de-9e691372eb56	true	id.token.claim
6a1fd7c5-505e-4ec4-a2de-9e691372eb56	false	lightweight.claim
6a1fd7c5-505e-4ec4-a2de-9e691372eb56	true	access.token.claim
6a1fd7c5-505e-4ec4-a2de-9e691372eb56	identityCard	claim.name
6a1fd7c5-505e-4ec4-a2de-9e691372eb56	String	jsonType.label
90ebd635-a93c-441c-b243-16fefb669a6c	true	introspection.token.claim
90ebd635-a93c-441c-b243-16fefb669a6c	true	userinfo.token.claim
90ebd635-a93c-441c-b243-16fefb669a6c	phoneNumber	user.attribute
90ebd635-a93c-441c-b243-16fefb669a6c	true	id.token.claim
90ebd635-a93c-441c-b243-16fefb669a6c	true	access.token.claim
90ebd635-a93c-441c-b243-16fefb669a6c	phone_number	claim.name
90ebd635-a93c-441c-b243-16fefb669a6c	String	jsonType.label
d4439e6c-d49c-4ee6-9105-7368093acbfb	true	introspection.token.claim
d4439e6c-d49c-4ee6-9105-7368093acbfb	true	userinfo.token.claim
d4439e6c-d49c-4ee6-9105-7368093acbfb	phoneNumberVerified	user.attribute
d4439e6c-d49c-4ee6-9105-7368093acbfb	true	id.token.claim
d4439e6c-d49c-4ee6-9105-7368093acbfb	true	access.token.claim
d4439e6c-d49c-4ee6-9105-7368093acbfb	phone_number_verified	claim.name
d4439e6c-d49c-4ee6-9105-7368093acbfb	boolean	jsonType.label
275d951d-5d92-4a2c-a544-dcb03f607b7c	true	introspection.token.claim
275d951d-5d92-4a2c-a544-dcb03f607b7c	true	userinfo.token.claim
275d951d-5d92-4a2c-a544-dcb03f607b7c	email	user.attribute
275d951d-5d92-4a2c-a544-dcb03f607b7c	true	id.token.claim
275d951d-5d92-4a2c-a544-dcb03f607b7c	true	access.token.claim
275d951d-5d92-4a2c-a544-dcb03f607b7c	email	claim.name
275d951d-5d92-4a2c-a544-dcb03f607b7c	String	jsonType.label
a4f34899-5407-4b2e-8954-17e464d35912	true	introspection.token.claim
a4f34899-5407-4b2e-8954-17e464d35912	true	userinfo.token.claim
a4f34899-5407-4b2e-8954-17e464d35912	emailVerified	user.attribute
a4f34899-5407-4b2e-8954-17e464d35912	true	id.token.claim
a4f34899-5407-4b2e-8954-17e464d35912	true	access.token.claim
a4f34899-5407-4b2e-8954-17e464d35912	email_verified	claim.name
a4f34899-5407-4b2e-8954-17e464d35912	boolean	jsonType.label
1c7317c0-24e7-4f17-b71a-0f05a3919254	true	introspection.token.claim
1c7317c0-24e7-4f17-b71a-0f05a3919254	true	userinfo.token.claim
1c7317c0-24e7-4f17-b71a-0f05a3919254	profile	user.attribute
1c7317c0-24e7-4f17-b71a-0f05a3919254	true	id.token.claim
1c7317c0-24e7-4f17-b71a-0f05a3919254	true	access.token.claim
1c7317c0-24e7-4f17-b71a-0f05a3919254	profile	claim.name
1c7317c0-24e7-4f17-b71a-0f05a3919254	String	jsonType.label
33734d70-1064-4a08-867a-bbf44f77c317	true	introspection.token.claim
33734d70-1064-4a08-867a-bbf44f77c317	true	userinfo.token.claim
33734d70-1064-4a08-867a-bbf44f77c317	nickname	user.attribute
33734d70-1064-4a08-867a-bbf44f77c317	true	id.token.claim
33734d70-1064-4a08-867a-bbf44f77c317	true	access.token.claim
33734d70-1064-4a08-867a-bbf44f77c317	nickname	claim.name
33734d70-1064-4a08-867a-bbf44f77c317	String	jsonType.label
3abbfccb-ccf5-442f-8b52-b9c04b824f94	true	introspection.token.claim
3abbfccb-ccf5-442f-8b52-b9c04b824f94	true	userinfo.token.claim
3abbfccb-ccf5-442f-8b52-b9c04b824f94	gender	user.attribute
3abbfccb-ccf5-442f-8b52-b9c04b824f94	true	id.token.claim
3abbfccb-ccf5-442f-8b52-b9c04b824f94	true	access.token.claim
3abbfccb-ccf5-442f-8b52-b9c04b824f94	gender	claim.name
3abbfccb-ccf5-442f-8b52-b9c04b824f94	String	jsonType.label
4335c67b-881c-416a-a604-dab243fee4a4	true	introspection.token.claim
4335c67b-881c-416a-a604-dab243fee4a4	true	userinfo.token.claim
4335c67b-881c-416a-a604-dab243fee4a4	updatedAt	user.attribute
4335c67b-881c-416a-a604-dab243fee4a4	true	id.token.claim
4335c67b-881c-416a-a604-dab243fee4a4	true	access.token.claim
4335c67b-881c-416a-a604-dab243fee4a4	updated_at	claim.name
4335c67b-881c-416a-a604-dab243fee4a4	long	jsonType.label
4c7982dd-5e54-4ada-af28-fa3d736e9b90	true	introspection.token.claim
4c7982dd-5e54-4ada-af28-fa3d736e9b90	true	userinfo.token.claim
4c7982dd-5e54-4ada-af28-fa3d736e9b90	firstName	user.attribute
4c7982dd-5e54-4ada-af28-fa3d736e9b90	true	id.token.claim
4c7982dd-5e54-4ada-af28-fa3d736e9b90	true	access.token.claim
4c7982dd-5e54-4ada-af28-fa3d736e9b90	given_name	claim.name
4c7982dd-5e54-4ada-af28-fa3d736e9b90	String	jsonType.label
4d41dcbd-34e3-4898-834a-9dae8fa965eb	true	introspection.token.claim
4d41dcbd-34e3-4898-834a-9dae8fa965eb	true	userinfo.token.claim
4d41dcbd-34e3-4898-834a-9dae8fa965eb	website	user.attribute
4d41dcbd-34e3-4898-834a-9dae8fa965eb	true	id.token.claim
4d41dcbd-34e3-4898-834a-9dae8fa965eb	true	access.token.claim
4d41dcbd-34e3-4898-834a-9dae8fa965eb	website	claim.name
4d41dcbd-34e3-4898-834a-9dae8fa965eb	String	jsonType.label
55d55235-a215-4f2d-9324-164ad1e842cb	true	introspection.token.claim
55d55235-a215-4f2d-9324-164ad1e842cb	true	userinfo.token.claim
55d55235-a215-4f2d-9324-164ad1e842cb	username	user.attribute
55d55235-a215-4f2d-9324-164ad1e842cb	true	id.token.claim
55d55235-a215-4f2d-9324-164ad1e842cb	true	access.token.claim
55d55235-a215-4f2d-9324-164ad1e842cb	preferred_username	claim.name
55d55235-a215-4f2d-9324-164ad1e842cb	String	jsonType.label
8e9a718d-b1a5-4663-a40b-52d0bec807f2	true	introspection.token.claim
8e9a718d-b1a5-4663-a40b-52d0bec807f2	true	userinfo.token.claim
8e9a718d-b1a5-4663-a40b-52d0bec807f2	middleName	user.attribute
8e9a718d-b1a5-4663-a40b-52d0bec807f2	true	id.token.claim
8e9a718d-b1a5-4663-a40b-52d0bec807f2	true	access.token.claim
8e9a718d-b1a5-4663-a40b-52d0bec807f2	middle_name	claim.name
8e9a718d-b1a5-4663-a40b-52d0bec807f2	String	jsonType.label
930fad4d-a1a4-4f3e-acaa-5416585dde3a	true	introspection.token.claim
930fad4d-a1a4-4f3e-acaa-5416585dde3a	true	userinfo.token.claim
930fad4d-a1a4-4f3e-acaa-5416585dde3a	zoneinfo	user.attribute
930fad4d-a1a4-4f3e-acaa-5416585dde3a	true	id.token.claim
930fad4d-a1a4-4f3e-acaa-5416585dde3a	true	access.token.claim
930fad4d-a1a4-4f3e-acaa-5416585dde3a	zoneinfo	claim.name
930fad4d-a1a4-4f3e-acaa-5416585dde3a	String	jsonType.label
bba3749c-33e5-4e65-b09a-99868c9ca1fd	true	introspection.token.claim
bba3749c-33e5-4e65-b09a-99868c9ca1fd	true	userinfo.token.claim
bba3749c-33e5-4e65-b09a-99868c9ca1fd	picture	user.attribute
bba3749c-33e5-4e65-b09a-99868c9ca1fd	true	id.token.claim
bba3749c-33e5-4e65-b09a-99868c9ca1fd	true	access.token.claim
bba3749c-33e5-4e65-b09a-99868c9ca1fd	picture	claim.name
bba3749c-33e5-4e65-b09a-99868c9ca1fd	String	jsonType.label
d9bf1bb8-6b23-4d36-9cef-4853eb91f4d4	true	id.token.claim
d9bf1bb8-6b23-4d36-9cef-4853eb91f4d4	true	introspection.token.claim
d9bf1bb8-6b23-4d36-9cef-4853eb91f4d4	true	access.token.claim
d9bf1bb8-6b23-4d36-9cef-4853eb91f4d4	true	userinfo.token.claim
e74ee35c-3e8f-4cd2-86aa-ef03a33fcd95	true	introspection.token.claim
e74ee35c-3e8f-4cd2-86aa-ef03a33fcd95	true	userinfo.token.claim
e74ee35c-3e8f-4cd2-86aa-ef03a33fcd95	birthdate	user.attribute
e74ee35c-3e8f-4cd2-86aa-ef03a33fcd95	true	id.token.claim
e74ee35c-3e8f-4cd2-86aa-ef03a33fcd95	true	access.token.claim
e74ee35c-3e8f-4cd2-86aa-ef03a33fcd95	birthdate	claim.name
e74ee35c-3e8f-4cd2-86aa-ef03a33fcd95	String	jsonType.label
e8f55769-463b-409a-807c-eca404aac375	true	introspection.token.claim
e8f55769-463b-409a-807c-eca404aac375	true	userinfo.token.claim
e8f55769-463b-409a-807c-eca404aac375	locale	user.attribute
e8f55769-463b-409a-807c-eca404aac375	true	id.token.claim
e8f55769-463b-409a-807c-eca404aac375	true	access.token.claim
e8f55769-463b-409a-807c-eca404aac375	locale	claim.name
e8f55769-463b-409a-807c-eca404aac375	String	jsonType.label
f0196095-2ed8-4c1a-968f-9f0e5a480410	true	introspection.token.claim
f0196095-2ed8-4c1a-968f-9f0e5a480410	true	userinfo.token.claim
f0196095-2ed8-4c1a-968f-9f0e5a480410	lastName	user.attribute
f0196095-2ed8-4c1a-968f-9f0e5a480410	true	id.token.claim
f0196095-2ed8-4c1a-968f-9f0e5a480410	true	access.token.claim
f0196095-2ed8-4c1a-968f-9f0e5a480410	family_name	claim.name
f0196095-2ed8-4c1a-968f-9f0e5a480410	String	jsonType.label
8b303a49-1773-44c5-8951-88a83bbf50c3	true	introspection.token.claim
8b303a49-1773-44c5-8951-88a83bbf50c3	true	access.token.claim
41482f31-7ac9-49af-b393-011881c6bba3	true	introspection.token.claim
41482f31-7ac9-49af-b393-011881c6bba3	true	userinfo.token.claim
41482f31-7ac9-49af-b393-011881c6bba3	username	user.attribute
41482f31-7ac9-49af-b393-011881c6bba3	true	id.token.claim
41482f31-7ac9-49af-b393-011881c6bba3	true	access.token.claim
41482f31-7ac9-49af-b393-011881c6bba3	upn	claim.name
41482f31-7ac9-49af-b393-011881c6bba3	String	jsonType.label
f2f3f583-bd34-43ad-bec0-b1265fb20786	true	introspection.token.claim
f2f3f583-bd34-43ad-bec0-b1265fb20786	true	multivalued
f2f3f583-bd34-43ad-bec0-b1265fb20786	true	userinfo.token.claim
f2f3f583-bd34-43ad-bec0-b1265fb20786	foo	user.attribute
f2f3f583-bd34-43ad-bec0-b1265fb20786	true	id.token.claim
f2f3f583-bd34-43ad-bec0-b1265fb20786	true	access.token.claim
f2f3f583-bd34-43ad-bec0-b1265fb20786	groups	claim.name
f2f3f583-bd34-43ad-bec0-b1265fb20786	String	jsonType.label
c4e3bc0e-be92-4653-9fda-cfc135538d71	true	introspection.token.claim
c4e3bc0e-be92-4653-9fda-cfc135538d71	true	userinfo.token.claim
c4e3bc0e-be92-4653-9fda-cfc135538d71	fullName	user.attribute
c4e3bc0e-be92-4653-9fda-cfc135538d71	true	id.token.claim
c4e3bc0e-be92-4653-9fda-cfc135538d71	false	lightweight.claim
c4e3bc0e-be92-4653-9fda-cfc135538d71	true	access.token.claim
c4e3bc0e-be92-4653-9fda-cfc135538d71	fullName	claim.name
c4e3bc0e-be92-4653-9fda-cfc135538d71	String	jsonType.label
e93f93d1-0b5b-4f66-b7a1-044820f02ecb	false	single
e93f93d1-0b5b-4f66-b7a1-044820f02ecb	Basic	attribute.nameformat
e93f93d1-0b5b-4f66-b7a1-044820f02ecb	Role	attribute.name
8a6efdec-6cf1-4229-8062-31a5eef774b8	true	id.token.claim
8a6efdec-6cf1-4229-8062-31a5eef774b8	true	introspection.token.claim
8a6efdec-6cf1-4229-8062-31a5eef774b8	true	access.token.claim
8a6efdec-6cf1-4229-8062-31a5eef774b8	true	userinfo.token.claim
cb2b90ba-7b55-4cfc-b35d-6e1a8d7be2a8	true	introspection.token.claim
cb2b90ba-7b55-4cfc-b35d-6e1a8d7be2a8	true	userinfo.token.claim
cb2b90ba-7b55-4cfc-b35d-6e1a8d7be2a8	locale	user.attribute
cb2b90ba-7b55-4cfc-b35d-6e1a8d7be2a8	true	id.token.claim
cb2b90ba-7b55-4cfc-b35d-6e1a8d7be2a8	true	access.token.claim
cb2b90ba-7b55-4cfc-b35d-6e1a8d7be2a8	locale	claim.name
cb2b90ba-7b55-4cfc-b35d-6e1a8d7be2a8	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
62eee42e-1836-4073-ba2c-4845df4bb81f	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	ec5b14b1-2baa-4e50-b265-d2a6a8748b6b	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	d2f9a516-ee50-4332-ab83-064c9e836a6e	4f54ecb3-4d53-47fd-b015-ed9215878840	6d891d07-9a44-4198-95c0-f5ac9f52c993	a15a1c1c-4091-4065-9787-ac617c49bf7b	8261cb25-ccf8-469b-b0ee-0c2881314c61	2592000	f	900	t	f	b12844cb-ec58-4951-8709-ae773d3933dc	0	f	0	0	ba6ac653-34a3-4b2a-ac74-8c56a9b5f66a
648ca54c-3788-49f4-b9fa-de81e6fc4bbb	60	300	300	keycloak.v3	keycloak.v2	keycloak	t	f	0	keycloak	violation-system	0	\N	t	t	t	f	EXTERNAL	1800	36000	f	f	f20d1de2-5b48-445f-941d-cb74b3f0fae6	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	5b4a9417-d119-4583-9e41-a196ef53ebbd	8b014614-9983-47ee-bb39-2e7380f0daed	b2dd812f-6fe5-4990-b84e-d2a530291025	651d1279-4010-40f3-afa3-b0eb224ec1df	2296c735-7776-4d79-b834-19e69c360ecf	2592000	f	900	t	f	656254e8-ebd7-4e6a-a739-348cd3243248	0	f	0	0	ab18b326-0a16-4b87-a728-45cb9a72d263
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	62eee42e-1836-4073-ba2c-4845df4bb81f	
_browser_header.xContentTypeOptions	62eee42e-1836-4073-ba2c-4845df4bb81f	nosniff
_browser_header.referrerPolicy	62eee42e-1836-4073-ba2c-4845df4bb81f	no-referrer
_browser_header.xRobotsTag	62eee42e-1836-4073-ba2c-4845df4bb81f	none
_browser_header.xFrameOptions	62eee42e-1836-4073-ba2c-4845df4bb81f	SAMEORIGIN
_browser_header.contentSecurityPolicy	62eee42e-1836-4073-ba2c-4845df4bb81f	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	62eee42e-1836-4073-ba2c-4845df4bb81f	1; mode=block
_browser_header.strictTransportSecurity	62eee42e-1836-4073-ba2c-4845df4bb81f	max-age=31536000; includeSubDomains
bruteForceProtected	62eee42e-1836-4073-ba2c-4845df4bb81f	false
permanentLockout	62eee42e-1836-4073-ba2c-4845df4bb81f	false
maxTemporaryLockouts	62eee42e-1836-4073-ba2c-4845df4bb81f	0
maxFailureWaitSeconds	62eee42e-1836-4073-ba2c-4845df4bb81f	900
minimumQuickLoginWaitSeconds	62eee42e-1836-4073-ba2c-4845df4bb81f	60
waitIncrementSeconds	62eee42e-1836-4073-ba2c-4845df4bb81f	60
quickLoginCheckMilliSeconds	62eee42e-1836-4073-ba2c-4845df4bb81f	1000
maxDeltaTimeSeconds	62eee42e-1836-4073-ba2c-4845df4bb81f	43200
failureFactor	62eee42e-1836-4073-ba2c-4845df4bb81f	30
realmReusableOtpCode	62eee42e-1836-4073-ba2c-4845df4bb81f	false
firstBrokerLoginFlowId	62eee42e-1836-4073-ba2c-4845df4bb81f	facb0ff9-4597-4aca-8a6b-1c1d254d63fe
displayName	62eee42e-1836-4073-ba2c-4845df4bb81f	Keycloak
displayNameHtml	62eee42e-1836-4073-ba2c-4845df4bb81f	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	62eee42e-1836-4073-ba2c-4845df4bb81f	RS256
offlineSessionMaxLifespanEnabled	62eee42e-1836-4073-ba2c-4845df4bb81f	false
offlineSessionMaxLifespan	62eee42e-1836-4073-ba2c-4845df4bb81f	5184000
_browser_header.contentSecurityPolicyReportOnly	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	
_browser_header.xContentTypeOptions	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	nosniff
_browser_header.referrerPolicy	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	no-referrer
_browser_header.xRobotsTag	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	none
_browser_header.xFrameOptions	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	SAMEORIGIN
_browser_header.contentSecurityPolicy	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	1; mode=block
_browser_header.strictTransportSecurity	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	max-age=31536000; includeSubDomains
bruteForceProtected	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	false
permanentLockout	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	false
maxTemporaryLockouts	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	0
maxFailureWaitSeconds	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	900
minimumQuickLoginWaitSeconds	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	60
waitIncrementSeconds	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	60
quickLoginCheckMilliSeconds	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	1000
maxDeltaTimeSeconds	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	43200
failureFactor	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	30
realmReusableOtpCode	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	false
defaultSignatureAlgorithm	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	RS256
offlineSessionMaxLifespanEnabled	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	false
offlineSessionMaxLifespan	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	5184000
clientSessionIdleTimeout	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	0
clientSessionMaxLifespan	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	0
clientOfflineSessionIdleTimeout	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	0
clientOfflineSessionMaxLifespan	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	0
actionTokenGeneratedByAdminLifespan	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	43200
actionTokenGeneratedByUserLifespan	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	300
oauth2DeviceCodeLifespan	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	600
oauth2DevicePollingInterval	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	5
webAuthnPolicyRpEntityName	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	keycloak
webAuthnPolicySignatureAlgorithms	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	ES256
webAuthnPolicyRpId	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	
webAuthnPolicyAttestationConveyancePreference	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	not specified
webAuthnPolicyAuthenticatorAttachment	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	not specified
webAuthnPolicyRequireResidentKey	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	not specified
webAuthnPolicyUserVerificationRequirement	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	not specified
webAuthnPolicyCreateTimeout	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	0
webAuthnPolicyAvoidSameAuthenticatorRegister	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	false
webAuthnPolicyRpEntityNamePasswordless	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	ES256
webAuthnPolicyRpIdPasswordless	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	
webAuthnPolicyAttestationConveyancePreferencePasswordless	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	not specified
webAuthnPolicyRequireResidentKeyPasswordless	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	not specified
webAuthnPolicyCreateTimeoutPasswordless	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	false
cibaBackchannelTokenDeliveryMode	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	poll
cibaExpiresIn	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	120
cibaInterval	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	5
cibaAuthRequestedUserHint	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	login_hint
parRequestUriLifespan	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	60
firstBrokerLoginFlowId	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	d52fe36a-5645-4df1-a598-4033fd70bdf2
client-policies.profiles	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	{"profiles":[]}
client-policies.policies	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	{"policies":[]}
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
648ca54c-3788-49f4-b9fa-de81e6fc4bbb	9d994d40-6c2d-48eb-9078-426ee334dc60
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
62eee42e-1836-4073-ba2c-4845df4bb81f	jboss-logging
648ca54c-3788-49f4-b9fa-de81e6fc4bbb	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	62eee42e-1836-4073-ba2c-4845df4bb81f
password	password	t	t	648ca54c-3788-49f4-b9fa-de81e6fc4bbb
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.redirect_uris (client_id, value) FROM stdin;
73dacec3-6bba-49f4-9fd3-46de00fd8cb7	/realms/master/account/*
ae6ce30c-5355-4a89-ab59-8c5eab30c235	/realms/master/account/*
1adf445c-da43-44c8-9b30-ca249e2f8209	/admin/master/console/*
6a09ee99-9116-45f9-adac-0f04cb119b5a	/realms/violation-system/account/*
2720e5ea-0903-4fe2-ba6f-4e978245faf6	/realms/violation-system/account/*
b0e6e45d-48a4-4ef8-8844-ac077ec6b634	/admin/violation-system/console/*
ffc6f6a0-6672-4968-8162-44761080f4da	http://localhost:8888/login/oauth2/code/*
71f25c21-915e-4015-811a-5cb3df1d0aff	http://localhost:5173/*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
bd08adee-4e97-4eff-b22f-eba410c913cd	VERIFY_EMAIL	Verify Email	62eee42e-1836-4073-ba2c-4845df4bb81f	t	f	VERIFY_EMAIL	50
44f40fc6-6a40-4742-bdd3-5f296825a5c2	UPDATE_PROFILE	Update Profile	62eee42e-1836-4073-ba2c-4845df4bb81f	t	f	UPDATE_PROFILE	40
fca586bb-979a-4339-ba64-35e29be3a0f4	CONFIGURE_TOTP	Configure OTP	62eee42e-1836-4073-ba2c-4845df4bb81f	t	f	CONFIGURE_TOTP	10
34c4135c-b8d3-4dee-b737-0d7facd57958	UPDATE_PASSWORD	Update Password	62eee42e-1836-4073-ba2c-4845df4bb81f	t	f	UPDATE_PASSWORD	30
ddcd10b8-604b-4247-bcc1-884c87e92ef7	TERMS_AND_CONDITIONS	Terms and Conditions	62eee42e-1836-4073-ba2c-4845df4bb81f	f	f	TERMS_AND_CONDITIONS	20
a3d57026-6f73-499f-bd48-1da6c8b234e3	delete_account	Delete Account	62eee42e-1836-4073-ba2c-4845df4bb81f	f	f	delete_account	60
26f834ec-76b4-45d1-a08d-7bb51ec05181	delete_credential	Delete Credential	62eee42e-1836-4073-ba2c-4845df4bb81f	t	f	delete_credential	100
e6a86e8d-8473-45f1-a771-b67b30ca3b4c	update_user_locale	Update User Locale	62eee42e-1836-4073-ba2c-4845df4bb81f	t	f	update_user_locale	1000
2e42e3d3-5fcc-4149-8136-af10937050a7	webauthn-register	Webauthn Register	62eee42e-1836-4073-ba2c-4845df4bb81f	t	f	webauthn-register	70
22af5b8b-7668-41e4-b945-7d7a5e513689	webauthn-register-passwordless	Webauthn Register Passwordless	62eee42e-1836-4073-ba2c-4845df4bb81f	t	f	webauthn-register-passwordless	80
5aac512f-3551-443f-9974-ac1d057e9d3d	VERIFY_PROFILE	Verify Profile	62eee42e-1836-4073-ba2c-4845df4bb81f	t	f	VERIFY_PROFILE	90
c6cb8701-8a60-4517-b672-00495d6ca377	CONFIGURE_TOTP	Configure OTP	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	t	f	CONFIGURE_TOTP	10
457b3c88-7c5c-4acd-820e-a2659e4458f5	TERMS_AND_CONDITIONS	Terms and Conditions	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	f	f	TERMS_AND_CONDITIONS	20
a7dfd30a-06a1-41a3-a82e-78faf2138bd6	UPDATE_PASSWORD	Update Password	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	t	f	UPDATE_PASSWORD	30
b35b5f53-2601-4403-8cad-fd3203e61e6f	UPDATE_PROFILE	Update Profile	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	t	f	UPDATE_PROFILE	40
df030e4c-5d42-4dbd-9e64-64ec181b2021	VERIFY_EMAIL	Verify Email	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	t	f	VERIFY_EMAIL	50
d816b692-6444-47a2-b0a3-b4bed54fc198	delete_account	Delete Account	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	f	f	delete_account	60
e803dbce-96ee-4c77-8a5e-16668bbaa539	webauthn-register	Webauthn Register	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	t	f	webauthn-register	70
e4fd7294-4ba4-48f8-a4c2-1c07d97841c6	webauthn-register-passwordless	Webauthn Register Passwordless	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	t	f	webauthn-register-passwordless	80
e8c3d8a4-0dfb-48d9-ab79-9c7528f5b503	VERIFY_PROFILE	Verify Profile	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	t	f	VERIFY_PROFILE	90
5fe559e0-23a8-4018-8561-4edbb1585759	delete_credential	Delete Credential	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	t	f	delete_credential	100
3357d2ab-4003-49f7-9114-55efadf15830	update_user_locale	Update User Locale	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	t	f	update_user_locale	1000
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
ae6ce30c-5355-4a89-ab59-8c5eab30c235	e6899bea-f568-45aa-b178-e2a0f4856511
ae6ce30c-5355-4a89-ab59-8c5eab30c235	c061eedf-cc54-43c8-b96c-49601fbdf682
2720e5ea-0903-4fe2-ba6f-4e978245faf6	ef2ee163-55e3-4806-9725-4f5be4968b50
2720e5ea-0903-4fe2-ba6f-4e978245faf6	a17ea82a-8f9c-4627-b38d-2106df6bcbf9
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_attribute (name, value, user_id, id, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
phoneNumber	0392225886	c61b7e1f-57dc-4a83-a298-b69e5d33c044	9e2016e6-f133-42b5-b37c-73fafb28047d	\N	\N	\N
fullName	Trần Đức An	c61b7e1f-57dc-4a83-a298-b69e5d33c044	78839ff7-4455-4224-a87a-ee859a5d2bb5	\N	\N	\N
identityCard	001204014306	c61b7e1f-57dc-4a83-a298-b69e5d33c044	da4d026e-5f11-4749-87c6-a1f95bbfa353	\N	\N	\N
fullName	admin	c200e091-4552-40de-b721-8e4ac046d812	be899469-6839-4d82-884b-895b96b81f95	\N	\N	\N
phoneNumber	0	c200e091-4552-40de-b721-8e4ac046d812	391bb214-ec0b-47af-8f8f-80770f563d3a	\N	\N	\N
identityCard	0	c200e091-4552-40de-b721-8e4ac046d812	c05e4c30-f788-41da-ad13-6aceab564542	\N	\N	\N
fullName	Long	c69eabb7-a087-48a1-8510-1a7f1bef6e79	41524910-bf1b-4cf9-b585-fe6e73b58bbf	\N	\N	\N
phoneNumber	0	c69eabb7-a087-48a1-8510-1a7f1bef6e79	fababc72-e6a6-4d2c-9985-5c43102be5f9	\N	\N	\N
identityCard	1	c69eabb7-a087-48a1-8510-1a7f1bef6e79	eba348a9-b689-468d-b075-102f969c55ab	\N	\N	\N
fullName	Long 2	def6ece6-9ecf-484d-8b2d-bf9402042dda	d74a50e4-5596-4286-9bd1-6db8aa7edaf7	\N	\N	\N
phoneNumber	0392225802	def6ece6-9ecf-484d-8b2d-bf9402042dda	8f3789f3-af48-48af-9aa8-7a6e0f87ab9b	\N	\N	\N
identityCard	001204014307	def6ece6-9ecf-484d-8b2d-bf9402042dda	3349f169-14dd-48c5-9dae-d98c94fb4c08	\N	\N	\N
fullName	Long 3	86c52cf2-109a-4cfe-bdd3-839a0f1ba7a4	59236140-a192-486f-88bb-cc2485d09334	\N	\N	\N
phoneNumber	0392225803	86c52cf2-109a-4cfe-bdd3-839a0f1ba7a4	0f613a67-5d04-4f70-a117-4569f0d64158	\N	\N	\N
identityCard	001204014308	86c52cf2-109a-4cfe-bdd3-839a0f1ba7a4	1a871268-3f9d-4e4f-a274-124e87479cde	\N	\N	\N
fullName	Long 4	8a9f43a8-16e8-4853-b06d-af4406d3d990	32510eeb-5e24-4418-9ece-46621ec81218	\N	\N	\N
phoneNumber	0392225804	8a9f43a8-16e8-4853-b06d-af4406d3d990	c571e357-13c7-4f87-9c9e-b246880c0b41	\N	\N	\N
identityCard	001204014309	8a9f43a8-16e8-4853-b06d-af4406d3d990	1dacf2b8-b1d2-43c3-a40f-5709407d6651	\N	\N	\N
fullName	Long 5	0477c90e-88b8-4adb-ad7e-15ef2cbdfdea	7342e566-8cc6-415f-9218-86b140a74054	\N	\N	\N
phoneNumber	0392225805	0477c90e-88b8-4adb-ad7e-15ef2cbdfdea	29cb74c5-b633-4cd4-90bf-cc01b881e18a	\N	\N	\N
identityCard	001204014310	0477c90e-88b8-4adb-ad7e-15ef2cbdfdea	0832ebbb-9f99-4da9-be13-9b9f0346d91f	\N	\N	\N
fullName	Long 6	b201b699-76df-4ca7-8e20-982c9ea08ae9	9f68b956-4c0e-4152-b082-ec552e184e8d	\N	\N	\N
phoneNumber	0392225806	b201b699-76df-4ca7-8e20-982c9ea08ae9	051001c3-5196-470a-973a-313c593cb792	\N	\N	\N
identityCard	001204014311	b201b699-76df-4ca7-8e20-982c9ea08ae9	06bca67c-d1e1-4c2f-9269-01e575b667f7	\N	\N	\N
fullName	Long 7	32a0e73e-a226-4d2b-a19f-10f9f5292858	22f367cd-71aa-4f66-81d9-a6d4293c335d	\N	\N	\N
phoneNumber	0392225807	32a0e73e-a226-4d2b-a19f-10f9f5292858	01232732-c52a-4d68-bcc3-bd098c2a6fe8	\N	\N	\N
identityCard	001204014312	32a0e73e-a226-4d2b-a19f-10f9f5292858	1ea7bd15-f0b6-4688-97a6-4b8a98343f11	\N	\N	\N
fullName	Long 8	e914bbd6-6db1-4762-bcae-a15daae55e68	2a68eb5e-9c29-486c-86a0-dc52e9d2a084	\N	\N	\N
phoneNumber	0392225808	e914bbd6-6db1-4762-bcae-a15daae55e68	9df3357f-9216-4500-a2dc-72725eee6120	\N	\N	\N
identityCard	001204014313	e914bbd6-6db1-4762-bcae-a15daae55e68	8611d4c7-fd9a-4e36-bdf1-e4f4fcf7b50a	\N	\N	\N
fullName	Long 9	f2c8a807-eb1c-40ab-9bbc-2f352f8f19b9	f08caa2b-6a4e-44cb-848a-9a9b81a63dcc	\N	\N	\N
phoneNumber	0392225809	f2c8a807-eb1c-40ab-9bbc-2f352f8f19b9	302d9d45-34e3-4c73-956d-13051e6f9cb2	\N	\N	\N
identityCard	001204014314	f2c8a807-eb1c-40ab-9bbc-2f352f8f19b9	14344d5d-4655-4555-b876-6d67ab971bc6	\N	\N	\N
fullName	Long 10	369432fb-b127-4244-b5d0-463b4a9d46c0	3b6040ff-4d6b-47bb-92a1-6fd68aa7ce5d	\N	\N	\N
phoneNumber	0392225810	369432fb-b127-4244-b5d0-463b4a9d46c0	45c1e4bd-b1ab-4c92-b5ea-0042dcb13a59	\N	\N	\N
identityCard	001204014315	369432fb-b127-4244-b5d0-463b4a9d46c0	d0242301-b219-4eb7-9aa3-a02bfecfee2d	\N	\N	\N
fullName	Long 11	9cf11d32-6f50-4b88-a83a-da4296bf44f2	4e83d448-a599-4093-affa-f97fd4364c27	\N	\N	\N
phoneNumber	0392225811	9cf11d32-6f50-4b88-a83a-da4296bf44f2	5824c0e5-8cd0-43e7-bcb1-2398eab80ef2	\N	\N	\N
identityCard	001204014316	9cf11d32-6f50-4b88-a83a-da4296bf44f2	a2a6cd7b-c7c9-4661-9959-a3c4af654a4f	\N	\N	\N
fullName	Long 12	ead92f4e-abe7-4c89-8c50-40017580f6bb	a64a176c-240d-4096-828c-1186c3988db8	\N	\N	\N
phoneNumber	0392225812	ead92f4e-abe7-4c89-8c50-40017580f6bb	ee212781-27fe-4b3f-9456-c953d856eba8	\N	\N	\N
identityCard	001204014317	ead92f4e-abe7-4c89-8c50-40017580f6bb	5058a1e8-1804-474c-9e03-a08c4f077356	\N	\N	\N
fullName	Long 13	f2ca25e0-e2bb-4cbc-8d80-c93aa8d5d714	406f0088-a1c9-4b71-ac69-cd81029d7b95	\N	\N	\N
phoneNumber	0392225813	f2ca25e0-e2bb-4cbc-8d80-c93aa8d5d714	3634c913-289a-4f0c-9650-2aadd39b51b2	\N	\N	\N
identityCard	001204014318	f2ca25e0-e2bb-4cbc-8d80-c93aa8d5d714	b4611599-798a-4a44-8219-730307b6a508	\N	\N	\N
fullName	Long 14	6c067068-4335-47af-8a01-32416137a5f6	043162d7-af9c-4cc9-97ca-edcc01ba927b	\N	\N	\N
phoneNumber	0392225814	6c067068-4335-47af-8a01-32416137a5f6	3794990c-d09e-4ddc-8f99-e534890f4a7b	\N	\N	\N
identityCard	001204014319	6c067068-4335-47af-8a01-32416137a5f6	890376bb-25e7-4ff8-83fe-9fc340f63f4e	\N	\N	\N
fullName	Long 15	7ddcaea6-5c3b-49ac-988e-c3353d365656	ed0a478b-895c-4404-94cd-988b3c0629ff	\N	\N	\N
phoneNumber	0392225815	7ddcaea6-5c3b-49ac-988e-c3353d365656	aabf6c96-86fe-486c-a769-a2a1cab43534	\N	\N	\N
identityCard	001204014320	7ddcaea6-5c3b-49ac-988e-c3353d365656	e8e71465-0f72-4de7-8895-d9c5e862bb1d	\N	\N	\N
fullName	Long 16	0e5f7ced-91de-4496-b164-271655d3dd09	bd988d2d-2bb6-47f8-a5c8-113b2512a9c5	\N	\N	\N
phoneNumber	0392225816	0e5f7ced-91de-4496-b164-271655d3dd09	cfdb92e7-3ba3-4471-8880-073d6733ad42	\N	\N	\N
identityCard	001204014321	0e5f7ced-91de-4496-b164-271655d3dd09	84dcc898-309c-4cd1-ba2f-311a8983cb84	\N	\N	\N
fullName	Long 17	16398a91-879d-4763-b0f4-3f295cdc4e71	b26e4e07-1d5a-4715-aa11-639422d1ece9	\N	\N	\N
phoneNumber	0392225817	16398a91-879d-4763-b0f4-3f295cdc4e71	6d3b46c5-29a6-4776-b54a-cd845d8b87e9	\N	\N	\N
identityCard	001204014322	16398a91-879d-4763-b0f4-3f295cdc4e71	7dc781d4-412a-419a-b283-833632c161a8	\N	\N	\N
fullName	Long 18	97c94877-8348-4d33-a17f-7baad60d16ea	08c3b900-90bb-4e13-af49-8ec46eb81520	\N	\N	\N
phoneNumber	0392225818	97c94877-8348-4d33-a17f-7baad60d16ea	d5cc205d-8364-45ab-86be-78d7adc3d35c	\N	\N	\N
identityCard	001204014323	97c94877-8348-4d33-a17f-7baad60d16ea	5b04cce0-e526-4029-8193-8464be1628ed	\N	\N	\N
fullName	Long 19	8a9d49a7-3c21-4e14-b584-9a35b6505352	de17ed64-1c6a-4b08-b031-3e627fcf41c1	\N	\N	\N
phoneNumber	0392225819	8a9d49a7-3c21-4e14-b584-9a35b6505352	0fc427cd-2cf1-4d63-94a6-c80a75ed0fa7	\N	\N	\N
identityCard	001204014324	8a9d49a7-3c21-4e14-b584-9a35b6505352	0baa5cb9-d465-4d56-a917-1a852d97dd58	\N	\N	\N
fullName	Long 20	7faf3975-73e5-4925-b6c0-6c4191daf102	dcc15d1d-3bf4-4591-93f6-a1bd2532cb91	\N	\N	\N
phoneNumber	0392225820	7faf3975-73e5-4925-b6c0-6c4191daf102	73955bc9-b733-4704-a1e8-d97aa4c0e852	\N	\N	\N
identityCard	001204014325	7faf3975-73e5-4925-b6c0-6c4191daf102	12e624ba-f7d3-4ebb-95a0-51e6df4d872e	\N	\N	\N
fullName	Long 21	6d9e0a86-ce11-402c-b9c5-857f6fdcc598	6fe86f0e-8538-44f5-889e-091273e6af45	\N	\N	\N
phoneNumber	0392225821	6d9e0a86-ce11-402c-b9c5-857f6fdcc598	450362f0-19dd-476e-8ad0-09c9644b6ce4	\N	\N	\N
identityCard	001204014326	6d9e0a86-ce11-402c-b9c5-857f6fdcc598	620d403b-fbc7-4d61-893c-6677603cc7b4	\N	\N	\N
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
96e816b2-13b7-42af-8e5a-720b4bc84cc4	\N	a111738f-0ce6-42a5-855d-beb5837a9db4	f	t	\N	\N	\N	62eee42e-1836-4073-ba2c-4845df4bb81f	admin	1748344816019	\N	0
c61b7e1f-57dc-4a83-a298-b69e5d33c044	an8112004@gmail.com	an8112004@gmail.com	t	t	\N	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	001204014306	1748342026697	\N	0
c200e091-4552-40de-b721-8e4ac046d812	t@gmail.com	t@gmail.com	t	t	\N	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	admin	1748370480233	\N	0
c69eabb7-a087-48a1-8510-1a7f1bef6e79	t1@g	t1@g	f	t	\N	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	111	1748371011779	\N	0
def6ece6-9ecf-484d-8b2d-bf9402042dda	t2@gmail.com	t2@gmail.com	t	t	\N	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	001204014307	1748432224398	\N	0
86c52cf2-109a-4cfe-bdd3-839a0f1ba7a4	t3@gmail.com	t3@gmail.com	t	t	\N	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	001204014308	1748432237655	\N	0
8a9f43a8-16e8-4853-b06d-af4406d3d990	t4@gmail.com	t4@gmail.com	t	t	\N	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	001204014309	1748432250804	\N	0
0477c90e-88b8-4adb-ad7e-15ef2cbdfdea	t5@gmail.com	t5@gmail.com	t	t	\N	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	001204014310	1748432259768	\N	0
b201b699-76df-4ca7-8e20-982c9ea08ae9	t6@gmail.com	t6@gmail.com	t	t	\N	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	001204014311	1748432268957	\N	0
32a0e73e-a226-4d2b-a19f-10f9f5292858	t7@gmail.com	t7@gmail.com	t	t	\N	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	001204014312	1748432279676	\N	0
e914bbd6-6db1-4762-bcae-a15daae55e68	t8@gmail.com	t8@gmail.com	t	t	\N	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	001204014313	1748432288615	\N	0
f2c8a807-eb1c-40ab-9bbc-2f352f8f19b9	t9@gmail.com	t9@gmail.com	t	t	\N	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	001204014314	1748432300997	\N	0
369432fb-b127-4244-b5d0-463b4a9d46c0	t10@gmail.com	t10@gmail.com	t	t	\N	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	001204014315	1748432314234	\N	0
9cf11d32-6f50-4b88-a83a-da4296bf44f2	t11@gmail.com	t11@gmail.com	t	t	\N	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	001204014316	1748432324828	\N	0
7faf3975-73e5-4925-b6c0-6c4191daf102	t20@gmail.com	t20@gmail.com	t	t	\N	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	001204014325	1748432501535	\N	0
8a9d49a7-3c21-4e14-b584-9a35b6505352	t19@gmail.com	t19@gmail.com	t	t	\N	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	001204014324	1748432491625	\N	0
97c94877-8348-4d33-a17f-7baad60d16ea	t18@gmail.com	t18@gmail.com	t	t	\N	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	001204014323	1748432481789	\N	0
16398a91-879d-4763-b0f4-3f295cdc4e71	t17@gmail.com	t17@gmail.com	t	t	\N	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	001204014322	1748432472139	\N	0
0e5f7ced-91de-4496-b164-271655d3dd09	t16@gmail.com	t16@gmail.com	t	t	\N	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	001204014321	1748432462852	\N	0
7ddcaea6-5c3b-49ac-988e-c3353d365656	t15@gmail.com	t15@gmail.com	t	t	\N	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	001204014320	1748432453338	\N	0
6c067068-4335-47af-8a01-32416137a5f6	t14@gmail.com	t14@gmail.com	t	t	\N	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	001204014319	1748432444970	\N	0
ead92f4e-abe7-4c89-8c50-40017580f6bb	t12@gmail.com	t12@gmail.com	t	t	\N	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	001204014317	1748432403307	\N	0
f2ca25e0-e2bb-4cbc-8d80-c93aa8d5d714	t13@gmail.com	t13@gmail.com	t	t	\N	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	001204014318	1748432415041	\N	0
6d9e0a86-ce11-402c-b9c5-857f6fdcc598	t21@gmail.com	t21@gmail.com	f	t	\N	\N	\N	648ca54c-3788-49f4-b9fa-de81e6fc4bbb	001204014326	1748434524742	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
9d994d40-6c2d-48eb-9078-426ee334dc60	c61b7e1f-57dc-4a83-a298-b69e5d33c044
9d994d40-6c2d-48eb-9078-426ee334dc60	c200e091-4552-40de-b721-8e4ac046d812
9d994d40-6c2d-48eb-9078-426ee334dc60	c69eabb7-a087-48a1-8510-1a7f1bef6e79
9d994d40-6c2d-48eb-9078-426ee334dc60	def6ece6-9ecf-484d-8b2d-bf9402042dda
9d994d40-6c2d-48eb-9078-426ee334dc60	86c52cf2-109a-4cfe-bdd3-839a0f1ba7a4
9d994d40-6c2d-48eb-9078-426ee334dc60	8a9f43a8-16e8-4853-b06d-af4406d3d990
9d994d40-6c2d-48eb-9078-426ee334dc60	0477c90e-88b8-4adb-ad7e-15ef2cbdfdea
9d994d40-6c2d-48eb-9078-426ee334dc60	b201b699-76df-4ca7-8e20-982c9ea08ae9
9d994d40-6c2d-48eb-9078-426ee334dc60	32a0e73e-a226-4d2b-a19f-10f9f5292858
9d994d40-6c2d-48eb-9078-426ee334dc60	e914bbd6-6db1-4762-bcae-a15daae55e68
9d994d40-6c2d-48eb-9078-426ee334dc60	f2c8a807-eb1c-40ab-9bbc-2f352f8f19b9
9d994d40-6c2d-48eb-9078-426ee334dc60	369432fb-b127-4244-b5d0-463b4a9d46c0
9d994d40-6c2d-48eb-9078-426ee334dc60	9cf11d32-6f50-4b88-a83a-da4296bf44f2
9d994d40-6c2d-48eb-9078-426ee334dc60	ead92f4e-abe7-4c89-8c50-40017580f6bb
9d994d40-6c2d-48eb-9078-426ee334dc60	f2ca25e0-e2bb-4cbc-8d80-c93aa8d5d714
9d994d40-6c2d-48eb-9078-426ee334dc60	6c067068-4335-47af-8a01-32416137a5f6
9d994d40-6c2d-48eb-9078-426ee334dc60	7ddcaea6-5c3b-49ac-988e-c3353d365656
9d994d40-6c2d-48eb-9078-426ee334dc60	0e5f7ced-91de-4496-b164-271655d3dd09
9d994d40-6c2d-48eb-9078-426ee334dc60	16398a91-879d-4763-b0f4-3f295cdc4e71
9d994d40-6c2d-48eb-9078-426ee334dc60	97c94877-8348-4d33-a17f-7baad60d16ea
9d994d40-6c2d-48eb-9078-426ee334dc60	8a9d49a7-3c21-4e14-b584-9a35b6505352
9d994d40-6c2d-48eb-9078-426ee334dc60	7faf3975-73e5-4925-b6c0-6c4191daf102
9d994d40-6c2d-48eb-9078-426ee334dc60	6d9e0a86-ce11-402c-b9c5-857f6fdcc598
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
ab18b326-0a16-4b87-a728-45cb9a72d263	c61b7e1f-57dc-4a83-a298-b69e5d33c044
ba6ac653-34a3-4b2a-ac74-8c56a9b5f66a	96e816b2-13b7-42af-8e5a-720b4bc84cc4
e8ba26c7-9cc0-4bed-87d5-428f4c6ffffa	96e816b2-13b7-42af-8e5a-720b4bc84cc4
ab18b326-0a16-4b87-a728-45cb9a72d263	c200e091-4552-40de-b721-8e4ac046d812
262ebd55-4ca4-40af-b112-c5f437a7ebeb	c200e091-4552-40de-b721-8e4ac046d812
ab18b326-0a16-4b87-a728-45cb9a72d263	c69eabb7-a087-48a1-8510-1a7f1bef6e79
ab18b326-0a16-4b87-a728-45cb9a72d263	def6ece6-9ecf-484d-8b2d-bf9402042dda
ab18b326-0a16-4b87-a728-45cb9a72d263	86c52cf2-109a-4cfe-bdd3-839a0f1ba7a4
ab18b326-0a16-4b87-a728-45cb9a72d263	8a9f43a8-16e8-4853-b06d-af4406d3d990
ab18b326-0a16-4b87-a728-45cb9a72d263	0477c90e-88b8-4adb-ad7e-15ef2cbdfdea
ab18b326-0a16-4b87-a728-45cb9a72d263	b201b699-76df-4ca7-8e20-982c9ea08ae9
ab18b326-0a16-4b87-a728-45cb9a72d263	32a0e73e-a226-4d2b-a19f-10f9f5292858
ab18b326-0a16-4b87-a728-45cb9a72d263	e914bbd6-6db1-4762-bcae-a15daae55e68
ab18b326-0a16-4b87-a728-45cb9a72d263	f2c8a807-eb1c-40ab-9bbc-2f352f8f19b9
ab18b326-0a16-4b87-a728-45cb9a72d263	369432fb-b127-4244-b5d0-463b4a9d46c0
ab18b326-0a16-4b87-a728-45cb9a72d263	9cf11d32-6f50-4b88-a83a-da4296bf44f2
ab18b326-0a16-4b87-a728-45cb9a72d263	ead92f4e-abe7-4c89-8c50-40017580f6bb
ab18b326-0a16-4b87-a728-45cb9a72d263	f2ca25e0-e2bb-4cbc-8d80-c93aa8d5d714
ab18b326-0a16-4b87-a728-45cb9a72d263	6c067068-4335-47af-8a01-32416137a5f6
ab18b326-0a16-4b87-a728-45cb9a72d263	7ddcaea6-5c3b-49ac-988e-c3353d365656
ab18b326-0a16-4b87-a728-45cb9a72d263	0e5f7ced-91de-4496-b164-271655d3dd09
ab18b326-0a16-4b87-a728-45cb9a72d263	16398a91-879d-4763-b0f4-3f295cdc4e71
ab18b326-0a16-4b87-a728-45cb9a72d263	97c94877-8348-4d33-a17f-7baad60d16ea
ab18b326-0a16-4b87-a728-45cb9a72d263	8a9d49a7-3c21-4e14-b584-9a35b6505352
ab18b326-0a16-4b87-a728-45cb9a72d263	7faf3975-73e5-4925-b6c0-6c4191daf102
ab18b326-0a16-4b87-a728-45cb9a72d263	6d9e0a86-ce11-402c-b9c5-857f6fdcc598
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.web_origins (client_id, value) FROM stdin;
1adf445c-da43-44c8-9b30-ca249e2f8209	+
b0e6e45d-48a4-4ef8-8844-ac077ec6b634	+
ffc6f6a0-6672-4968-8162-44761080f4da	http://localhost:3000/
71f25c21-915e-4015-811a-5cb3df1d0aff	http://localhost:5173
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: fed_user_attr_long_values; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX fed_user_attr_long_values ON public.fed_user_attribute USING btree (long_value_hash, name);


--
-- Name: fed_user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX fed_user_attr_long_values_lower_case ON public.fed_user_attribute USING btree (long_value_hash_lower_case, name);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, substr(value, 1, 255));


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_preload; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: user_attr_long_values; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_attr_long_values ON public.user_attribute USING btree (long_value_hash, name);


--
-- Name: user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_attr_long_values_lower_case ON public.user_attribute USING btree (long_value_hash_lower_case, name);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4 (Debian 17.4-1.pgdg120+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

--
-- Database "violation" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4 (Debian 17.4-1.pgdg120+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: violation; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE violation WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE violation OWNER TO admin;

\connect violation

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: app_user; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.app_user (
    id bigint NOT NULL,
    email character varying(255),
    identity_card character varying(255),
    keycloak_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    phone_number character varying(255) NOT NULL,
    username character varying(255)
);


ALTER TABLE public.app_user OWNER TO admin;

--
-- Name: app_user_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.app_user_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.app_user_seq OWNER TO admin;

--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_roles (
    user_id bigint NOT NULL,
    role character varying(255)
);


ALTER TABLE public.user_roles OWNER TO admin;

--
-- Name: vehicle_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.vehicle_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vehicle_seq OWNER TO admin;

--
-- Name: vehicle; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.vehicle (
    id bigint DEFAULT nextval('public.vehicle_seq'::regclass) NOT NULL,
    user_id bigint,
    license_plate character varying(255) NOT NULL,
    vehicle_type character varying(255)
);


ALTER TABLE public.vehicle OWNER TO admin;

--
-- Name: violation; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.violation (
    is_approved boolean,
    is_purchased boolean,
    id bigint NOT NULL,
    "timestamp" timestamp(6) without time zone,
    license_plate character varying(255) NOT NULL,
    violation_type character varying(255),
    CONSTRAINT violation_violation_type_check CHECK (((violation_type)::text = ANY ((ARRAY['VUOT_DEN_DO'::character varying, 'DI_SAI_LAN'::character varying, 'KHONG_DO_MU_BAO_HIEM'::character varying])::text[])))
);


ALTER TABLE public.violation OWNER TO admin;

--
-- Name: violation_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.violation_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.violation_seq OWNER TO admin;

--
-- Data for Name: app_user; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.app_user (id, email, identity_card, keycloak_id, name, phone_number, username) FROM stdin;
52	an8112004@gmail.com	001204014306	c61b7e1f-57dc-4a83-a298-b69e5d33c044	Trần Đức An	0392225886	001204014306
53	t2@gmail.com	001204014307	def6ece6-9ecf-484d-8b2d-bf9402042dda	Long 2	0392225802	001204014307
54	t3@gmail.com	001204014308	86c52cf2-109a-4cfe-bdd3-839a0f1ba7a4	Long 3	0392225803	001204014308
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_roles (user_id, role) FROM stdin;
52	offline_access
52	default-roles-violation-system
52	uma_authorization
52	user
53	offline_access
53	default-roles-violation-system
53	uma_authorization
53	user
54	offline_access
54	default-roles-violation-system
54	uma_authorization
54	user
\.


--
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.vehicle (id, user_id, license_plate, vehicle_type) FROM stdin;
901	52	29A-12345	Car
951	52	30B-67890	Motorbike
1001	53	31C-22222	Truck
1051	53	32D-33333	SUV
1101	54	33E-44444	Motorbike
1151	54	34F-55555	Car
\.


--
-- Data for Name: violation; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.violation (is_approved, is_purchased, id, "timestamp", license_plate, violation_type) FROM stdin;
f	f	1	2025-05-12 08:15:30	29A-12345	VUOT_DEN_DO
f	f	2	2025-05-12 09:45:10	30B-67890	DI_SAI_LAN
f	f	3	2025-05-12 10:22:55	31C-22222	KHONG_DO_MU_BAO_HIEM
f	f	4	2025-05-12 11:05:42	32D-33333	VUOT_DEN_DO
f	f	5	2025-05-12 14:10:33	33E-44444	DI_SAI_LAN
f	f	6	2025-05-12 16:55:12	34F-55555	KHONG_DO_MU_BAO_HIEM
\.


--
-- Name: app_user_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.app_user_seq', 101, true);


--
-- Name: vehicle_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.vehicle_seq', 1151, true);


--
-- Name: violation_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.violation_seq', 51, true);


--
-- Name: app_user app_user_identity_card_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_identity_card_key UNIQUE (identity_card);


--
-- Name: app_user app_user_keycloak_id_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_keycloak_id_key UNIQUE (keycloak_id);


--
-- Name: app_user app_user_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_pkey PRIMARY KEY (id);


--
-- Name: vehicle vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_pkey PRIMARY KEY (id);


--
-- Name: violation violation_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.violation
    ADD CONSTRAINT violation_pkey PRIMARY KEY (id);


--
-- Name: vehicle fk1rmuyse7b5h3k60p0hv5grgqr; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT fk1rmuyse7b5h3k60p0hv5grgqr FOREIGN KEY (user_id) REFERENCES public.app_user(id);


--
-- Name: user_roles fk6fql8djp64yp4q9b3qeyhr82b; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fk6fql8djp64yp4q9b3qeyhr82b FOREIGN KEY (user_id) REFERENCES public.app_user(id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

