-- AMENITIES

-- ------------------------------------
-- ------------------------------------
--  Nearer My God, To Thee
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_NEARER_MY_GOD', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_NEARER_MY_GOD', 'LOC_SDG_NEARER_MY_GOD', 'LOC_SDG_NEARER_MY_GOD_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_NEARER_MY_GOD', 'SDG_NEARER_MY_GOD_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_NEARER_MY_GOD_YIELD', 'DB_DM_CITIES_ADJUST_AMENITIES_FROM_RELIGION', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_NEARER_MY_GOD_YIELD', 'Amount', 1) ;

-- ------------------------------------
-- ------------------------------------
--  BE_STILL_MY_SOUL
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_BE_STILL_MY_SOUL', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_BE_STILL_MY_SOUL', 'LOC_SDG_BE_STILL_MY_SOUL', 'LOC_SDG_BE_STILL_MY_SOUL_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_BE_STILL_MY_SOUL', 'SDG_BE_STILL_MY_SOUL_YIELD_' || x FROM counter ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_BE_STILL_MY_SOUL_YIELD_' || x, 'DB_DM_CITIES_ADJUST_AMENITIES_FROM_RELIGION', 'DB_REQSET_CITY_HAS_' || x || '_POPULATION_AND_FOLLOWS_RELIGION' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_BE_STILL_MY_SOUL_YIELD_' || x, 'Amount', 1 FROM counter ;
  

-- ------------------------------------
-- ------------------------------------
--  ODE_TO_JOY
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ODE_TO_JOY', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_ODE_TO_JOY', 'LOC_SDG_ODE_TO_JOY', 'LOC_SDG_ODE_TO_JOY_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_ODE_TO_JOY', 'SDG_ODE_TO_JOY_YIELD_' || x FROM counter ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_ODE_TO_JOY_YIELD_' || x, 'DB_DM_CITIES_ADJUST_AMENITIES_FROM_RELIGION', 'DB_REQSET_CITY_HAS_' || x || '_DISTRICTS_AND_FOLLOWS_RELIGION' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_ODE_TO_JOY_YIELD_' || x, 'Amount', 1 FROM counter ;

-- ------------------------------------
-- ------------------------------------
--  HALLELUJAH_CHORUS
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_HALLELUJAH_CHORUS', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_HALLELUJAH_CHORUS', 'LOC_SDG_HALLELUJAH_CHORUS', 'LOC_SDG_HALLELUJAH_CHORUS_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_HALLELUJAH_CHORUS', 'SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_ENTERTAINMENT_COMPLEX_FAITH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_ENTERTAINMENT_COMPLEX_FAITH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_ENTERTAINMENT_COMPLEX_FAITH_MODIFIER', 'ModifierId', 'SDG_HALLELUJAH_CHORUS_ENTERTAINMENT_COMPLEX_FAITH') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HALLELUJAH_CHORUS_ENTERTAINMENT_COMPLEX_FAITH', 'DB_DM_ADJUST_DISTRICT_YIELD', 'DB_REQSET_IS_ENTERTAINMENT_COMPLEX') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_HALLELUJAH_CHORUS_ENTERTAINMENT_COMPLEX_FAITH', 'YieldType', 'YIELD_FAITH'),
                              ('SDG_HALLELUJAH_CHORUS_ENTERTAINMENT_COMPLEX_FAITH', 'Amount', 1) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_HALLELUJAH_CHORUS', 'SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_ENTERTAINMENT_COMPLEX_FAITH_ADJACENCY_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_ENTERTAINMENT_COMPLEX_FAITH_ADJACENCY_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_ENTERTAINMENT_COMPLEX_FAITH_ADJACENCY_MODIFIER', 'ModifierId', 'SDG_HALLELUJAH_CHORUS_ENTERTAINMENT_COMPLEX_FAITH_ADJACENCY') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HALLELUJAH_CHORUS_ENTERTAINMENT_COMPLEX_FAITH_ADJACENCY', 'DB_DM_ADJUST_DISTRICT_YIELD', 'DB_REQSET_IS_ENTERTAINMENT_COMPLEX_NEXT_TO_HOLY_SITE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_HALLELUJAH_CHORUS_ENTERTAINMENT_COMPLEX_FAITH_ADJACENCY', 'Amount', 1),
							  ('SDG_HALLELUJAH_CHORUS_ENTERTAINMENT_COMPLEX_FAITH_ADJACENCY', 'YieldType', 'YIELD_FAITH') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_HALLELUJAH_CHORUS', 'SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_WATER_ENTERTAINMENT_COMPLEX_FAITH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_WATER_ENTERTAINMENT_COMPLEX_FAITH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_WATER_ENTERTAINMENT_COMPLEX_FAITH_MODIFIER', 'ModifierId', 'SDG_HALLELUJAH_CHORUS_WATER_ENTERTAINMENT_COMPLEX_FAITH') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HALLELUJAH_CHORUS_WATER_ENTERTAINMENT_COMPLEX_FAITH', 'DB_DM_ADJUST_DISTRICT_YIELD', 'DB_REQSET_IS_WATER_ENTERTAINMENT_COMPLEX') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_HALLELUJAH_CHORUS_WATER_ENTERTAINMENT_COMPLEX_FAITH', 'YieldType', 'YIELD_FAITH'),
                              ('SDG_HALLELUJAH_CHORUS_WATER_ENTERTAINMENT_COMPLEX_FAITH', 'Amount', 1) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_HALLELUJAH_CHORUS', 'SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_WATER_ENTERTAINMENT_COMPLEX_FAITH_ADJACENCY_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_WATER_ENTERTAINMENT_COMPLEX_FAITH_ADJACENCY_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_WATER_ENTERTAINMENT_COMPLEX_FAITH_ADJACENCY_MODIFIER', 'ModifierId', 'SDG_HALLELUJAH_CHORUS_WATER_ENTERTAINMENT_COMPLEX_FAITH_ADJACENCY') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HALLELUJAH_CHORUS_WATER_ENTERTAINMENT_COMPLEX_FAITH_ADJACENCY', 'DB_DM_ADJUST_DISTRICT_YIELD', 'DB_REQSET_IS_WATER_ENTERTAINMENT_COMPLEX_NEXT_TO_HOLY_SITE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_HALLELUJAH_CHORUS_WATER_ENTERTAINMENT_COMPLEX_FAITH_ADJACENCY', 'Amount', 1),
							  ('SDG_HALLELUJAH_CHORUS_WATER_ENTERTAINMENT_COMPLEX_FAITH_ADJACENCY', 'YieldType', 'YIELD_FAITH') ;


INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_HALLELUJAH_CHORUS', 'SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_HOLY_SITE_AMENITY_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_HOLY_SITE_AMENITY_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_HOLY_SITE_AMENITY_MODIFIER', 'ModifierId', 'SDG_HALLELUJAH_CHORUS_HOLY_SITE_AMENITY') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HALLELUJAH_CHORUS_HOLY_SITE_AMENITY', 'DB_DM_ADJUST_DISTRICT_AMENITIES', 'DB_REQSET_IS_HOLY_SITE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_HALLELUJAH_CHORUS_HOLY_SITE_AMENITY', 'Amount', 1) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_HALLELUJAH_CHORUS', 'SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_HOLY_SITE_AMENITY_ADJACENCY_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_HOLY_SITE_AMENITY_ADJACENCY_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_HOLY_SITE_AMENITY_ADJACENCY_MODIFIER', 'ModifierId', 'SDG_HALLELUJAH_CHORUS_HOLY_SITE_AMENITY_ADJACENCY') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HALLELUJAH_CHORUS_HOLY_SITE_AMENITY_ADJACENCY', 'DB_DM_ADJUST_DISTRICT_AMENITIES', 'DB_REQSET_IS_HOLY_SITE_NEXT_TO_ENTERTAINMENT_COMPLEX') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_HALLELUJAH_CHORUS_HOLY_SITE_AMENITY_ADJACENCY', 'Amount', 1) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_HALLELUJAH_CHORUS', 'SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_HOLY_SITE_AMENITY_ADJACENCY2_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_HOLY_SITE_AMENITY_ADJACENCY2_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_HOLY_SITE_AMENITY_ADJACENCY2_MODIFIER', 'ModifierId', 'SDG_HALLELUJAH_CHORUS_HOLY_SITE_AMENITY2_ADJACENCY') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HALLELUJAH_CHORUS_HOLY_SITE_AMENITY2_ADJACENCY', 'DB_DM_ADJUST_DISTRICT_AMENITIES', 'DB_REQSET_IS_HOLY_SITE_NEXT_TO_WATER_ENTERTAINMENT_COMPLEX') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_HALLELUJAH_CHORUS_HOLY_SITE_AMENITY2_ADJACENCY', 'Amount', 1) ;

/*
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_HALLELUJAH_CHORUS', 'SDG_HALLELUJAH_CHORUS_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HALLELUJAH_CHORUS_YIELD', 'DB_DM_CITIES_ADJUST_AMENITIES_FROM_RELIGION', 'DB_REQSET_CITY_HAS_HOLY_SITE_AND_FOLLOWS_RELIGION') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_HALLELUJAH_CHORUS_YIELD', 'Amount', 1) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_HALLELUJAH_CHORUS', 'SDG_HALLELUJAH_CHORUS_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HALLELUJAH_CHORUS_YIELD', 'DB_DM_CITIES_ADJUST_AMENITIES_FROM_RELIGION', 'DB_REQSET_CITY_HAS_HOLY_SITE_AND_FOLLOWS_RELIGION') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_HALLELUJAH_CHORUS_YIELD', 'Amount', 1) ;



INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_HALLELUJAH_CHORUS', 'SDG_HALLELUJAH_CHORUS_CITY_ADDS_YIELD_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HALLELUJAH_CHORUS_CITY_ADDS_YIELD_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_HALLELUJAH_CHORUS_CITY_ADDS_YIELD_MODIFIER', 'ModifierId', 'SDG_HALLELUJAH_CHORUS_YIELD2') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HALLELUJAH_CHORUS_YIELD2', 'DB_DM_ADJUST_DISTRICT_YIELD', 'DISTRICT_IS_HOLY_SITE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_HALLELUJAH_CHORUS_YIELD2', 'YieldType', 'YIELD_FAITH'),
                              ('SDG_HALLELUJAH_CHORUS_YIELD2', 'Amount', 1) ;

*/
