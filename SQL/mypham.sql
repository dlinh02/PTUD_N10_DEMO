-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 23, 2023 lúc 03:15 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `mypham`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethoadon`
--

CREATE TABLE `chitiethoadon` (
  `MaChiTietHoaDon` int(11) NOT NULL,
  `TongTien` double NOT NULL,
  `NgayLapChiTietHoaDon` date NOT NULL,
  `MaSanPham` int(11) NOT NULL,
  `MaHoaDon` int(11) NOT NULL,
  `SoLuong` int(11) NOT NULL,
  `MaKhachHang` int(11) DEFAULT NULL,
  `DiaChiGiaoHang` varchar(100) NOT NULL,
  `HoTen` varchar(100) NOT NULL,
  `SoDienThoai` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitiethoadon`
--

INSERT INTO `chitiethoadon` (`MaChiTietHoaDon`, `TongTien`, `NgayLapChiTietHoaDon`, `MaSanPham`, `MaHoaDon`, `SoLuong`, `MaKhachHang`, `DiaChiGiaoHang`, `HoTen`, `SoDienThoai`, `Email`) VALUES
(102, 179000, '2023-11-23', 1, 199, 1, 1, '12, Nguyễn Văn Bảo', 'Nguyễn Văn Qúy', 816977959, 'myphamdep@gmail.com'),
(103, 693000, '2023-11-23', 2, 199, 7, 1, '12, Nguyễn Văn Bảo', 'Nguyễn Văn Qúy', 816977959, 'myphamdep@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang`
--

CREATE TABLE `giohang` (
  `MaGioHang` int(11) NOT NULL,
  `SoLuong` int(11) NOT NULL,
  `MaKhachHang` int(11) NOT NULL,
  `MaSanPham` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giohang`
--

INSERT INTO `giohang` (`MaGioHang`, `SoLuong`, `MaKhachHang`, `MaSanPham`) VALUES
(7, 2, 3, 2),
(8, 3, 3, 1),
(9, 3, 3, 1),
(10, 1, 3, 1),
(36, 1, 0, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `MaHoaDon` int(11) NOT NULL,
  `TongTien` double NOT NULL,
  `NgayLap` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`MaHoaDon`, `TongTien`, `NgayLap`) VALUES
(199, 872000, '2023-11-23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `MaKhachHang` int(11) NOT NULL,
  `HoTen` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SoDienThoai` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DiaChi` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `MatKhau` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `trangThai` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`MaKhachHang`, `HoTen`, `SoDienThoai`, `DiaChi`, `MatKhau`, `Email`, `trangThai`) VALUES
(1, 'Nguyễn Văn Qúy', '0816977959', '12, Nguyễn Văn Bảo', '11', 'myphamdep@gmail.com', 1),
(2, 'dỗ truồng', '0905371629', ' 40 Dương Quảng Hàm - p5 - gò vấp', 'Abc12345!', 'dotruong0704@gmail.com', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loainhanvien`
--

CREATE TABLE `loainhanvien` (
  `MaLoaiNhanVien` int(11) NOT NULL,
  `TenLoaiNhanVien` varchar(100) NOT NULL,
  `GhiChu` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loainhanvien`
--

INSERT INTO `loainhanvien` (`MaLoaiNhanVien`, `TenLoaiNhanVien`, `GhiChu`) VALUES
(1, 'Bán Hàng', 'Bán hàng tại khu vực Gò Vấp'),
(2, 'Quản lý kho', 'Quản lý kho tại khu vực Gò Vấp'),
(3, 'Admin', 'chủ của hàng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `MaLoai` int(11) NOT NULL,
  `TenLoai` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `GhiChu` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `loaisanpham`
--

INSERT INTO `loaisanpham` (`MaLoai`, `TenLoai`, `GhiChu`) VALUES
(1, 'Kem Nền', 'Kem nền che khuyết điểm'),
(2, 'Mascara', 'Làm cong mí mắt'),
(3, 'Phấn phủ', 'Phấn phủ làm mịn da'),
(4, 'Son Môi', 'Son dưỡng ẩm môi vào ban đêm'),
(5, 'Sữa rữa mặt', 'Sữa rữa mặt làm sáng da'),
(6, 'Kem chống nẳng', 'Kem chống nắng cho da dầu');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhacungcap`
--

CREATE TABLE `nhacungcap` (
  `MaNhaCungCap` int(11) NOT NULL,
  `TenNhaCungCap` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `GhiChu` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `nhacungcap`
--

INSERT INTO `nhacungcap` (`MaNhaCungCap`, `TenNhaCungCap`, `GhiChu`) VALUES
(1, 'MQ SKIN', 'Cung cấp các sản phẩm mỹ phẩm nghiên về thảo dược.'),
(2, 'Mascara', 'Làm cong mi mắt'),
(3, 'Naunau', 'Cung cấp các sản phẩm có mùi hương cuốn hút.'),
(4, 'Skina', 'Cung cấp các sản phẩm ch?m sóc da từ thảo mộc tự nhiên.'),
(5, 'Titione', 'Cung cấp các sản phẩm thân thiện với người dùng.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MaNhanVien` int(11) NOT NULL,
  `HoTen` varchar(50) NOT NULL,
  `MatKhau` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `SoDienThoai` varchar(15) NOT NULL,
  `DiaChi` varchar(200) NOT NULL,
  `LoaiNhanVien` int(11) NOT NULL,
  `trangThai` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`MaNhanVien`, `HoTen`, `MatKhau`, `Email`, `SoDienThoai`, `DiaChi`, `LoaiNhanVien`, `trangThai`) VALUES
(1, 'Trần Tuấn Anh', '11122288', 'trantuananh@gmail.com', '0987654222', '91 Nguyễn Văn Bảo, Gò Vấp, Hồ Chí Minh', 1, 1),
(2, 'Trương Ngọc Bình', '12341234', 'truongngocbinh@gmail.com', '0789665431', '200 Phan Xích Long, Phú Nhuận, Hồ Chí Minh', 2, 1),
(3, 'Lý Hữu Cảnh', '12344444', 'lyhuucanh@gmail.com', '0987666555', '22 Nguyễn Thái Sơn, Gò Vấp, Hồ Chí Minh', 1, 1),
(4, 'Trần Minh Dự', '33338888', 'tranminhdu@gmail.com', '0788654332', '33 Lê Đức Thọ, Gò Vấp, Hồ Chí Minh', 2, 1),
(5, 'Lê Hoàng Hữu', '66667777', 'lehoanghuu@gmail.com', '0998765443', '1 Phan Xích Long, Phú Nhuận, Hồ Chí Minh', 2, 1),
(6, 'Diệu Linh', 'lonmay1234A@', 'dotruong0704@gmail.com', '0905371627', 'thon 9', 3, 2),
(7, 'Nguyễn Thị Diệu Linh', 'A1234', 'linhdieu3001@gmail.com', '0336794265', 'Gò Vấp', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `noidungdanhgia`
--

CREATE TABLE `noidungdanhgia` (
  `MaDanhGia` int(11) NOT NULL,
  `MaSanPham` int(11) NOT NULL,
  `ThoiGianDanhGia` date NOT NULL,
  `NoiDungDanhGia` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `MaKhachHang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `noidungdanhgia`
--

INSERT INTO `noidungdanhgia` (`MaDanhGia`, `MaSanPham`, `ThoiGianDanhGia`, `NoiDungDanhGia`, `MaKhachHang`) VALUES
(1, 1, '2023-10-16', 'Kem rất tốt, sử dụng cảm thấy rất an toàn và hiệu quả.', 1),
(2, 2, '2023-10-22', 'Sản phẩm đúng như mô tả, sẽ ủng hộ shop tiếp.', 0),
(3, 3, '2023-10-23', 'Phấn đẹp, rất lâu phai.', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieudathang`
--

CREATE TABLE `phieudathang` (
  `MaDatHang` int(11) NOT NULL,
  `SoLuong` int(11) NOT NULL,
  `ThoiGianDatHang` date NOT NULL,
  `MaKhachHang` int(11) NOT NULL,
  `MaSanPham` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `phieudathang`
--

INSERT INTO `phieudathang` (`MaDatHang`, `SoLuong`, `ThoiGianDatHang`, `MaKhachHang`, `MaSanPham`) VALUES
(1, 2, '2023-10-01', 2, 2),
(2, 4, '2023-10-02', 2, 2),
(3, 1, '2023-10-03', 3, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieukiemtrakho`
--

CREATE TABLE `phieukiemtrakho` (
  `NgayKiemTra` date NOT NULL,
  `MaSanPham` int(11) NOT NULL,
  `MaNhanVien` int(11) NOT NULL,
  `TrangThaiKiemTra` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `MaPhieuKiemTraKho` tinyint(4) NOT NULL,
  `PhieuShow` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `phieukiemtrakho`
--

INSERT INTO `phieukiemtrakho` (`NgayKiemTra`, `MaSanPham`, `MaNhanVien`, `TrangThaiKiemTra`, `MaPhieuKiemTraKho`, `PhieuShow`) VALUES
('2023-11-25', 1, 1, 'sản phẩm ổn không hư hỏng', 6, 1),
('2023-11-22', 2, 2, 'oke', 7, 1),
('2023-11-22', 3, 3, 'oke', 8, 1),
('2023-11-22', 4, 4, 'oke', 9, 1),
('2023-11-22', 3, 4, 'oke', 10, 1),
('2023-12-06', 5, 2, 'sản phẩm ổn không hư hỏng', 20, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieunhapkho`
--

CREATE TABLE `phieunhapkho` (
  `MaPhieuNhapKho` int(11) NOT NULL,
  `NgayLapPhieuNhapKho` date NOT NULL,
  `TrangThaiPhieuNhapKho` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `MaSanPham` int(11) NOT NULL,
  `MaNhanVien` int(11) NOT NULL,
  `PhieuShow` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `phieunhapkho`
--

INSERT INTO `phieunhapkho` (`MaPhieuNhapKho`, `NgayLapPhieuNhapKho`, `TrangThaiPhieuNhapKho`, `MaSanPham`, `MaNhanVien`, `PhieuShow`) VALUES
(1, '2023-10-30', 'Chưa duyệt', 1, 1, 1),
(2, '2023-10-30', 'Chưa duyệt', 2, 2, 1),
(3, '2023-10-30', 'Được duyệt', 3, 3, 1),
(4, '2023-10-30', 'Được duyệt', 4, 4, 1),
(21, '2023-11-14', 'oke', 1, 1, 1),
(22, '2023-11-14', 'oke', 1, 1, 0),
(23, '2023-11-16', 'oke', 3, 3, 0),
(24, '2023-11-16', 'oke', 3, 3, 0),
(25, '2023-11-16', 'oke', 3, 3, 0),
(26, '2023-11-16', 'oke', 3, 3, 0),
(27, '2023-11-28', 'oke', 1, 1, 1),
(28, '2023-11-28', 'oke', 1, 1, 0),
(29, '2023-11-22', 'Được duyệt', 5, 2, 1),
(30, '2023-11-22', 'Được duyệt', 5, 2, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieutrahang`
--

CREATE TABLE `phieutrahang` (
  `ThoiGianTraHang` date NOT NULL,
  `SoLuong` int(11) NOT NULL,
  `LyDoTraHang` varchar(100) NOT NULL,
  `MaKhachHang` int(11) NOT NULL,
  `MaSanPham` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `phieutrahang`
--

INSERT INTO `phieutrahang` (`ThoiGianTraHang`, `SoLuong`, `LyDoTraHang`, `MaKhachHang`, `MaSanPham`) VALUES
('2023-10-06', 1, 'S?n ph?m không gi?ng mô t?', 1, 1),
('2023-10-07', 4, 'S?n ph?m b? h? h?i', 2, 2),
('2023-10-08', 3, 'S?n ph?m không gi?ng mô t?', 3, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieuxuatkho`
--

CREATE TABLE `phieuxuatkho` (
  `MaPhieuXuatKho` int(11) NOT NULL,
  `NgayLapPhieuXuatKho` date NOT NULL,
  `TrangThaiPhieuXuatKho` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaNhanVien` int(11) NOT NULL,
  `MaSanPham` int(11) NOT NULL,
  `PhieuShow` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `phieuxuatkho`
--

INSERT INTO `phieuxuatkho` (`MaPhieuXuatKho`, `NgayLapPhieuXuatKho`, `TrangThaiPhieuXuatKho`, `MaNhanVien`, `MaSanPham`, `PhieuShow`) VALUES
(1, '2023-11-02', 'Chưa duyệt', 1, 1, 1),
(2, '2023-11-08', 'Chưa duyệt', 2, 2, 1),
(5, '2023-11-14', 'oke', 1, 1, 1),
(6, '2023-11-15', 'Được duyệt', 3, 3, 1),
(7, '2023-11-15', 'oke', 3, 3, 0),
(8, '2023-11-22', 'oke', 1, 1, 1),
(9, '2023-11-22', 'oke', 1, 1, 1),
(10, '2023-11-23', 'Được duyệt', 4, 5, 0),
(11, '2023-11-23', 'Được duyệt', 4, 5, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `MaSanPham` int(11) NOT NULL,
  `TenSanPham` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SoLuongTon` int(11) NOT NULL DEFAULT 1,
  `MoTa` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `GiaBan` double NOT NULL,
  `GiaNhap` double NOT NULL,
  `ThuongHieu` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `HinhAnh` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `HanSuDung` date DEFAULT NULL,
  `LoaiSanPham` int(11) NOT NULL,
  `NhaCungCap` int(11) NOT NULL,
  `trangThai` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`MaSanPham`, `TenSanPham`, `SoLuongTon`, `MoTa`, `GiaBan`, `GiaNhap`, `ThuongHieu`, `HinhAnh`, `HanSuDung`, `LoaiSanPham`, `NhaCungCap`, `trangThai`) VALUES
(1, 'Mascara touching', 4, 'Kem nền dạng lỏng che khuyết điểm', 179000, 79000, 'Becca', 'a1.jpg', '2024-10-23', 1, 1, 1),
(2, 'Phấn phủ gramy', 949, 'Mascara làm cong mi mắt', 99000, 39000, 'GECOMO', 'a2.jpg', '2025-10-15', 2, 2, 1),
(3, 'Phấn phủ Pramy', 578, 'Phấn phủ làm mịn da', 490000, 290000, 'PRAMY', 'a3.jpg', '2025-10-01', 3, 3, 0),
(4, 'sữa rửa mặt simple', 98, 'sữa rửa mặt simple', 460000, 400000, 'Melody', 'a4.jpg', '2025-11-13', 4, 4, 1),
(5, 'Sữa rửa mặt lahabo', 10, 'Sữa rửa mặt sáng dae', 100000, 90000, 'Simple', 'a5.jpg', '2023-11-29', 5, 5, 1),
(14, 'Test', 5, 'Rửa mặt sạch 2', 1000000, 100000, 'Loreal', 'Test.jpg', '2023-11-22', 1, 1, 0),
(15, 'Test', 5, 'Rửa mặt 2', 1000000, 100000, 'Loreal', 'Test.jpg', '2023-11-22', 1, 1, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD PRIMARY KEY (`MaChiTietHoaDon`);

--
-- Chỉ mục cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`MaGioHang`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`MaHoaDon`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`MaKhachHang`);

--
-- Chỉ mục cho bảng `loainhanvien`
--
ALTER TABLE `loainhanvien`
  ADD PRIMARY KEY (`MaLoaiNhanVien`);

--
-- Chỉ mục cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`MaLoai`);

--
-- Chỉ mục cho bảng `nhacungcap`
--
ALTER TABLE `nhacungcap`
  ADD PRIMARY KEY (`MaNhaCungCap`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MaNhanVien`);

--
-- Chỉ mục cho bảng `noidungdanhgia`
--
ALTER TABLE `noidungdanhgia`
  ADD PRIMARY KEY (`MaDanhGia`),
  ADD KEY `MaSanPham` (`MaSanPham`),
  ADD KEY `MaKhachHang` (`MaKhachHang`);

--
-- Chỉ mục cho bảng `phieudathang`
--
ALTER TABLE `phieudathang`
  ADD PRIMARY KEY (`MaDatHang`),
  ADD KEY `MaKhachHang` (`MaKhachHang`,`MaSanPham`);

--
-- Chỉ mục cho bảng `phieukiemtrakho`
--
ALTER TABLE `phieukiemtrakho`
  ADD PRIMARY KEY (`MaPhieuKiemTraKho`),
  ADD KEY `MaSanPham` (`MaSanPham`,`MaNhanVien`);

--
-- Chỉ mục cho bảng `phieunhapkho`
--
ALTER TABLE `phieunhapkho`
  ADD PRIMARY KEY (`MaPhieuNhapKho`),
  ADD KEY `MaSanPham` (`MaSanPham`,`MaNhanVien`);

--
-- Chỉ mục cho bảng `phieutrahang`
--
ALTER TABLE `phieutrahang`
  ADD KEY `MaKhachHang` (`MaKhachHang`,`MaSanPham`);

--
-- Chỉ mục cho bảng `phieuxuatkho`
--
ALTER TABLE `phieuxuatkho`
  ADD PRIMARY KEY (`MaPhieuXuatKho`),
  ADD KEY `MaNhanVien` (`MaNhanVien`,`MaSanPham`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MaSanPham`),
  ADD KEY `LoaiSanPham` (`LoaiSanPham`,`NhaCungCap`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  MODIFY `MaChiTietHoaDon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT cho bảng `giohang`
--
ALTER TABLE `giohang`
  MODIFY `MaGioHang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `MaHoaDon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `MaKhachHang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `loainhanvien`
--
ALTER TABLE `loainhanvien`
  MODIFY `MaLoaiNhanVien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  MODIFY `MaLoai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `nhacungcap`
--
ALTER TABLE `nhacungcap`
  MODIFY `MaNhaCungCap` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `MaNhanVien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `noidungdanhgia`
--
ALTER TABLE `noidungdanhgia`
  MODIFY `MaDanhGia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `phieudathang`
--
ALTER TABLE `phieudathang`
  MODIFY `MaDatHang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `phieukiemtrakho`
--
ALTER TABLE `phieukiemtrakho`
  MODIFY `MaPhieuKiemTraKho` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `phieunhapkho`
--
ALTER TABLE `phieunhapkho`
  MODIFY `MaPhieuNhapKho` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `phieuxuatkho`
--
ALTER TABLE `phieuxuatkho`
  MODIFY `MaPhieuXuatKho` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MaSanPham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
