ALTER TABLE casedword ADD CONSTRAINT pk_casedword PRIMARY KEY (wordid);
ALTER TABLE framedef ADD CONSTRAINT pk_framedef PRIMARY KEY (frameid);
ALTER TABLE frameref ADD CONSTRAINT pk_frameref PRIMARY KEY (synsetid,wordid,frameid);
ALTER TABLE legacy2021 ADD CONSTRAINT pk_legacy1 PRIMARY KEY (mapid);
ALTER TABLE legacy2030 ADD CONSTRAINT pk_legacy PRIMARY KEY (mapid);
ALTER TABLE legacy2130 ADD CONSTRAINT pk_legacy2 PRIMARY KEY (mapid);
ALTER TABLE legacysensekey2021 ADD CONSTRAINT pk_legacysensekey1 PRIMARY KEY (mapid,sensekey);
ALTER TABLE legacysensekey2030 ADD CONSTRAINT pk_legacysensekey PRIMARY KEY (mapid,sensekey);
ALTER TABLE legacysensekey2130 ADD CONSTRAINT pk_legacysensekey2 PRIMARY KEY (mapid,sensekey);
ALTER TABLE lexlinkref ADD CONSTRAINT pk_lexlinkref PRIMARY KEY (word1id,synset1id,word2id,synset2id,linkid);
ALTER TABLE morphdef ADD CONSTRAINT pk_morphdef PRIMARY KEY (morphid);
ALTER TABLE morphref ADD CONSTRAINT pk_morphref PRIMARY KEY(morphid,pos,wordid);
ALTER TABLE sample ADD CONSTRAINT pk_sample PRIMARY KEY (synsetid,sampleid);
ALTER TABLE semlinkref ADD CONSTRAINT pk_semlinkref PRIMARY KEY (synset1id,synset2id,linkid);
ALTER TABLE sense ADD CONSTRAINT pk_sense PRIMARY KEY (synsetid,wordid);
ALTER TABLE sentencedef ADD CONSTRAINT pk_sentencedef PRIMARY KEY(sentenceid);
ALTER TABLE sentenceref ADD CONSTRAINT pk_sentenceref PRIMARY KEY (synsetid,wordid,sentenceid);
ALTER TABLE synset ADD CONSTRAINT pk_synset PRIMARY KEY (synsetid);
ALTER TABLE vnclass ADD CONSTRAINT pk_vnclass PRIMARY KEY (classid);
ALTER TABLE vnexampledef ADD CONSTRAINT pk_vnexampledef PRIMARY KEY (exampleid);
ALTER TABLE vnexampleref ADD CONSTRAINT pk_vnexampleref PRIMARY KEY (frameid,exampleid);
ALTER TABLE vnframedef ADD CONSTRAINT pk_vnframedef PRIMARY KEY (frameid);
ALTER TABLE vnframeref ADD CONSTRAINT pk_vnframeref PRIMARY KEY (framerefid);
ALTER TABLE vnrole ADD CONSTRAINT pk_vnrole PRIMARY KEY (roleid);
ALTER TABLE vnroletype ADD CONSTRAINT pk_vnroletype PRIMARY KEY (roletypeid);
ALTER TABLE vnselrestr ADD CONSTRAINT pk_vnselrestr PRIMARY KEY (selrestrid);
ALTER TABLE vnselrestrs ADD CONSTRAINT pk_vnselrestrs PRIMARY KEY (selrestrsid);
ALTER TABLE word ADD CONSTRAINT pk_word PRIMARY KEY (wordid);
ALTER TABLE wordposition ADD CONSTRAINT pk_wordposition PRIMARY KEY (synsetid,wordid);
CREATE UNIQUE INDEX unq_casedword_lemma ON casedword (lemma);
CREATE UNIQUE INDEX unq_morphdef_lemma ON morphdef (lemma);
CREATE UNIQUE INDEX unq_vnclass_class ON vnclass (class);
CREATE UNIQUE INDEX unq_vnexampledef_example ON vnexampledef (example);
CREATE UNIQUE INDEX unq_vnframedef_all ON vnframedef (number,xtag,description1,description2,syntax,semantics);
CREATE UNIQUE INDEX unq_vnframeref_wordid_synsetid_frameid_classid ON vnframeref (wordid,synsetid,frameid,classid);
CREATE UNIQUE INDEX unq_vnrole_wordid_synsetid_classid_roletypeid_selrestrsid ON vnrole (wordid,synsetid,classid,roletypeid,selrestrsid);
CREATE UNIQUE INDEX unq_vnroletype_type ON vnroletype (type);
CREATE UNIQUE INDEX unq_vnselrestr_value_type ON vnselrestr (value,type);
CREATE UNIQUE INDEX unq_vnselrestrs_selrestrs ON vnselrestrs (selrestrs);
CREATE UNIQUE INDEX unq_word_lemma ON word (lemma);
CREATE UNIQUE INDEX unq_xwnparselft_synsetid_parse_lft ON xwnparselft (synsetid,parse,lft);
CREATE UNIQUE INDEX unq_xwnwsd_synsetid_wsd_text ON xwnwsd (synsetid,wsd,text);
CREATE INDEX k_legacy1_synsetid ON legacy2021 (synsetid);
CREATE INDEX k_legacy1_synsetid2 ON legacy2021 (synsetid2);
CREATE INDEX k_legacy2_synsetid ON legacy2130 (synsetid);
CREATE INDEX k_legacy2_synsetid2 ON legacy2130 (synsetid2);
CREATE INDEX k_legacy_synsetid ON legacy2030 (synsetid);
CREATE INDEX k_legacy_synsetid2 ON legacy2030 (synsetid2);
CREATE INDEX k_legacysensekey1_sensekey ON legacysensekey2021 (sensekey);
CREATE INDEX k_legacysensekey2_sensekey ON legacysensekey2130 (sensekey);
CREATE INDEX k_legacysensekey_sensekey ON legacysensekey2030 (sensekey);
CREATE INDEX k_lexlinkref_synset1id_word1id ON lexlinkref (synset1id,word1id);
CREATE INDEX k_lexlinkref_synset2id_word2id ON lexlinkref (synset2id,word2id);
CREATE INDEX k_morphref_morphid ON morphref (morphid);
CREATE INDEX k_morphref_wordid ON morphref (wordid);
CREATE INDEX k_sample_synsetid ON sample (synsetid);
CREATE INDEX k_semlinkref_synset1id ON semlinkref (synset1id);
CREATE INDEX k_semlinkref_synset2id ON semlinkref (synset2id);
CREATE INDEX k_sense_synsetid ON sense (synsetid);
CREATE INDEX k_sense_wordid ON sense (wordid);
CREATE INDEX k_vnrole_wordid_synsetid ON vnrole (wordid,synsetid);
CREATE INDEX k_wnparselft_synsetid ON xwnparselft (synsetid);
ALTER TABLE frameref ADD CONSTRAINT fk_frameref_frameid FOREIGN KEY (frameid) REFERENCES framedef(frameid);
ALTER TABLE frameref ADD CONSTRAINT fk_frameref_synsetid FOREIGN KEY (synsetid) REFERENCES synset(synsetid);
ALTER TABLE frameref ADD CONSTRAINT fk_frameref_wordid FOREIGN KEY (wordid) REFERENCES word(wordid);
ALTER TABLE legacy2030 ADD CONSTRAINT fk_legacy_synsetid FOREIGN KEY (synsetid) REFERENCES synset(synsetid);
ALTER TABLE legacy2130 ADD CONSTRAINT fk_legacy2_synsetid FOREIGN KEY (synsetid) REFERENCES synset(synsetid);
ALTER TABLE lexlinkref ADD CONSTRAINT fk_lexlinkref_linkid FOREIGN KEY (linkid) REFERENCES linkdef (linkid);
ALTER TABLE lexlinkref ADD CONSTRAINT fk_lexlinkref_synset1id FOREIGN KEY (synset1id) REFERENCES synset (synsetid);
ALTER TABLE lexlinkref ADD CONSTRAINT fk_lexlinkref_synset2id FOREIGN KEY (synset2id) REFERENCES synset (synsetid);
ALTER TABLE lexlinkref ADD CONSTRAINT fk_lexlinkref_word1id FOREIGN KEY (word1id) REFERENCES word (wordid);
ALTER TABLE lexlinkref ADD CONSTRAINT fk_lexlinkref_word2id FOREIGN KEY (word2id) REFERENCES word (wordid);
ALTER TABLE morphref ADD CONSTRAINT fk_morphref_morphid FOREIGN KEY (morphid) REFERENCES morphdef(morphid);
ALTER TABLE morphref ADD CONSTRAINT fk_morphref_wordid FOREIGN KEY (wordid) REFERENCES word(wordid);
ALTER TABLE sample ADD CONSTRAINT fk_sample_synsetid FOREIGN KEY (synsetid) REFERENCES synset(synsetid);
ALTER TABLE semlinkref ADD CONSTRAINT fk_semlinkref_linkid FOREIGN KEY (linkid) REFERENCES linkdef (linkid);
ALTER TABLE semlinkref ADD CONSTRAINT fk_semlinkref_synset1id FOREIGN KEY (synset1id) REFERENCES synset (synsetid);
ALTER TABLE semlinkref ADD CONSTRAINT fk_semlinkref_synset2id FOREIGN KEY (synset2id) REFERENCES synset (synsetid);
ALTER TABLE sense ADD CONSTRAINT fk_sense_synsetid FOREIGN KEY (synsetid) REFERENCES synset(synsetid);
ALTER TABLE sense ADD CONSTRAINT fk_sense_wordid FOREIGN KEY (wordid) REFERENCES word(wordid);
ALTER TABLE sentenceref ADD CONSTRAINT fk_sentenceref_sentenceid FOREIGN KEY (sentenceid) REFERENCES sentencedef(sentenceid);
ALTER TABLE sentenceref ADD CONSTRAINT fk_sentenceref_synsetid FOREIGN KEY (synsetid) REFERENCES synset(synsetid);
ALTER TABLE sentenceref ADD CONSTRAINT fk_sentenceref_wordid FOREIGN KEY (wordid) REFERENCES word(wordid);
ALTER TABLE synset ADD CONSTRAINT fk_synset_categoryid FOREIGN KEY (categoryid) REFERENCES categorydef (categoryid);
ALTER TABLE vnexampleref ADD CONSTRAINT fk_vnexampleref_exampleid FOREIGN KEY (exampleid) REFERENCES vnexampledef(exampleid);
ALTER TABLE vnexampleref ADD CONSTRAINT fk_vnexampleref_frameid FOREIGN KEY (frameid) REFERENCES vnframedef(frameid);
ALTER TABLE vnframeref ADD CONSTRAINT fk_vnframeref_classid FOREIGN KEY (classid) REFERENCES vnclass(classid);
ALTER TABLE vnframeref ADD CONSTRAINT fk_vnframeref_frameid FOREIGN KEY (frameid) REFERENCES vnframedef(frameid);
ALTER TABLE vnframeref ADD CONSTRAINT fk_vnframeref_wordid FOREIGN KEY (wordid) REFERENCES word(wordid);
ALTER TABLE vnrole ADD CONSTRAINT fk_vnrole_classid FOREIGN KEY (classid) REFERENCES vnclass(classid);
ALTER TABLE vnrole ADD CONSTRAINT fk_vnrole_roletypeid FOREIGN KEY (roletypeid) REFERENCES vnroletype(roletypeid);
ALTER TABLE vnrole ADD CONSTRAINT fk_vnrole_wordid FOREIGN KEY (wordid) REFERENCES word(wordid);
ALTER TABLE wordposition ADD CONSTRAINT fk_wordposition_synsetid FOREIGN KEY (synsetid) REFERENCES synset (synsetid);
ALTER TABLE wordposition ADD CONSTRAINT fk_wordposition_wordid FOREIGN KEY (wordid) REFERENCES word (wordid);
ALTER TABLE xwnparselft ADD CONSTRAINT fk_xwnparselft_synsetid FOREIGN KEY (synsetid) REFERENCES synset(synsetid);
ALTER TABLE xwnwsd ADD CONSTRAINT fk_xwnwsd_synsetid FOREIGN KEY (synsetid) REFERENCES synset(synsetid);
