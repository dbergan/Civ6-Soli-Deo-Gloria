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
UPDATE Beliefs SET BeliefClassType= 'BELIEF_CLASS_ENHANCER' WHERE BeliefClassType != 'BELIEF_CLASS_PANTHEON' AND BeliefClassType != 'BELIEF_CLASS_WORSHIP' ;
UPDATE BeliefClasses SET MaxInReligion = 999, AdoptionOrder = 3 WHERE BeliefClassType != 'BELIEF_CLASS_PANTHEON' ;
UPDATE BeliefClasses SET MaxInReligion = 1, AdoptionOrder = 2 WHERE BeliefClassType = 'BELIEF_CLASS_FOLLOWER' ;

-- ------------------------------------
-- ------------------------------------
-- "Follower" beliefs are just do-nothing flavor quotes. The game limits the number of prophets to how many follower beliefs are available.
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind)
  WITH counter as (SELECT 11 x UNION SELECT x + 1 FROM counter WHERE x < 52) 
  SELECT 'SDG_FOLLOWER' || x, 'KIND_BELIEF' FROM counter ;

INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType)
  WITH counter as (SELECT 11 x UNION SELECT x + 1 FROM counter WHERE x < 52) 
  SELECT 'SDG_FOLLOWER' || x, 'LOC_SDG_FOLLOWER' || x, 'LOC_SDG_FOLLOWER' || x || '_DESCRIPTION', 'BELIEF_CLASS_FOLLOWER' FROM counter ;

-- ------------------------------------
-- ------------------------------------
-- The functional beliefs all need to be in their own belief class so that AI will actually choose them
-- ------------------------------------
-- ------------------------------------

UPDATE CivilopediaPageQueries SET SQL = 'SELECT BeliefType as PageId, CASE WHEN BeliefClassType LIKE "SDG_BELIEF_CLASS%" THEN SUBSTR(BeliefClassType, 1, LENGTH(BeliefClassType)-4) ELSE BeliefClassType END as PageGroupId, "Belief" as PageLayoutId, Name, null as Tooltip FROM Beliefs WHERE PageId NOT LIKE "SDG_BLANK%"' WHERE RowId = 16 ;
UPDATE CivilopediaPageGroups SET SortIndex = 10 WHERE SectionId = 'RELIGIONS' AND PageGroupId = 'BELIEF_CLASS_PANTHEON' ;
INSERT INTO CivilopediaPageGroups (SectionId, PageGroupId, Name, SortIndex) VALUES
('RELIGIONS', 'SDG_BELIEF_CLASS_MILITARY', 'LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_MILITARY_BELIEFS_NAME', 100),
('RELIGIONS', 'SDG_BELIEF_CLASS_NAVAL', 'LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_NAVAL_BELIEFS_NAME', 110),
('RELIGIONS', 'SDG_BELIEF_CLASS_FOOD', 'LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_FOOD_BELIEFS_NAME', 120),
('RELIGIONS', 'SDG_BELIEF_CLASS_PRODUCTION', 'LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_PRODUCTION_BELIEFS_NAME', 130),
('RELIGIONS', 'SDG_BELIEF_CLASS_GOLD', 'LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_GOLD_BELIEFS_NAME', 140),
('RELIGIONS', 'SDG_BELIEF_CLASS_SCIENCE', 'LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_SCIENCE_BELIEFS_NAME', 150),
('RELIGIONS', 'SDG_BELIEF_CLASS_CULTURE', 'LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_CULTURE_BELIEFS_NAME', 160),
('RELIGIONS', 'SDG_BELIEF_CLASS_RELIGION', 'LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_RELIGION_BELIEFS_NAME', 170),
('RELIGIONS', 'SDG_BELIEF_CLASS_FAITHPURCHASES', 'LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_FAITHPURCHASES_BELIEFS_NAME', 180),
('RELIGIONS', 'SDG_BELIEF_CLASS_MUSES', 'LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_MUSES_BELIEFS_NAME', 190),
('RELIGIONS', 'SDG_BELIEF_CLASS_HOUSING', 'LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_HOUSING_BELIEFS_NAME', 200),
('RELIGIONS', 'SDG_BELIEF_CLASS_AMENITIES', 'LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_AMENITIES_BELIEFS_NAME', 210),
('RELIGIONS', 'SDG_BELIEF_CLASS_CITY', 'LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_CITY_BELIEFS_NAME', 220),
('RELIGIONS', 'SDG_BELIEF_CLASS_WONDERS', 'LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_WONDERS_BELIEFS_NAME', 230),
('RELIGIONS', 'SDG_BELIEF_CLASS_RESOURCES', 'LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_RESOURCES_BELIEFS_NAME', 240) ;
UPDATE CivilopediaPageGroups SET SortIndex = 995 WHERE SectionId = 'RELIGIONS' AND PageGroupId = 'BELIEF_CLASS_WORSHIP' ;
UPDATE CivilopediaPageGroups SET SortIndex = 996 WHERE SectionId = 'RELIGIONS' AND PageGroupId = 'BELIEF_CLASS_ENHANCER' ;
UPDATE CivilopediaPageGroups SET SortIndex = 997 WHERE SectionId = 'RELIGIONS' AND PageGroupId = 'BELIEF_CLASS_FOUNDER' ;
UPDATE CivilopediaPageGroups SET SortIndex = 998 WHERE SectionId = 'RELIGIONS' AND PageGroupId = 'BELIEF_CLASS_FOLLOWER' ;
UPDATE CivilopediaPageGroups SET SortIndex = 999 WHERE SectionId = 'RELIGIONS' AND PageGroupId = 'Religion' ;

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
('SDG_+3_MOVEMENT',						'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT', 0,			0,			'DB_REQSET_NOT_EMBARKED'),
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

-- Define which units get the great prophet's AOE bonus
INSERT OR REPLACE INTO Tags (Tag, Vocabulary) VALUES ('SDG_CLASS_GREAT_PROPHET_BENEFACTORS', 'ABILITY_CLASS') ;
INSERT OR REPLACE INTO TypeTags (Type, Tag)
SELECT UnitType, 'SDG_CLASS_GREAT_PROPHET_BENEFACTORS' FROM Units WHERE TrackReligion = 1 ;

-- AOE bonuses for religious units (including Warrior Monks) near great prophets
INSERT INTO Types (Type, Kind) VALUES ('SDG_ABILITY_GREAT_PROPHET_STRENGTH', 'KIND_ABILITY') ;
INSERT INTO TypeTags (Type, Tag) VALUES ('SDG_ABILITY_GREAT_PROPHET_STRENGTH', 'SDG_CLASS_GREAT_PROPHET_BENEFACTORS') ;
INSERT INTO UnitAbilities (UnitAbilityType, Inactive, Name, Description) VALUES ('SDG_ABILITY_GREAT_PROPHET_STRENGTH', 1, 'LOC_SDG_ABILITY_GREAT_PROPHET_STRENGTH_NAME', 'LOC_SDG_ABILITY_GREAT_PROPHET_STRENGTH_DESCRIPTION') ;
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES ('SDG_ABILITY_GREAT_PROPHET_STRENGTH', 'SDG_MOD_GREAT_PROPHET_STRENGTH') ;

INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_MOD_GREAT_PROPHET_STRENGTH', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_MOD_GREAT_PROPHET_STRENGTH', 'Amount', 5) ;
INSERT INTO ModifierStrings (ModifierId, Context, Text) VALUES ('SDG_MOD_GREAT_PROPHET_STRENGTH', 'Preview', 'LOC_SDG_MOD_GREAT_PROPHET_STRENGTH_PREVIEW') ;

INSERT INTO Types (Type, Kind) VALUES ('SDG_ABILITY_GREAT_PROPHET_MOVEMENT', 'KIND_ABILITY') ;
INSERT INTO TypeTags (Type, Tag) VALUES ('SDG_ABILITY_GREAT_PROPHET_MOVEMENT', 'SDG_CLASS_GREAT_PROPHET_BENEFACTORS') ;
INSERT INTO UnitAbilities (UnitAbilityType, Inactive, Name, Description) VALUES ('SDG_ABILITY_GREAT_PROPHET_MOVEMENT', 1, 'LOC_SDG_ABILITY_GREAT_PROPHET_MOVEMENT_NAME', 'LOC_SDG_ABILITY_GREAT_PROPHET_MOVEMENT_DESCRIPTION') ;
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES ('SDG_ABILITY_GREAT_PROPHET_MOVEMENT', 'SDG_MOD_GREAT_PROPHET_MOVEMENT') ;

INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_MOD_GREAT_PROPHET_MOVEMENT', 'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_MOD_GREAT_PROPHET_MOVEMENT', 'Amount', 1) ;



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
-- Level 3 Holy Site buildings provide a Great Prophet Point
-- ------------------------------------
-- ------------------------------------
INSERT INTO Building_GreatPersonPoints (BuildingType, GreatPersonClassType, PointsPerTurn)
	SELECT Building, 'GREAT_PERSON_CLASS_PROPHET', 1 FROM BuildingPrereqs WHERE PrereqBuilding = 'BUILDING_TEMPLE' ;


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
UPDATE Units SET EnabledByReligion = 0, PrereqCivic = 'CIVIC_THEOLOGY' WHERE UnitType = 'UNIT_WARRIOR_MONK' ;



-- ------------------------------------
-- ------------------------------------
-- Holy City tourism reduced from 8 to 2 (since every civ makes a holy city)
-- ------------------------------------
-- ------------------------------------
UPDATE GlobalParameters SET Value = 2 WHERE Name = 'TOURISM_FROM_HOLY_CITY' ;