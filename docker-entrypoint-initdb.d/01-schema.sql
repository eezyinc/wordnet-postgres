--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: casedword; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE casedword (
    wordid numeric(6,0) DEFAULT 0::numeric NOT NULL,
    lemma character varying(80) DEFAULT ''::character varying NOT NULL
);


--
-- Name: categorydef; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categorydef (
    categoryid numeric(2,0) DEFAULT 0::numeric NOT NULL,
    name character varying(32),
    pos character(1)
);


--
-- Name: framedef; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE framedef (
    frameid numeric(2,0) DEFAULT 0::numeric NOT NULL,
    frame character varying(50)
);


--
-- Name: frameref; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE frameref (
    synsetid numeric(9,0) DEFAULT 0::numeric NOT NULL,
    wordid numeric(6,0) NOT NULL,
    frameid numeric(2,0) DEFAULT 0::numeric NOT NULL
);


--
-- Name: legacy2021; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE legacy2021 (
    mapid numeric(6,0) NOT NULL,
    synsetid numeric(9,0) NOT NULL,
    synsetid2 numeric(9,0) NOT NULL,
    score numeric(3,0)
);


--
-- Name: legacy2030; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE legacy2030 (
    mapid numeric(6,0) NOT NULL,
    synsetid numeric(9,0) NOT NULL,
    synsetid2 numeric(9,0) NOT NULL,
    score numeric(3,0)
);


--
-- Name: legacy2130; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE legacy2130 (
    mapid numeric(6,0) NOT NULL,
    synsetid numeric(9,0) NOT NULL,
    synsetid2 numeric(9,0) NOT NULL,
    score numeric(3,0)
);


--
-- Name: legacysensekey2021; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE legacysensekey2021 (
    mapid numeric(6,0) NOT NULL,
    sensekey character varying(100) DEFAULT ''::character varying NOT NULL
);


--
-- Name: legacysensekey2030; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE legacysensekey2030 (
    mapid numeric(6,0) NOT NULL,
    sensekey character varying(100) DEFAULT ''::character varying NOT NULL
);


--
-- Name: legacysensekey2130; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE legacysensekey2130 (
    mapid numeric(6,0) NOT NULL,
    sensekey character varying(100) DEFAULT ''::character varying NOT NULL
);


--
-- Name: lexlinkref; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE lexlinkref (
    synset1id numeric(9,0) DEFAULT 0::numeric NOT NULL,
    word1id numeric(6,0) DEFAULT 0::numeric NOT NULL,
    synset2id numeric(9,0) DEFAULT 0::numeric NOT NULL,
    word2id numeric(6,0) DEFAULT 0::numeric NOT NULL,
    linkid numeric(2,0) DEFAULT 0::numeric NOT NULL
);


--
-- Name: linkdef; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE linkdef (
    linkid numeric(2,0) DEFAULT 0::numeric NOT NULL,
    name character varying(50),
    recurses character(1) DEFAULT 'N'::bpchar NOT NULL
);


--
-- Name: morphdef; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE morphdef (
    morphid numeric(6,0) DEFAULT 0::numeric NOT NULL,
    lemma character varying(70) DEFAULT ''::character varying NOT NULL
);


--
-- Name: morphref; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE morphref (
    wordid numeric(6,0) DEFAULT 0::numeric NOT NULL,
    pos character(1) NOT NULL,
    morphid numeric(6,0) DEFAULT 0::numeric NOT NULL
);


--
-- Name: sample; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sample (
    synsetid numeric(9,0) DEFAULT 0::numeric NOT NULL,
    sampleid numeric(2,0) DEFAULT 0::numeric NOT NULL,
    sample text NOT NULL
);


--
-- Name: semlinkref; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE semlinkref (
    synset1id numeric(9,0) DEFAULT 0::numeric NOT NULL,
    synset2id numeric(9,0) DEFAULT 0::numeric NOT NULL,
    linkid numeric(2,0) DEFAULT 0::numeric NOT NULL
);


--
-- Name: sense; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sense (
    wordid numeric(6,0) DEFAULT 0::numeric NOT NULL,
    casedwordid numeric(6,0),
    synsetid numeric(9,0) DEFAULT 0::numeric NOT NULL,
    rank numeric(2,0) DEFAULT 0::numeric NOT NULL,
    lexid numeric(2,0) DEFAULT 0::numeric NOT NULL,
    tagcount numeric(5,0)
);


--
-- Name: sentencedef; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sentencedef (
    sentenceid numeric(3,0) DEFAULT 0::numeric NOT NULL,
    sentence text
);


--
-- Name: sentenceref; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sentenceref (
    synsetid numeric(9,0) DEFAULT 0::numeric NOT NULL,
    wordid numeric(6,0) DEFAULT 0::numeric NOT NULL,
    sentenceid numeric(3,0) DEFAULT 0::numeric NOT NULL
);


--
-- Name: synset; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE synset (
    synsetid numeric(9,0) DEFAULT 0::numeric NOT NULL,
    pos character(1),
    categoryid numeric(2,0) DEFAULT 0::numeric NOT NULL,
    definition text
);


--
-- Name: vnclass; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE vnclass (
    classid numeric(3,0) NOT NULL,
    "class" character varying(64) NOT NULL
);


--
-- Name: vnexampledef; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE vnexampledef (
    exampleid numeric(4,0) NOT NULL,
    example character varying(128) NOT NULL
);


--
-- Name: vnexampleref; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE vnexampleref (
    frameid numeric(5,0) NOT NULL,
    exampleid numeric(4,0) NOT NULL
);


--
-- Name: vnframedef; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE vnframedef (
    frameid numeric(5,0) NOT NULL,
    number character varying(16) NOT NULL,
    xtag character varying(16) NOT NULL,
    description1 character varying(64) NOT NULL,
    description2 character varying(64),
    syntax text NOT NULL,
    semantics text NOT NULL
);


--
-- Name: vnframeref; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE vnframeref (
    framerefid numeric(5,0) NOT NULL,
    wordid numeric(6,0) NOT NULL,
    synsetid numeric(9,0),
    frameid numeric(5,0) NOT NULL,
    classid numeric(3,0) NOT NULL,
    quality integer
);


--
-- Name: vnrole; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE vnrole (
    roleid numeric(6,0) NOT NULL,
    wordid numeric(6,0) NOT NULL,
    synsetid numeric(9,0),
    classid numeric(3,0) NOT NULL,
    rolesetid numeric(4,0) NOT NULL,
    roletypeid numeric(4,0) NOT NULL,
    selrestrsid numeric(2,0) NOT NULL,
    quality integer
);


--
-- Name: vnroletype; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE vnroletype (
    roletypeid numeric(3,0) NOT NULL,
    "type" character varying(32) NOT NULL
);


--
-- Name: vnselrestr; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE vnselrestr (
    selrestrid numeric(5,0) NOT NULL,
    value character varying(32) NOT NULL,
    "type" character varying(32) NOT NULL
);


--
-- Name: vnselrestrs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE vnselrestrs (
    selrestrsid numeric(2,0) NOT NULL,
    selrestrs text NOT NULL
);


--
-- Name: word; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE word (
    wordid numeric(6,0) DEFAULT 0::numeric NOT NULL,
    lemma character varying(80) DEFAULT ''::character varying NOT NULL
);


--
-- Name: wordposition; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wordposition (
    synsetid numeric(9,0) DEFAULT 0::numeric NOT NULL,
    wordid numeric(6,0) DEFAULT 0::numeric NOT NULL,
    positionid character(2) DEFAULT 'a'::bpchar NOT NULL
);


--
-- Name: xwnparselft; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE xwnparselft (
    synsetid numeric(9,0) NOT NULL,
    parse text NOT NULL,
    lft text NOT NULL,
    parsequality integer,
    lftquality integer
);


--
-- Name: xwnwsd; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE xwnwsd (
    synsetid numeric(9,0) NOT NULL,
    wsd text NOT NULL,
    text text
);


--
-- Name: pk_casedword; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY casedword
    ADD CONSTRAINT pk_casedword PRIMARY KEY (wordid);


--
-- Name: pk_category; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categorydef
    ADD CONSTRAINT pk_category PRIMARY KEY (categoryid);


--
-- Name: pk_framedef; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY framedef
    ADD CONSTRAINT pk_framedef PRIMARY KEY (frameid);


--
-- Name: pk_frameref; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY frameref
    ADD CONSTRAINT pk_frameref PRIMARY KEY (synsetid, wordid, frameid);


--
-- Name: pk_legacy; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY legacy2030
    ADD CONSTRAINT pk_legacy PRIMARY KEY (mapid);


--
-- Name: pk_legacy1; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY legacy2021
    ADD CONSTRAINT pk_legacy1 PRIMARY KEY (mapid);


--
-- Name: pk_legacy2; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY legacy2130
    ADD CONSTRAINT pk_legacy2 PRIMARY KEY (mapid);


--
-- Name: pk_legacysensekey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY legacysensekey2030
    ADD CONSTRAINT pk_legacysensekey PRIMARY KEY (mapid, sensekey);


--
-- Name: pk_legacysensekey1; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY legacysensekey2021
    ADD CONSTRAINT pk_legacysensekey1 PRIMARY KEY (mapid, sensekey);


--
-- Name: pk_legacysensekey2; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY legacysensekey2130
    ADD CONSTRAINT pk_legacysensekey2 PRIMARY KEY (mapid, sensekey);


--
-- Name: pk_lexlinkref; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY lexlinkref
    ADD CONSTRAINT pk_lexlinkref PRIMARY KEY (word1id, synset1id, word2id, synset2id, linkid);


--
-- Name: pk_linkdef; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY linkdef
    ADD CONSTRAINT pk_linkdef PRIMARY KEY (linkid);


--
-- Name: pk_morphdef; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY morphdef
    ADD CONSTRAINT pk_morphdef PRIMARY KEY (morphid);


--
-- Name: pk_morphref; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY morphref
    ADD CONSTRAINT pk_morphref PRIMARY KEY (morphid, pos, wordid);


--
-- Name: pk_sample; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sample
    ADD CONSTRAINT pk_sample PRIMARY KEY (synsetid, sampleid);


--
-- Name: pk_semlinkref; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY semlinkref
    ADD CONSTRAINT pk_semlinkref PRIMARY KEY (synset1id, synset2id, linkid);


--
-- Name: pk_sense; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sense
    ADD CONSTRAINT pk_sense PRIMARY KEY (synsetid, wordid);


--
-- Name: pk_sentencedef; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sentencedef
    ADD CONSTRAINT pk_sentencedef PRIMARY KEY (sentenceid);


--
-- Name: pk_sentenceref; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sentenceref
    ADD CONSTRAINT pk_sentenceref PRIMARY KEY (synsetid, wordid, sentenceid);


--
-- Name: pk_synset; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY synset
    ADD CONSTRAINT pk_synset PRIMARY KEY (synsetid);


--
-- Name: pk_vnclass; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY vnclass
    ADD CONSTRAINT pk_vnclass PRIMARY KEY (classid);


--
-- Name: pk_vnexampledef; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY vnexampledef
    ADD CONSTRAINT pk_vnexampledef PRIMARY KEY (exampleid);


--
-- Name: pk_vnexampleref; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY vnexampleref
    ADD CONSTRAINT pk_vnexampleref PRIMARY KEY (frameid, exampleid);


--
-- Name: pk_vnframedef; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY vnframedef
    ADD CONSTRAINT pk_vnframedef PRIMARY KEY (frameid);


--
-- Name: pk_vnframeref; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY vnframeref
    ADD CONSTRAINT pk_vnframeref PRIMARY KEY (framerefid);


--
-- Name: pk_vnrole; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY vnrole
    ADD CONSTRAINT pk_vnrole PRIMARY KEY (roleid);


--
-- Name: pk_vnroletype; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY vnroletype
    ADD CONSTRAINT pk_vnroletype PRIMARY KEY (roletypeid);


--
-- Name: pk_vnselrestr; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY vnselrestr
    ADD CONSTRAINT pk_vnselrestr PRIMARY KEY (selrestrid);


--
-- Name: pk_vnselrestrs; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY vnselrestrs
    ADD CONSTRAINT pk_vnselrestrs PRIMARY KEY (selrestrsid);


--
-- Name: pk_word; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY word
    ADD CONSTRAINT pk_word PRIMARY KEY (wordid);


--
-- Name: pk_wordposition; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wordposition
    ADD CONSTRAINT pk_wordposition PRIMARY KEY (synsetid, wordid);


--
-- Name: k_legacy1_synsetid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX k_legacy1_synsetid ON legacy2021 USING btree (synsetid);


--
-- Name: k_legacy1_synsetid2; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX k_legacy1_synsetid2 ON legacy2021 USING btree (synsetid2);


--
-- Name: k_legacy2_synsetid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX k_legacy2_synsetid ON legacy2130 USING btree (synsetid);


--
-- Name: k_legacy2_synsetid2; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX k_legacy2_synsetid2 ON legacy2130 USING btree (synsetid2);


--
-- Name: k_legacy_synsetid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX k_legacy_synsetid ON legacy2030 USING btree (synsetid);


--
-- Name: k_legacy_synsetid2; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX k_legacy_synsetid2 ON legacy2030 USING btree (synsetid2);


--
-- Name: k_legacysensekey1_sensekey; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX k_legacysensekey1_sensekey ON legacysensekey2021 USING btree (sensekey);


--
-- Name: k_legacysensekey2_sensekey; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX k_legacysensekey2_sensekey ON legacysensekey2130 USING btree (sensekey);


--
-- Name: k_legacysensekey_sensekey; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX k_legacysensekey_sensekey ON legacysensekey2030 USING btree (sensekey);


--
-- Name: k_lexlinkref_synset1id_word1id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX k_lexlinkref_synset1id_word1id ON lexlinkref USING btree (synset1id, word1id);


--
-- Name: k_lexlinkref_synset2id_word2id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX k_lexlinkref_synset2id_word2id ON lexlinkref USING btree (synset2id, word2id);


--
-- Name: k_morphref_morphid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX k_morphref_morphid ON morphref USING btree (morphid);


--
-- Name: k_morphref_wordid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX k_morphref_wordid ON morphref USING btree (wordid);


--
-- Name: k_sample_synsetid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX k_sample_synsetid ON sample USING btree (synsetid);


--
-- Name: k_semlinkref_synset1id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX k_semlinkref_synset1id ON semlinkref USING btree (synset1id);


--
-- Name: k_semlinkref_synset2id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX k_semlinkref_synset2id ON semlinkref USING btree (synset2id);


--
-- Name: k_sense_synsetid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX k_sense_synsetid ON sense USING btree (synsetid);


--
-- Name: k_sense_wordid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX k_sense_wordid ON sense USING btree (wordid);


--
-- Name: k_vnrole_wordid_synsetid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX k_vnrole_wordid_synsetid ON vnrole USING btree (wordid, synsetid);


--
-- Name: k_wnparselft_synsetid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX k_wnparselft_synsetid ON xwnparselft USING btree (synsetid);


--
-- Name: unq_casedword_lemma; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unq_casedword_lemma ON casedword USING btree (lemma);


--
-- Name: unq_morphdef_lemma; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unq_morphdef_lemma ON morphdef USING btree (lemma);


--
-- Name: unq_vnclass_class; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unq_vnclass_class ON vnclass USING btree ("class");


--
-- Name: unq_vnexampledef_example; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unq_vnexampledef_example ON vnexampledef USING btree (example);


--
-- Name: unq_vnframedef_all; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unq_vnframedef_all ON vnframedef USING btree (number, xtag, description1, description2, syntax, semantics);


--
-- Name: unq_vnframeref_wordid_synsetid_frameid_classid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unq_vnframeref_wordid_synsetid_frameid_classid ON vnframeref USING btree (wordid, synsetid, frameid, classid);


--
-- Name: unq_vnrole_wordid_synsetid_classid_roletypeid_selrestrsid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unq_vnrole_wordid_synsetid_classid_roletypeid_selrestrsid ON vnrole USING btree (wordid, synsetid, classid, roletypeid, selrestrsid);


--
-- Name: unq_vnroletype_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unq_vnroletype_type ON vnroletype USING btree ("type");


--
-- Name: unq_vnselrestr_value_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unq_vnselrestr_value_type ON vnselrestr USING btree (value, "type");


--
-- Name: unq_vnselrestrs_selrestrs; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unq_vnselrestrs_selrestrs ON vnselrestrs USING btree (selrestrs);


--
-- Name: unq_word_lemma; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unq_word_lemma ON word USING btree (lemma);


--
-- Name: unq_xwnparselft_synsetid_parse_lft; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unq_xwnparselft_synsetid_parse_lft ON xwnparselft USING btree (synsetid, parse, lft);


--
-- Name: unq_xwnwsd_synsetid_wsd_text; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unq_xwnwsd_synsetid_wsd_text ON xwnwsd USING btree (synsetid, wsd, text);


--
-- PostgreSQL database dump complete
--

