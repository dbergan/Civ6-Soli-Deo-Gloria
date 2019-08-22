
-- GENERAL CITY

-- ------------------------------------
-- ------------------------------------
--  OKTOBERFEST
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_OKTOBERFEST', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_OKTOBERFEST', 'LOC_SDG_OKTOBERFEST', 'LOC_SDG_OKTOBERFEST_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_OKTOBERFEST', 'SDG_OKTOBERFEST_HARVEST_BONUS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_OKTOBERFEST_HARVEST_BONUS', 'DB_DM_CITIES_ADJUST_RESOURCE_HARVEST_BONUS', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_OKTOBERFEST_HARVEST_BONUS', 'Amount', 25) ;