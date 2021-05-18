	-- create database
    DROP DATABASE IF EXISTS TesttingSystem2;
    CREATE DATABASE TesttingSystem2;
	USE TesttingSystem2;

-- create table: Department
DROP DATABASE IF EXISTS Department;
CREATE TABLE Department(
	DepartmentID 	MEDIUMINT UNSIGNED PRIMARY KEY,
	DepartmentName 	ENUM ('Dev', 'Sale', 'MKT','PM','Test' )  NOT NULL UNIQUE KEY
);

-- create table: Position
DROP DATABASE IF EXISTS `Position`;
CREATE TABLE `Position` (
	PositionID 		MEDIUMINT UNSIGNED PRIMARY KEY,
	PositionName 	ENUM ('Dev', 'Test', 'Scrum Master', 'PM') NOT NULL	UNIQUE KEY
);

-- create table: Account
DROP DATABASE IF EXISTS `Account`;
CREATE TABLE `Account` (
	AccountID 		MEDIUMINT UNSIGNED PRIMARY KEY,
	Email 			VARCHAR (100)  NOT NULL UNIQUE KEY, 
	Username 		VARCHAR(50) NOT NULL UNIQUE KEY,
	Fullname 		NVARCHAR (50) NOT NULL,
	DepartmentID 	MEDIUMINT UNSIGNED,
	PositionID 		MEDIUMINT UNSIGNED,
	CreateDate 		DATETIME DEFAULT NOW(),
			FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID),
            FOREIGN KEY (PositionID) REFERENCES `Position` (PositionID)
);

-- create table: Group
CREATE TABLE `Group`(
	GroupID 	MEDIUMINT UNSIGNED PRIMARY KEY,
	GroupName 	VARCHAR(100)  NOT NULL UNIQUE KEY,
	CreatorID 	MEDIUMINT UNSIGNED,
	CreateDate 	DATETIME DEFAULT NOW()
);

-- create table: AccountGroup
CREATE TABLE AccountGroup (
	GroupID 	MEDIUMINT UNSIGNED NOT NULL,
	AccountID 	MEDIUMINT UNSIGNED NOT NULL,
	JoinDate 	DATETIME DEFAULT NOW(),
		PRIMARY KEY (GroupID, AccountID),
		FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID),
		FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID)
);

-- create table: TypeQuestion
CREATE TABLE TypeQuestion (
	TypeID 		MEDIUMINT UNSIGNED PRIMARY KEY,
	TypeName 	VARCHAR (100) 
);

-- create table: CategoryQuestion
CREATE TABLE CategoryQuestion (
	CategoryID 		MEDIUMINT UNSIGNED PRIMARY KEY,
	CategoryName 	VARCHAR (100) NOT NULL UNIQUE KEY
);

-- create table: Question
CREATE TABLE Question (
	QuestionID 	MEDIUMINT UNSIGNED PRIMARY KEY,
	Content 	VARCHAR (200) NOT NULL,
	CategoryID 	MEDIUMINT UNSIGNED,
	TypeID 		MEDIUMINT UNSIGNED,
	CreatorID 	MEDIUMINT UNSIGNED,
	CreateDate 	DATETIME DEFAULT NOW(),
		FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
		FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID)
);

-- create table: Answer
CREATE TABLE Answer (
	AnswerID 	MEDIUMINT UNSIGNED PRIMARY KEY,
	Content 	VARCHAR(100) NOT NULL UNIQUE KEY,
	QuestionID 	MEDIUMINT UNSIGNED,
	isCorrect 	ENUM('isCorrect', 'Wrong')
);

-- create table: Exam
CREATE TABLE Exam(
	ExamID 		MEDIUMINT UNSIGNED PRIMARY KEY,
	`code` 		MEDIUMINT UNSIGNED,
	Title 		VARCHAR(50),
	CategoryID 	MEDIUMINT UNSIGNED,
	Duration 	TIME,
	CreatetorID MEDIUMINT UNSIGNED,
	CreateDate 	DATETIME DEFAULT NOW()
);

-- create table: ExamQuestion
CREATE TABLE ExamQuestion(
	ExamID 		MEDIUMINT UNSIGNED PRIMARY KEY,
	QuestionID 	MEDIUMINT UNSIGNED,
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);


-- add data Department 
INSERT INTO Department(DepartmentID, DepartmentName)
VALUE
								(1,		'Dev'),
                                (2,		'Sale'),
                                (3,		'MKT'),	
                                (4,		'PM'),
                                (5,		'Test');
                                
INSERT INTO Position (PositionID ,PositionName)
VALUES 				(1,					'Dev'),
					(2,					'Test'),
					(3,					'Scrum Master'),
					(4,					'PM');                     
                    
INSERT INTO `Account` (AccountID,		Email, 				Username, 			FullName, 			DepartmentID, 		PositionID)
VALUES 				(1	,		'ducannha@vnext.com', 		'ducanha', 				'ducanhadsad', 				1				, 1),
					(2	,		'ducanhb@gmail.com2', 		'ducanhb2', 			'ducanhbds', 				3				, 3),
					(3	,		'ducanhc@gmail.com3', 		'ducanhc3', 			'ducanhcdsadsad', 				2				, 4),
					(4	,		'ducanhd@gmail.com4', 		'ducanhd4', 			'ducanhds', 				2				, 3),
					(5	,		'ducanhe@gmail.com5', 		'ducanhe5', 			'ducanhesda', 				4				, 3);

INSERT INTO AccountGroup (GroupID,		GroupName,		CreatorID)
VALUE	(				1,			'ducanh1', 			1),
		(				2,			'ducanh2', 			1),
        (				3,			'ducanh3', 			1),
        (				4,			'ducanh4',			1),
        (				5,			'ducanh5', 			1);
        
INSERT INTO `Group` (GroupID,		AccountID)        
VALUE					(1,			1),
						(2,			2),
                        (3,			3),	
                        (4,			4),	
                        (5,			5);	


