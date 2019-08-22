-- CULTURE

-- BORDERS

-- ------------------------------------
-- ------------------------------------
--  Wilderness Preachers
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_WILDERNESS_PREACHERS', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_WILDERNESS_PREACHERS', 'LOC_SDG_WILDERNESS_PREACHERS', 'LOC_SDG_WILDERNESS_PREACHERS_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_WILDERNESS_PREACHERS', 'SDG_WILDERNESS_PREACHERS_CULTUREBORDER') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_WILDERNESS_PREACHERS_CULTUREBORDER', 'MODIFIER_ALL_CITIES_CULTURE_BORDER_EXPANSION', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_WILDERNESS_PREACHERS_CULTUREBORDER', 'Amount', 100) ;


-- ------------------------------------
-- ------------------------------------
--  Itinerant Ministers
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ITINERANT_MINISTERS', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_ITINERANT_MINISTERS', 'LOC_SDG_ITINERANT_MINISTERS', 'LOC_SDG_ITINERANT_MINISTERS_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ITINERANT_MINISTERS', 'SDG_ITINERANT_MINISTERS_CULTUREBORDER') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ITINERANT_MINISTERS_CULTUREBORDER', 'MODIFIER_ALL_CITIES_CULTURE_BORDER_EXPANSION', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ITINERANT_MINISTERS_CULTUREBORDER', 'Amount', 100) ;


-- ------------------------------------
-- ------------------------------------
--  Desert Anchorites
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_DESERT_ANCHORITES', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_DESERT_ANCHORITES', 'LOC_SDG_DESERT_ANCHORITES', 'LOC_SDG_DESERT_ANCHORITES_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_DESERT_ANCHORITES', 'SDG_DESERT_ANCHORITES_CULTUREBORDER') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_DESERT_ANCHORITES_CULTUREBORDER', 'MODIFIER_ALL_CITIES_CULTURE_BORDER_EXPANSION', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_DESERT_ANCHORITES_CULTUREBORDER', 'Amount', 100) ;


-- ------------------------------------
-- ------------------------------------
--  Circuit Riders
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_CIRCUIT_RIDERS', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_CIRCUIT_RIDERS', 'LOC_SDG_CIRCUIT_RIDERS', 'LOC_SDG_CIRCUIT_RIDERS_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_CIRCUIT_RIDERS', 'SDG_CIRCUIT_RIDERS_CULTUREBORDER') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_CIRCUIT_RIDERS_CULTUREBORDER', 'MODIFIER_ALL_CITIES_CULTURE_BORDER_EXPANSION', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_CIRCUIT_RIDERS_CULTUREBORDER', 'Amount', 100) ;


-- CULTURE


-- ------------------------------------
-- ------------------------------------
--  PSALMS
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_PSALMS', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_PSALMS', 'LOC_SDG_PSALMS', 'LOC_SDG_PSALMS_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_PSALMS', 'SDG_PSALMS_BASE_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                            ('SDG_PSALMS_BASE_YIELD', 'DB_DM_CITIES_ADJUST_YIELD', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_PSALMS_BASE_YIELD', 'YieldType', 'YIELD_CULTURE'),
                              ('SDG_PSALMS_BASE_YIELD', 'Amount', 2) ;


-- ------------------------------------
-- ------------------------------------
--  GREGORIAN_CHANTS
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_GREGORIAN_CHANTS', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_GREGORIAN_CHANTS', 'LOC_SDG_GREGORIAN_CHANTS', 'LOC_SDG_GREGORIAN_CHANTS_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_GREGORIAN_CHANTS', 'SDG_GREGORIAN_CHANTS_BASE_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                            ('SDG_GREGORIAN_CHANTS_BASE_YIELD', 'DB_DM_CITIES_ADJUST_YIELD', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_GREGORIAN_CHANTS_BASE_YIELD', 'YieldType', 'YIELD_CULTURE'),
                              ('SDG_GREGORIAN_CHANTS_BASE_YIELD', 'Amount', 1) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_GREGORIAN_CHANTS', 'SDG_GREGORIAN_CHANTS_POP_YIELD_' || x FROM counter ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_GREGORIAN_CHANTS_POP_YIELD_' || x, 'DB_DM_CITIES_ADJUST_YIELD', 'DB_REQSET_CITY_HAS_' || x || '_POPULATION_AND_FOLLOWS_RELIGION' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_GREGORIAN_CHANTS_POP_YIELD_' || x, 'YieldType', 'YIELD_CULTURE' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_GREGORIAN_CHANTS_POP_YIELD_' || x, 'Amount', 1 FROM counter ;


-- ------------------------------------
-- ------------------------------------
--  HYMNS
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_HYMNS', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_HYMNS', 'LOC_SDG_HYMNS', 'LOC_SDG_HYMNS_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_HYMNS', 'SDG_HYMNS_BASE_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                            ('SDG_HYMNS_BASE_YIELD', 'DB_DM_CITIES_ADJUST_YIELD', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_HYMNS_BASE_YIELD', 'YieldType', 'YIELD_CULTURE'),
                              ('SDG_HYMNS_BASE_YIELD', 'Amount', 1) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_HYMNS', 'SDG_HYMNS_DISTRICT_YIELD_' || x FROM counter ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_HYMNS_DISTRICT_YIELD_' || x, 'DB_DM_CITIES_ADJUST_YIELD', 'DB_REQSET_CITY_HAS_' || x || '_DISTRICTS_AND_FOLLOWS_RELIGION' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_HYMNS_DISTRICT_YIELD_' || x, 'YieldType', 'YIELD_CULTURE' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_HYMNS_DISTRICT_YIELD_' || x, 'Amount', 1 FROM counter ;


-- ------------------------------------
-- ------------------------------------
--  ORATORIOS
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ORATORIOS', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_ORATORIOS', 'LOC_SDG_ORATORIOS', 'LOC_SDG_ORATORIOS_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ORATORIOS', 'SDG_ORATORIOS_CITY_YIELD_PERCENT') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ORATORIOS_CITY_YIELD_PERCENT', 'DB_DM_CITIES_ADJUST_YIELD_PERCENT', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
                              ('SDG_ORATORIOS_CITY_YIELD_PERCENT', 'Amount', 12),
							  ('SDG_ORATORIOS_CITY_YIELD_PERCENT', 'YieldType', 'YIELD_CULTURE') ;


-- ------------------------------------
-- ------------------------------------
--  REQUIEM_MASSES
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_REQUIEM_MASSES', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_REQUIEM_MASSES', 'LOC_SDG_REQUIEM_MASSES', 'LOC_SDG_REQUIEM_MASSES_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_REQUIEM_MASSES', 'SDG_REQUIEM_MASSES_PERCENT_FOR_FOLLOWERS') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_REQUIEM_MASSES_PERCENT_FOR_FOLLOWERS', 'DB_DM_CITIES_ADJUST_FOLLOWER_YIELD_PERCENT', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_REQUIEM_MASSES_PERCENT_FOR_FOLLOWERS', 'Amount', 1),
							  ('SDG_REQUIEM_MASSES_PERCENT_FOR_FOLLOWERS', 'YieldType', 'YIELD_CULTURE') ;




-- ------------------------------------
-- ------------------------------------
--   Slave Spirituals
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_SLAVE_SPIRITUALS', 'KIND_BELIEF') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_SLAVE_SPIRITUALS', 'LOC_SDG_SLAVE_SPIRITUALS', 'LOC_SDG_SLAVE_SPIRITUALS_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES  ('SDG_SLAVE_SPIRITUALS', 'SDG_SLAVE_SPIRITUALS_CITY_ADDS_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SLAVE_SPIRITUALS_CITY_ADDS_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SLAVE_SPIRITUALS_CITY_ADDS_MODIFIER', 'ModifierId', 'SDG_SLAVE_SPIRITUALS_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SLAVE_SPIRITUALS_YIELD', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_PLANTATION') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_SLAVE_SPIRITUALS_YIELD', 'YieldType', 'YIELD_CULTURE'),
							  ('SDG_SLAVE_SPIRITUALS_YIELD', 'Amount', 1) ;


