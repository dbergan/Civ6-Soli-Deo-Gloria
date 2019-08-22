-- RESOURCES

-- ------------------------------------
-- ------------------------------------
--  Freemasonry
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_FREEMASONRY', 'KIND_BELIEF') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_FREEMASONRY', 'LOC_SDG_FREEMASONRY', 'LOC_SDG_FREEMASONRY_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;
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
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_LAND_OF_MILK_AND_HONEY', 'LOC_SDG_LAND_OF_MILK_AND_HONEY', 'LOC_SDG_LAND_OF_MILK_AND_HONEY_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;
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
INSERT INTO Types (Type, Kind) VALUES ('SDG_ENTHEOGENS', 'KIND_BELIEF') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_ENTHEOGENS', 'LOC_SDG_ENTHEOGENS', 'LOC_SDG_ENTHEOGENS_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ENTHEOGENS', 'SDG_ENTHEOGENS_TRUFFLES_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ENTHEOGENS_TRUFFLES_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ENTHEOGENS_TRUFFLES_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_ENTHEOGENS_TRUFFLES_FAITH_ON_TRUFFLES') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ENTHEOGENS_TRUFFLES_FAITH_ON_TRUFFLES', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_TRUFFLES') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_ENTHEOGENS_TRUFFLES_FAITH_ON_TRUFFLES', 'YieldType', 'YIELD_FAITH'),
							  ('SDG_ENTHEOGENS_TRUFFLES_FAITH_ON_TRUFFLES', 'Amount', 5) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ENTHEOGENS', 'SDG_ENTHEOGENS_MUSHROOMS_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ENTHEOGENS_MUSHROOMS_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ENTHEOGENS_MUSHROOMS_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_ENTHEOGENS_MUSHROOMS_FAITH_ON_MUSHROOMS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ENTHEOGENS_MUSHROOMS_FAITH_ON_MUSHROOMS', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_MUSHROOMS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_ENTHEOGENS_MUSHROOMS_FAITH_ON_MUSHROOMS', 'YieldType', 'YIELD_FAITH'),
							  ('SDG_ENTHEOGENS_MUSHROOMS_FAITH_ON_MUSHROOMS', 'Amount', 5) ;


-- ------------------------------------
-- ------------------------------------
--  Salt of the Earth
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_SALT_OF_THE_EARTH', 'KIND_BELIEF') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_SALT_OF_THE_EARTH', 'LOC_SDG_SALT_OF_THE_EARTH', 'LOC_SDG_SALT_OF_THE_EARTH_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;
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
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_JONAH', 'LOC_SDG_JONAH', 'LOC_SDG_JONAH_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;
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
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_PEARL_OF_GREAT_PRICE', 'LOC_SDG_PEARL_OF_GREAT_PRICE', 'LOC_SDG_PEARL_OF_GREAT_PRICE_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;
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
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_TURTLES_ALL_THE_WAY_DOWN', 'LOC_SDG_TURTLES_ALL_THE_WAY_DOWN', 'LOC_SDG_TURTLES_ALL_THE_WAY_DOWN_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;
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
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_I_AM_DEATH', 'LOC_SDG_I_AM_DEATH', 'LOC_SDG_I_AM_DEATH_DESCRIPTION', 'SDG_BELIEF_CLASS_199') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 9 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_199' ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_I_AM_DEATH', 'SDG_I_AM_DEATH_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_I_AM_DEATH_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_I_AM_DEATH_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_I_AM_DEATH_SCIENCE_ON_URANIUM') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_I_AM_DEATH_SCIENCE_ON_URANIUM', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_URANIUM') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_I_AM_DEATH_SCIENCE_ON_URANIUM', 'YieldType', 'YIELD_SCIENCE'),
							  ('SDG_I_AM_DEATH_SCIENCE_ON_URANIUM', 'Amount', 5) ;