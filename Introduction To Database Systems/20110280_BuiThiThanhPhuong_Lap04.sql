use CsdlDonDatHang;

--cau 1 Cho biết mã số, tên, mã nhà cung cấp của các mặt hàng có đơn giá lớn hơn 20.00 và
--tình trạng là còn. 

select MaMH, TenMH, MaNCC
from MATHANG
where DonGia >20.00 and TinhTrang >=1;
--Cau2 Tìm các đơn đặt hàng trong tháng 7/2012
select *
from DONDATHANG
where NgayDatHang between '07/01/2012' and '07/31/2012';
--cau 3 Cho biết mã số, họ tên, số điện thoại của các khách hàng có tên bắt đầu bằng chữ L
--(ví dụ Elizabeth Lincoln, Maria Larsson, …). 
select MaKH, HoTen, SoDT
from KHACHHANG
where HOTen LIKE'% L%';

--Cau4 Cho biết tên nhà cung cấp ở Germany và các mặt hàng của họ. 
select NCC.TenNCC, MH.TenMH
from NHACUNGCAP as NCC,MATHANG as MH
where QuocGia='Germany' and NCC.MaNCC=MH.MaNCC;
--CAU 5 Cho biết chi tiết các đơn đặt hàng của khách hàng Mario Pontes. 
select CTDDH.*
from CHITIETDDH as CTDDH, KHACHHANG as KH, DONDATHANG as DDH
where HoTen='Mario Pontes' and DDH.MaKH=KH.MaKH and DDH.MaDDH=CTDDH.MaDDH;
--CAU 6 Cho biết mã đơn đặt hàng, ngày đặt hàng, tên khách hàng của các đơn đặt hàng có
--mặt hàng Manjimup Dried Apples
select DDH.MaDDH, DDH.NgayDatHang, KH.HoTen
from DONDATHANG as DDH, KHACHHANG as KH, MATHANG as MH, CHITIETDDH as CTDDH
where TenMH='Manjimup Dried Apples' and DDH.MaKH=KH.MaKH and DDH.MaDDH= CTDDH.MaDDH and CTDDH.MaMH=MH.MaMH;

--
