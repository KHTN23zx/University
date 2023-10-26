use CsdlCongty;

--cau 1
select MaNV, HoNV, Dem, TenNV,NgaySinh
from NHANVIEN
where MaPB=4;
--cau 7
select *
from NHANVIEN
where year(NgaySinh) between 1950 and 1959;
--cau 8
select distinct Luong
from NHANVIEN;
--cau 9
select *
from NHANVIEN
where MaGS is null;
--cau 10
select PB.TenPB, TSP.TruSo
from PHONGBAN as PB, TRUSO_PHONG  as TSP
where TSP.MaPB = PB.MaPB;
--cau 14
select DA.MaDA, PB.TenPB, NV.HONV, NV.Dem, NV.TenNV, NV.DiaChi, NV.NgaySinh
from DUAN as DA, PHONGBAN as PB, NHANVIEN as NV
WHere (DA.MaPB = PB.MaPB and PB.MaQL = NV.MaNV) and
      (DA.DiaDiem='GO Vap'); 

--
use CsdlCongty;

-- Truy van 1
select MaNV, HoNV, Dem, TenNV
from NHANVIEN
where MaPB=4;

-- Truy van 2
select *
from NHANVIEN
where Luong > 30000;

-- Truy van 3
select *
from NHANVIEN
where (Luong > 25000 and MaPB = 4) or (Luong > 30000 and MaPB = 5);

-- Truy van 4
select HoNV, Dem, TenNV, NgaySinh, DiaChi
from NHANVIEN
where DiaChi like '%TpHCM';

-- Truy van 5
select NgaySinh, DiaChi
from NHANVIEN
where concat(HoNV, ' ', Dem, ' ', TenNV) = 'Nguyen Bao Hung';

-- Truy van 6
select *
from NHANVIEN
where DiaChi like '%Phu Nhuan%';
select * from NHANVIEN;

select *
from NHANVIEN
where patindex('%Phu Nhuan%', DiaChi) > 0;

-- Truy van 7
select *
from NHANVIEN
where datepart(year,NgaySinh) between 1950 and 1959;

-- Truy van 8
select distinct Luong
from NHANVIEN;

-- Truy van 9
select *
from NHANVIEN
where MaGS is null;

-- Truy van 10
select PB.TenPB, TSP.TruSo
from PHONGBAN as PB, TRUSO_PHONG as TSP
where TSP.MaPB=PB.MaPB;

-- Truy van 11
select PB.TenPB, NV.HoNV, NV.Dem, NV.TenNV
from PHONGBAN as PB, NHANVIEN as NV
where PB.MaQL = NV.MaNV;

-- Truy van 12
select NV.HoNV, NV.Dem, NV.TenNV, TN.TenTN
from NHANVIEN as NV, THANNHAN as TN
where (NV.MaNV = TN.MaNV) and (NV.GioiTinh in ('f', 'F'));

-- Truy van 13
select NV.HoNV, NV.Dem, NV.TenNV, NV.DiaChi
from NHANVIEN as NV, PHONGBAN as PB
where (NV.MaPB=PB.MaPB) and (PB.TenPB='Nghien cuu');

-- Truy van 14
select DA.MaDA, PB.TenPB, NV.HoNV, NV.Dem, NV.TenNV, NV.NgaySinh, NV.DiaChi
from DUAN as DA, PHONGBAN as PB, NHANVIEN as NV
where (DA.MaPB = PB.MaPB and PB.MaQL = NV.MaNV) and (DA.DiaDiem = 'Go Vap');

-- Truy van 15 (Xet truong hop nhung nhan vien co nguoi giam sat)
select NV.HoNV, NV.Dem, NV.TenNV, GS.HoNV, GS.Dem, GS.TenNV
from NHANVIEN as NV, NHANVIEN as GS
where NV.MaGS = GS.MaNV;

-- Truy van 16
select 1.1 * NV.Luong as 'Luong moi'
from NHANVIEN as NV, THAMGIA as TG, DUAN as DA
where (NV.MaNV = TG.MaNV and TG.MaDA = DA.MaDA) and (DA.TenDA = 'San pham X');

-- Truy van 17
select NV.HoNV, NV.Dem, NV.TenNV
from NHANVIEN as NV, THANNHAN as TN
where (NV.MaNV = TN.MaNV) and (NV.TenNV = TN.TenTN and NV.GioiTinh = TN.GioiTinh);


