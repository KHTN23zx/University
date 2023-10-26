use Csdl_Sach;
go

--Cau 1
SELECT s.TenSA, s.ISBN, NXB.TenNXB, S.NgayXuatBan
FROM SACH S join NHAXUATBAN NXB ON S.MaNXB = NXB.MaNXB
WHERE YEAR (S.NgayXuatBan) IN (2015,2017,2019)
GO
--5.

select NXB.TenNXB
from NHAXUATBAN as NXB, Sach as S
where (S.MaNXB=NXB.MaNXB) and (datepart(year,S.NgayXuatBan) !=2015)
group by NXB.TenNXB
-- CAU 2

SELECT s.TenSA, s.ISBN, s.XepHang, nxb.TenNXB
FROM SACH s join NHAXUATBAN nxb ON s.MaNXB = nxb.MaNXB
WHERE TenNXB like '%Oxford%'
 --Cau 3
SELECT tg.MaTG, tg.HoTG, tg.TenTG, count(*) AS TongDauSach
FROM TACGIA tg join VIETSACH vs ON tg.MaTG = vs.MaTG join SACH s ON vs.MaSA = s.MaSA
WHERE YEAR(s.NgayXuatBan) between 2010 and 2019
GROUP BY tg.MaTG, tg.HoTG, tg.TenTG
GO

--Cau 4
SELECT tg.MaTG, tg.HoTG, tg.TenTG, count(*) AS TongDauSach
FROM TACGIA tg join VIETSACH vs ON tg.MaTG = vs.MaTG join SACH s ON vs.MaSA = s.MaSA
GROUP BY tg.MaTG, tg.HoTG, tg.TenTG
HAVING count(*) >= 2
GO
-- cau 5
select TG.MaTG, TG.HoTG, TG.Dem, TG.TenTG
from Sach as S, TACGIA as TG, VIETSACH as VS
where ( VS.MaTG=TG.MaTG and VS.MaSA=S.MaSA ) and (year(S.NgayXuatBan) != 2015);

--Cau 5
SELECT TenTG FROM TACGIA
EXCEPT
SELECT DISTINCT tg.TenTG
FROM TACGIA tg join VIETSACH vs ON tg.MaTG = vs.MaTG join SACH s ON vs.MaSA = s.MaSA
WHERE YEAR(s.NgayXuatBan) = 2015
GO