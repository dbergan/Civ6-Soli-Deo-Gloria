
-- ------------------------------------
-- ------------------------------------
--  Eternal Father Strong to Save
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ABILITY_ETERNAL_FATHER_HEAL', 'KIND_ABILITY') ; 
INSERT INTO TypeTags (Type, Tag) VALUES ('SDG_ABILITY_ETERNAL_FATHER_HEAL', 'DB_CLASS_NAVAL_COMBAT') ; 
INSERT INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive) VALUES ('SDG_ABILITY_ETERNAL_FATHER_HEAL', 'LOC_SDG_ABILITY_ETERNAL_FATHER_HEAL_NAME', 'LOC_SDG_ABILITY_ETERNAL_FATHER_HEAL_DESCRIPTION', 1) ;
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES ('SDG_ABILITY_ETERNAL_FATHER_HEAL', 'SDG_ABILITY_EF_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_ABILITY_EF_MODIFIER', 'MODIFIER_PLAYER_UNIT_ADJUST_HEAL_PER_TURN') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_ABILITY_EF_MODIFIER', 'Amount', 20),
							  ('SDG_ABILITY_EF_MODIFIER', 'Type', 'NEUTRAL') ;

INSERT INTO Types (Type, Kind) VALUES ('SDG_ETERNAL_FATHER', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_ETERNAL_FATHER', 'LOC_SDG_ETERNAL_FATHER', 'LOC_SDG_ETERNAL_FATHER_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ETERNAL_FATHER', 'SDG_ETERNAL_FATHER_CITIES_ATTACH_MODIFIER') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ETERNAL_FATHER_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ETERNAL_FATHER_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_ACTIVATE_EF_HEALING') ;

INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_ACTIVATE_EF_HEALING', 'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ACTIVATE_EF_HEALING', 'AbilityType', 'SDG_ABILITY_ETERNAL_FATHER_HEAL') ;

