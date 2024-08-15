CREATE DATABASE StudentSystem;
GO
USE StudentSystem;
GO


CREATE TABLE Student(
    StudentID INT PRIMARY KEY IDENTITY(1,1) NOT NULL, 
    FullName NVARCHAR(50),
	DateOfBirth DATETIME,
	Gender NVARCHAR(50),
	Address NVARCHAR(100),
	Phone NVARCHAR(50),
	Email NVARCHAR(100),
	constraint gioitinh Check (Gender in ('Male', 'Female'));GO

insert into Student  
values ('an');

CREATE TABLE Teacher(
    TeacherID INT PRIMARY KEY IDENTITY(1,1), 
    FullName NVARCHAR(50),
	DateOfBirth DATETIME,
	Gender NVARCHAR(50),
	Address NVARCHAR(100),
	Phone NVARCHAR(50),
	Email NVARCHAR(100),
	Major NVARCHAR(50)
);
GO


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY IDENTITY(1,1),
    CourseName NVARCHAR(100) NOT NULL,
    TeacherID INT FOREIGN KEY REFERENCES Teacher(TeacherID),
);
GO
INSERT INTO Courses(CourseName)
VALUES ('SE07102');

CREATE TABLE Score(
    ScoreID INT PRIMARY KEY IDENTITY(1,1),
    Scorename NVARCHAR(100) NOT NULL,
    Part1 NVARCHAR(50) NOT NULL,
    Part2 NVARCHAR(50) NOT NULL,
    Final NVARCHAR(50) NOT NULL,
    StudentID INT FOREIGN KEY REFERENCES Student(StudentID),
    CourseID INT FOREIGN KEY REFERENCES Courses(CourseID),
);
GO
DBCC CHECKIDENT ('[dbo].[Score]', RESEED, 0);
GO
SELECT * FROM [dbo].[Score]
UPDATE Score 
SET ScoreName = 'SampleName', 
    Part1 = '65', 
    Part2 = '65', 
    Final = '65', 
    StudentID = 1, 
    CourseID = 1 
WHERE ScoreID = 5;

CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL,
    Password NVARCHAR(50) NOT NULL,
    Role NVARCHAR(50) NOT NULL
);
GO

INSERT INTO Users(Username, Password, Role)
VALUES ('linhne', '1234', '1');
INSERT INTO Users(Username, Password, Role)
VALUES ('admin', '5678', '2');
GO
DELETE FROM [dbo].[Student]

DELETE FROM Score



CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT FOREIGN KEY REFERENCES Users(UserID),
    CourseID INT FOREIGN KEY REFERENCES Courses(CourseID),
);


CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT FOREIGN KEY REFERENCES Users(UserID),
    CourseID INT FOREIGN KEY REFERENCES Courses(CourseID),
    AttendanceDate DATE,
    Status NVARCHAR(20)
);

