USE QuanLySinhVien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT * FROM Subject
WHERE Credit = (SELECT MAX(Credit) FROM Subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT Subject.SubName, Mark.Mark
FROM Subject
JOIN Mark ON Subject.SubId = Mark.SubId
WHERE Mark.Mark = (SELECT MAX(Mark) FROM Mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT Student.StudentName, AVG(Mark.Mark) AS AverageMark
FROM Student
LEFT JOIN Mark ON Student.StudentId = Mark.StudentId
GROUP BY Student.StudentId
ORDER BY AverageMark DESC;
