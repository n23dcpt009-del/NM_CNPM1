📘 BÁO CÁO DỰ ÁN: HỆ THỐNG CHẤM CÔNG NHÂN VIÊN
1. Giới thiệu

Báo cáo này trình bày quy trình phân tích và thiết kế hệ thống chấm công nhân viên, bao gồm các mô hình, biểu đồ và mã nguồn được xây dựng trong quá trình thực hiện.
Các nội dung chính của báo cáo:

Phân tích chức năng hệ thống.

Mô hình Use Case và Sequence Diagram.

Mã nguồn giao diện đăng nhập (HTML, CSS, JavaScript).

Mô tả chi tiết Use Case theo chuẩn UML.

2. Phân tích mục tiêu hệ thống

Hệ thống được chọn: Hệ thống quản lý chấm công nhân viên.

Mục tiêu chính:

Hỗ trợ nhân viên thực hiện thao tác Check-in/Check-out nhanh chóng và chính xác.

Cho phép theo dõi và tra cứu lịch sử chấm công.

Cung cấp báo cáo tổng hợp cho bộ phận quản lý.

Nhu cầu thực tế:

Tăng tính minh bạch trong quản lý giờ làm.

Hạn chế sai sót khi tính công thủ công.

Giúp nhà quản lý tối ưu phân ca và theo dõi hiệu suất làm việc.

3. Sơ đồ Use Case

📌 Tổng quan hệ thống chấm công
Use Case thể hiện mối quan hệ giữa các tác nhân chính (Nhân viên, Quản lý, Admin) và các chức năng chính của hệ thống.

📌 Use Case chi tiết – Quản lý nhân viên
Mô tả cụ thể các thao tác như thêm, chỉnh sửa và xóa thông tin nhân viên trong hệ thống.

4. Sequence Diagram – Quản lý nhân viên

Biểu đồ Sequence mô tả luồng tương tác giữa các thành phần: người dùng (Manager), giao diện (UI), lớp điều khiển (Controller), lớp xử lý nghiệp vụ (Service), và cơ sở dữ liệu (Database) trong quá trình thêm/sửa/xóa thông tin nhân viên.

5. Source Code Giao Diện Đăng Nhập (Login Form)

📁 Thư mục chứa mã nguồn:
🔗 GitHub Repository

💻 Cách triển khai:
git clone https://github.com/Lanne-0402/Nhap-mon-CNPM.git  
cd Nhap-mon-CNPM
Triển khai demo bằng GitHub Pages:
Giao diện đăng nhập được công bố thông qua GitHub Pages.
Đường dẫn demo: https://lanne-0402.github.io/Nhap-mon-CNPM/labs/Lab04
