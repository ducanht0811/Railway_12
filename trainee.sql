
-- Q3: : Insert 1 bản ghi mà có điểm ET_IQ =30. Sau đó xem kết quả
INSERT INTO Trainee(Fullname,		BirthDate,			Gender,			ET_IQ,			ET_Gmath,			ET_English,			Training_Class,				Evolution_Notes)
VALUE			('Nguyen Van A',		'2000-05-05',		'Male',			30,				15,					40,					'VTI001',					'DHBKHN'			);
-- Q4: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào
-- và sắp xếp theo ngày sinh. Điểm ET_IQ >=12, ET_Gmath>=12, ET_English>=20
SELECT * FROM fresher.trainee 
WHERE ET_IQ >=12 AND ET_Gmath >=12 AND ET_English >=20;

-- Q5 Viết lệnh để lấy ra thông tin thực tập sinh có tên bắt đầu bằng chữ N và kết thúc
-- bằng chữ C

SELECT * FROM fresher.trainee 
WHERE fullname LIKE ('N%c');

-- Q6 Viết lệnh để lấy ra thông tin thực tập sinh mà tên có ký thự thứ 2 là chữ G
SELECT * FROM fresher.trainee
WHERE fullname LIKE ('_g%');

-- Q7 : Viết lệnh để lấy ra thông tin thực tập sinh mà tên có 10 ký tự và ký tự cuối cùng
-- là C
SELECT * FROM fresher.trainee
WHERE  	Length(fullname)=14 AND	fullname LIKE ('%c');

-- Viết lệnh để lấy ra Fullname của các thực tập sinh trong lớp, lọc bỏ các tên trùng
-- nhau.
SELECT DISTINCT Fullname  FROM fresher.trainee;

-- Q9: Viết lệnh để lấy ra Fullname của các thực tập sinh trong lớp, sắp xếp các tên này
-- theo thứ tự từ A-Z.
SELECT * FROM fresher.trainee
ORDER BY fullname;

-- Q10: : Viết lệnh để lấy ra thông tin thực tập sinh có tên dài nhất
 SELECT *,Max(length(fullname)) FROM fresher.trainee;
 -- Q11: Viết lệnh để lấy ra ID, Fullname và Ngày sinh thực tập sinh có tên dài nhất
 SELECT TraineeID, fullname,birthdate FROM fresher.trainee 
 WHERE length(fullname) = (SELECT max(length(fullname)) FROM fresher.trainee);
 
-- Q12: Viết lệnh để lấy ra Tên, và điểm IQ, Gmath, English thực tập sinh có tên dài
-- nhất
SELECT fullname ,ET_IQ, ET_Gmath, ET_English FROM fresher.trainee
WHERE length(fullname) = (SELECT max(length(fullname)) FROM fresher.trainee);

-- Q13:Lấy ra 5 thực tập sinh có tuổi nhỏ nhất
SELECT * FROM fresher.trainee
ORDER BY BirthDate DESC LIMIT 5;

-- Q14: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là
-- những người thỏa mãn số điểm như sau:
-- • ET_IQ + ET_Gmath>=20
-- • ET_IQ>=8
-- • ET_Gmath>=8
-- • ET_English>=18
SELECT * FROM fresher.trainee
WHERE (ET_IQ + ET_Gmath) >=20 AND ET_IQ >=8 AND ET_Gmath >=8 AND ET_English >=18;

-- Q15 Xóa thực tập sinh có TraineeID = 5
DELETE FROM fresher.trainee
WHERE TraineeID =5;

-- Q16: Xóa thực tập sinh có tổng điểm ET_IQ, ET_Gmath <=15
DELETE FROM fresher.trainee
WHERE (ET_IQ + ET_Gmath) <=15;

-- Q17 Xóa thực tập sinh quá 30 tuổi.

DELETE FROM fresher.trainee
WHERE year(curdate())-year(birthdate)>30;

-- Q18 Thực tập sinh có TraineeID = 3 được chuyển sang lớp " VTI003". Hãy cập nhật
-- thông tin vào database.
UPDATE fresher.trainee
SET Training_Class = 'VTI003'
WHERE TraineeID = 3;

-- Q19: Do có sự nhầm lẫn khi nhập liệu nên thông tin của học sinh số 10 đang bị sai,
-- hãy cập nhật lại tên thành “LeVanA”, điểm ET_IQ =10, điểm ET_Gmath =15, điểm
-- ET_English = 30

UPDATE fresher.trainee
SET fullname = 'LeVanA', ET_IQ = 10, ET_Gmath = 15, ET_English = 30
WHERE TraineeID = 10;

-- Q20 Đếm xem trong lớp VTI001 có bao nhiêu thực tập sinh.
SELECT Training_Class, COUNT(Training_Class) FROM fresher.trainee 
GROUP BY Training_Class HAVING Training_Class = 'VTI001'; 

-- Q22 Đếm tổng số thực tập sinh trong lớp VTI001 và VTI003 có bao nhiêu thực tập
-- sinh.
SELECT Training_Class, COUNT(Training_Class) FROM fresher.trainee 
GROUP BY Training_Class HAVING Training_Class = 'VTI001' OR Training_Class = 'VTI003'; 

-- Q23 Lấy ra số lượng các thực tập sinh theo giới tính: Male, Female, Unknown

SELECT COUNT(*) FROM fresher.trainee WHERE Gender = 'male';
SELECT COUNT(*) FROM fresher.trainee WHERE Gender = 'female';
SELECT COUNT(*) FROM fresher.trainee WHERE Gender = 'unknown';


-- Q24:  Lấy ra lớp có lớn hơn 5 thực tập viên 
SELECT Training_Class,  COUNT(Training_Class) AS 'So luong sinh vien' FROM fresher.trainee
GROUP BY Training_Class HAVING COUNT(Training_Class) > 3;

-- Q26 : Lấy ra trường có ít hơn 4 thực tập viên tham gia khóa học
SELECT Training_Class,  COUNT(Training_Class) AS 'So luong sinh vien' FROM fresher.trainee
GROUP BY Training_Class HAVING COUNT(Training_Class) < 4 ;



