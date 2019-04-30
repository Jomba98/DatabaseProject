CREATE TABLE 'States' (
  'StateId' int(11) NOT NULL,
  'StateName' varchar(50) NOT NULL,
  PRIMARY KEY ('StateId')
);


CREATE TABLE 'HeartDeaths' (
  'StateID' int(11) NOT NULL,
  'DeathRate' float DEFAULT NULL,
  'Deaths' float DEFAULT NULL,
  CONSTRAINT 'FK_StatesHeartDeaths' 
  FOREIGN KEY ('StateID') REFERENCES 'States' ('StateId')
);


CREATE TABLE 'MedianIncome' (
  'StateID' int(11) NOT NULL,
  'MedianIncome' float DEFAULT NULL,
  CONSTRAINT 'FK_StatesMedianIncome' 
  FOREIGN KEY ('StateID') REFERENCES 'States' ('StateId')
);


CREATE TABLE 'Medicare' (
  'StateID' int(11) NOT NULL,
  'Population' int(11) NOT NULL,
  'MedicareEnrollment' int(11) DEFAULT NULL,
  'OriginalMedicare' int(11) DEFAULT NULL,
  'OriginalMedicareRate' float DEFAULT NULL,
  'MedAdvantage' int(11) DEFAULT NULL,
  'MedAdvantageRate' float DEFAULT NULL,
  'TotalEnrollMetro' int(11) DEFAULT NULL,
  'TotalEnrollMicro' int(11) DEFAULT NULL,
  'TotalEnrollmentNCBSA' int(11) DEFAULT NULL,
  'EnrollmentRate' float DEFAULT NULL,
  CONSTRAINT 'FK_StatesMedicare' 
  FOREIGN KEY ('StateID') REFERENCES 'States' ('StateId')
);


CREATE INDEX StateInd 
	ON States(StateId);

CREATE INDEX FK_StatesMedicare 
	ON States(StateId);

CREATE INDEX FK_StatesMedianIncome 
	ON States(StateId);

CREATE INDEX FK_StatesHeartDeaths 
	ON States(StateId);

CREATE VIEW MedianIncomeView AS 
	SELECT StateID, MedianIncome 
	FROM MedianIncome;   

CREATE VIEW DeathRate AS 
	SELECT StateID, DeathRate 
	FROM HeartDeaths;

CREATE VIEW EnrollmentRate AS 
	SELECT StateID, EnrollmentRate 
	FROM Medicare;

CREATE VIEW TopDeathRates AS
	SELECT StateID, DeathRate
	FROM HeartDeaths
	ORDER BY DeathRate
	LIMIT 10;

CREATE VIEW TopMedEnrollment AS
	SELECT StateID, EnrollmentRate
	FROM Medicare
	ORDER BY EnrollmentRate DESC
	LIMIT 10;

CREATE VIEW LowestMedEnrollment AS
	SELECT StateID, EnrollmentRate
	FROM Medicare
	ORDER BY DeathRate
	LIMIT 10;

CREATE VIEW LowestMedianIncome AS
	SELECT StateID, MedianIncome
	FROM MedianIncome
	ORDER BY MedianIncome
	LIMIT 10;



SELECT DeathRate FROM HeartDeaths
	WHERE StateID IN (SELECT StateId FROM States
		WHERE StateName = 'TEXAS');
