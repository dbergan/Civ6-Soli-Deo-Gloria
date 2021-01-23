INSERT INTO Parameters (ParameterId, Name, Description, 
Domain, DefaultValue, ConfigurationGroup, ConfigurationId, GroupId, Visible, ReadOnly,
SupportsSinglePlayer, SupportsLANMultiplayer, SupportsInternetMultiplayer, SupportsHotSeat, SupportsPlayByCloud,
ChangeableAfterGameStart, ChangeableAfterPlayByCloudMatchCreate, SortIndex) VALUES 


('SDG_OLYMPIC_PANTHEONS', 'SDG - Olympic Pantheons', 'Pantheon overhaul', 
'bool', 1, 'Game', 'SDG_OLYMPIC_PANTHEONS', 'GameOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 81),

('SDG_REMOVE_CONDEMN_HERETIC', 'SDG - Remove Condemn Heretic', 'Removes the Condemn Heretic action from military units', 
'bool', 1, 'Game', 'SDG_REMOVE_CONDEMN_HERETIC', 'GameOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 82),

('SDG_ONE_CLEANSE_INQUISITORS', 'SDG - Inquisitors: Only 1 Cleanse', 'Inquisitors only get one cleansing charge each, instead of the usual three (and don''t get bonus charges from Mosques or the Exodus of the Evangelicals golden age commemoration)', 
'bool', 1, 'Game', 'SDG_ONE_CLEANSE_INQUISITORS', 'GameOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 83),

('SDG_DONT_NEED_INQUISITION', 'SDG - Inquisitors: Don''t Need An Inquisition', 'Removes inquisitions from the game. Inquisitors can simply be purchased with faith from a Temple.', 
'bool', 1, 'Game', 'SDG_DONT_NEED_INQUISITION', 'GameOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 84),

('SDG_INQUISITORS_FROM_SHRINES', 'SDG - Inquisitors: Purchased from Shrines', 'Instead of Temples', 
'bool', 1, 'Game', 'SDG_INQUISITORS_FROM_SHRINES', 'GameOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 85),

('SDG_RELIGIOUS_UNITS_TWO_MOVES', 'SDG - Religious Units: Only 2 Movement', 'Missionaries, Apostles, Inquisitors and Gurus only have 2 base movement. Normally they have 4, which makes them better scouts than Scouts.', 
'bool', 1, 'Game', 'SDG_RELIGIOUS_UNITS_TWO_MOVES', 'GameOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 86),

('SDG_NO_RELIGIOUS_SEA_SPIES', 'SDG - No Religious Sea-Spies', 'Religious units can only enter water tiles when they are adjacent to a naval unit. If a religious unit is embarked and naval units are no longer adjacent to it, it will die at the end of the turn.', 
'bool', 1, 'Game', 'SDG_NO_RELIGIOUS_SEA_SPIES', 'GameOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 87),

('SDG_ALL_HS3_BUILDINGS', 'SDG - All Holy Site Buildings', 'All level 3 Holy Site buildings (Cathedral, Mosque, Pagoda, etc.) are available when the Divine Right civic is obtained. The Worship ("building") class of beliefs is removed.', 
'bool', 1, 'Game', 'SDG_ALL_HS3_BUILDINGS', 'GameOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 88),

('SDG_CATHEDRALS_HOLD_RELICS', 'SDG - Cathedrals Hold Relics', 'Cathedrals can hold religious art, a relic, or a piece of music. Normally they can only hold religious art.', 
'bool', 1, 'Game', 'SDG_CATHEDRALS_HOLD_RELICS', 'GameOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 89),

('SDG_KOTOKUIN_TO_THEOLGY', 'SDG - Kotoku-In Moved To Theology', 'Kotoku-In (wonder) moves from the Divine Right civic to the Theology civic and its production cost changes from 710 to 400', 
'bool', 1, 'Game', 'SDG_KOTOKUIN_TO_THEOLGY', 'GameOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 90),


('SDG_ALL_CUSTOM_NAMES', 'SDG - All Custom Names', 'The names for all relgions can be customized, but the AI chooses blank names', 
'bool', 0, 'Game', 'SDG_ALL_CUSTOM_NAMES', 'GameOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 93),

('SDG_DOUBLE_BELIEFS', 'SDG - Double Beliefs', 'Players get 2 beliefs for each Great Prophet instead of just 1', 
'bool', 0, 'Game', 'SDG_DOUBLE_BELIEFS', 'GameOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 94),

('SDG_COMBAT_DOESNT_PRESSURE', 'SDG - Combat Doesn''t Pressure', 'Theological Combat no longer affects the religious pressure in nearby cities', 
'bool', 0, 'Game', 'SDG_COMBAT_DOESNT_PRESSURE', 'GameOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 95),

('SDG_BUY_HSBUILDINGS_WITH_FAITH', 'SDG - Buy Holy Site Buildings With Faith', 'All Holy Site buildings can be purchased with gold or faith by default', 
'bool', 0, 'Game', 'SDG_BUY_HSBUILDINGS_WITH_FAITH', 'GameOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 96),

('SDG_MARTYRS_LOSE_CS', 'SDG - Weak Martyrs', 'Apostles with a Martyr promotion lose 100 combat strength (110 --> 10; spread strength does not change). They still create a relic upon death.', 
'bool', 0, 'Game', 'SDG_MARTYRS_LOSE_CS', 'GameOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 97),

('SDG_REMOVE_HEATHEN_CONVERSION', 'SDG - Remove Heathen Conversion', 'Removes the Heathen Conversion promotion from Apostles', 
'bool', 0, 'Game', 'SDG_REMOVE_HEATHEN_CONVERSION', 'GameOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 98),

('SDG_RELIGION_TESTER_HELPER', 'SDG - Religion Tester', 'Super-Fast religion gameplay values to help me test my religion mods more quickly', 
'bool', 0, 'Game', 'SDG_RELIGION_TESTER_HELPER', 'GameOptions', 1, 0, 
1, 1, 1, 1, 1, 
0, 0, 99)

;