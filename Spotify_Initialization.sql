CREATE DATABASE spotify
GO
USE spotify
GO

CREATE TABLE SubscriptionPlan (
    id INT IDENTITY (1,1) PRIMARY KEY,
    name VARCHAR(255) NOT NULL
)
GO

CREATE TABLE Feature (
    id INT IDENTITY (1,1) PRIMARY KEY,
    name VARCHAR(255) NOT NULL
)
GO

CREATE TABLE Users (
    id INT IDENTITY (1,1) PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
	date_of_birth DATE,
    subscription_plan INTEGER,
    FOREIGN KEY (subscription_plan) REFERENCES SubscriptionPlan(id)
)
GO

CREATE TABLE Settings (
    user_id INT PRIMARY KEY,
    play_no_pause BIT NOT NULL,
    auto_mix BIT NOT NULL,
    smooth_transition_seconds INTEGER NOT NULL,
    auto_play BIT NOT NULL,
    mono_audio BIT NOT NULL,
    normalize_sound_volume BIT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id),
	CHECK (smooth_transition_seconds BETWEEN 0 AND 12)
)
GO
 
CREATE TABLE Artist (
    id INT IDENTITY (1,1) PRIMARY KEY,
    artist_name VARCHAR(255) NOT NULL,
    artist_info TEXT,
    user_id INTEGER UNIQUE,
    FOREIGN KEY (user_id) REFERENCES Users(id)
)
GO
 
CREATE TABLE Album (
    id INT IDENTITY (1,1) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    cover_pic VARCHAR(255)
)
GO
 
CREATE TABLE Song (
    id INT IDENTITY (1,1) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    release_date DATE,
    lyrics TEXT
)
GO
 
CREATE TABLE Playlist (
    id INT IDENTITY (1,1) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    cover_pic VARCHAR(255) NOT NULL
)
GO

-- Many-to-many trunk tables
CREATE TABLE SubscriptionPlan_Feature(
    subscription_plan_id INTEGER NOT NULL,
    feature_id INTEGER NOT NULL,
    PRIMARY KEY (subscription_plan_id, feature_id),
	FOREIGN KEY (subscription_plan_id) REFERENCES SubscriptionPlan(id),
	FOREIGN KEY (feature_id) REFERENCES Feature(id)
)
GO

CREATE TABLE SongArtist (
    song_id INTEGER NOT NULL,
    artist_id INTEGER NOT NULL,
    PRIMARY KEY (song_id, artist_id),
	FOREIGN KEY (song_id) REFERENCES Song(id),
	FOREIGN KEY (artist_id) REFERENCES Artist(id)
)
GO

CREATE TABLE PlaylistSong (
    playlist_id INTEGER NOT NULL,
    song_id INTEGER NOT NULL,
    PRIMARY KEY (playlist_id, song_id),
	FOREIGN KEY (song_id) REFERENCES Song(id),
	FOREIGN KEY (playlist_id) REFERENCES Playlist(id)
)
GO

CREATE TABLE AlbumSong (
    album_id INTEGER NOT NULL,
    song_id INTEGER NOT NULL,
    PRIMARY KEY (album_id, song_id),
	FOREIGN KEY (song_id) REFERENCES Song(id),
	FOREIGN KEY (album_id) REFERENCES Album(id)
)
GO

CREATE TABLE AlbumArtist (
    album_id INTEGER NOT NULL,
    artist_id INTEGER NOT NULL,
    PRIMARY KEY (album_id, artist_id),
	FOREIGN KEY (artist_id) REFERENCES Artist(id),
	FOREIGN KEY (album_id) REFERENCES Album(id)
)
GO

CREATE TABLE AlbumUser (
    album_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    PRIMARY KEY (album_id, user_id),
	FOREIGN KEY (user_id) REFERENCES Users(id),
	FOREIGN KEY (album_id) REFERENCES Album(id)
)
GO

CREATE TABLE PlaylistUser (
    playlist_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    PRIMARY KEY (playlist_id, user_id),
	FOREIGN KEY (user_id) REFERENCES Users(id),
	FOREIGN KEY (playlist_id) REFERENCES Playlist(id)
)
GO