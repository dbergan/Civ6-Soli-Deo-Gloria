-- Requirements to test for city having a Holy Site or Lavra
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
                            ("DB_REQSET_CITY_HAS_HOLY_SITE_OR_LAVRA", "REQUIREMENTSET_TEST_ANY") ;
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
                                       ("DB_REQSET_CITY_HAS_HOLY_SITE_OR_LAVRA", "REQUIRES_CITY_HAS_HOLY_SITE"),
									   ("DB_REQSET_CITY_HAS_HOLY_SITE_OR_LAVRA", "REQUIRES_CITY_HAS_LAVRA") ;

-- All HS buildings can be purchased with Gold
UPDATE Buildings SET PurchaseYield = "YIELD_GOLD" WHERE PrereqDistrict = "DISTRICT_HOLY_SITE" AND PurchaseYield = "YIELD_FAITH" ;

-- Game Modifier to allow all HS building to be purchased with Faith
INSERT INTO GameModifiers (ModifierId) VALUES ("DB_HSBUILDINGS_FAITH_PURCHASE") ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ("DB_HSBUILDINGS_FAITH_PURCHASE", "MODIFIER_ALL_CITIES_ATTACH_MODIFIER", "DB_REQSET_CITY_HAS_HOLY_SITE_OR_LAVRA") ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ("DB_HSBUILDINGS_FAITH_PURCHASE", "ModifierId", "DB_HSBUILDINGS_FAITH_PURCHASE_MODIFIER") ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ("DB_HSBUILDINGS_FAITH_PURCHASE_MODIFIER", "MODIFIER_CITY_ENABLE_BUILDING_FAITH_PURCHASE") ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ("DB_HSBUILDINGS_FAITH_PURCHASE_MODIFIER", "DistrictType", "DISTRICT_HOLY_SITE") ;
