INSERT INTO Feature ([name])
VALUES ('No Ads'), ('Song Skip'), ('Song Download'), ('High Audio Quality')
GO

INSERT INTO SubscriptionPlan ([name])
VALUES	('Pro'), -- No Ads, Song Skip, High Audio Quality
		('Full Premium') -- No Ads, Song Skip, High Audio Quality, Song Download
GO

INSERT INTO Users (username, email, password, date_of_birth, subscription_plan)
VALUES	('vsl700', 'Vasil Chushev', '3$293484$fhdshoifhoaiioh', '04-01-2003', 2),
		('cris6666', 'Kris', 'oi40rug09u0u933ujff', NULL, NULL),
		('valko7', 'Vulyo', 'kjfpo9wjt9t4', NULL, 1),
		('kris1234', 'Christyan', 'fok043i-0', '12-04-2005', 1),
		('maria69', 'Maria Nikolova', '453tgge54', NULL, NULL)
GO

INSERT INTO Settings (user_id, play_no_pause, auto_mix, smooth_transition_seconds, auto_play, mono_audio, normalize_sound_volume)
VALUES	(1, 0, 1, 3, 1, 0, 1),
		(2, 0, 0, 0, 1, 0, 0),
		(3, 1, 0, 5, 0, 1, 1),
		(4, 1, 0, 4, 0, 0, 1),
		(5, 1, 1, 2, 1, 0, 0)
GO

INSERT INTO Artist (artist_name, artist_info, user_id)
VALUES	('DJ VASCii', 'Greatest Techno DJ ever!', 1),
		('DJ KRISSS', 'Born in the Balkans, living in America, creating Indian jams', 2),
		('Guns N Roses', 'Best Rock band ever!', 5)
GO

INSERT INTO Song ([name], release_date)
VALUES	('Welcome to the jungle', CONVERT(DATE,'21-07-1987', 105)), -- Guns N' Roses
		('Shadow of your love', CONVERT(DATE,'04-05-2018', 105)),
		('Paradise City', CONVERT(DATE,'13-01-1989', 105)),
		('Jamming Summer', NULL), -- DJ VASCii
		('Jamming Winter', NULL),
		('Gasolina Bhangra Remix', NULL) -- DJ KRISSS feat. DJ VASCii
GO

INSERT INTO Album ([name], cover_pic)
VALUES	('Greatest Hits', 'some_link'), -- Guns N Roses
		('Jamming Seasons', 'some_link'), -- DJ VASCii
		('Appetite for Destruction', 'some_link') -- Guns N Roses
GO

INSERT INTO Playlist ([name], cover_pic)
VALUES	('Rock Music', 'some_link'), -- 1 2 3
		('Summer Music', 'some_link'), -- 4
		('Techno', 'some_link') -- 4 5 6
GO


-- Many-to-many trunk tables
INSERT INTO SubscriptionPlan_Feature (subscription_plan_id, feature_id)
VALUES	(1, 1),
		(1, 2),
		(1, 4),
		(2, 1),
		(2, 2),
		(2, 3),
		(2, 4)
GO

INSERT INTO SongArtist (song_id, artist_id)
VALUES	(1, 3),
		(2, 3),
		(3, 3),
		(4, 1),
		(5, 1),
		(6, 1),
		(6, 2)
GO

INSERT INTO AlbumArtist (album_id, artist_id)
VALUES	(1, 3),
		(2, 1),
		(3, 3)
GO

INSERT INTO AlbumSong (album_id, song_id)
VALUES	(1, 1),
		(1, 2),
		(1, 3),
		(2, 4),
		(2, 5),
		(3, 1),
		(3, 2),
		(3, 3)
GO

INSERT INTO AlbumUser (album_id, user_id)
VALUES	(3, 2),
		(1, 2),
		(2, 2),
		(2, 3),
		(2, 5),
		(1, 4)
GO

INSERT INTO PlaylistSong (playlist_id, song_id)
VALUES	(1, 1),
		(1, 2),
		(1, 3),
		(2, 4),
		(3, 4),
		(3, 5),
		(3, 6)
GO

INSERT INTO PlaylistUser (playlist_id, user_id)
VALUES	(1, 1),
		(1, 2),
		(1, 5),
		(3, 3)
GO