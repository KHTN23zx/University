use master;
go
if exists(select *from sys.databases where name='CsdlDonDatHang')
drop database CsdlDonDatHang;
go
create database CsdlDonDatHang;
go
use CsdlDonDatHang;
go
--Tạo Bảng NHACUNGCAP
create table NHACUNGCAP(
   MaNCC int,
   TenNCC varchar(40),
   Email  varchar(40),
   ThanhPho varchar(40),
   QuocGia  varchar(40),
   constraint NHACUNGCAP_PK primary key (MaNCC)
   );
-- Tạo Bang MATHANG
create table MATHANG(
    MaMH int,
	TenMH varchar(50),
	MaNCC int,
	DonGia decimal(12,2),
	TinhTrang char,
	constraint MATHANG_PK primary key (MaMH),
	constraint MATHANG_NHACUNGCAP_FK foreign key (MaNCC) references NHACUNGCAP (MaNCC),
	constraint MATHANG_TINHTRANG_DM check(TinhTrang in (0,1))
	);
--Tao Bảng KHACHHANG
	create table KHACHHANG (
	    MaKH int,
		HoTen varchar(50),
		DiaChi varchar(50),
		ThanhPho varchar(40),
		QuocGia varchar(40),
		SoDT varchar(15),
		constraint KHACHHANG_PK primary key (MaKH),
	);
--Tạo Bảng ĐONATHANG
	create table DONDATHANG(
	    MaDDH int,
		NgayDatHang datetime,
		MaKH int,
		TriGia decimal(12,2),
		constraint DONDATHANG_PK primary key (MaDDH),
		constraint DONDATHANG_KHACHHANG_FK foreign key (MaKH) references KHACHHANG (MaKH),
		
	);
--TẠO Bảng CHITIETDDH
	create table CHITIETDDH(
	    MaCT int,
		MaDDH int,
		MaMH int,
		DonGia decimal(12,2),
		SoLuong int,
		constraint CHITIETDDH_PK primary key (MaCT, MaDDH),
		constraint CHITIETDDH_DONDATHANG_FK foreign key (MaDDH) references DONDATHANG (MaDDH),
		constraint CHITIETDDH_MATHANG_FK foreign key (MaMH) references MATHANG (MaMH)
		);
--THEM CAC DONG VAO COT NHACUNGCAP
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (1, 'Exotic Liquids', null, 'London', 'UK')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (2, 'New Orleans Cajun Delights', null, 'New Orleans', 'USA')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (3, 'Grandma Kelly''s Homestead', null, 'Ann Arbor', 'USA')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (4, 'Tokyo Traders', null, 'Tokyo', 'Japan')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (5, 'Cooperativa de Quesos ''Las Cabras''', null, 'Oviedo', 'Spain')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (6, 'Mayumi''s', null, 'Osaka', 'Japan')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (7, 'Pavlova, Ltd.', null, 'Melbourne', 'Australia')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (8, 'Specialty Biscuits, Ltd.', null, 'Manchester', 'UK')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (9, 'PB Knackebrod AB', null, 'Goteborg', 'Sweden')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (10, 'Refrescos Americanas LTDA', null, 'Sao Paulo', 'Brazil')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (11, 'Heli Subwaren GmbH & Co. KG', null, 'Berlin', 'Germany')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (12, 'Plutzer Lebensmittelgrobmarkte AG', null, 'Frankfurt', 'Germany')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (13, 'Nord-Ost-Fisch Handelsgesellschaft mbH', null, 'Cuxhaven', 'Germany')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (14, 'Formaggi Fortini s.r.l.', null, 'Ravenna', 'Italy')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (15, 'Norske Meierier', null, 'Sandvika', 'Norway')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (16, 'Bigfoot Breweries', null, 'Bend', 'USA')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (17, 'Svensk Sjofoda AB', null, 'Stockholm', 'Sweden')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (18, 'Aux joyeux ecclesiastiques', null, 'Paris', 'France')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (19, 'New England Seafood Cannery', null, 'Boston', 'USA')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (20, 'Leka Trading', null, 'Singapore', 'Singapore')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (21, 'Lyngbysild', null, 'Lyngby', 'Denmark')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (22, 'Zaanse Snoepfabriek', null, 'Zaandam', 'Netherlands')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (23, 'Karkki Oy', null, 'Lappeenranta', 'Finland')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (24, 'G''day, Mate', null, 'Sydney', 'Australia')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (25, 'Ma Maison', null, 'Montreal', 'Canada')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (26, 'Pasta Buttini s.r.l.', null, 'Salerno', 'Italy')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (27, 'Escargots Nouveaux', null, 'Montceau', 'France')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (28, 'Gai paturage', null, 'Annecy', 'France')
INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES (29, 'Forets d''erables', null, 'Ste-Hyacinthe', 'Canada');

--THIET LAP CAC COT KHACHHANG
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (1, 'Maria Anders', null, 'Berlin', 'Germany', '030-0074321')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (2, 'Ana Trujillo', null, 'Mexico D.F.', 'Mexico', '(5) 555-4729')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (3, 'Antonio Moreno', null, 'Mexico D.F.', 'Mexico', '(5) 555-3932')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (4, 'Thomas Hardy', null, 'London', 'UK', '(171) 555-7788')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (5, 'Christina Berglund', null, 'Lulea', 'Sweden', '0921-12 34 65')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (6, 'Hanna Moos', null, 'Mannheim', 'Germany', '0621-08460')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (7, 'Frederique Citeaux', null, 'Strasbourg', 'France', '88.60.15.31')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (8, 'Martin Sommer', null, 'Madrid', 'Spain', '(91) 555 22 82')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (9, 'Laurence Lebihan', null, 'Marseille', 'France', '91.24.45.40')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (10, 'Elizabeth Lincoln', null, 'Tsawassen', 'Canada', '(604) 555-4729')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (11, 'Victoria Ashworth', null, 'London', 'UK', '(171) 555-1212')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (12, 'Patricio Simpson', null, 'Buenos Aires', 'Argentina', '(1) 135-5555')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (13, 'Francisco Chang', null, 'Mexico D.F.', 'Mexico', '(5) 555-3392')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (14, 'Yang Wang', null, 'Bern', 'Switzerland', '0452-076545')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (15, 'Pedro Afonso', null, 'Sao Paulo', 'Brazil', '(11) 555-7647')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (16, 'Elizabeth Brown', null, 'London', 'UK', '(171) 555-2282')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (17, 'Sven Ottlieb', null, 'Aachen', 'Germany', '0241-039123')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (18, 'Janine Labrune', null, 'Nantes', 'France', '40.67.88.88')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (19, 'Ann Devon', null, 'London', 'UK', '(171) 555-0297')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (20, 'Roland Mendel', null, 'Graz', 'Austria', '7675-3425')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (21, 'Aria Cruz', null, 'Sao Paulo', 'Brazil', '(11) 555-9857')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (22, 'Diego Roel', null, 'Madrid', 'Spain', '(91) 555 94 44')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (23, 'Martine Rance', null, 'Lille', 'France', '20.16.10.16')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (24, 'Maria Larsson', null, 'Bracke', 'Sweden', '0695-34 67 21')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (25, 'Peter Franken', null, 'Munchen', 'Germany', '089-0877310')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (26, 'Carine Schmitt', null, 'Nantes', 'France', '40.32.21.21')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (27, 'Paolo', 'Accorti', 'Torino', 'Italy', '011-4988260')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (28, 'Lino Rodriguez', null, 'Lisboa', 'Portugal', '(1) 354-2534')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (29, 'Eduardo Saavedra', null, 'Barcelona', 'Spain', '(93) 203 4560')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (30, 'Jose Pedro Freyre', null, 'Sevilla', 'Spain', '(95) 555 82 82')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (31, 'Andre Fonseca', null, 'Campinas', 'Brazil', '(11) 555-9482')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (32, 'Howard Snyder', null, 'Eugene', 'USA', '(503) 555-7555')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (33, 'Manuel Pereira', null, 'Caracas', 'Venezuela', '(2) 283-2951')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (34, 'Mario Pontes', null, 'Rio de Janeiro', 'Brazil', '(21) 555-0091')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (35, 'Carlos Hernulldez', null, 'San Cristobal', 'Venezuela', '(5) 555-1340')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (36, 'Yoshi Latimer', null, 'Elgin', 'USA', '(503) 555-6874')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (37, 'Patricia McKenna', null, 'Cork', 'Ireland', '2967 542')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (38, 'Helen Bennett', null, 'Cowes', 'UK', '(198) 555-8888')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (39, 'Philip Cramer', null, 'Brandenburg', 'Germany', '0555-09876')
INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT) VALUES (40, 'Daniel Tonini', null, 'Versailles', 'France', '30.59.84.10');

--THIET LAP CAC COT MATHANG

INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (1, 'Chai', 1, 18.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (2, 'Chang', 1, 19.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (3, 'Aniseed Syrup', 1, 10.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (4, 'Chef Anton''s Cajun Seasoning', 2, 22.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (5, 'Chef Anton''s Gumbo Mix', 2, 21.35, 1)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (6, 'Grandma''s Boysenberry Spread', 3, 25.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (7, 'Uncle Bob''s Organic Dried Pears', 3, 30.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (8, 'Northwoods Cranberry Sauce', 3, 40.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (9, 'Mishi Kobe Niku', 4, 97.0, 1)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (10, 'Ikura', 4, 31.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (11, 'Queso Cabrales', 5, 21.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (12, 'Queso Manchego La Pastora', 5, 38.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (13, 'Konbu', 6, 6.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (14, 'Tofu', 6, 23.25, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (15, 'Genen Shouyu', 6, 15.5, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (16, 'Pavlova', 7, 17.45, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (17, 'Alice Mutton', 7, 39.0, 1)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (18, 'Carnarvon Tigers', 7, 62.5, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (19, 'Teatime Chocolate Biscuits', 8, 9.2, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (20, 'Sir Rodney''s Marmalade', 8, 81.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (21, 'Sir Rodney''s Scones', 8, 10.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (22, 'Gustaf''s Knackebröd', 9, 21.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (23, 'Tunnbrod', 9, 9.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (24, 'Guarana Fantastica', 10, 4.5, 1)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (25, 'NuNuCa Nub-Nougat-Creme', 11, 14.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (26, 'Gumbar Gummibarchen', 11, 31.23, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (27, 'Schoggi Schokolade', 11, 43.9, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (28, 'Rossle Sauerkraut', 12, 45.6, 1)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (29, 'Thuringer Rostbratwurst', 12, 123.79, 1)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (30, 'Nord-Ost Matjeshering', 13, 25.89, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (31, 'Gorgonzola Telino', 14, 12.5, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (32, 'Mascarpone Fabioli', 14, 32.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (33, 'Geitost', 15, 2.5, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (34, 'Sasquatch Ale', 16, 14.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (35, 'Steeleye Stout', 16, 18.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (36, 'Inlagd Sill', 17, 19.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (37, 'Gravad lax', 17, 26.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (38, 'Cote de Blaye', 18, 263.5, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (39, 'Chartreuse verte', 18, 18.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (40, 'Boston Crab Meat', 19, 18.4, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (41, 'Jack''s New England Clam Chowder', 19, 9.65, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (42, 'Singaporean Hokkien Fried Mee', 20, 14.0, 1)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (43, 'Ipoh Coffee', 20, 46.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (44, 'Gula Malacca', 20, 19.45, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (45, 'Rogede sild', 21, 9.5, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (46, 'Spegesild', 21, 12.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (47, 'Zaanse koeken', 22, 9.5, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (48, 'Chocolade', 22, 12.75, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (49, 'Maxilaku', 23, 20.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (50, 'Valkoinen suklaa', 23, 16.25, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (51, 'Manjimup Dried Apples', 24, 53.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (52, 'Filo Mix', 24, 7.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (53, 'Perth Pasties', 24, 32.8, 1)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (54, 'Tourtiere', 25, 7.45, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (55, 'Pâté chinois', 25, 24.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (56, 'Gnocchi di nonna Alice', 26, 38.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (57, 'Ravioli Angelo', 26, 19.5, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (58, 'Escargots de Bourgogne', 27, 13.25, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (59, 'Raclette Courdavault', 28, 55.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (60, 'Camembert Pierrot', 28, 34.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (61, 'Sirop d''erable', 29, 28.5, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (62, 'Tarte au sucre', 29, 49.3, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (63, 'Vegie-spread', 7, 43.9, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (64, 'Wimmers gute Semmelknodel', 12, 33.25, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (65, 'Louisiana Fiery Hot Pepper Sauce', 2, 21.05, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (66, 'Louisiana Hot Spiced Okra', 2, 17.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (67, 'Laughing Lumberjack Lager', 16, 14.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (68, 'Scottish Longbreads', 8, 12.5, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (69, 'Gudbrandsdalsost', 15, 36.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (70, 'Outback Lager', 7, 15.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (71, 'Flotemysost', 15, 21.5, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (72, 'Mozzarella di Giovanni', 14, 34.8, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (73, 'Rod Kaviar', 17, 15.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (74, 'Longlife Tofu', 4, 10.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (75, 'Rhonbrau Klosterbier', 12, 7.75, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (76, 'Lakkalikoori', 23, 18.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (77, 'Original Frankfurter grune Sobe', 12, 13.0, 0)
INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang) VALUES (78, 'Stroopwafels', 22, 9.75, 0);

--THIET LAP CAC COT DDONDATHANG

INSERT INTO DONDATHANG (MaDDH, NgayDatHang, MaKH, TriGia) VALUES (1, '07/04/2012', 15, 440.0)
INSERT INTO DONDATHANG (MaDDH, NgayDatHang, MaKH, TriGia) VALUES (2, '07/05/2012', 9, 1863.4)
INSERT INTO DONDATHANG (MaDDH, NgayDatHang, MaKH, TriGia) VALUES (3, '07/08/2012', 34, 1813.0)
INSERT INTO DONDATHANG (MaDDH, NgayDatHang, MaKH, TriGia) VALUES (4, '07/08/2012', 14, 670.8)
INSERT INTO DONDATHANG (MaDDH, NgayDatHang, MaKH, TriGia) VALUES (5, '07/09/2012', 26, 3730.0)
INSERT INTO DONDATHANG (MaDDH, NgayDatHang, MaKH, TriGia) VALUES (6, '07/10/2012', 34, 1444.8)
INSERT INTO DONDATHANG (MaDDH, NgayDatHang, MaKH, TriGia) VALUES (7, '07/11/2012', 14, 625.2)
INSERT INTO DONDATHANG (MaDDH, NgayDatHang, MaKH, TriGia) VALUES (8, '07/12/2012', 38, 2490.5)
INSERT INTO DONDATHANG (MaDDH, NgayDatHang, MaKH, TriGia) VALUES (9, '07/15/2012', 28, 517.8)
INSERT INTO DONDATHANG (MaDDH, NgayDatHang, MaKH, TriGia) VALUES (10, '07/16/2012', 35, 1119.9)

--THIET LAP CAC COT CHITIETDDH
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (1.0, 1.0, 11.0, 14.0, 12.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (2.0, 1.0, 42.0, 9.8, 10.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (3.0, 1.0, 72.0, 34.8, 5.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (4.0, 2.0, 14.0, 18.6, 9.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (5.0, 2.0, 51.0, 42.4, 40.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (6.0, 3.0, 41.0, 7.7, 10.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (7.0, 3.0, 51.0, 42.4, 35.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (8.0, 3.0, 65.0, 16.8, 15.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (9.0, 4.0, 22.0, 16.8, 6.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (10.0, 4.0, 57.0, 15.6, 15.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (11.0, 4.0, 65.0, 16.8, 20.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (12.0, 5.0, 20.0, 64.8, 40.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (13.0, 5.0, 33.0, 2.0, 25.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (14.0, 5.0, 60.0, 27.2, 40.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (15.0, 6.0, 31.0, 10.0, 20.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (16.0, 6.0, 39.0, 14.4, 42.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (17.0, 6.0, 49.0, 16.0, 40.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (18.0, 7.0, 24.0, 3.6, 15.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (19.0, 7.0, 55.0, 19.2, 21.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (20.0, 7.0, 74.0, 8.0, 21.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (21.0, 8.0, 2.0, 15.2, 20.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (22.0, 8.0, 16.0, 13.9, 35.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (23.0, 8.0, 36.0, 15.2, 25.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (24.0, 8.0, 59.0, 44.0, 30.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (25.0, 9.0, 53.0, 26.2, 15.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (26.0, 9.0, 77.0, 10.4, 12.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (27.0, 10.0, 27.0, 35.1, 25.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (28.0, 10.0, 39.0, 14.4, 6.0)
INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong) VALUES (29.0, 10.0, 77.0, 10.4, 15.0);











