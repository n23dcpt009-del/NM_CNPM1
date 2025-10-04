-- Tạo database (nếu chưa có)
CREATE DATABASE IF NOT EXISTS systemdb;
USE systemdb;

-- Bảng User (tài khoản đăng nhập hệ thống)
CREATE TABLE IF NOT EXISTS User (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    Role ENUM('Admin','Manager','Employee') DEFAULT 'Employee',
    NgayTao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Bảng NhanVien (thông tin nhân sự thực tế)
CREATE TABLE IF NOT EXISTS NhanVien (
    NhanVienID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT UNIQUE,  -- Liên kết tài khoản
    HoTen VARCHAR(100) NOT NULL,
    NgaySinh DATE,
    GioiTinh ENUM('Nam','Nữ','Khác'),
    DiaChi VARCHAR(255),
    SoDienThoai VARCHAR(20),
    Email VARCHAR(100),
    ViTri VARCHAR(100),
    PhongBan VARCHAR(100),
    NgayVaoLam DATE,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
        ON DELETE SET NULL
);

-- Bảng QuanLyCa (phân công ca làm việc)
CREATE TABLE IF NOT EXISTS QuanLyCa (
    CaID INT AUTO_INCREMENT PRIMARY KEY,
    TenCa VARCHAR(50) NOT NULL,
    GioBatDau TIME NOT NULL,
    GioKetThuc TIME NOT NULL,
    GhiChu TEXT
);

-- Bảng CheckInCheckOut (ghi nhận chấm công)
CREATE TABLE IF NOT EXISTS CheckInCheckOut (
    ChamCongID INT AUTO_INCREMENT PRIMARY KEY,
    NhanVienID INT NOT NULL,
    CaID INT,
    Ngay DATE NOT NULL,
    GioCheckIn TIME,
    GioCheckOut TIME,
    TrangThai ENUM('Đi làm','Đi trễ','Nghỉ phép','Nghỉ không phép','OT') DEFAULT 'Đi làm',
    FOREIGN KEY (NhanVienID) REFERENCES NhanVien(NhanVienID)
        ON DELETE CASCADE,
    FOREIGN KEY (CaID) REFERENCES QuanLyCa(CaID)
        ON DELETE SET NULL
);

-- Bảng BaoCaoChamCong (tổng hợp báo cáo theo nhân viên)
CREATE TABLE IF NOT EXISTS BaoCaoChamCong (
    BaoCaoID INT AUTO_INCREMENT PRIMARY KEY,
    NhanVienID INT NOT NULL,
    Thang INT NOT NULL,
    Nam INT NOT NULL,
    TongNgayCong INT DEFAULT 0,
    SoNgayDiTre INT DEFAULT 0,
    SoNgayNghiPhep INT DEFAULT 0,
    SoNgayNghiKhongPhep INT DEFAULT 0,
    SoGioOT INT DEFAULT 0,
    FOREIGN KEY (NhanVienID) REFERENCES NhanVien(NhanVienID)
        ON DELETE CASCADE
);

INSERT INTO NhanVien (HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email, ViTri, PhongBan, NgayVaoLam)
VALUES
('Thạch Gia Uy', '2005-03-12', 'Nam', '123 Le Loi, TP.HCM', '0901234567', 'vana@example.com', 'Nhân viên IT', 'CNTT', '2025-09-01'),
('Lê Thị Bảo Diệp', '2005-07-22', 'Nu', '45 Tran Hung Dao, Ha Noi', '0912345678', 'thib@example.com', 'Kế toán', 'Tài chính', '2025-09-10'),
('Nông Thị Hồng Lan', '2005-11-05', 'Nu', '78 Nguyen Trai, Da Nang', '0934567890', 'vanc@example.com', 'Nhân sự', 'HR', '2025-09-15'),
('Nguyễn Ngọc Gia Hân', '2005-01-18', 'Nu', '12 Hai Ba Trung, Can Tho', '0945678901', 'thid@example.com', 'Thực tập sinh', 'Marketing', '2025-09-20')
ON DUPLICATE KEY UPDATE
    HoTen = VALUES(HoTen),
    SoDienThoai = VALUES(SoDienThoai),
    ViTri = VALUES(ViTri),
    PhongBan = VALUES(PhongBan),
    NgayVaoLam = VALUES(NgayVaoLam); 
