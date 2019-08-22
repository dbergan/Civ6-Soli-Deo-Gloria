-- FOOD

-- ------------------------------------
-- ------------------------------------
--  MANNA_FROM_HEAVEN
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_MANNA_FROM_HEAVEN', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_MANNA_FROM_HEAVEN', 'LOC_SDG_MANNA_FROM_HEAVEN', 'LOC_SDG_MANNA_FROM_HEAVEN_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_MANNA_FROM_HEAVEN', 'SDG_MANNA_FROM_HEAVEN_BASE_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_MANNA_FROM_HEAVEN_BASE_YIELD', 'DB_DM_CITIES_ADJUST_YIELD', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_MANNA_FROM_HEAVEN_BASE_YIELD', 'YieldType', 'YIELD_FOOD'),
                              ('SDG_MANNA_FROM_HEAVEN_BASE_YIELD', 'Amount', 2) ;


-- ------------------------------------
-- ------------------------------------
--  CHILD_MARRIAGE
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_CHILD_MARRIAGE', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_CHILD_MARRIAGE', 'LOC_SDG_CHILD_MARRIAGE', 'LOC_SDG_CHILD_MARRIAGE_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_CHILD_MARRIAGE', 'SDG_CHILD_MARRIAGE_BASE_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_CHILD_MARRIAGE_BASE_YIELD', 'DB_DM_CITIES_ADJUST_YIELD', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_CHILD_MARRIAGE_BASE_YIELD', 'YieldType', 'YIELD_FOOD'),
                              ('SDG_CHILD_MARRIAGE_BASE_YIELD', 'Amount', 1) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_CHILD_MARRIAGE', 'SDG_CHILD_MARRIAGE_POP_YIELD_' || x FROM counter ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_CHILD_MARRIAGE_POP_YIELD_' || x, 'DB_DM_CITIES_ADJUST_YIELD', 'DB_REQSET_CITY_HAS_' || x || '_POPULATION_AND_FOLLOWS_RELIGION' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_CHILD_MARRIAGE_POP_YIELD_' || x, 'YieldType', 'YIELD_FOOD' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_CHILD_MARRIAGE_POP_YIELD_' || x, 'Amount', 1 FROM counter ;


-- ------------------------------------
-- ------------------------------------
--  JOSEPH
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_JOSEPH', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_JOSEPH', 'LOC_SDG_JOSEPH', 'LOC_SDG_JOSEPH_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_JOSEPH', 'SDG_JOSEPH_BASE_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_JOSEPH_BASE_YIELD', 'DB_DM_CITIES_ADJUST_YIELD', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_JOSEPH_BASE_YIELD', 'YieldType', 'YIELD_FOOD'),
                              ('SDG_JOSEPH_BASE_YIELD', 'Amount', 1) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_JOSEPH', 'SDG_JOSEPH_DISTRICT_YIELD_' || x FROM counter ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_JOSEPH_DISTRICT_YIELD_' || x, 'DB_DM_CITIES_ADJUST_YIELD', 'DB_REQSET_CITY_HAS_' || x || '_DISTRICTS_AND_FOLLOWS_RELIGION' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_JOSEPH_DISTRICT_YIELD_' || x, 'YieldType', 'YIELD_FOOD' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_JOSEPH_DISTRICT_YIELD_' || x, 'Amount', 1 FROM counter ;
  

-- ------------------------------------
-- ------------------------------------
--  POLYGAMY
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_POLYGAMY', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_POLYGAMY', 'LOC_SDG_POLYGAMY', 'LOC_SDG_POLYGAMY_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_POLYGAMY', 'SDG_POLYGAMY_GROWTH') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_POLYGAMY_GROWTH', 'MODIFIER_ALL_CITIES_ADJUST_CITY_GROWTH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_POLYGAMY_GROWTH', 'Amount', 28) ;


-- ------------------------------------
-- ------------------------------------
--  EVERY_SPERM_IS_SACRED
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_EVERY_SPERM_IS_SACRED', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_EVERY_SPERM_IS_SACRED', 'LOC_SDG_EVERY_SPERM_IS_SACRED', 'LOC_SDG_EVERY_SPERM_IS_SACRED_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_EVERY_SPERM_IS_SACRED', 'SDG_EVERY_SPERM_IS_SACRED_CITY_YIELD_PERCENT') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_EVERY_SPERM_IS_SACRED_CITY_YIELD_PERCENT', 'DB_DM_CITIES_ADJUST_YIELD_PERCENT', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
                              ('SDG_EVERY_SPERM_IS_SACRED_CITY_YIELD_PERCENT', 'Amount', 12),
							  ('SDG_EVERY_SPERM_IS_SACRED_CITY_YIELD_PERCENT', 'YieldType', 'YIELD_FOOD') ;


-- ------------------------------------
-- ------------------------------------
--  FOOD_FOR_PEACE
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_FOOD_FOR_PEACE', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_FOOD_FOR_PEACE', 'LOC_SDG_FOOD_FOR_PEACE', 'LOC_SDG_FOOD_FOR_PEACE_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_FOOD_FOR_PEACE', 'SDG_FOOD_FOR_PEACE_PERCENT_FOR_FOLLOWERS') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_FOOD_FOR_PEACE_PERCENT_FOR_FOLLOWERS', 'DB_DM_CITIES_ADJUST_FOLLOWER_YIELD_PERCENT', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_FOOD_FOR_PEACE_PERCENT_FOR_FOLLOWERS', 'Amount', 1),
							  ('SDG_FOOD_FOR_PEACE_PERCENT_FOR_FOLLOWERS', 'YieldType', 'YIELD_FOOD') ;
