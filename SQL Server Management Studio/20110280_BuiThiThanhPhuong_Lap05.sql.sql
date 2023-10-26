use CsdlDonDatHang;
go
--cau 1 Cho biết mã số, tên, đơn giá và đơn giá đặt hàng trung bình, tổng số lượng của các
--mặt hàng được đặt hàng trong tháng 07/2012. 
select MH.MaMH, MH.DonGia, MH.TenMH, AVG(MH.DonGia) as' Don Gia Dat Hang Trung Binh', COUNT(*) as'tong so luong don dat hang'
from (MATHANG as MH left join CHITIETDDH as CTDH on MH.MaMH=CTDH.MaMH ) left join DONDATHANG as DDH on CTDH.MaDDH=DDH.MaDDH
where  MONTH(DDH.NgayDatHang) = 7
group by MH.MaMH, MH.DonGia, MH.TenMH;

-- Cau 1 - Lab 5
select MH.MaMH, MH.TenMH, MH.DonGia, avg(CTDDH.DonGia) as 'Don Gia TB', sum(CTDDH.SoLuong) as 'Tong so luong'
from ((MATHANG as MH join CHITIETDDH as CTDDH on MH.MaMH = CTDDH.MaMH) join DONDATHANG as DDH on CTDDH.MaDDH = DDH.MaDDH)
group by MH.MaMH, MH.TenMH, MH.DonGia;

--cau 2  Cho biết các khách hàng mà tổng trị giá tất cả các đơn đặt hàng của họ lớn hơn 3,000
select KH.*
from KHACHHANG as KH
where KH.MaKH in (select DDH.MaKH
                  from DONDATHANG as DDH
				  where KH.MaKH=DDH.MaKH
				  group by DDH.MaKH
				  having sum(DDH.TriGia) >3000);
--cach 2
select KH.MaKH, KH.HoTen
from (KHACHHANG as KH join DONDATHANG as DDH on KH.MaKH = DDH.MaKH)
group by KH.MaKH, KH.HoTen
having sum(DDH.TriGia) > 3000;


--cach 2
select KH.*--KH.MaKH, KH.HoTen, KH.DiaChi, KH.ThanhPho, KH.QuocGia, KH.SoDT
from KHACHHANG as KH join DONDATHANG as DDH on KH.MaKH=DDH.MaKH
group by KH.MaKH, KH.HoTen, KH.DiaChi, KH.ThanhPho, KH.QuocGia, KH.SoDT
having sum(DDH.TriGia) >3000;

--cau 3 Với mỗi khách hàng cho biết mã khách hàng, tên khách hàng và tổng số đơn đặt hàng
--của họ. 
select KH.MaKH, KH.HoTen, count(*) as 'Tong So Don Dat Hang'
from KHACHHANG as KH join DONDATHANG as DDH on KH.MaKH=DDH.MaKH
group by KH.MaKH, KH.HoTen;

select KH.MaKH, KH.HoTen, count(*) as 'tong so luong don dat hang'
from (KHACHHANG AS KH JOIN DONDATHANG AS DDH ON KH.MaKH=DDH.MaKH) 
group by KH.MaKH, KH.HoTen;

select KH.MaKH, KH.HoTen, count(*) as 'So don dat hang'
from (KHACHHANG as KH left join DONDATHANG as DDH on KH.MaKH = DDH.MaKH)
group by KH.MaKH, KH.HoTen;

--cau 4 Cho biết các mặt hàng còn hàng nhưng chưa được đặt hàng. 
select MH.*
from MATHANG as MH
WHERE MH.TinhTrang = 1 and MH.MaMH not in (select CTDDH.MaMH
                                           from CHITIETDDH as CTDDH
										   group by CTDDH.MaMH);
--Cau 5 Cho biết mã số, tên các nhà cung cấp có số lượng mặt hàng nhiều nhất. 
select NCC.MaNCC, NCC.TenNCC
from NHACUNGCAP as NCC JOIN MATHANG as MH on NCC.MaNCC=MH.MaNCC
group by NCC.MaNCC, NCC.TenNCC
having count(*) >=all (select count(*) as 'so luong mat hang'
                       from NHACUNGCAP as NCC JOIN MATHANG as MH on NCC.MaNCC=MH.MaNCC
					   group by NCC.MaNCC, NCC.TenNCC);

--cau 6 Cho biết các khách hàng ở Brazil có đơn đặt hàng có trị giá lớn nhất. 
select KH.*
from KHACHHANG as KH JOIN DONDATHANG as DDH on KH.MaKH=DDH.MaKH
where DDH.TriGia in (select max(DDH.TriGia)
                     from KHACHHANG as KH JOIN DONDATHANG as DDH on KH.MaKH=DDH.MaKH
					 where KH.QuocGia='Brazil');

					   
--

									
