CREATE DATABASE PROJECT;
USE PROJECT;
CREATE TABLE UserEntity (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Full_Name VARCHAR(255),
    Bio TEXT,
    Registration_Date DATE
);


CREATE TABLE PostEntity (
    PostID INT PRIMARY KEY,
    UserID INT,
    Caption TEXT,
    Image_URL VARCHAR(255),
    Location VARCHAR(255),
    Post_Date DATE,
    FOREIGN KEY (UserID) REFERENCES UserEntity(UserID)
);


CREATE TABLE CommentEntity (
    CommentID INT PRIMARY KEY,
    PostID INT,
    UserID INT,
    Text TEXT,
    Comment_Date DATE,
    FOREIGN KEY (PostID) REFERENCES PostEntity(PostID),
    FOREIGN KEY (UserID) REFERENCES UserEntity(UserID)
);


CREATE TABLE LikeEntity (
    LikeID INT PRIMARY KEY,
    PostID INT,
    UserID INT,
    Like_Date DATE,
    FOREIGN KEY (PostID) REFERENCES PostEntity(PostID),
    FOREIGN KEY (UserID) REFERENCES UserEntity(UserID)
);


CREATE TABLE FollowerEntity (
    FollowerID INT PRIMARY KEY,
    FollowingUserID INT,
    FollowerUserID INT,
    Follow_Date DATE,
    FOREIGN KEY (FollowingUserID) REFERENCES UserEntity(UserID),
    FOREIGN KEY (FollowerUserID) REFERENCES UserEntity(UserID)
);


CREATE TABLE HashtagEntity (
    HashtagID INT PRIMARY KEY,
    Tag VARCHAR(255) NOT NULL
);


CREATE TABLE PostHashtagEntity (
    PostHashtagID INT PRIMARY KEY,
    PostID INT,
    HashtagID INT,
    FOREIGN KEY (PostID) REFERENCES PostEntity(PostID),
    FOREIGN KEY (HashtagID) REFERENCES HashtagEntity(HashtagID)
);
