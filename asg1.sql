DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;

USE Testing_System_Assignment_1;

CREATE TABLE Department(
	DepartmentID INT,
    DepartmentName VARCHAR(50)
);

CREATE table `Position`(
PositionID INT,
PositionName VARCHAR (50)
);

CREATE TABLE `Account`(
	AccountID INT,
    Email VARCHAR (100),
    Username VARCHAR (50),
    Fullname VARCHAR (100),
    DepartmentID INT,
    PositionID INT,
    CreateDate DATE

);

CREATE TABLE `Group`(
GroupID INT,
GroupName VARCHAR (100),
CreatorID INT,
CreatorDate DATE
);

CREATE TABLE `GroupAccount`(
GroupID INT,
AccountID VARCHAR(50),
JoinDate DATE

);

CREATE TABLE `TypeQuestion`(
TypeID INT,
TypeName VARCHAR (50)


);

CREATE TABLE `CategoryQuestion`(
CategoryID INT,
CategoryName VARCHAR (50)
);

CREATE TABLE `Question`(
QuestionID int,
Content VARCHAR (200),
CategoryID INT,
TypeID INT,
CreatorID INT,
CreateDate DATE
);

CREATE TABLE `Answer`(
AnswerID INT,
Content VARCHAR (200),
QuestionsID INT,	
isCorrect INT

);

CREATE TABLE `Exam`(
ExamID INT,
`code` VARCHAR (50),
Title VARCHAR (100),
CategoryID  INT,
Duration INT,
CreationID INT,
CreateDate DATE 
);

CREATE TABLE `ExamQuestion`(
ExamID INT,
QuestionsID INT
);
