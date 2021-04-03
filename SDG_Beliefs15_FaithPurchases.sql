-- ------------------------------------
-- ------------------------------------
--  HANDCART_PIONEERS
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_HANDCART_PIONEERS', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_HANDCART_PIONEERS', 'LOC_SDG_HANDCART_PIONEERS', 'LOC_SDG_HANDCART_PIONEERS_DESCRIPTION', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_HANDCART_PIONEERS', 'SDG_HANDCART_PIONEERS_SETTLERS') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HANDCART_PIONEERS_SETTLERS', 'DB_DM_CITIES_CAN_PURCHASE_UNIT_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_HANDCART_PIONEERS_SETTLERS', 'Tag', 'CLASS_SETTLER') ;


-- ------------------------------------
-- ------------------------------------
--  HABITAT_FOR_HUMANITY
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_HABITAT_FOR_HUMANITY', 'KIND_BELIEF') ;

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_HABITAT_FOR_HUMANITY', 'LOC_SDG_HABITAT_FOR_HUMANITY', 'LOC_SDG_HABITAT_FOR_HUMANITY_DESCRIPTION', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_HABITAT_FOR_HUMANITY', 'SDG_HABITAT_FOR_HUMANITY_BUILDERS') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HABITAT_FOR_HUMANITY_BUILDERS', 'DB_DM_CITIES_CAN_PURCHASE_UNIT_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_HABITAT_FOR_HUMANITY_BUILDERS', 'Tag', 'CLASS_BUILDER') ;


-- ------------------------------------
-- ------------------------------------
--  SEA_ORG
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_SEA_ORG', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_SEA_ORG', 'LOC_SDG_SEA_ORG', 'LOC_SDG_SEA_ORG_DESCRIPTION', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SEA_ORG', 'SDG_SEA_ORG_NAVAL_UNITS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SEA_ORG_NAVAL_UNITS', 'DB_DM_CITIES_CAN_PURCHASE_UNIT_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SEA_ORG_NAVAL_UNITS', 'Tag', 'DB_CLASS_NAVAL_ALL') ;


-- ------------------------------------
-- ------------------------------------
--  PHARAOH_AND_JOSEPH
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_PHARAOH_AND_JOSEPH', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_PHARAOH_AND_JOSEPH', 'LOC_SDG_PHARAOH_AND_JOSEPH', 'LOC_SDG_PHARAOH_AND_JOSEPH_DESCRIPTION', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_PHARAOH_AND_JOSEPH', 'SDG_PHARAOH_AND_JOSEPH_FAITH_PURCHASE_GRANARY') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_PHARAOH_AND_JOSEPH_FAITH_PURCHASE_GRANARY', 'DB_DM_CITIES_CAN_PURCHASE_BUILDING_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_PHARAOH_AND_JOSEPH_FAITH_PURCHASE_GRANARY', 'BuildingType', 'BUILDING_GRANARY') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_PHARAOH_AND_JOSEPH', 'SDG_PHARAOH_AND_JOSEPH_FAITH_PURCHASE_MONUMENT') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_PHARAOH_AND_JOSEPH_FAITH_PURCHASE_MONUMENT', 'DB_DM_CITIES_CAN_PURCHASE_BUILDING_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_PHARAOH_AND_JOSEPH_FAITH_PURCHASE_MONUMENT', 'BuildingType', 'BUILDING_MONUMENT') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_PHARAOH_AND_JOSEPH', 'SDG_PHARAOH_AND_JOSEPH_GRANARY_PURCHASE_DISCOUNT') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_PHARAOH_AND_JOSEPH_GRANARY_PURCHASE_DISCOUNT', 'DB_DM_CITIES_ADJUST_BUILDING_COST', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
	('SDG_PHARAOH_AND_JOSEPH_GRANARY_PURCHASE_DISCOUNT', 'BuildingType', 'BUILDING_GRANARY'),
	('SDG_PHARAOH_AND_JOSEPH_GRANARY_PURCHASE_DISCOUNT', 'Amount', 20) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_PHARAOH_AND_JOSEPH', 'SDG_PHARAOH_AND_JOSEPH_MONUMENT_PURCHASE_DISCOUNT') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_PHARAOH_AND_JOSEPH_MONUMENT_PURCHASE_DISCOUNT', 'DB_DM_CITIES_ADJUST_BUILDING_COST', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
	('SDG_PHARAOH_AND_JOSEPH_MONUMENT_PURCHASE_DISCOUNT', 'BuildingType', 'BUILDING_MONUMENT'),
	('SDG_PHARAOH_AND_JOSEPH_MONUMENT_PURCHASE_DISCOUNT', 'Amount', 20) ;

-- ------------------------------------
-- ------------------------------------
--  NEHEMIAH
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_NEHEMIAH', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_NEHEMIAH', 'LOC_SDG_NEHEMIAH', 'LOC_SDG_NEHEMIAH_DESCRIPTION', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_NEHEMIAH', 'SDG_NEHEMIAH_FAITH_PURCHASE_WALLS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_NEHEMIAH_FAITH_PURCHASE_WALLS', 'DB_DM_CITIES_CAN_PURCHASE_BUILDING_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_NEHEMIAH_FAITH_PURCHASE_WALLS', 'BuildingType', 'BUILDING_WALLS') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_NEHEMIAH', 'SDG_NEHEMIAH_FAITH_PURCHASE_CASTLE') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_NEHEMIAH_FAITH_PURCHASE_CASTLE', 'DB_DM_CITIES_CAN_PURCHASE_BUILDING_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_NEHEMIAH_FAITH_PURCHASE_CASTLE', 'BuildingType', 'BUILDING_CASTLE') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_NEHEMIAH', 'SDG_NEHEMIAH_FAITH_PURCHASE_STAR_FORT') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_NEHEMIAH_FAITH_PURCHASE_STAR_FORT', 'DB_DM_CITIES_CAN_PURCHASE_BUILDING_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_NEHEMIAH_FAITH_PURCHASE_STAR_FORT', 'BuildingType', 'BUILDING_STAR_FORT') ;


-- ------------------------------------
-- ------------------------------------
--  YORISHIRO
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_YORISHIRO', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_YORISHIRO', 'LOC_SDG_YORISHIRO', 'LOC_SDG_YORISHIRO_DESCRIPTION', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

-- Faith Purchases
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_YORISHIRO', 'SDG_YORISHIRO_SCIENCE_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_YORISHIRO_SCIENCE_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_YORISHIRO_SCIENCE_BUILDINGS', 'DistrictType', 'DISTRICT_PRESERVE') ;

-- Discounts
INSERT INTO BeliefModifiers (BeliefType, ModifierID)
SELECT 'SDG_YORISHIRO', 'SDG_YORISHIRO_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_PRESERVE' ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
SELECT 'SDG_YORISHIRO_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'DB_DM_CITIES_ADJUST_BUILDING_COST', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_PRESERVE' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_YORISHIRO_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'BuildingType', BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_PRESERVE' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_YORISHIRO_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'Amount', 20 FROM Buildings WHERE PrereqDistrict = 'DISTRICT_PRESERVE' ;


-- ------------------------------------
-- ------------------------------------
--  JESUIT_EDUCATION
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_JESUIT_EDUCATION', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_JESUIT_EDUCATION', 'LOC_SDG_JESUIT_EDUCATION', 'LOC_SDG_JESUIT_EDUCATION_DESCRIPTION', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

-- Faith Purchases
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_JESUIT_EDUCATION', 'SDG_JESUIT_EDUCATION_SCIENCE_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_JESUIT_EDUCATION_SCIENCE_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_JESUIT_EDUCATION_SCIENCE_BUILDINGS', 'DistrictType', 'DISTRICT_CAMPUS') ;

-- Discounts
INSERT INTO BeliefModifiers (BeliefType, ModifierID)
SELECT 'SDG_JESUIT_EDUCATION', 'SDG_JESUIT_EDUCATION_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_CAMPUS' ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
SELECT 'SDG_JESUIT_EDUCATION_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'DB_DM_CITIES_ADJUST_BUILDING_COST', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_CAMPUS' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_JESUIT_EDUCATION_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'BuildingType', BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_CAMPUS' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_JESUIT_EDUCATION_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'Amount', 20 FROM Buildings WHERE PrereqDistrict = 'DISTRICT_CAMPUS' ;


-- ------------------------------------
-- ------------------------------------
--  JIHAD
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_JIHAD', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_JIHAD', 'LOC_SDG_JIHAD', 'LOC_SDG_JIHAD_DESCRIPTION', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

-- Faith Purchases
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_JIHAD', 'SDG_JIHAD_ENCAMPMENT_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_JIHAD_ENCAMPMENT_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_JIHAD_ENCAMPMENT_BUILDINGS', 'DistrictType', 'DISTRICT_ENCAMPMENT') ;

-- Discounts
INSERT INTO BeliefModifiers (BeliefType, ModifierID)
SELECT 'SDG_JIHAD', 'SDG_JIHAD_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_ENCAMPMENT' ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
SELECT 'SDG_JIHAD_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'DB_DM_CITIES_ADJUST_BUILDING_COST', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_ENCAMPMENT' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_JIHAD_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'BuildingType', BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_ENCAMPMENT' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_JIHAD_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'Amount', 20 FROM Buildings WHERE PrereqDistrict = 'DISTRICT_ENCAMPMENT' ;


-- ------------------------------------
-- ------------------------------------
--  XMAS
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_XMAS', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_XMAS', 'LOC_SDG_XMAS', 'LOC_SDG_XMAS_DESCRIPTION', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

-- Faith Purchases
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_XMAS', 'SDG_XMAS_COMMERCIAL_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_XMAS_COMMERCIAL_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_XMAS_COMMERCIAL_BUILDINGS', 'DistrictType', 'DISTRICT_COMMERCIAL_HUB') ;

-- Discounts
INSERT INTO BeliefModifiers (BeliefType, ModifierID)
SELECT 'SDG_XMAS', 'SDG_XMAS_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB' ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
SELECT 'SDG_XMAS_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'DB_DM_CITIES_ADJUST_BUILDING_COST', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_XMAS_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'BuildingType', BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_XMAS_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'Amount', 20 FROM Buildings WHERE PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB' ;


-- ------------------------------------
-- ------------------------------------
--  FISHERS_OF_MEN
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_FISHERS_OF_MEN', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_FISHERS_OF_MEN', 'LOC_SDG_FISHERS_OF_MEN', 'LOC_SDG_FISHERS_OF_MEN_DESCRIPTION', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

-- Faith Purchases
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_FISHERS_OF_MEN', 'SDG_FISHERS_OF_MEN_HARBOR_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_FISHERS_OF_MEN_HARBOR_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_FISHERS_OF_MEN_HARBOR_BUILDINGS', 'DistrictType', 'DISTRICT_HARBOR') ;

-- Discounts
INSERT INTO BeliefModifiers (BeliefType, ModifierID)
SELECT 'SDG_FISHERS_OF_MEN', 'SDG_FISHERS_OF_MEN_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HARBOR' ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
SELECT 'SDG_FISHERS_OF_MEN_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'DB_DM_CITIES_ADJUST_BUILDING_COST', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HARBOR' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_FISHERS_OF_MEN_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'BuildingType', BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HARBOR' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_FISHERS_OF_MEN_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'Amount', 20 FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HARBOR' ;


-- ------------------------------------
-- ------------------------------------
--  ECCLESIASTICAL_COMMISSION
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ECCLESIASTICAL_COMMISSION', 'KIND_BELIEF') ;

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_ECCLESIASTICAL_COMMISSION', 'LOC_SDG_ECCLESIASTICAL_COMMISSION', 'LOC_SDG_ECCLESIASTICAL_COMMISSION_DESCRIPTION', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

-- Faith Purchases
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ECCLESIASTICAL_COMMISSION', 'SDG_ECCLESIASTICAL_COMMISSION_THEATER_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ECCLESIASTICAL_COMMISSION_THEATER_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ECCLESIASTICAL_COMMISSION_THEATER_BUILDINGS', 'DistrictType', 'DISTRICT_THEATER') ;

-- Discounts
INSERT INTO BeliefModifiers (BeliefType, ModifierID)
SELECT 'SDG_ECCLESIASTICAL_COMMISSION', 'SDG_ECCLESIASTICAL_COMMISSION_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_THEATER' ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
SELECT 'SDG_ECCLESIASTICAL_COMMISSION_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'DB_DM_CITIES_ADJUST_BUILDING_COST', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_THEATER' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_ECCLESIASTICAL_COMMISSION_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'BuildingType', BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_THEATER' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_ECCLESIASTICAL_COMMISSION_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'Amount', 20 FROM Buildings WHERE PrereqDistrict = 'DISTRICT_THEATER' ;


-- ------------------------------------
-- ------------------------------------
--  SOLIDARITY
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_SOLIDARITY', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_SOLIDARITY', 'LOC_SDG_SOLIDARITY', 'LOC_SDG_SOLIDARITY_DESCRIPTION', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

-- Faith Purchases
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SOLIDARITY', 'SDG_SOLIDARITY_INDUSTRIAL_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SOLIDARITY_INDUSTRIAL_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SOLIDARITY_INDUSTRIAL_BUILDINGS', 'DistrictType', 'DISTRICT_INDUSTRIAL_ZONE') ;

-- Discounts
INSERT INTO BeliefModifiers (BeliefType, ModifierID)
SELECT 'SDG_SOLIDARITY', 'SDG_SOLIDARITY_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE' ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
SELECT 'SDG_SOLIDARITY_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'DB_DM_CITIES_ADJUST_BUILDING_COST', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_SOLIDARITY_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'BuildingType', BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_SOLIDARITY_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'Amount', 20 FROM Buildings WHERE PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE' ;


-- ------------------------------------
-- ------------------------------------
--  FAMILY_HOME_EVENING
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_FAMILY_HOME_EVENING', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_FAMILY_HOME_EVENING', 'LOC_SDG_FAMILY_HOME_EVENING', 'LOC_SDG_FAMILY_HOME_EVENING_DESCRIPTION', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

-- Faith Purchases
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_FAMILY_HOME_EVENING', 'SDG_FAMILY_HOME_EVENING_NEIGHBORHOOD_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_FAMILY_HOME_EVENING_NEIGHBORHOOD_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_FAMILY_HOME_EVENING_NEIGHBORHOOD_BUILDINGS', 'DistrictType', 'DISTRICT_NEIGHBORHOOD') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_FAMILY_HOME_EVENING', 'SDG_FAMILY_HOME_EVENING_ENTERTAINMENT_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_FAMILY_HOME_EVENING_ENTERTAINMENT_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_FAMILY_HOME_EVENING_ENTERTAINMENT_BUILDINGS', 'DistrictType', 'DISTRICT_ENTERTAINMENT_COMPLEX') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_FAMILY_HOME_EVENING', 'SDG_FAMILY_HOME_EVENING_WATER_ENTERTAINMENT_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_FAMILY_HOME_EVENING_WATER_ENTERTAINMENT_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_FAMILY_HOME_EVENING_WATER_ENTERTAINMENT_BUILDINGS', 'DistrictType', 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX') ;

-- Discounts
INSERT INTO BeliefModifiers (BeliefType, ModifierID)
SELECT 'SDG_FAMILY_HOME_EVENING', 'SDG_FAMILY_HOME_EVENING_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_NEIGHBORHOOD' OR PrereqDistrict = 'DISTRICT_ENTERTAINMENT_COMPLEX' OR PrereqDistrict = 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX' ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
SELECT 'SDG_FAMILY_HOME_EVENING_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'DB_DM_CITIES_ADJUST_BUILDING_COST', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_NEIGHBORHOOD' OR PrereqDistrict = 'DISTRICT_ENTERTAINMENT_COMPLEX' OR PrereqDistrict = 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_FAMILY_HOME_EVENING_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'BuildingType', BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_NEIGHBORHOOD' OR PrereqDistrict = 'DISTRICT_ENTERTAINMENT_COMPLEX' OR PrereqDistrict = 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_FAMILY_HOME_EVENING_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'Amount', 20 FROM Buildings WHERE PrereqDistrict = 'DISTRICT_NEIGHBORHOOD' OR PrereqDistrict = 'DISTRICT_ENTERTAINMENT_COMPLEX' OR PrereqDistrict = 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX' ;


-- ------------------------------------
-- ------------------------------------
--  JOHN_FRUM
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_JOHN_FRUM', 'KIND_BELIEF') ;

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_JOHN_FRUM', 'LOC_SDG_JOHN_FRUM', 'LOC_SDG_JOHN_FRUM_DESCRIPTION', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

-- Faith Purchases
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_JOHN_FRUM', 'SDG_JOHN_FRUM_AERODROME_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_JOHN_FRUM_AERODROME_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_JOHN_FRUM_AERODROME_BUILDINGS', 'DistrictType', 'DISTRICT_AERODROME') ;

-- Discounts
INSERT INTO BeliefModifiers (BeliefType, ModifierID)
SELECT 'SDG_JOHN_FRUM', 'SDG_JOHN_FRUM_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_AERODROME' ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
SELECT 'SDG_JOHN_FRUM_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'DB_DM_CITIES_ADJUST_BUILDING_COST', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_AERODROME' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_JOHN_FRUM_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'BuildingType', BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_AERODROME' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_JOHN_FRUM_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'Amount', 20 FROM Buildings WHERE PrereqDistrict = 'DISTRICT_AERODROME' ;

-- Airstrips
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_JOHN_FRUM', 'SDG_JOHN_FRUM_FAITH_CITY_APPLIES_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_JOHN_FRUM_FAITH_CITY_APPLIES_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_JOHN_FRUM_FAITH_CITY_APPLIES_MODIFIER', 'ModifierId', 'SDG_JOHN_FRUM_FAITH_INCREASES_ON_AIRSTRIP') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_JOHN_FRUM_FAITH_INCREASES_ON_AIRSTRIP', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_AIRSTRIP') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_JOHN_FRUM_FAITH_INCREASES_ON_AIRSTRIP', 'YieldType', 'YIELD_FAITH'),
							  ('SDG_JOHN_FRUM_FAITH_INCREASES_ON_AIRSTRIP', 'Amount', 25) ;



-- ------------------------------------
-- ------------------------------------
--  SHAKER_CELIBACY
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_SHAKER_CELIBACY', 'KIND_BELIEF') ;

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_SHAKER_CELIBACY', 'LOC_SDG_SHAKER_CELIBACY', 'LOC_SDG_SHAKER_CELIBACY_DESCRIPTION', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_PLAYERS_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_PLAYERS_ATTACH_MODIFIER', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_FOUNDED_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_PLAYERS_ATTACH_MODIFIER', 'ModifierId', 'SDG_SHAKER_CELIBACY_GROWTH') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_SHAKER_CELIBACY_GROWTH', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_GROWTH') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_GROWTH', 'Amount', -150) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_GOLD_PURCHASE_DISTRICTS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_GOLD_PURCHASE_DISTRICTS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICTS_W_GOLD', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_GOLD_PURCHASE_DISTRICTS', 'CanPurchase', '1') ;

-- Doesn't work (even though the gold one does and it's structured the same way)
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_FAITH_PURCHASE_DISTRICTS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_FAITH_PURCHASE_DISTRICTS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICTS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_FAITH_PURCHASE_DISTRICTS', 'CanPurchase', '1') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_AERODROME_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_AERODROME_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_AERODROME_BUILDINGS', 'DistrictType', 'DISTRICT_AERODROME') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_AQUEDUCT_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_AQUEDUCT_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_AQUEDUCT_BUILDINGS', 'DistrictType', 'DISTRICT_AQUEDUCT') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_CAMPUS_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_CAMPUS_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_CAMPUS_BUILDINGS', 'DistrictType', 'DISTRICT_CAMPUS') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_CANAL_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_CANAL_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_CANAL_BUILDINGS', 'DistrictType', 'DISTRICT_CANAL') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_CITY_CENTER_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_CITY_CENTER_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_CITY_CENTER_BUILDINGS', 'DistrictType', 'DISTRICT_CITY_CENTER') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_COMMERCIAL_HUB_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_COMMERCIAL_HUB_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_COMMERCIAL_HUB_BUILDINGS', 'DistrictType', 'DISTRICT_COMMERCIAL_HUB') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_DAM_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_DAM_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_DAM_BUILDINGS', 'DistrictType', 'DISTRICT_DAM') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_ENCAMPMENT_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_ENCAMPMENT_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_ENCAMPMENT_BUILDINGS', 'DistrictType', 'DISTRICT_ENCAMPMENT') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_ENTERTAINMENT_COMPLEX_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_ENTERTAINMENT_COMPLEX_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_ENTERTAINMENT_COMPLEX_BUILDINGS', 'DistrictType', 'DISTRICT_ENTERTAINMENT_COMPLEX') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_GOVERNMENT_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_GOVERNMENT_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_GOVERNMENT_BUILDINGS', 'DistrictType', 'DISTRICT_GOVERNMENT') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_HARBOR_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_HARBOR_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_HARBOR_BUILDINGS', 'DistrictType', 'DISTRICT_HARBOR') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_HOLY_SITE_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_HOLY_SITE_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_HOLY_SITE_BUILDINGS', 'DistrictType', 'DISTRICT_HOLY_SITE') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_INDUSTRIAL_ZONE_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_INDUSTRIAL_ZONE_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_INDUSTRIAL_ZONE_BUILDINGS', 'DistrictType', 'DISTRICT_INDUSTRIAL_ZONE') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_NEIGHBORHOOD_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_NEIGHBORHOOD_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_NEIGHBORHOOD_BUILDINGS', 'DistrictType', 'DISTRICT_NEIGHBORHOOD') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_SPACEPORT_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_SPACEPORT_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_SPACEPORT_BUILDINGS', 'DistrictType', 'DISTRICT_SPACEPORT') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_THEATER_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_THEATER_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_THEATER_BUILDINGS', 'DistrictType', 'DISTRICT_THEATER') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_WATER_ENTERTAINMENT_COMPLEX_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_WATER_ENTERTAINMENT_COMPLEX_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_WATER_ENTERTAINMENT_COMPLEX_BUILDINGS', 'DistrictType', 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_UNITS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_UNITS', 'DB_DM_CITIES_CAN_PURCHASE_UNIT_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_UNITS', 'Tag', 'DB_CLASS_ALL') ;
