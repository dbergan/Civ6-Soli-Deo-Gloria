-- ------------------------------------
-- ------------------------------------
-- Delete all existing (non-pantheon, non-worship) beliefs
-- ------------------------------------
-- ------------------------------------
DELETE FROM Types WHERE Type IN (  SELECT Type FROM Types INNER JOIN Beliefs ON Beliefs.BeliefType = Types.Type AND Beliefs.BeliefClassType != 'BELIEF_CLASS_PANTHEON' AND Beliefs.BeliefClassType != 'BELIEF_CLASS_WORSHIP' AND Beliefs.BeliefType NOT LIKE 'POK_%'  ) ;
DELETE FROM Beliefs WHERE BeliefClassType != 'BELIEF_CLASS_PANTHEON' AND BeliefClassType != 'BELIEF_CLASS_WORSHIP' AND Beliefs.BeliefType NOT LIKE 'POK_%' ;

-- ------------------------------------
-- ------------------------------------
-- The religious beliefs are all replaced
-- ------------------------------------
-- ------------------------------------

-- See: SDG_ReligiousBeliefs.sql & LOC_SDG_ReligiousBeliefs.sql


-- ------------------------------------
-- ------------------------------------
-- There is no limit to the number of religions; every civilization (except Kongo) can found its own religion.
-- ------------------------------------
-- ------------------------------------
UPDATE Map_GreatPersonClasses SET MaxWorldInstances = 999 WHERE GreatPersonClassType = 'GREAT_PERSON_CLASS_PROPHET';

-- ------------------------------------
-- ------------------------------------
-- There is no limit to the number of beliefs you can have in your religion, and the beliefs are not grouped into 'classes'.
-- ------------------------------------
-- ------------------------------------
UPDATE Beliefs SET BeliefClassType= 'BELIEF_CLASS_ENHANCER' WHERE BeliefClassType != 'BELIEF_CLASS_PANTHEON' ;
UPDATE BeliefClasses SET MaxInReligion = 999, AdoptionOrder = 3 WHERE BeliefClassType != 'BELIEF_CLASS_PANTHEON' ;
UPDATE BeliefClasses SET MaxInReligion = 1, AdoptionOrder = 2 WHERE BeliefClassType = 'BELIEF_CLASS_FOLLOWER' ;

-- ------------------------------------
-- ------------------------------------
-- "Follower" beliefs are just do-nothing flavor quotes. The game limits the number of prophets to how many follower beliefs are available.
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 39) 
  SELECT 'SDG_FOLLOWER' || x, 'KIND_BELIEF' FROM counter ;

INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 39) 
  SELECT 'SDG_FOLLOWER' || x, 'LOC_SDG_FOLLOWER' || x, 'LOC_SDG_FOLLOWER' || x || '_DESCRIPTION', 'BELIEF_CLASS_FOLLOWER' FROM counter ;

-- ------------------------------------
-- ------------------------------------
-- The functional beliefs all need to be in their own belief class so that AI will actually choose them
-- ------------------------------------
-- ------------------------------------
INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
  WITH counter as (SELECT 10 x UNION SELECT x + 1 FROM counter WHERE x < 199) 
  SELECT 'SDG_BELIEF_CLASS_' || x, 'LOC_SDG_BELIEF_CLASS_NAME', 999, x FROM counter ;


/*
I'd like to have all my beliefs in one Civilopedia Page Group
This code puts them each in their own page group, which is worse than no page group

INSERT INTO CivilopediaPageGroups (SectionId, PageGroupId, Name, VisibleIfEmpty, SortIndex)
  WITH counter as (SELECT 10 x UNION SELECT x + 1 FROM counter WHERE x < 99) 
  SELECT 'RELIGIONS', 'SDG_BELIEF_CLASS_0' || x, 'LOC_PEDIA_RELIGIONS_PAGEGROUP_SDG_BELIEFS_NAME', 1, 21 FROM counter ;

INSERT INTO CivilopediaPageGroups (SectionId, PageGroupId, Name, VisibleIfEmpty, SortIndex)
  WITH counter as (SELECT 100 x UNION SELECT x + 1 FROM counter WHERE x < 199) 
  SELECT 'RELIGIONS', 'SDG_BELIEF_CLASS_' || x, 'LOC_PEDIA_RELIGIONS_PAGEGROUP_SDG_BELIEFS_NAME', 1, 21 FROM counter ;

*/

-- ------------------------------------
-- ------------------------------------
-- Founding a religion provides two beliefs (but the first one is a do-nothing flavor quote)
-- ------------------------------------
-- ------------------------------------
UPDATE GlobalParameters SET Value = 2 WHERE Name = 'RELIGION_INITIAL_BELIEFS' ;


-- ------------------------------------
-- ------------------------------------
-- Great Prophets are just like the other Great People.  Instead of getting only one to found your religion, with SDG, you can earn subsequent Great Prophets who each add a belief to your religion.
-- ------------------------------------
-- ------------------------------------
UPDATE GreatPersonClasses SET MaxPlayerInstances = NULL WHERE GreatPersonClassType = 'GREAT_PERSON_CLASS_PROPHET' ;

--    Great prophets die when they are attacked (instead of retreating)
--    Great prophets only move 1 square/turn
UPDATE Units SET CanRetreatWhenCaptured = 0, BaseMoves = 1 WHERE UnitType = 'UNIT_GREAT_PROPHET' ;

--    Modifiers for Great Prophets
INSERT INTO Modifiers 
(ModifierId,							ModifierType,							RunOnce,	Permanent,	SubjectRequirementSetId) 
VALUES
('SDG_ADD_BELIEF',						'MODIFIER_PLAYER_ADD_BELIEF',			1,			1,			NULL),
('SDG_+3_MOVEMENT',						'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT', 0,			0,			NULL),
('SDG_MOD_GREAT_PROPHET_STRENGTH_AOE',	'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',	0,			0,			'DB_REQSET_AOE_OWNER_ADJACENCY'),
('SDG_MOD_GREAT_PROPHET_MOVEMENT_AOE',	'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',	0,			0,			'DB_REQSET_AOE_OWNER_ADJACENCY') ;

INSERT INTO ModifierArguments 
(ModifierId,							Name,			Value) 
VALUES 
('SDG_ADD_BELIEF',						'Amount',		1),
('SDG_+3_MOVEMENT',						'Amount',		3),
('SDG_MOD_GREAT_PROPHET_STRENGTH_AOE',	'AbilityType',	'SDG_ABILITY_GREAT_PROPHET_STRENGTH'),
('SDG_MOD_GREAT_PROPHET_MOVEMENT_AOE',	'AbilityType',	'SDG_ABILITY_GREAT_PROPHET_MOVEMENT') ;


-- Subsequent beliefs are granted upon the new prophet's births... but only after they've founded a religion

-- Adding a promotion class with one promotion for Great Prophets
-- The effect of the promotion is to give the player a new belief
INSERT INTO Types (Type, Kind) VALUES 
                  ('SDG_PROMOTION_CLASS_PROPHET', 'KIND_PROMOTION_CLASS'),
				  ('SDG_PROMOTION_PROPHET_BELIEF_AND_MOVEMENT', 'KIND_PROMOTION') ;
INSERT INTO UnitPromotionClasses (PromotionClassType, Name) VALUES 
                           ('SDG_PROMOTION_CLASS_PROPHET', 'LOC_SDG_PROMOTION_CLASS_PROPHET') ;
INSERT INTO UnitPromotions (UnitPromotionType, Name, Description, Level, PromotionClass, Column) VALUES 
                           ('SDG_PROMOTION_PROPHET_BELIEF_AND_MOVEMENT', 'LOC_SDG_PROMOTION_PROPHET_BELIEF_AND_MOVEMENT_NAME', 'LOC_SDG_PROMOTION_PROPHET_BELIEF_AND_MOVEMENT_DESCRIPTION', 1, 'SDG_PROMOTION_CLASS_PROPHET', 1) ;
INSERT INTO UnitPromotionModifiers (UnitPromotionType, ModifierId) VALUES 
                           ('SDG_PROMOTION_PROPHET_BELIEF_AND_MOVEMENT', 'SDG_ADD_BELIEF'),
						   ('SDG_PROMOTION_PROPHET_BELIEF_AND_MOVEMENT', 'SDG_+3_MOVEMENT'),
						   ('SDG_PROMOTION_PROPHET_BELIEF_AND_MOVEMENT', 'SDG_MOD_GREAT_PROPHET_STRENGTH_AOE'),
						   ('SDG_PROMOTION_PROPHET_BELIEF_AND_MOVEMENT', 'SDG_MOD_GREAT_PROPHET_MOVEMENT_AOE') ;


-- This modifier grants our promotion to all great prophets (ala Mont St Michel)
INSERT INTO Modifiers (ModifierId, ModifierType, Permanent) VALUES
                      ('SDG_GRANT_PROMOTION_PROPHET_BELIEF', 'MODIFIER_PLAYER_UNITS_GRANT_PROMOTION', 1) ;
INSERT INTO ModifierArguments(ModifierId, Name, Value) VALUES
                             ('SDG_GRANT_PROMOTION_PROPHET_BELIEF', 'PromotionType', 'SDG_PROMOTION_PROPHET_BELIEF_AND_MOVEMENT') ;

-- This modifier grants the above modifier to players that have founded a religion
-- (beliefs added before a Religion causes the game to hang)
INSERT INTO GameModifiers (ModifierId) VALUES ('SDG_ENABLE_GREAT_PROPHET_BELIEF_PROMOTION_AFTER_FOUNDED_RELIGION') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                      ('SDG_ENABLE_GREAT_PROPHET_BELIEF_PROMOTION_AFTER_FOUNDED_RELIGION', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'DB_REQSET_PLAYER_FOUNDED_RELIGION') ;
INSERT INTO ModifierArguments(ModifierId, Name, Value) VALUES
                             ('SDG_ENABLE_GREAT_PROPHET_BELIEF_PROMOTION_AFTER_FOUNDED_RELIGION', 'ModifierId', 'SDG_GRANT_PROMOTION_PROPHET_BELIEF') ;

UPDATE Units SET PromotionClass = 'SDG_PROMOTION_CLASS_PROPHET' WHERE UnitType = 'UNIT_GREAT_PROPHET' ;


-- AOE bonuses for religious units near great prophets
INSERT INTO Types (Type, Kind) VALUES ('SDG_ABILITY_GREAT_PROPHET_STRENGTH', 'KIND_ABILITY') ;
INSERT INTO TypeTags (Type, Tag) VALUES ('SDG_ABILITY_GREAT_PROPHET_STRENGTH', 'CLASS_RELIGIOUS_ALL') ;
INSERT INTO UnitAbilities (UnitAbilityType, Inactive, Name, Description) VALUES ('SDG_ABILITY_GREAT_PROPHET_STRENGTH', 1, 'LOC_SDG_ABILITY_GREAT_PROPHET_STRENGTH_NAME', 'LOC_SDG_ABILITY_GREAT_PROPHET_STRENGTH_DESCRIPTION') ;
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES ('SDG_ABILITY_GREAT_PROPHET_STRENGTH', 'SDG_MOD_GREAT_PROPHET_STRENGTH') ;

INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_MOD_GREAT_PROPHET_STRENGTH', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_MOD_GREAT_PROPHET_STRENGTH', 'Amount', 5) ;
INSERT INTO ModifierStrings (ModifierId, Context, Text) VALUES ('SDG_MOD_GREAT_PROPHET_STRENGTH', 'Preview', 'LOC_SDG_MOD_GREAT_PROPHET_STRENGTH_PREVIEW') ;

INSERT INTO Types (Type, Kind) VALUES ('SDG_ABILITY_GREAT_PROPHET_MOVEMENT', 'KIND_ABILITY') ;
INSERT INTO TypeTags (Type, Tag) VALUES ('SDG_ABILITY_GREAT_PROPHET_MOVEMENT', 'CLASS_RELIGIOUS_ALL') ;
INSERT INTO UnitAbilities (UnitAbilityType, Inactive, Name, Description) VALUES ('SDG_ABILITY_GREAT_PROPHET_MOVEMENT', 1, 'LOC_SDG_ABILITY_GREAT_PROPHET_MOVEMENT_NAME', 'LOC_SDG_ABILITY_GREAT_PROPHET_MOVEMENT_DESCRIPTION') ;
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES ('SDG_ABILITY_GREAT_PROPHET_MOVEMENT', 'SDG_MOD_GREAT_PROPHET_MOVEMENT') ;

INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_MOD_GREAT_PROPHET_MOVEMENT', 'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_MOD_GREAT_PROPHET_MOVEMENT', 'Amount', 1) ;





/*
--    Great prophets can 'build' a Great Sermon (+1 Faith to tile)
--    Great prophets die when they are attacked (instead of retreating)
--    Great prophets only move 1 square/turn
UPDATE Units SET BuildCharges = 1, CanRetreatWhenCaptured = 0, BaseMoves = 1 WHERE UnitType = 'UNIT_GREAT_PROPHET' ;

--    Great Sermon is an improvement, that by default cannot be built (like a city park), but when it can, it can only be built by Great Prophets
INSERT INTO Types (Type, Kind) VALUES 
                  ('SDG_IMPROVEMENT_GREAT_SERMON', 'KIND_IMPROVEMENT') ;
INSERT INTO Improvements (ImprovementType, Name, Description, TraitType, Buildable, PlunderType, PlunderAmount, Icon, TilesRequired, SameAdjacentValid, Domain)  VALUES
                         ('SDG_IMPROVEMENT_GREAT_SERMON', 'LOC_SDG_IMPROVEMENT_GREAT_SERMON', 'LOC_SDG_IMPROVEMENT_GREAT_SERMON_DESCRIPTION', 'TRAIT_CIVILIZATION_NO_PLAYER', 1, 'PLUNDER_FAITH', 0, 'ICON_SDG_GREAT_SERMON', 1, 1, 'DOMAIN_LAND') ;
INSERT INTO Improvement_ValidBuildUnits (ImprovementType, UnitType) VALUES 
                                        ('SDG_IMPROVEMENT_GREAT_SERMON', 'UNIT_GREAT_PROPHET') ;
INSERT INTO Improvement_YieldChanges (ImprovementType, YieldType, YieldChange) VALUES
                                     ('SDG_IMPROVEMENT_GREAT_SERMON', 'YIELD_FAITH', 1) ;

--     Great Sermon can be built on all land terrains, features, resources (as long as the prophet can move onto the tile)
INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType, PrereqTech, PrereqCivic)
	SELECT 'SDG_IMPROVEMENT_GREAT_SERMON', TerrainType, NULL, NULL FROM Terrains ;
INSERT INTO Improvement_ValidFeatures (ImprovementType, FeatureType) 
	SELECT 'SDG_IMPROVEMENT_GREAT_SERMON', FeatureType FROM Features ;
INSERT INTO Improvement_ValidResources (ImprovementType, ResourceType, MustRemoveFeature)  
	SELECT 'SDG_IMPROVEMENT_GREAT_SERMON', ResourceType, 0 FROM Resources ;								  

--     Great Sermons are enabled only after a Religion has been founded
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES
                      ('SDG_ENABLE_GREAT_SERMON', 'MODIFIER_PLAYER_ADJUST_VALID_IMPROVEMENT') ;
INSERT INTO ModifierArguments(ModifierId, Name, Value) VALUES
                             ('SDG_ENABLE_GREAT_SERMON', 'ImprovementType', 'SDG_IMPROVEMENT_GREAT_SERMON') ;

INSERT INTO GameModifiers (ModifierId) VALUES ('SDG_GREAT_PROPHET_ENABLE_GREAT_SERMON_AFTER_RELIGION_FOUNDED') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                      ('SDG_GREAT_PROPHET_ENABLE_GREAT_SERMON_AFTER_RELIGION_FOUNDED', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'DB_REQSET_PLAYER_FOUNDED_RELIGION') ;
INSERT INTO ModifierArguments(ModifierId, Name, Value) VALUES
                             ('SDG_GREAT_PROPHET_ENABLE_GREAT_SERMON_AFTER_RELIGION_FOUNDED', 'ModifierId', 'SDG_ENABLE_GREAT_SERMON') ;
							 

-- Subsequent beliefs are granted upon the new prophet's births... but only after they've founded a religion

-- Adding a promotion class with one promotion for Great Prophets
-- The effect of the promotion is to give the player a new belief
INSERT INTO Types (Type, Kind) VALUES 
                  ('SDG_PROMOTION_CLASS_PROPHET', 'KIND_PROMOTION_CLASS'),
				  ('SDG_PROMOTION_PROPHET_BELIEF', 'KIND_PROMOTION') ;
INSERT INTO UnitPromotionClasses (PromotionClassType, Name) VALUES 
                           ('SDG_PROMOTION_CLASS_PROPHET', 'LOC_SDG_PROMOTION_CLASS_PROPHET') ;
INSERT INTO UnitPromotions (UnitPromotionType, Name, Description, Level, PromotionClass, Column) VALUES 
                           ('SDG_PROMOTION_PROPHET_BELIEF', 'LOC_SDG_PROMOTION_PROPHET_BELIEF', 'LOC_SDG_PROMOTION_PROPHET_BELIEF_DESCRIPTION', 1, 'SDG_PROMOTION_CLASS_PROPHET', 1) ;
INSERT INTO UnitPromotionModifiers (UnitPromotionType, ModifierId) VALUES 
                           ('SDG_PROMOTION_PROPHET_BELIEF', 'SDG_ADD_BELIEF') ;

-- This modifier grants our promotion to all great prophets (ala Mont St Michel)
INSERT INTO Modifiers (ModifierId, ModifierType, Permanent) VALUES
                      ('SDG_GRANT_PROMOTION_PROPHET_BELIEF', 'MODIFIER_PLAYER_UNITS_GRANT_PROMOTION', 1) ;
INSERT INTO ModifierArguments(ModifierId, Name, Value) VALUES
                             ('SDG_GRANT_PROMOTION_PROPHET_BELIEF', 'PromotionType', 'SDG_PROMOTION_PROPHET_BELIEF') ;

-- This modifier grants the above modifier to players that have founded a religion
-- (beliefs added before a Religion causes the game to hang)
INSERT INTO GameModifiers (ModifierId) VALUES ('SDG_ENABLE_GREAT_PROPHET_BELIEF_PROMOTION_AFTER_FOUNDED_RELIGION') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                      ('SDG_ENABLE_GREAT_PROPHET_BELIEF_PROMOTION_AFTER_FOUNDED_RELIGION', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'DB_REQSET_PLAYER_FOUNDED_RELIGION') ; -- 'DB_REQSET_PLAYER_IS_AI_AND_HAS_FOUNDED_RELIGION') ;
INSERT INTO ModifierArguments(ModifierId, Name, Value) VALUES
                             ('SDG_ENABLE_GREAT_PROPHET_BELIEF_PROMOTION_AFTER_FOUNDED_RELIGION', 'ModifierId', 'SDG_GRANT_PROMOTION_PROPHET_BELIEF') ;

UPDATE Units SET PromotionClass = 'SDG_PROMOTION_CLASS_PROPHET' WHERE UnitType = 'UNIT_GREAT_PROPHET' ;
*/


-- ------------------------------------
-- ------------------------------------
-- All civs start with a Great Prophet
-- ------------------------------------
-- ------------------------------------
INSERT INTO GameModifiers (ModifierId) VALUES 
                           ('SDG_FREE_PROPHET_PLAYERS_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                      ('SDG_FREE_PROPHET_PLAYERS_ATTACH_MODIFIER', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'DB_REQSET_FREE_PROPHET') ;
INSERT INTO ModifierArguments(ModifierId, Name, Value) VALUES
                             ('SDG_FREE_PROPHET_PLAYERS_ATTACH_MODIFIER', 'ModifierId', 'SDG_FREE_PROPHET') ;
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId) VALUES 
                      ('SDG_FREE_PROPHET', 'DB_DM_PLAYER_GRANT_GREAT_PERSON_IN_CAPITAL', 1, 1, 'DB_REQSET_FREE_PROPHET') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
                              ('SDG_FREE_PROPHET', 'Amount', 1), 
							  ('SDG_FREE_PROPHET', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_PROPHET') ;

-- ------------------------------------
-- ------------------------------------
-- Apostles can no longer evangelize beliefs
-- ------------------------------------
-- ------------------------------------
UPDATE Units SET EvangelizeBelief = 0 WHERE UnitType = 'UNIT_APOSTLE' ;


-- ------------------------------------
-- ------------------------------------
-- 'Exodus of the Evangelicals' golden age commemoration gives 2 Great Prophet points per turn instead of 4.
-- ------------------------------------
-- ------------------------------------
UPDATE ModifierArguments SET Value = 2 WHERE ModifierID = 'COMMEMORATION_RELIGIOUS_GA_GREAT_PROPHET_POINTS' AND Name = 'Amount' ;


-- ------------------------------------
-- ------------------------------------
-- Holy Site projects provide double the religious pressure and only 30% of the Great Prophet Points
-- ------------------------------------
-- ------------------------------------
UPDATE Project_GreatPersonPoints SET Points = 4 WHERE ProjectType = 'PROJECT_ENHANCE_DISTRICT_HOLY_SITE' ;
UPDATE Projects_XP2 SET ReligiousPressureModifier = 200 WHERE ProjectType = 'PROJECT_ENHANCE_DISTRICT_HOLY_SITE' ;

-- ------------------------------------
-- ------------------------------------
-- Saladin's 'The Last Prophet' was renamed to 'The Prophet'.  It no longer gives you the last Great Prophet (because all civs can make a religion and that might take forever), but instead gives you a free Great Prophet at the dawn of the Classical era.
-- ------------------------------------
-- ------------------------------------
DELETE FROM TraitModifiers WHERE ModifierId = 'TRAIT_GUARANTEE_ONE_PROPHET' ;

INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId) VALUES 
                      ('SDG_TRAIT_FREE_PROPHET_CLASSICAL_ERA', 'SDG_MODIFIER_PLAYER_GREAT_PERSON_CLASS_IN_CAPITAL', 1, 1, 'DB_REQSET_CAPITAL_CITY_IN_CLASSICAL_ERA') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
                              ('SDG_TRAIT_FREE_PROPHET_CLASSICAL_ERA', 'Amount', 1), 
							  ('SDG_TRAIT_FREE_PROPHET_CLASSICAL_ERA', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_PROPHET') ;
INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES 
                           ('TRAIT_CIVILIZATION_LAST_PROPHET', 'SDG_TRAIT_FREE_PROPHET_CLASSICAL_ERA') ;
						   
						   
-- ------------------------------------
-- ------------------------------------
-- New Great Prophets were added.
-- ------------------------------------
-- ------------------------------------

-- See: SDG_NewProphets.sql & LOC_SDG_NewProphets.sql


-- ------------------------------------
-- ------------------------------------
-- Warrior Monks no longer require a belief. (Otherwise the AI always wastes a belief on this.)
-- ------------------------------------
-- ------------------------------------
UPDATE Units SET EnabledByReligion = 0 WHERE UnitType = 'UNIT_WARRIOR_MONK' ;



/*
-- Pamphlet Shop do-nothing building that spawns in cities when you discover Printing (used with Scripture and 95 Theses)
INSERT INTO Types (Type, Kind) VALUES ('BUILDING_SDG_PAMPHLET_SHOP', 'KIND_BUILDING') ; 
INSERT INTO Buildings (BuildingType, Name, Description, Cost, PrereqTech, PrereqDistrict) VALUES ('BUILDING_SDG_PAMPHLET_SHOP', 'LOC_BUILDING_SDG_PAMPHLET_SHOP', 'LOC_BUILDING_SDG_PAMPHLET_SHOP_DESCRIPTION', 1, 'TECH_PRINTING', 'DISTRICT_CITY_CENTER') ;

-- Cities with Printing get a Print Shop
INSERT INTO TechnologyModifiers (TechnologyType, ModifierID) VALUES ('TECH_PRINTING', 'SDG_GRANT_PAMPHLET_SHOP_IN_PLAYER_CITIES') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_GRANT_PAMPHLET_SHOP_IN_PLAYER_CITIES', 'SDG_GRANT_BUILDING_IN_PLAYER_CITIES_IGNORE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_GRANT_PAMPHLET_SHOP_IN_PLAYER_CITIES', 'BuildingType', 'SDG_PAMPHLET_SHOP') ;
*/



