-- Function
CREATE FUNCTION AVERAGE_USER_AGE() RETURNS DECIMAL(5,2)
AS
BEGIN
DECLARE @AVG_AGE DECIMAL(5,2), @USER_COUNT INTEGER, @TOTAL_AGE INTEGER
SELECT @TOTAL_AGE = SUM(DATEDIFF(year, date_of_birth, GETDATE())) 
FROM Users
WHERE date_of_birth IS NOT NULL
SELECT @USER_COUNT = COUNT(id)
FROM Users
WHERE date_of_birth IS NOT NULL
SELECT @AVG_AGE = (@TOTAL_AGE + 0.01) / @USER_COUNT
RETURN @AVG_AGE
END

SELECT DBO.AVERAGE_USER_AGE()


-- Procedure
CREATE PROCEDURE SUB_USERS_COUNT
AS
SELECT s.[name], COUNT(u.id)
FROM Users u JOIN SubscriptionPlan s
ON u.subscription_plan = s.id
GROUP BY s.[name]

EXEC SUB_USERS_COUNT

-- Trigger
CREATE TRIGGER TRG_NEW_USER_SETTINGS
ON Users
AFTER INSERT
AS
	INSERT INTO Settings (user_id, auto_mix, auto_play, mono_audio, normalize_sound_volume, play_no_pause, smooth_transition_seconds)
	SELECT
		I.id,
		1,
		1,
		0,
		1,
		1,
		0
	FROM INSERTED I