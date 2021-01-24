INSERT INTO Parameters (ParameterId, Name, Description, 
Domain, DefaultValue, ConfigurationGroup, ConfigurationId, GroupId, Visible, ReadOnly,
SupportsSinglePlayer, SupportsLANMultiplayer, SupportsInternetMultiplayer, SupportsHotSeat, SupportsPlayByCloud,
ChangeableAfterGameStart, ChangeableAfterPlayByCloudMatchCreate, SortIndex) VALUES 


('SDG_OLYMPIC_PANTHEONS', 'Olympic Pantheons', 'Pantheon overhaul[NEWLINE][NEWLINE][COLOR_Red]from mod "Soli Deo Gloria"[ENDCOLOR]', 
'bool', 1, 'Game', 'SDG_OLYMPIC_PANTHEONS', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 320),

('SDG_REMOVE_CONDEMN_HERETIC', 'Remove Condemn Heretic', 'Removes the Condemn Heretic action from military units[NEWLINE][NEWLINE][COLOR_Red]from mod "Soli Deo Gloria"[ENDCOLOR]', 
'bool', 1, 'Game', 'SDG_REMOVE_CONDEMN_HERETIC', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 321),

('SDG_ONE_CLEANSE_INQUISITORS', 'Inquisitors: Only 1 Cleanse', 'Inquisitors only get one cleansing charge each, instead of the usual three (and don''t get bonus charges from Mosques or the Exodus of the Evangelicals golden age commemoration)[NEWLINE][NEWLINE][COLOR_Red]from mod "Soli Deo Gloria"[ENDCOLOR]', 
'bool', 1, 'Game', 'SDG_ONE_CLEANSE_INQUISITORS', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 322),

('SDG_DONT_NEED_INQUISITION', 'Inquisitors: Don''t Need An Inquisition', 'Removes inquisitions from the game. Inquisitors can simply be purchased with faith from a Temple.[NEWLINE][NEWLINE][COLOR_Red]from mod "Soli Deo Gloria"[ENDCOLOR]', 
'bool', 1, 'Game', 'SDG_DONT_NEED_INQUISITION', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 323),

('SDG_INQUISITORS_FROM_SHRINES', 'Inquisitors: Purchased from Shrines', 'Instead of Temples[NEWLINE][NEWLINE][COLOR_Red]from mod "Soli Deo Gloria"[ENDCOLOR]', 
'bool', 1, 'Game', 'SDG_INQUISITORS_FROM_SHRINES', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 324),

('SDG_RELIGIOUS_UNITS_TWO_MOVES', 'Religious Units: Only 2 Movement', 'Missionaries, Apostles, Inquisitors and Gurus only have 2 base movement. Normally they have 4, which makes them better scouts than Scouts.[NEWLINE][NEWLINE][COLOR_Red]from mod "Soli Deo Gloria"[ENDCOLOR]', 
'bool', 1, 'Game', 'SDG_RELIGIOUS_UNITS_TWO_MOVES', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 325),

('SDG_NO_RELIGIOUS_SEA_SPIES', 'No Religious Sea-Spies', 'Religious units can only enter water tiles when they are adjacent to a naval unit. If a religious unit is embarked and naval units are no longer adjacent to it, it will die at the end of the turn.[NEWLINE][NEWLINE][COLOR_Red]from mod "Soli Deo Gloria"[ENDCOLOR]', 
'bool', 1, 'Game', 'SDG_NO_RELIGIOUS_SEA_SPIES', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 326),

('SDG_ALL_HS3_BUILDINGS', 'All Holy Site Buildings', 'All level 3 Holy Site buildings (Cathedral, Mosque, Pagoda, etc.) are available when the Divine Right civic is obtained. The Worship ("building") class of beliefs is removed.[NEWLINE][NEWLINE][COLOR_Red]from mod "Soli Deo Gloria"[ENDCOLOR]', 
'bool', 1, 'Game', 'SDG_ALL_HS3_BUILDINGS', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 327),

('SDG_CATHEDRALS_HOLD_RELICS', 'Cathedrals Hold Relics', 'Cathedrals can hold religious art, a relic, or a piece of music. Normally they can only hold religious art.[NEWLINE][NEWLINE][COLOR_Red]from mod "Soli Deo Gloria"[ENDCOLOR]', 
'bool', 1, 'Game', 'SDG_CATHEDRALS_HOLD_RELICS', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 328),

('SDG_KOTOKUIN_TO_THEOLGY', 'Kotoku-In Moved To Theology', 'Kotoku-In (wonder) moves from the Divine Right civic to the Theology civic and its production cost changes from 710 to 400[NEWLINE][NEWLINE][COLOR_Red]from mod "Soli Deo Gloria"[ENDCOLOR]', 
'bool', 1, 'Game', 'SDG_KOTOKUIN_TO_THEOLGY', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 329),


('SDG_ALL_CUSTOM_NAMES', 'All Religions Can Have Custom Names', 'The names for all relgions can be customized, but the AI chooses blank names[NEWLINE][NEWLINE][COLOR_Red]from mod "Soli Deo Gloria"[ENDCOLOR]', 
'bool', 0, 'Game', 'SDG_ALL_CUSTOM_NAMES', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 340),

('SDG_DOUBLE_BELIEFS', 'Double Beliefs', 'Players get 2 beliefs for each Great Prophet instead of just 1[NEWLINE][NEWLINE][COLOR_Red]from mod "Soli Deo Gloria"[ENDCOLOR]', 
'bool', 0, 'Game', 'SDG_DOUBLE_BELIEFS', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 341),

('SDG_COMBAT_DOESNT_PRESSURE', 'Combat Doesn''t Pressure', 'Theological Combat no longer affects the religious pressure in nearby cities[NEWLINE][NEWLINE][COLOR_Red]from mod "Soli Deo Gloria"[ENDCOLOR]', 
'bool', 0, 'Game', 'SDG_COMBAT_DOESNT_PRESSURE', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 342),

('SDG_BUY_HSBUILDINGS_WITH_FAITH', 'Buy Holy Site Buildings With Faith', 'All Holy Site buildings can be purchased with gold or faith by default[NEWLINE][NEWLINE][COLOR_Red]from mod "Soli Deo Gloria"[ENDCOLOR]', 
'bool', 0, 'Game', 'SDG_BUY_HSBUILDINGS_WITH_FAITH', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 343),

('SDG_MARTYRS_LOSE_CS', 'Weak Martyrs', 'Apostles with a Martyr promotion lose 100 combat strength (110 --> 10; spread strength does not change). They still create a relic upon death.[NEWLINE][NEWLINE][COLOR_Red]from mod "Soli Deo Gloria"[ENDCOLOR]', 
'bool', 0, 'Game', 'SDG_MARTYRS_LOSE_CS', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 344),

('SDG_REMOVE_HEATHEN_CONVERSION', 'Remove Heathen Conversion', 'Removes the Heathen Conversion promotion from Apostles[NEWLINE][NEWLINE][COLOR_Red]from mod "Soli Deo Gloria"[ENDCOLOR]', 
'bool', 0, 'Game', 'SDG_REMOVE_HEATHEN_CONVERSION', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 345),

('SDG_RELIGION_TESTER_HELPER', 'Religion Tester', 'Super-Fast religion gameplay values to help me test my religion mods more quickly[NEWLINE][NEWLINE][COLOR_Red]from mod "Soli Deo Gloria"[ENDCOLOR]', 
'bool', 0, 'Game', 'SDG_RELIGION_TESTER_HELPER', 'AdvancedOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 346)

;