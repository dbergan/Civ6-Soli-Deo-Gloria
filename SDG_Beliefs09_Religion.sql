-- RELIGIOUS
-- ------------------------------------
-- ------------------------------------
--  Catechists
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_CATECHISTS', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_RELIGION_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_CATECHISTS', 'LOC_SDG_CATECHISTS', 'LOC_SDG_CATECHISTS_DESCRIPTION', 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_CATECHISTS', 'SDG_CATECHISTS_BASE_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                            ('SDG_CATECHISTS_BASE_YIELD', 'DB_DM_CITIES_ADJUST_YIELD', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_CATECHISTS_BASE_YIELD', 'YieldType', 'YIELD_FAITH'),
                              ('SDG_CATECHISTS_BASE_YIELD', 'Amount', 4) ;


-- ------------------------------------
-- ------------------------------------
--  READERS
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_READERS', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_RELIGION_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_READERS', 'LOC_SDG_READERS', 'LOC_SDG_READERS_DESCRIPTION', 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_READERS', 'SDG_READERS_BASE_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                            ('SDG_READERS_BASE_YIELD', 'DB_DM_CITIES_ADJUST_YIELD', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_READERS_BASE_YIELD', 'YieldType', 'YIELD_FAITH'),
                              ('SDG_READERS_BASE_YIELD', 'Amount', 2) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_READERS', 'SDG_READERS_POP_YIELD_' || x FROM counter ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_READERS_POP_YIELD_' || x, 'DB_DM_CITIES_ADJUST_YIELD', 'DB_REQSET_CITY_HAS_' || x || '_POPULATION_AND_FOLLOWS_RELIGION' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_READERS_POP_YIELD_' || x, 'YieldType', 'YIELD_FAITH' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_READERS_POP_YIELD_' || x, 'Amount', 2 FROM counter ;


-- ------------------------------------
-- ------------------------------------
--  DEACONS
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_DEACONS', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_RELIGION_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_DEACONS', 'LOC_SDG_DEACONS', 'LOC_SDG_DEACONS_DESCRIPTION', 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_DEACONS', 'SDG_DEACONS_BASE_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                            ('SDG_DEACONS_BASE_YIELD', 'DB_DM_CITIES_ADJUST_YIELD', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_DEACONS_BASE_YIELD', 'YieldType', 'YIELD_FAITH'),
                              ('SDG_DEACONS_BASE_YIELD', 'Amount', 2) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_DEACONS', 'SDG_DEACONS_DISTRICT_YIELD_' || x FROM counter ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_DEACONS_DISTRICT_YIELD_' || x, 'DB_DM_CITIES_ADJUST_YIELD', 'DB_REQSET_CITY_HAS_' || x || '_DISTRICTS_AND_FOLLOWS_RELIGION' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_DEACONS_DISTRICT_YIELD_' || x, 'YieldType', 'YIELD_FAITH' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_DEACONS_DISTRICT_YIELD_' || x, 'Amount', 2 FROM counter ;




-- ------------------------------------
-- ------------------------------------
--  Vicars
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_VICARS', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_RELIGION_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_VICARS', 'LOC_SDG_VICARS', 'LOC_SDG_VICARS_DESCRIPTION', 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_VICARS', 'SDG_VICARS_CITY_YIELD_PERCENT') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_VICARS_CITY_YIELD_PERCENT', 'DB_DM_CITIES_ADJUST_YIELD_PERCENT', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
                              ('SDG_VICARS_CITY_YIELD_PERCENT', 'Amount', 24),
							  ('SDG_VICARS_CITY_YIELD_PERCENT', 'YieldType', 'YIELD_FAITH') ;


-- ------------------------------------
-- ------------------------------------
--  DIOCESANS
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_DIOCESANS', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_RELIGION_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_DIOCESANS', 'LOC_SDG_DIOCESANS', 'LOC_SDG_DIOCESANS_DESCRIPTION', 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_DIOCESANS', 'SDG_DIOCESANS_PERCENT_FOR_FOLLOWERS') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_DIOCESANS_PERCENT_FOR_FOLLOWERS', 'DB_DM_CITIES_ADJUST_FOLLOWER_YIELD_PERCENT', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_DIOCESANS_PERCENT_FOR_FOLLOWERS', 'Amount', 2),
							  ('SDG_DIOCESANS_PERCENT_FOR_FOLLOWERS', 'YieldType', 'YIELD_FAITH') ;
							  



-- ------------------------------------
-- ------------------------------------
--  Soli Deo Gloria
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_SOLI_DEO_GLORIA', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_RELIGION_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_SOLI_DEO_GLORIA', 'LOC_SDG_SOLI_DEO_GLORIA', 'LOC_SDG_SOLI_DEO_GLORIA_DESCRIPTION', 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) 
  SELECT 'SDG_SOLI_DEO_GLORIA', 'SDG_SOLI_DEO_GLORIA_' || SUBSTR(GreatWorkObjectType, 17) || '_YIELD' FROM GreatWorkObjectTypes ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
  SELECT 'SDG_SOLI_DEO_GLORIA_' || SUBSTR(GreatWorkObjectType, 17) || '_YIELD', 'DB_DM_CITIES_ADJUST_GREATWORK_YIELD', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM GreatWorkObjectTypes ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
  SELECT 'SDG_SOLI_DEO_GLORIA_' || SUBSTR(GreatWorkObjectType, 17) || '_YIELD', 'GreatWorkObjectType', GreatWorkObjectType FROM GreatWorkObjectTypes ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
  SELECT 'SDG_SOLI_DEO_GLORIA_' || SUBSTR(GreatWorkObjectType, 17) || '_YIELD', 'YieldType', 'YIELD_FAITH' FROM GreatWorkObjectTypes ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
  SELECT 'SDG_SOLI_DEO_GLORIA_' || SUBSTR(GreatWorkObjectType, 17) || '_YIELD', 'YieldChange', 3 FROM GreatWorkObjectTypes ;


-- ------------------------------------
-- ------------------------------------
--  Ad Maiorem Dei Gloriam
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_AD_MAIOREM_DEI_GLORIAM', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_RELIGION_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_AD_MAIOREM_DEI_GLORIAM', 'LOC_SDG_AD_MAIOREM_DEI_GLORIAM', 'LOC_SDG_AD_MAIOREM_DEI_GLORIAM_DESCRIPTION', 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_AD_MAIOREM_DEI_GLORIAM', 'SDG_AD_MAIOREM_DEI_GLORIAM_YIELD') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_AD_MAIOREM_DEI_GLORIAM_YIELD', 'DB_DM_CITIES_ADJUST_WONDER_YIELD', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_AD_MAIOREM_DEI_GLORIAM_YIELD', 'YieldType', 'YIELD_FAITH'),
							  ('SDG_AD_MAIOREM_DEI_GLORIAM_YIELD', 'Amount', 5) ;


-- ------------------------------------
-- ------------------------------------
--  Reliquaries
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_RELIQUARIES', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_RELIGION_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_RELIQUARIES', 'LOC_SDG_RELIQUARIES', 'LOC_SDG_RELIQUARIES_DESCRIPTION', 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_RELIQUARIES', 'SDG_RELIQUARIES_TOURISM_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_RELIQUARIES_TOURISM_YIELD', 'DB_DM_CITIES_ADJUST_TOURISM', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_RELIQUARIES_TOURISM_YIELD', 'GreatWorkObjectType', 'GREATWORKOBJECT_RELIC'),
							  ('SDG_RELIQUARIES_TOURISM_YIELD', 'ScalingFactor', '500') ;



-- ------------------------------------
-- ------------------------------------
--  Synodus Horrenda
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ABILITY_SYNODUS_HORRENDA', 'KIND_ABILITY') ; 
INSERT INTO TypeTags (Type, Tag) VALUES ('SDG_ABILITY_SYNODUS_HORRENDA', 'CLASS_INQUISITOR') ; 
INSERT INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive) VALUES ('SDG_ABILITY_SYNODUS_HORRENDA', 'LOC_SDG_ABILITY_SYNODUS_HORRENDA_NAME', 'LOC_SDG_ABILITY_SYNODUS_HORRENDA_DESCRIPTION', 1) ;
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES ('SDG_ABILITY_SYNODUS_HORRENDA', 'SDG_SYNODUS_HORRENDA_COMBAT') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_SYNODUS_HORRENDA_COMBAT', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SYNODUS_HORRENDA_COMBAT', 'Amount', 10) ;
INSERT INTO ModifierStrings (ModifierId, Context, Text) VALUES ('SDG_SYNODUS_HORRENDA_COMBAT', 'Preview', 'LOC_SDG_SYNODUS_HORRENDA_COMBAT_DESCRIPTION') ;

INSERT INTO Types (Type, Kind) VALUES ('SDG_SYNODUS_HORRENDA', 'KIND_BELIEF') ; 
INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_RELIGION_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_SYNODUS_HORRENDA', 'LOC_SDG_SYNODUS_HORRENDA', 'LOC_SDG_SYNODUS_HORRENDA_DESCRIPTION', 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SYNODUS_HORRENDA', 'SDG_SYNODUS_HORRENDA_CITIES_ATTACH_MODIFIER') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SYNODUS_HORRENDA_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SYNODUS_HORRENDA_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_ACTIVATE_SYNODUS_HORRENDA_COMBAT') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_ACTIVATE_SYNODUS_HORRENDA_COMBAT', 'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ACTIVATE_SYNODUS_HORRENDA_COMBAT', 'AbilityType', 'SDG_ABILITY_SYNODUS_HORRENDA') ;

/*
INSERT INTO Types (Type, Kind) VALUES ('SDG_ABILITY_SYNODUS_HORRENDA', 'KIND_ABILITY') ; 
INSERT INTO TypeTags (Type, Tag) VALUES ('SDG_ABILITY_SYNODUS_HORRENDA', 'CLASS_INQUISITOR') ; 
INSERT INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive) VALUES ('SDG_ABILITY_SYNODUS_HORRENDA', 'LOC_SDG_ABILITY_SYNODUS_HORRENDA_NAME', 'LOC_SDG_ABILITY_SYNODUS_HORRENDA_DESCRIPTION', 1) ;

INSERT INTO Types (Type, Kind) VALUES ('SDG_SYNODUS_HORRENDA', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_RELIGION_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_SYNODUS_HORRENDA', 'LOC_SDG_SYNODUS_HORRENDA', 'LOC_SDG_SYNODUS_HORRENDA_DESCRIPTION', 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SYNODUS_HORRENDA', 'SDG_SYNODUS_HORRENDA_CITIES_ATTACH_MODIFIER') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SYNODUS_HORRENDA_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SYNODUS_HORRENDA_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_ACTIVATE_SYNODUS_HORRENDA_COMBAT') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_ACTIVATE_SYNODUS_HORRENDA_COMBAT', 'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ACTIVATE_SYNODUS_HORRENDA_COMBAT', 'AbilityType', 'SDG_ABILITY_SYNODUS_HORRENDA') ;

INSERT INTO Requirements (RequirementId, RequirementType, ProgressWeight) VALUES ('SDG_REQ_UNIT_HAS_SYNODUS_HORRENDA', 'REQUIREMENT_UNIT_HAS_ABILITY', 1) ;
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES ('SDG_REQ_UNIT_HAS_SYNODUS_HORRENDA', 'UnitAbilityType', 'SDG_ABILITY_SYNODUS_HORRENDA') ;
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('SDG_REQSET_UNIT_HAS_SYNODUS_HORRENDA', 'REQUIREMENTSET_TEST_ALL') ;
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('SDG_REQSET_UNIT_HAS_SYNODUS_HORRENDA', 'SDG_REQ_UNIT_HAS_SYNODUS_HORRENDA') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SYNODUS_HORRENDA', 'SDG_SYNODUS_HORRENDA_UNIT_APPLIES_MODIFIER') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SYNODUS_HORRENDA_UNIT_APPLIES_MODIFIER', 'MODIFIER_ALL_UNITS_ATTACH_MODIFIER', 'SDG_REQSET_UNIT_HAS_SYNODUS_HORRENDA') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SYNODUS_HORRENDA_UNIT_APPLIES_MODIFIER', 'ModifierId', 'SDG_SYNODUS_HORRENDA_COMBAT') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_SYNODUS_HORRENDA_COMBAT', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SYNODUS_HORRENDA_COMBAT', 'Amount', 10) ;
INSERT INTO ModifierStrings (ModifierId, Context, Text) VALUES ('SDG_SYNODUS_HORRENDA_COMBAT', 'Preview', 'LOC_SDG_SYNODUS_HORRENDA_COMBAT_DESCRIPTION') ;
*/


-- ------------------------------------
-- ------------------------------------
--  Itinerant Ministers
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ITINERANT_MINISTERS', 'KIND_BELIEF') ; 
INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_CULTURE_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_ITINERANT_MINISTERS', 'LOC_SDG_ITINERANT_MINISTERS', 'LOC_SDG_ITINERANT_MINISTERS_DESCRIPTION', 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ITINERANT_MINISTERS', 'SDG_ITINERANT_MINISTERS_SPREAD') ; 
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_ITINERANT_MINISTERS_SPREAD', 'MODIFIER_PLAYER_RELIGION_ADJUST_RELIGIOUS_SPREAD_DISTANCE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ITINERANT_MINISTERS_SPREAD', 'DistanceChange', '3') ;


-- ------------------------------------
-- ------------------------------------
--  Desert Anchorites
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_DESERT_ANCHORITES', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_CULTURE_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_DESERT_ANCHORITES', 'LOC_SDG_DESERT_ANCHORITES', 'LOC_SDG_DESERT_ANCHORITES_DESCRIPTION', 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 36) 
  SELECT 'SDG_DESERT_ANCHORITES', 'SDG_DESERT_ANCHORITES_CITIES_ATTACH_MODIFIER_' || x FROM counter ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 36) 
  SELECT 'SDG_DESERT_ANCHORITES_CITIES_ATTACH_MODIFIER_' || x, 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'DB_REQSET_CITY_FOLLOWS_RELIGION_AND_HAS_' || x || '_' || SUBSTR(TerrainType, 9) || '_OR_' || SUBSTR(TerrainType, 9) || '_HILLS' FROM counter LEFT JOIN Terrains WHERE TerrainType NOT LIKE '%HILLS%' AND TerrainType NOT LIKE '%MOUNTAIN%' AND TerrainType LIKE '%DESERT%' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 36) 
  SELECT 'SDG_DESERT_ANCHORITES_CITIES_ATTACH_MODIFIER_' || x, 'ModifierId', 'SDG_DESERT_ANCHORITES_GPP_' || x FROM counter ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 36) 
  SELECT 'SDG_DESERT_ANCHORITES_GPP_' || x, 'DB_DM_ADJUST_DISTRICT_GREATPERSON', 'DB_REQSET_IS_CITY_CENTER' FROM counter ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 36) 
  SELECT 'SDG_DESERT_ANCHORITES_GPP_' || x, 'GreatPersonClassType', 'GREAT_PERSON_CLASS_PROPHET' FROM counter ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 36) 
  SELECT 'SDG_DESERT_ANCHORITES_GPP_' || x, 'Amount', 1 FROM counter ;

-- ------------------------------------
-- ------------------------------------
--  Fulton Sheen
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_FULTON_SHEEN', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_RELIGION_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_FULTON_SHEEN', 'LOC_SDG_FULTON_SHEEN', 'LOC_SDG_FULTON_SHEEN_DESCRIPTION', 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_FULTON_SHEEN', 'SDG_FULTON_SHEEN_SPREAD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_FULTON_SHEEN_SPREAD', 'DB_DM_CITIES_ADJUST_RELIGION_PRESSURE', 'DB_REQSET_CITY_HAS_BROADCAST_CENTER_AND_FOLLOWS_RELIGION') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_FULTON_SHEEN_SPREAD', 'Amount', 200) ;
