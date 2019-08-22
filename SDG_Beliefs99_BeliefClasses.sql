/*
-- Put all beliefs in their own BeliefClass (so the AI will choose them)
INSERT OR REPLACE INTO Beliefs (BeliefType, Name, Description, BeliefClassType)
SELECT a.BeliefType, 'LOC_' || a.BeliefType, 'LOC_' || a.BeliefType || '_DESCRIPTION', 'SDG_BELIEF_CLASS_' || cast(COUNT(b.BeliefType) + 9 as text)
  FROM Beliefs AS a
  INNER JOIN Beliefs AS b ON b.BeliefType LIKE 'SDG_%' AND b.BeliefType NOT LIKE 'SDG_FOLLOWER%' AND b.BeliefType NOT LIKE 'SDG_BLANK%' AND a.BeliefType >= b.BeliefType
  WHERE a.BeliefType LIKE 'SDG_%' AND a.BeliefType NOT LIKE 'SDG_FOLLOWER%' AND a.BeliefType NOT LIKE 'SDG_BLANK%' GROUP BY a.BeliefType ;
*/
