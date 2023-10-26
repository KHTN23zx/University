
use Csdl_Sach
go
-- cai 1
select S.TenSA, S.ISBN, S.XepHang, NXB.TenNXB
from SACH as S, NHAXUATBAN as NXB
where (S.MaNXB=NXB.MaNXB)and( S.XepHang >= 4 AND S.XepHang <=5);
--cau2
select S.TenSA, S.ISBN, NXB.TenNXB,S.NgayXuatBan
from SACH as S, NHAXUATBAN as NXB
where  (S.MaNXB=NXB.MaNXB)and (datepart(year, NgayXuatBan) between 1990 and 1999);
--cau3
select S.MaNXB,NXB.MaNXB,NXB.TenNXB, count(*) as 'Tong so dau sach'
from NHAXUATBAN as NXB, Sach as S
where (S.MaNXB=NXB.MaNXB) and(datepart(year,s.NgayXuatBan) between 2010 and 2019)
group by S.MaNXB,NXB.TenNXB,NXB.MaNXB;
--cau4
select NXB.TenNXB, count(*) as 'Tong mso dau sach'
from NHAXUATBAN as NXB, Sach as S
where (S.MaNXB=NXB.MaNXB) 
group by NXB.TenNXB
having (count(*) >5)

--Truy van 5
select NXB.TenNXB
from NHAXUATBAN as NXB, Sach as S
where (S.MaNXB=NXB.MaNXB) and (datepart(year,S.NgayXuatBan) !=2015)
group by NXB.TenNXB
