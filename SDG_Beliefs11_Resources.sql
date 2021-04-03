-- RESOURCES

-- ------------------------------------
-- ------------------------------------
--  Freemasonry
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_FREEMASONRY', 'KIND_BELIEF') ;

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_RESOURCES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_FREEMASONRY', 'LOC_SDG_FREEMASONRY', 'LOC_SDG_FREEMASONRY_DESCRIPTION', 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_FREEMASONRY', 'SDG_FREEMASONRY_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_FREEMASONRY_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_FREEMASONRY_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_FREEMASONRY_FAITH_ON_STONE') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_FREEMASONRY_FAITH_ON_STONE', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_STONE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_FREEMASONRY_FAITH_ON_STONE', 'YieldType', 'YIELD_FAITH'),
							  ('SDG_FREEMASONRY_FAITH_ON_STONE', 'Amount', 3) ;

-- ------------------------------------
-- ------------------------------------
--  Land of Milk and Honey
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_LAND_OF_MILK_AND_HONEY', 'KIND_BELIEF') ;

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_RESOURCES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_LAND_OF_MILK_AND_HONEY', 'LOC_SDG_LAND_OF_MILK_AND_HONEY', 'LOC_SDG_LAND_OF_MILK_AND_HONEY_DESCRIPTION', 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_LAND_OF_MILK_AND_HONEY', 'SDG_LAND_OF_MILK_AND_HONEY_CATTLE_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_LAND_OF_MILK_AND_HONEY_CATTLE_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_LAND_OF_MILK_AND_HONEY_CATTLE_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_LAND_OF_MILK_AND_HONEY_CATTLE_FAITH_ON_CATTLE') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_LAND_OF_MILK_AND_HONEY_CATTLE_FAITH_ON_CATTLE', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_CATTLE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_LAND_OF_MILK_AND_HONEY_CATTLE_FAITH_ON_CATTLE', 'YieldType', 'YIELD_FAITH'),
							  ('SDG_LAND_OF_MILK_AND_HONEY_CATTLE_FAITH_ON_CATTLE', 'Amount', 3) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_LAND_OF_MILK_AND_HONEY', 'SDG_LAND_OF_MILK_AND_HONEY_HONEY_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_LAND_OF_MILK_AND_HONEY_HONEY_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_LAND_OF_MILK_AND_HONEY_HONEY_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_LAND_OF_MILK_AND_HONEY_HONEY_FAITH_ON_HONEY') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_LAND_OF_MILK_AND_HONEY_HONEY_FAITH_ON_HONEY', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_HONEY') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_LAND_OF_MILK_AND_HONEY_HONEY_FAITH_ON_HONEY', 'YieldType', 'YIELD_FAITH'),
							  ('SDG_LAND_OF_MILK_AND_HONEY_HONEY_FAITH_ON_HONEY', 'Amount', 3) ;	


-- ------------------------------------
-- ------------------------------------
--  Entheogens
-- ------------------------------------
-- ------------------------------------
INSERT OR IGNORE INTO Tags (Tag, Vocabulary) VALUES ('SDG_CLASS_ENTHEOGENS_RESOURCES', 'RESOURCE_CLASS') ;
INSERT OR IGNORE INTO TypeTags (Type, Tag) VALUES 
('RESOURCE_TRUFFLES',	'SDG_CLASS_ENTHEOGENS_RESOURCES'),
('RESOURCE_TOBACCO',	'SDG_CLASS_ENTHEOGENS_RESOURCES') ;

--		City has improved resource requirements (SDG_REQSET_CITY_HAS_IMPROVED_ENTHEOGENS_RESOURCE)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
SELECT 'SDG_REQ_CITY_HAS_' || SUBSTR(Type, 10), 'REQUIREMENT_CITY_HAS_RESOURCE_TYPE_IMPROVED' FROM TypeTags WHERE Tag = 'SDG_CLASS_ENTHEOGENS_RESOURCES' ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
SELECT 'SDG_REQ_CITY_HAS_' || SUBSTR(Type, 10), 'ResourceType', Type FROM TypeTags WHERE Tag = 'SDG_CLASS_ENTHEOGENS_RESOURCES' ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('SDG_REQSET_CITY_HAS_IMPROVED_ENTHEOGENS_RESOURCE', 'REQUIREMENTSET_TEST_ANY') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
SELECT 'SDG_REQSET_CITY_HAS_IMPROVED_ENTHEOGENS_RESOURCE', 'SDG_REQ_CITY_HAS_' || SUBSTR(Type, 10) FROM TypeTags WHERE Tag = 'SDG_CLASS_ENTHEOGENS_RESOURCES' ;

INSERT INTO Types (Type, Kind) VALUES ('SDG_ENTHEOGENS', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_RESOURCES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_ENTHEOGENS', 'LOC_SDG_ENTHEOGENS', 'LOC_SDG_ENTHEOGENS_DESCRIPTION', 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ENTHEOGENS', 'SDG_ENTHEOGENS_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ENTHEOGENS_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ENTHEOGENS_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_ENTHEOGENS_CITIES_ATTACH_MODIFIER2') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ENTHEOGENS_CITIES_ATTACH_MODIFIER2', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'SDG_REQSET_CITY_HAS_IMPROVED_ENTHEOGENS_RESOURCE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ENTHEOGENS_CITIES_ATTACH_MODIFIER2', 'ModifierId', 'SDG_ENTHEOGENS_GPP') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ENTHEOGENS_GPP', 'DB_DM_ADJUST_DISTRICT_GREATPERSON', 'DB_REQSET_IS_CITY_CENTER') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_ENTHEOGENS_GPP', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_PROPHET'),
							  ('SDG_ENTHEOGENS_GPP', 'Amount', 3) ;


-- ------------------------------------
-- ------------------------------------
--  Salt of the Earth
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_SALT_OF_THE_EARTH', 'KIND_BELIEF') ;

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_RESOURCES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_SALT_OF_THE_EARTH', 'LOC_SDG_SALT_OF_THE_EARTH', 'LOC_SDG_SALT_OF_THE_EARTH_DESCRIPTION', 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SALT_OF_THE_EARTH', 'SDG_SALT_OF_THE_EARTH_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SALT_OF_THE_EARTH_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SALT_OF_THE_EARTH_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_SALT_OF_THE_EARTH_FAITH_ON_SALT') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SALT_OF_THE_EARTH_FAITH_ON_SALT', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_SALT') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_SALT_OF_THE_EARTH_FAITH_ON_SALT', 'YieldType', 'YIELD_FAITH'),
							  ('SDG_SALT_OF_THE_EARTH_FAITH_ON_SALT', 'Amount', 5) ;


-- ------------------------------------
-- ------------------------------------
--  Jonah
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_JONAH', 'KIND_BELIEF') ;

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_RESOURCES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_JONAH', 'LOC_SDG_JONAH', 'LOC_SDG_JONAH_DESCRIPTION', 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_JONAH', 'SDG_JONAH_WHALES_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_JONAH_WHALES_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_JONAH_WHALES_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_JONAH_WHALES_FAITH_ON_WHALES') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_JONAH_WHALES_FAITH_ON_WHALES', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_WHALES') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_JONAH_WHALES_FAITH_ON_WHALES', 'YieldType', 'YIELD_FAITH'),
							  ('SDG_JONAH_WHALES_FAITH_ON_WHALES', 'Amount', 5) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_JONAH', 'SDG_JONAH_ORCA_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_JONAH_ORCA_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_JONAH_ORCA_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_JONAH_ORCA_FAITH_ON_ORCA') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_JONAH_ORCA_FAITH_ON_ORCA', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_ORCA') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_JONAH_ORCA_FAITH_ON_ORCA', 'YieldType', 'YIELD_FAITH'),
							  ('SDG_JONAH_ORCA_FAITH_ON_ORCA', 'Amount', 5) ;
							  
-- ------------------------------------
-- ------------------------------------
--  Pearl of Great Price
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_PEARL_OF_GREAT_PRICE', 'KIND_BELIEF') ;

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_RESOURCES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_PEARL_OF_GREAT_PRICE', 'LOC_SDG_PEARL_OF_GREAT_PRICE', 'LOC_SDG_PEARL_OF_GREAT_PRICE_DESCRIPTION', 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_PEARL_OF_GREAT_PRICE', 'SDG_PEARL_OF_GREAT_PRICE_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_PEARL_OF_GREAT_PRICE_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_PEARL_OF_GREAT_PRICE_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_PEARL_OF_GREAT_PRICE_FAITH_ON_PEARLS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_PEARL_OF_GREAT_PRICE_FAITH_ON_PEARLS', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_PEARLS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_PEARL_OF_GREAT_PRICE_FAITH_ON_PEARLS', 'YieldType', 'YIELD_FAITH'),
							  ('SDG_PEARL_OF_GREAT_PRICE_FAITH_ON_PEARLS', 'Amount', 5) ;



-- ------------------------------------
-- ------------------------------------
--  Turtles All The Way Down
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_TURTLES_ALL_THE_WAY_DOWN', 'KIND_BELIEF') ;

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_RESOURCES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_TURTLES_ALL_THE_WAY_DOWN', 'LOC_SDG_TURTLES_ALL_THE_WAY_DOWN', 'LOC_SDG_TURTLES_ALL_THE_WAY_DOWN_DESCRIPTION', 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_TURTLES_ALL_THE_WAY_DOWN', 'SDG_TURTLES_ALL_THE_WAY_DOWN_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_TURTLES_ALL_THE_WAY_DOWN_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_TURTLES_ALL_THE_WAY_DOWN_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_TURTLES_ALL_THE_WAY_DOWN_FAITH_ON_TURTLES') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_TURTLES_ALL_THE_WAY_DOWN_FAITH_ON_TURTLES', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_TURTLES') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_TURTLES_ALL_THE_WAY_DOWN_FAITH_ON_TURTLES', 'YieldType', 'YIELD_FAITH'),
							  ('SDG_TURTLES_ALL_THE_WAY_DOWN_FAITH_ON_TURTLES', 'Amount', 5) ;
							  
							  
-- ------------------------------------
-- ------------------------------------
--  I Am Death
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_I_AM_DEATH', 'KIND_BELIEF') ;

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_RESOURCES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_I_AM_DEATH', 'LOC_SDG_I_AM_DEATH', 'LOC_SDG_I_AM_DEATH_DESCRIPTION', 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_I_AM_DEATH', 'SDG_I_AM_DEATH_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_I_AM_DEATH_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_I_AM_DEATH_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_I_AM_DEATH_SCIENCE_ON_URANIUM') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_I_AM_DEATH_SCIENCE_ON_URANIUM', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_URANIUM') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_I_AM_DEATH_SCIENCE_ON_URANIUM', 'YieldType', 'YIELD_SCIENCE'),
							  ('SDG_I_AM_DEATH_SCIENCE_ON_URANIUM', 'Amount', 5) ;