/*
-- all players that play QB
-- Q1
select nameFull
from players
where position = "QB";
*/

/*
-- players under 6 feet
-- Q2
select nameFull
from players
where heightInches <= 72;
*/

/*
-- passers that made a pass
-- Q3
select distinct nameFull
from players as PL, passer as PR
where PR.playerId = PL.playerId
    and PR.passPosition = "WR"
    and PR.passComp = 1;
*/

/*
-- runners with at least 7 TDs
-- Q4
select P.nameFull as Players
from players as P, rusher as RS
where P.playerId = RS.playerId
    and P.position = "RB"
group by P.playerID
having count(RS.rushTD) >= 7;
*/

/*
-- games with a final score difference less than one touchdown
-- Q5
select week, winningTeam
from games
where (homeTeamFinalScore - visitingTeamFinalScore) < 6;
*/

/*
--entering new players into tables
-- Q6
insert into players values(99999999, "John Doe", "LB", 73, 240, "1999-01-01");
*/

/*
-- update players weight
-- Q7
update players
set weight = 245
where playerID = 99999999;
*/

/*
-- checking to see if updates worked
-- Q8
select *
from players
where playerId = 99999999;
*/

/*
-- players that have both rushed more than 15 yards w/ a touchdown
-- Q9
select distinct nameFull
from players as P, rusher as RB, receiver as RS
where P.playerId = RB.playerId
    and RB.playerId = RS.playerId
    and RS.recYards > 15
    and RB.rushTD >= 1;
*/


/*
-- player that are 30
-- Q10
select nameFull, dob
from players
where dob like "%1990";
*/

/*
--Lbs with a pick and 5 sacks
-- Q11
select nameFull
from players as P, interceptions as I, sacks as S
where P.playerId = I.playerId
    and I.playerId = S.playerId
    and S.sackNull = 0
    and sackPosition = "LB"
    and I.intPosition = "LB"
    and I.int = 1
    and I.intNull = 0
group by I.playerId
having count(S.sackNull) = 5;
*/

/*
-- players with most solo tackles in a team
-- Q12
select T1.playerId, sum(T1.tackleYdsScrim)
from tackles as T1, tackles as T2
where T1.teamId = T2.teamId
    and T1.tackleType = "solo"
    and T1.playerId != T2.playerId
group by T1.teamId
order by sum(T1.tackleYdsScrim) desc;
*/

/*
-- players with pass defenses and sacks
-- Q13
select P.nameFull, P.playerId
from players as P, passDef as I, 
        (SELECT playerId
            from sacks
            where sackNull = 0
            group by playerId
            having count(sackId) >= 1) as F
where F.playerId = I.playerId
    and I.passDefNull = 0
    and F.playerId = P.playerId
group by F.playerId
having count(I.passDefId) >= 1;
*/


/*
-- remove entries
-- Q14
delete from plays
where playId = 30298;
*/

/*
-- teams in 2004 that played in the playoffs
-- Q15
select homeTeamId, visitorTeamId
from games
where seasonType != "PRE" 
    and seasonType != "REG"
    and season = 2004;
*/

/*
-- winners of superbowls
-- Q16
select season, winningTeam
from games
where seasonType = "SB";
*/

/*
-- players that had a forced turnover
-- Q17
select playerId
from fumbles
where fumType = "forced"
    and fumTurnover = 1
    and fumNull = 0
group by playerId
UNION
select playerId
from interceptions as I
where I.intNull = 0
    and I.int = 1
group by playerId;
*/

/*
-- players with a rushing touchdown to the left side and a catch
-- Q18
select playerId
from receiver
where recNull = 0
    and rec = 1
    and recEnd = "in bounds"
group by playerId
INTERSECT
select playerId
from rusher
where rushDirection = "left"
    and rushPrimary = 1
    and rushTd = 1
    and rushNull = 0
group by playerId;
*/

/*
-- players that had a TD called back by penatly
-- Q19
select playerId
from rusher
where rushPrimary = 1
    and rushTd = 1
    and rushNull = 1;
*/

/*
-- total rushing yards in a game
-- Q20
select G.gameId, sum(rushYards) as home
from games as G, rusher as R, plays as P
where G.gameId = P.gameId
    and P.playId = R.playId
    and G.homeTeamId = R.teamId
UNION
select G.gameId, sum(rushYards) as visitors
from games as G, rusher as R, plays as P
where G.gameId = P.gameId
    and P.playId = R.playId
    and G.visitorTeamId = R.teamId;
*/





/*CREATE TABLE games(
    gameId DECIMAL(6, 0) NOT NULL,
    season DECIMAL(5, 0) NOT NULL,
    week DECIMAL(3, 0) NOT NULL,
    homeTeamId DECIMAL(5, 0) NOT NULL,
    visitorTeamId DECIMAL(5, 0) NOT NULL,
    seasonType VARCHAR(5, 0) NOT NULL,
    weekNameAbbr VARCHAR(8, 0) NOT NULL,
    homeTeamFinalScore DECIMAL(4, 0) NOT NULL,
    visitingTeamFinalScore DECIMAL(4, 0) NOT NULL,
    winningTeam DECIMAL(5, 0) NOT NULL
);*/

/*CREATE TABLE players(
    playerId decimal(10, 0) not null,
    nameFull varchar(30, 0) not null,
    position varchar(3, 0) not null,
    heightInches decimal(3, 0) not null,
    weight decimal(4, 0) not null,
    dob varchar(12, 0) not null
);*/

/*
CREATE TABLE fumbles(
    fumId decimal(10, 0) not null,
    playId decimal(10, 0) not null,
    teamId decimal(6, 0) not null,
    playerId decimal(10, 0) not null,
    fumPosition varchar(6, 0) not null,
    fumType varchar(10, 0) not null,
    fumOOB decimal(2, 0) not null,
    fumTurnover decimal(2, 0) not null,
    fumNull decimal(2, 0) not null
);
*/
/*
CREATE TABLE interceptions(
    interceptionId decimal(10, 0) not null,
    playId decimal(10, 0) not null,
    teamId decimal(6, 0) not null,
    playerId decimal(10, 0) not null,
    intPosition varchar(6, 0) not null,
    int decimal(2, 0) not null,
    intYards decimal(3, 0) not null,
    intTd decimal(2, 0) not null,
    intNull decimal(2, 0) not null
);
*/
/*
CREATE TABLE passDef(
    passDefId decimal(10, 0) not null,
    playId decimal(10, 0) not null,
    teamId decimal(6, 0) not null,
    playerId decimal(10, 0) not null,
    passDefPosition varchar(6, 0) not null,
    passDefNull decimal(2, 0) not null
);
*/
/*
CREATE TABLE sacks(
    sackId decimal(10, 0) not null,
    playId decimal(10, 0) not null,
    teamId decimal(6, 0) not null,
    playerId decimal(10, 0) not null,
    sackPosition varchar(10, 0) not null,
    sackYards decimal(3, 0) not null,
    sackNull decimal(2, 0) not null
);
*/


/*
CREATE TABLE tackles(
    tackleId decimal(10, 0) not null,
    playId decimal(10, 0) not null,
    teamId decimal(6, 0) not null,
    playerId decimal(10, 0) not null,
    tacklePosition varchar(8, 0) not null,
    tackleType varchar(10, 0) not null,
    tackleYdsScrim decimal(3, 1) not null,
    tackleNull decimal(2, 0) null
);*/

/*
CREATE TABLE passer(
    passId decimal(10, 0) not null,
    playId decimal(10, 0) not null,
    teamId decimal(6, 0) not null,
    playerId decimal(10, 0) not null,
    passPosition varchar(8, 0) not null,
    passOutcome varchar(12, 0) not null,
    passDirection varchar(8, 0) not null,
    passDepth varchar(8, 0) not null,
    passLength decimal(5, 0) not null,
    passComp decimal(3, 0) not null,
    passNull decimal(2, 0) not null
);*/

/*
CREATE TABLE receiver(
    receiverId decimal(10, 0) not null,
    playId decimal(10, 0) not null,
    teamId decimal(6, 0) not null,
    playerId decimal(10, 0) not null,
    recPosition varchar(8, 0) not null,
    recYards decimal(3, 0) not null,
    rec decimal(2, 0) not null,
    recYac decimal(3, 0) not null,
    rec1down decimal(2, 0) not null,
    recEnd varchar(20, 0) not null,
    recNull decimal(2, 0) not null
);
*/

/*
CREATE TABLE rusher(
    rushId decimal(10, 0) not null,
    playId decimal(10, 0) not null,
    teamId decimal(6, 0) not null,
    playerId decimal(10, 0) not null,
    rushPosition varchar(8, 0) not null,
    rushType varchar(15, 0) not null,
    rushDirection varchar(8, 0) not null,
    rushLandmark varchar(10, 0) not null,
    rushYards decimal(3, 0) not null,
    rushPrimary decimal(3, 0) not null,
    rushTd decimal(3, 0) not null,
    rushEnd varchar(15, 0) not null,
    rushNull decimal(2, 0) not null
);
*/

/*
CREATE TABLE plays(
    playId decimal(10, 0) not null,
    gameId decimal(10, 0) not null,
    playSequence decimal(10, 0) not null,
    quarter decimal(5, 0) not null,
    possessionTeamId decimal(10, 0) not null,
    nonpossessionTeamId decimal(10, 0) not null,
    playType varchar(15, 0) not null,
    playType2 varchar(15, 0) not null,
    playTypeDetailed varchar(30, 0) not null,
    playNumberByTeam decimal(10, 0) not null,
    gameClockSecondsExpired decimal(10, 0) not null,
    gameClockStoppedAfterPlay decimal(10, 0) not null,
    down decimal(5, 0) not null,
    distance decimal(5, 0) not null,
    distanceToGoalPre decimal(5, 0) not null,
    changePossession decimal(3, 0) not null,
    turnover decimal(3, 0) not null,
    safety decimal(3, 0) not null,
    offensiveYards decimal(5, 0) not null,
    netYards decimal(5, 0) not null,
    firstDown decimal(3, 0) not null,
    efficientPlay decimal(3, 0) not null,
    scorePossession decimal(5, 0) not null,
    scoreNonpossession decimal(5, 0) not null,
    homeScorePre decimal(5, 0) not null,
    visitingScorePre decimal(5, 0) not null,
    homeScorePost decimal(5, 0) not null,
    visitingScorePost decimal(5, 0) not null,
    distanceToGoalPost decimal(8, 0) not null
);
*/

/*
CREATE TABLE conferences(
    confId decimal(2, 0),
    confName varchar(12, 0)
);
*/

--DROP TABLE conferences;
/*
INSERT INTO conferences
VALUES (8, "NFC NORTH");
*/
/*
.mode "csv"
.separator ","
.import data/games.csv game
*/