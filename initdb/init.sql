-- Tạo một database mới
CREATE DATABASE wedding_booking_staging;

-- Tạo user mới (bỏ qua bước này nếu đã định nghĩa trong docker-compose)
CREATE USER myappuser

-- Gán quyền cho user này trên database mới
GRANT ALL PRIVILEGES ON DATABASE wedding_booking_staging TO myappuser;